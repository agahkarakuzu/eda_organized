% This function is the read the transformation file
% saved by DSI studio. 

function affineTransform = readTransformation(txtFile)

% Construct parser object 
p = inputParser;

% Input must be a text file 
isTxtFile = @(x) isfile(x) && strcmp(x(end-2:end),'txt');
%Add REQUIRED inputs 
addRequired(p,'txtFile',isTxtFile);
%PARSE inputs 
parse(p,txtFile);

% Open file for  reading, then read into a cell vector
fid = fopen(p.Results.txtFile,'rt');
transform = textscan(fid, '%f');
fclose(fid);
% Convert cell to mat size (1,16)
% Reshape into 4X4 and transpose
affineTransform = reshape(cell2mat(transform),[4,4])';

end