function [xq yq] = ECscalarMultiplication_MSBfirst(scalarK, xp, yp)
    xq = xp;
    yq = yp;
    
    binK = dec2bin(scalarK);
    length = size(binK);
    length = length(2);
    
    for i = 2:length
        [xq yq] = ECdoubling(xq, yq);
        if (binK(i)-'0') == 1
            [xq yq] = ECaddition(xq, yq, xp, yp);
        end
    end
        