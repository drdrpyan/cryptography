disp('EC addition, y^2 = x^3 + x + 6, (Z11, mod)')
Xp = input('점 p의 x : ');
Yp = input('점 p의 y : ');
if isOnEC(Xp, Yp) ~= true
    error('(Xp, Yp)는 EC위의 점이 아닙니다.');
end
K = input('곱할 스칼라 상수 : ');

[Xr Yr] = ECscalarMultiplication_MSBfirst(K, Xp, Yp);

disp(sprintf('KP = (%d, %d)', Xr, Yr));