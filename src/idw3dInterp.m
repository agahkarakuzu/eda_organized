function [fiberHeader,interpolatedFibers] = idw3dInterp(fiberHeader,fiberData,volHeader,volData)

maxSlice_volHeader = volHeader.size(3);
volHeader.SliceRASidx = zeros(1,maxSlice_volHeader); %(1XN)
for i=1:maxSlice_volHeader
    curPoint = changeCoordSys([0 0 i],volHeader,'xyz');
    volHeader.SliceRASidx(1,i) = curPoint(3);
end

maxX_volHeader = volHeader.size(1);
volHeader.xRASidx = zeros(1,maxX_volHeader); %(1XN)
for i=1:maxX_volHeader
    curPoint = changeCoordSys([i 0 0],volHeader,'xyz');
    volHeader.xRASidx(1,i) = curPoint(1);
end

maxY_volHeader = volHeader.size(2);
volHeader.yRASidx = zeros(1,maxY_volHeader); %(1XN)
for i=1:maxY_volHeader
    curPoint = changeCoordSys([0 i 0],volHeader,'xyz');
    volHeader.yRASidx(1,i) = curPoint(2);
end


% Loop through all fiber nodes (this operation wil take some time)

IJKneighbors = struct(repmat(struct, [1 length(fiberData)]));
interpWeighs = IJKneighbors;

for i=1:length(fiberData)
    
    IJKneighbors(i).mat = zeros(length(fiberData(i).matrix),3,8);
    interpWeighs(i).mat = zeros(length(fiberData(i).matrix),8);
    
    
    for j=1:length(fiberData(i).matrix)
        
        curCoord = fiberData(i).matrix(j,:);
        
        % Get closest 3 slices (along-z)
        [~,qz] = sort(sum(abs(bsxfun(@minus,volHeader.SliceRASidx,curCoord(3))),1));
        qz = sort(qz(1:3));
        % Get closest 3 slices (along-x)
        [~,qx] = sort(sum(abs(bsxfun(@minus,volHeader.xRASidx,curCoord(1))),1));
        qx = sort(qx(1:3));
        % Get closest 3 slices (along-y)
        [~,qy] = sort(sum(abs(bsxfun(@minus,volHeader.yRASidx,curCoord(2))),1));
        qy = sort(qy(1:3));
        slice_points_ijk = zeros(3,3,9);
        slice_points_RAS = zeros(3,3,9);
        
        for k=1:3
            for l=1:3
                for m=1:3
                    slice_points_RAS(k,:,(m+(l-1)*3)) = [volHeader.xRASidx(qx(l)) volHeader.yRASidx(qy(m)) volHeader.SliceRASidx(qz(k))];
                    slice_points_ijk(k,:,(m+(l-1)*3)) = [qx(l) qy(m) qz(k)];
                end
            end
        end
        
        
        % Search for 8 nodes.
        normHolder = zeros(27,3);
        iter = 1;
        while (iter<=27)
            for k=1:3 % In each slice
                for l=1:9 % For each point
                    normHolder(iter,1)= norm(slice_points_RAS(k,:,l)-curCoord);
                    normHolder(iter,2)= k;
                    normHolder(iter,3)= l;
                    iter = iter + 1;
                end
            end
        end
        
        [~,idx]=sort(normHolder(:,1)); 
        normHolder_sorted=normHolder(idx,:);   
        normHolder_sorted = normHolder_sorted(1:8,:); % Here we have 8 of them
        
        weighs=power(normHolder_sorted(:,1),-1);
        totweigh = sum(weighs);
        weighs = weighs./totweigh;
 
        for m=1:8
            IJKneighbors(i).mat(j,:,m) = slice_points_ijk(normHolder_sorted(m,2),:,normHolder_sorted(m,3));
            interpWeighs(i).mat(j,m) = weighs(m);
        end
        

    end
end

% initialize by copying the original fiber locations 
% intterpolated indices will be added as the next col

interpolatedFibers = fiberData;

sz = size(interpolatedFibers(1).matrix);
idxScalar = sz(2) + 1; 

for iFiber=1:length(fiberData)
    for iNode=1:length(fiberData(iFiber).matrix)

        idx = squeeze(IJKneighbors(iFiber).mat(iNode,:,:));

tmp = [];
for kk=1:8
    
    tmp = [tmp volData(idx(1,kk),idx(2,kk),idx(3,kk))];
end

% Add nodal
interpolatedFibers(iFiber).matrix(iNode,idxScalar) = sum(interpWeighs(iFiber).mat(iNode,:).*tmp);


    end
    % Add average
interpolatedFibers(iFiber).matrix(:,idxScalar+1) = mean(interpolatedFibers(iFiber).matrix(:,idxScalar));
    
end

fiberHeader.n_scalars = fiberHeader.n_scalars + 2;

end