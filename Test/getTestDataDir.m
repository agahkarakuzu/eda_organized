function dataDir = getTestDataDir

PLATFORM  = getenv('PLATFORM');

if strcmp(PLATFORM,'GITHUB')
    
    dataDir = '/github/workspace/Test/testData';

elseif strcmp(PLATFORM,'AZURE')  % MATLAB
    
    dataDir = '/home/agah_local/testData';
    % Add MOxUnit 
    addpath(genpath('/home/agah_local/MOxUnit'));
    % Add MOcov
    addpath(genpath('/home/agah_local/MOcov'));
    
elseif isempty(PLATFORM)  % local 
    
    dataDir = '/testData';
    
end




end