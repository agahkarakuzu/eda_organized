function test_suite=transformFibersTest
    try % assignment of 'localfunctions' is necessary in Matlab >= 2016
        test_functions=localfunctions();
    catch % no problem; early Matlab versions can use initTestSuite fine
    end
    initTestSuite;
    
    function test_fiber_transform
    
        
    dataDir = ['testData' filesep];
    load([dataDir 'testGetData.mat']);
    load([dataDir 'testTransformedFibers.mat']);
    load([dataDir 'testTransform.mat']);
    disp('Testing readTransformation =====================');
    transformedFibersNow = transformFibers(data.fibers,header.mtOn.origin,testTransform);
    for iFib = 1:length(transformedFibersNow)
        disp(['Testing transformed fiber at 5% accuracy ' num2str(iFib)]);
        assertElementsAlmostEqual(transformedFibersNow(1).matrix,transformedFibers(1).matrix,0.05);
    end