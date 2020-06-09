function test_suite=readTransformationTest
    try % assignment of 'localfunctions' is necessary in Matlab >= 2016
        test_functions=localfunctions();
    catch % no problem; early Matlab versions can use initTestSuite fine
    end
    initTestSuite;
    
    function test_load_affine
    dataDir = [fileparts(which(mfilename())) filesep 'testData' filesep];
    saved = load([dataDir 'testTransform.mat']);
    disp('Read transformation test at 1% accuracy');
    affineTransform = readTransformation([dataDir 'transform.txt']);
    assertElementsAlmostEqual(affineTransform,saved.testTransform,0.01);
    
    