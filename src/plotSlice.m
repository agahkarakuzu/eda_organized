function plotSlice(slice,header,sliceNo,varargin)

% Construct parser object ================== PARSER 

p = inputParser;

% SET parser validation checks 

% Accept header as input only if it is a struct with fields:
isHeader = @(x) isstruct(x) && all(isfield(x,{'spacing','origin'}));

% Accept transformTo only if it is a 3x3 matrix
isOrientation = @(x) ismatrix(x) && all(size(x)==[3 3]);

% Add REQUIRED inputs 
addRequired(p,'slice',@ismatrix);
addRequired(p,'header',isHeader);
addRequired(p,'sliceNo',@isnumeric);

% Add OPTIONAL inputs 
addParameter(p,'orientation',eye(3),isOrientation);
addParameter(p,'hold','off',@ischar);

parse(p,slice,header,sliceNo,varargin{:});


%  =========================================== IJK --> XYZ TRANSFORM

% Initialize output matrices 
% Initialize by input slice size in case data is partially sent
slice = squeeze(slice);
sliceSize = size(slice);
plot = struct('X',zeros(sliceSize(1),sliceSize(2)), ...
              'Y',zeros(sliceSize(1),sliceSize(2)), ...
              'Z',zeros(sliceSize(1),sliceSize(2)));

% Iterate over indexes to convert every point in ijk domain to
% world coordinates (xyz)

% TODO:
% This nested loop is not good enough, especially for Octave. We can do 
% vectorization to improve performance. The changeCoordSys function 
% would still work if we passed an (M*N)X3 matrix to it, where M and N 
% are sliceSize(1) and sliceSize(2), respectively. 

% Hint: in Jim's jim_analyze code, you will see that he is using a function
% called meshgrid (but not using its outputs anywhere). You can create a 3D 
% mesgrid. Than see what cat and reshape functions can offer to you to create that 
% (M*N)X3 matrix. 

% Fork this repo, implement your solution and see if CI test still passes 
% after your changes :) 

for iX=1:sliceSize(1)
    for jY=1:sliceSize(2)
        
        outPoint = changeCoordSys([iX jY sliceNo],header,'xyz');
        plot.X(iX,jY) = outPoint(1);
        plot.Y(iX,jY) = outPoint(2);
        plot.Z(iX,jY) = outPoint(3);
        
    end
end


figure();
% 3D plot in world coordinates colored by intensity values
surf(plot.X,plot.Y,plot.Z,mat2gray(squeeze(slice)));
% Add figure title showing field name and slice number. 
title(sprintf([header.name ' Slice: %d'],sliceNo));

% Passed as optional param (default off) 
hold(p.Results.hold);

end