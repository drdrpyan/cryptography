function tf = isEqualECPoint(xp, yp, xq, yq)
    if (xp == xq) && (yp == yq)
        tf = true;
    else
        tf = false;
    end