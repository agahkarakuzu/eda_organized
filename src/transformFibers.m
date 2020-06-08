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

% Initialize output
transformedFibers = fibers;

% Implicit expansion over struct array 
% Outputs a cell array 
tmp = arrayfun(@(x)(tfm(x.matrix,transform,origin)),fibers, 'UniformOutput',false);

% Cell array is casted into a matrix by {:} operator
% [ ] is needed to assign it to matrix field of the transformedFibers. 
[transformedFibers.matrix] = tmp{:};


end

function out = tfm(matrix,transform,origin)

out = matrix*transform(1:3,1:3) + transform(1:3,4)' +origin;

end