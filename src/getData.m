%FUNCTION_NAME - One line description of what the function or script performs (H1 line)
%Optional file header info (to give more details about the function than in the H1 line)
%
% Syntax:  [output1,output2] = function_name(fileMtOn,fileMtOff,fileTract, PARAM1, VAL1)
%
% Inputs:
%    input1 - Description
%    input2 - Description
%    input3 - Description
%
% Outputs:
%    output1 - Description
%    output2 - Description
%
% Parameters include:
%   
% Example: 
%    Line 1 of example
%    Line 2 of example
%    Line 3 of example
%
% Other m-files required: none
% Subfunctions: none
% MAT-files required: none
%
% See also: OTHER_FUNCTION_NAME1,  OTHER_FUNCTION_NAME2
% Author: FirstName FamilyName
% Work address
% email: 
% Website: http://www.
% May 2004; Last revision: 12-May-2004

function [data,header]  = getData(niiMtOn,niiMtOff,trkFibers,varargin)

% Create input parser object ================ PARSER 
p = inputParser;

% SET input conditions 
% Only allow decompressed nifti files
validNii = @(x) exist(x,'file') && strcmp(x(end-2:end),'nii');
% Only allow decompressed trk files
validTrk = @(x) exist(x,'file') && strcmp(x(end-2:end),'trk');

% Add REQUIRED parameters and check for types 
addRequired(p,'mtOn',validNii);
addRequired(p,'mtOff',validNii);
addRequired(p,'fibers',validTrk);

% Add OPTIONAL parameters and check for types
addParameter(p,'fa',[],validNii);
addParameter(p,'orientation',eye(3),@ismatrix);

% Parse parameters 
parse(p,niiMtOn,niiMtOff,trkFibers,varargin{:});

% ======================================== INIT OUTPUTS 

% Initialize data struct 
data = struct('mtOn',[],'mtOff',[],'fibers',[],'fa',[]);

% Initialize header struct (should contain the same fields with 'data')
header = struct('mtOn',[],'mtOff',[],'fibers',[],'fa',[]);

% ======================================== READ NIFTI INPUTS 

% List variables associated with NIFTI.
% Expand this list if you are going to add new NIFTI inputs
% to read all the data. 
niiList = [{'mtOn'},{'mtOff'},{'fa'}];

for iNii = 1:length(niiList)
   
    name = niiList{iNii}; % Get current NIFTI name from the list 
    
    if ~isempty(p.Results.(name)) % If arguments passed via parser
       
        % Read nifti header 
        header.(name) = getNiiHeader(p.Results.(name));
        % Inject orientation 
        header.(name).orientation = p.Results.orientation;
        % Inhect filename 
        header.(name).name = name;
        % Read nifti data
        data.(name) = getFlipNiiImage(p.Results.(name));
    
    end
    
end

% ======================================== READ TRK INPUTS 

[header.fibers,data.fibers] = trk_read(trkFibers);


end

function [headerOut] = getNiiHeader(niiFile)


% Initialize output struct
headerOut = struct('origin',zeros(1,3),'spacing',zeros(1,3)); 

% Read only the (original) header.
headerIn = load_untouch_header_only(niiFile);

% Define anonymous function to read multiple fields of a struct
getFields = @(S,varargin) cellfun(@(f) S.(f),varargin);

% Get origin information (x,y,z coordinates of the upper left of the image)
headerOut.origin = getFields(headerIn.hist,'qoffset_x','qoffset_y','qoffset_z');

% Get voxel dimensions (spacing, ASSUME 3D)
headerOut.spacing = headerIn.dime.pixdim(2:4);

% Get volume size (ASSUME 3D)
headerOut.size = headerIn.dime.dim(2:4);

end


function img = getFlipNiiImage(niiFile)
% Due to differences in MATLAB vs NIFTI orientation 
% conventions, in-planar dimensions are flipped to 
% match that of world coordinates (where tracts are defined). 

img  = double(load_nii_data(niiFile));

% Flip dimensions
img = flip(img,2);
img = flip(img,1);

end
