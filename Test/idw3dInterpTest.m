function test_suite=idw3dInterpTest
    try % assignment of 'localfunctions' is necessary in Matlab >= 2016
        test_functions=localfunctions();
    catch % no problem; early Matlab versions can use initTestSuite fine
    end
    initTestSuite;
    
    function interp_test
        
    dataDir = ['testData' filesep];
    load([dataDir 'testGetData.mat']);
    load([dataDir 'testTransformedFibers.mat']);
    load([dataDir 'testInterpolated.mat']);
    
    MTR = abs(data.mtOn - data.mtOff)./data.mtOff;
    MTR(isinf(MTR)) = 0;
    MTR(isnan(MTR)) = 0;
    MTR(MTR>1) = 1;
    
    [interpolatedHeaderNow,interpolatedFibersNow] = idw3dInterp(header.fibers,transformedFibers,header.mtOn,MTR);
    disp('Testing idw3dInterp =====================');
    for iFib = 1:length(interpolatedFibers)
    disp(['Assertion test interpolation fibers at 5% ' num2str(iFib)]);    
    assertElementsAlmostEqual(interpolatedFibers(iFib).matrix,interpolatedFibersNow(iFib).matrix,0.05);
    end
    assertEqual(interpolatedHeader,interpolatedHeaderNow,0.05);