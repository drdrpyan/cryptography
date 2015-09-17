function rp = getRandomRelativePrime(param)
    temp = 1;
    while temp == 1
        temp = randi(param - 1);
    end
    
    while gcd(temp, param) ~= 1
        temp = temp + 1;
        if temp == param
            randi(param);
        end
    end
    
    rp = temp;

