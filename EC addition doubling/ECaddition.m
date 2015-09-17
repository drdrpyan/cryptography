function [xr yr] = ECaddition(xp, yp, xq, yq)
    if isEqualECPoint(xp, yp, xq, yq)
        [xr yr] = ECdoubling(xp, yp);
    elseif isEqualECPoint(xp, yp, xq, -1*yq)
        xr = inf;
        yr = inf;
    elseif xp == xq
        error('Xp == Xq');
        
    else
        s = floor((yp - yq) / (xp - xq));
        xr = s^2 - xp - xq;
        yr = (s * (xp - xr)) - yp;
        
        xr = mod(xr, 11);
        yr = mod(yr, 11);
    end