function test_suite=plotSliceTest
    try % assignment of 'localfunctions' is necessary in Matlab >= 2016
        test_functions=localfunctions();
    catch % no problem; early Matlab versions can use initTestSuite fine
    end
    initTestSuite;
    
    function test_plot
   
    dataDir = [fileparts(which(mfilename())) filesep 'testData' filesep];
    saved = load([dataDir 'testGetData.mat']);
    disp('Testing plotSlice =====================');
    
    if moxunit_util_platform_is_octave
       pkg('load','image');
    end
    
    plotSlice(saved.data.mtOn(:,:,20),saved.header.mtOn,20,'hold','off');
    close all;