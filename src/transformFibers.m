function transformedFibers = transformFibers(fiberData,toOrigin,transformMatrix)

p = inputParser;

isFiberData = @(x) isstruct(x) && ismember('matrix',fieldnames(x));

addRequired(p,'fiberData',isFiberData);
addRequired(p,'toOrigin',@isvector);
addRequired(p,'transformMatrix',@ismatrix);

parse(p,fiberData,toOrigin,transformMatrix);

fibers  = p.Results.fiberData;
origin  = p.Results.toOrigin;
transform = p.Results.transformMatrix;

% Invert the affine transformation 
transform = inv(transform);

% Set rotation, orientatoin and scaling to identity transform
transform(1:3,1:3) = eye(3);

% For interested reader with <3
% ================================================= SOME NOTES ABOUT PERFORMANCE
% Official documentaiton re performance: https://www.mathworks.com/help/matlab/matlab_prog/techniques-for-improving-performance.html

% (1) Preallocation [ALWAYS practice it]
% ---------------------------------------
% Why preallocate variables before for loops? 
% See the answer here: https://www.mathworks.com/help/matlab/matlab_prog/preallocating-arrays.html
% In line 24, preallocation I did was a bit lazy approach. Normally, the proper 
% preallocation should use zeros. But you can still see its effect:
%      -   i Run the following for loop while transformedFibers is in scope 
%      -  ii clear transformedFibers
%      - iii Run the following for loop again. 
% You will see that (i) is going to execute faster than (iii) due to prealloc. 

% Hint: Transpose operation in matlab moves elements in memory. In the for
% loop below, change transform(1:3,4)' with a variable that is assigned to 
% this value before the loop. You should see it executing faster about 0.02 
% second :) In this case, it does not make much of a difference, but the 
% difference will become more noticeable as the array size becomes larger. 

% ============================================================ BEFORE REFACTORING 

%transformedFibers = fibers; % Pre-allocation
%tic;
%for ii=1:length(fibers)
%    for jj = 1:length(fibers(ii).matrix)
%        transformedFibers(ii).matrix(jj,:) = fibers(ii).matrix(jj,:)*transform(1:3,1:3) + origin - transform(1:3,4)';
%    end
%end
%toc;
 

% (2) Vectorization 
% -----------------
% Vectorized operatoins take advantage of low-level optimized routines 
% (stuff in Intel's Math Kernel Library), hence runs much faster than 
% for loops. For example: 
 
%    i = 0;
%    for t = 0:.01:10
%        i = i + 1;
%        y(i) = sin(t);
%    end

% would run much faster if you did 

%    t = 0:.01:10;
%    y = sin(t);


% (3) Implicit expansion (previously available as bsxfun)
% -------------------------------------------------------
% a = [1 2 3;4 5 6;7 8 9];
% b = [10 10 10];
% If you try a+b in MATLAB<R2016b, you will get an error. But in newer versions,
% it will give you an output: 
%
%         a+b = 11 12 13
%               14 15 16
%               17 18 19
%
% How did that happen? MATLAB somehow understood how to "expand" a 1X3 vector
% to add it with a 3X3 matrix. This is called "implicit expansion", which is 
% known to work faster than explicit for loops, i.e.: 

%        c = zeros(size(a)); % Pre-allocate :) 
%        for iRow = 1:3
%            c(iRow,:) = a(iRow,:) + b
%        end

% This small example may not be the best way to explore performance improvement,
% but this is a feature that everyone writing code in MATLAB should be aware of. 
% Octave equivalent of implicit expansion is broadcasting, available in versions
% newer than 3.6.0.
%
% Previously implicit expansion was accessible through a function called bsxfun.
% If we were to apply bsxfun to the same example, we would call: 

%       c = zeros(size(a)); % Pre-allocate :) 
%       c = bsxfun(@plus,a,b);


% (4) FUN operations
% -----------------
% See this series of blog posts by @neurojojo (twitter):
% https://medium.com/analytics-vidhya/day-1-making-matlab-fun-ad850eaffbde

% Looks like the performance benefits of fun family (e.g. arrayfun) is rather 
% case specific. Some people reported that they are really useful for GPU 
% operations. Some others will note that arrayfun is ALWAYS slower than for 
% loops, which does not apply to our case. Compare lines [124-137] with 
% [46-53] and see it for yourself :) 

% ============================================================ AFTER REFACTORING
% Arrayfun: Execute transformation function on each element of a struct
% array. https://www.mathworks.com/help/matlab/ref/arrayfun.html
% Outputs a cell array 
% Implicit expansion over struct array 
% Outputs a cell array 

transformedFibers = fibers; % Pre-allocate (for line 136)
tic;
tmp = arrayfun(@(x)(tfm(x.matrix,transform,origin)),fibers, 'UniformOutput',false);

% To allow arrayfun to receive outputs from the tfm function that differs in 
% size and type, we set UniformOutput option to false. We need this, because 
% every streamline has different number of nodes. 

% Given that we set 'UniformOutput' to false, matlab will return outputs 
% of the tfm function in cell arrays.
% Cell array is casted into a matrix by {:} operator
% [ ] is needed to assign it to matrix field of the transformedFibers. 
[transformedFibers.matrix] = tmp{:};
toc;

end

function out = tfm(matrix,transform,origin)
% Transform a matrix of node coordinates (NX3) using 
% origin and transformation matrix. 
% Implicit expansion over struct array. See line 74 for further 
% explanation about implicit expansion.

out = matrix*transform(1:3,1:3) + (transform(1:3,4)' + origin);

end