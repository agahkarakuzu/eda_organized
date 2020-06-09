function test_suite=plotSliceTest
    try % assignment of 'localfunctions' is necessary in Matlab >= 2016
        test_functions=localfunctions();
    catch % no problem; early Matlab versions can use initTestSuite fine
    end
    initTestSuite;
    
    function test_plot
   
    dataDir = ['testData' filesep];
    saved = load([dataDir 'testGetData.mat']);
    disp('Testing plotSlice =====================');
    
    plotSlice(saved.data.mtOn(:,:,20),saved.header.mtOn,20,'hold','off');
    FigList = findobj(allchild(0), 'flat', 'Type', 'figure');
    disp(FigList);
    close all;