function test_suite=getDataTest
    try % assignment of 'localfunctions' is necessary in Matlab >= 2016
        test_functions=localfunctions();
    catch % no problem; early Matlab versions can use initTestSuite fine
    end
    initTestSuite;
    
    
    function test_loader
    
    disp('Testing getData =====================');
    dataDir = [fileparts(which(mfilename())) filesep 'testData' filesep];
    [dataLoaded,headerLoaded]  = getData([dataDir 'mtOn.nii'],[dataDir 'mtOff.nii'],[dataDir 'testFibers.trk']);
    
    % As this is to check loading, must be identical.
    saved = load([dataDir 'testGetData.mat']);
    assertEqual(dataLoaded.fibers,saved.data.fibers);
    assertEqual(dataLoaded.mtOn,saved.data.mtOn);
    assertEqual(dataLoaded.mtOff,saved.data.mtOff);
    assertEqual(headerLoaded.mtOn,saved.header.mtOn);
    assertEqual(headerLoaded.mtOff,saved.header.mtOff);
    if ~moxunit_util_platform_is_octave
        % Octave complains about this. weird.
        % TODO:
        assertEqual(headerLoaded.fibers,saved.header.fibers);
    end