
tic;
[data,header]  = getData('mtOn.nii','mtOff.nii','CC_50.trk');

affineTransform = readTransformation('transform.txt');

transformedFibers = transformFibers(data.fibers,header.mtOn.origin,affineTransform);

plotSlice(data.mtOn(:,:,30),header.mtOn,30,'hold','on')
trk_plot(header.fibers,transformedFibers);


MTR = abs(data.mtOn - data.mtOff)./data.mtOff;
MTR(isinf(MTR)) = 0;
MTR(isnan(MTR)) = 0;
MTR(MTR>1) = 1;

[interpolatedHeader,interpolatedFibers] = idw3dInterp(header.fibers,transformedFibers,header.mtOn,MTR);

plotSlice(data.mtOn(:,:,30),header.mtOn,30,'hold','on');
trk_plot(interpolatedHeader,interpolatedFibers,[],[],'scalar',1);
title('MTR nodal distribution');
toc;

plotSlice(data.mtOn(:,:,30),header.mtOn,30,'hold','on');
trk_plot(interpolatedHeader,interpolatedFibers,[],[],'scalar',2);
title('Averaged MTR');