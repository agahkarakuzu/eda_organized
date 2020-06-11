function test_suite=getMtrTest
    try % assignment of 'localfunctions' is necessary in Matlab >= 2016
        test_functions=localfunctions();
    catch % no problem; early Matlab versions can use initTestSuite fine
    end
    initTestSuite;
    
 
    function test_get_mtr
        
    dataDir = [getTestDataDir filesep];
    
    
    load([dataDir 'testGetData.mat']); % Get mtOn and mtOff data
    load([dataDir 'testMTR.mat']); % Get pre-calculated MTR (mtr)
    
    mtrNew = getMtr(data.mtOn,data.mtOff);
    assertEqual(mtrNew,mtr);