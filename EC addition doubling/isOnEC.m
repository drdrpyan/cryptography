function tf = isOnEC(x, y)
    if mod(y^2, 11) == mod((mod((x^3), 11) + mod(x, 11) + mod(6, 11)), 11)
        tf = true;
    else
        tf = false;
    end