function test_suite=changeCoordSysTest
    try % assignment of 'localfunctions' is necessary in Matlab >= 2016
        test_functions=localfunctions();
    catch % no problem; early Matlab versions can use initTestSuite fine
    end
    initTestSuite;
    
    function test_coord_change
    
    dataDir = ['/github/workspace/Test/testData' filesep];
    savedD = load([dataDir 'testGetData.mat']);
    savedP = load([dataDir 'testCoordChange.mat']);
    disp('Testing changeCoordSys =====================');
    outPoint = changeCoordSys([1 2 3],savedD.header.mtOn,'xyz');
    assertEqual(outPoint,savedP.ijk2xyz);
    
    outPoint = changeCoordSys([1 2 3],savedD.header.mtOn,'ijk');
    assertElementsAlmostEqual(outPoint,savedP.xyz2ijk,0.05);