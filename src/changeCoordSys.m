% This function is intended to be called within a loop, therefore 
% omits argument parser for speed. 

function outPoint = changeCoordSys(point,header,transformTo)

        S = diag(header.spacing);
        origin = header.origin';
        direction = header.orientation;
        
switch transformTo
   
    case 'xyz'
        
       
        % Transform from ijk (image) to xyz (world)
        outPoint = (direction*S*point')+origin;
        
    case 'ijk'
    
        % Transform from xyz (world) to ijk (image)
        outPoint = (inv(direction*S))*(point'-origin);
        outPoint = ceil(outPoint);
    
end % switch

end
