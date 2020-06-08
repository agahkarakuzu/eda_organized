function test_suite=readTransformationTest
    try % assignment of 'localfunctions' is necessary in Matlab >= 2016
        test_functions=localfunctions();
    catch % no problem; early Matlab versions can use initTestSuite fine
    end
    initTestSuite;
    
    
    function test_fiber_transform
    
    dataDir = [pwd filesep 'testData' filesep];
    load([dataDir 'testGetData.mat']);
    load([dataDir 'testTransformedFibers.mat']);
    load([dataDir 'testTransform.mat']);
    disp('Testing readTransformation =====================');
    transformedFibersNow = transformFibers(data.fibers,header.mtOn.origin,testTransform);
    assertEqual(transformedFibersNow,transformedFibers);