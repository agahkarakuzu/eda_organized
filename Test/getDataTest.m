function test_suite=getDataTest
    try % assignment of 'localfunctions' is necessary in Matlab >= 2016
        test_functions=localfunctions();
    catch % no problem; early Matlab versions can use initTestSuite fine
    end
    initTestSuite;
    
    
    function test_loader
    
    disp('Testing getData =====================');
    dataDir = [pwd filesep 'testData' filesep];
    [dataLoaded,headerLoaded]  = getData([dataDir 'mtOn.nii'],[dataDir 'mtOff.nii'],[dataDir 'testFibers.trk']);
    
    % As this is to check loading, must be identical.
    saved = load([dataDir 'testGetData.mat']);
    assertEqual(dataLoaded,saved.data);
    assertEqual(headerLoaded,saved.header);