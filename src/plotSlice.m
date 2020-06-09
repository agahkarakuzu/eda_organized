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

for iX=1:sliceSize
    for jY=1:sliceSize
        
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