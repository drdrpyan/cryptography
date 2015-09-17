function inverse = multiplicativeInverseInGFp(modP, valueK)
    r1 = modP;
    s1 = 1;
    t1 = 0;
    
    r2 = valueK;
    s2 = 0;
    t2 = 1;
    
    while r2 ~= 1
        q = floor(r1/r2);
        r = r1 - q*r2;
        r1 = r2;
        r2 = r;

        s = s1 - q*s2;
        s1 = s2;
        s2 = s;

        t = t1 - q*t2;
        t1 = t2;
        t2 = t;
    end
    
    if t2 < 0
        inverse = t2 + modP;
    else
        inverse = t2;
    end