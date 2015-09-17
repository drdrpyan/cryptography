function [xr yr] = ECdoubling(xp, yp)
    %y^2 = x^3 + x + 6, a=1, b=6
    a = 1;
    
    if yp == 0
        xr = inf;
        yr = inf;
        
    else
        s = (3*(xp^2) + a) * multiplicativeInverseInGFp(11, (2*yp));
        xr = s^2 - 2*xp;
        yr = (s * (xp - xr)) - yp;
        
        xr = mod(xr, 11);
        yr = mod(yr, 11);
    end