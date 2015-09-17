disp('EC addition, y^2 = x^3 + x + 6, (Z11, mod)')
Xp = input('점 p의 x : ');
Yp = input('점 p의 y : ');
if isOnEC(Xp, Yp) ~= true
    error('(Xp, Yp)는 EC위의 점이 아닙니다.');
end
Xq = input('점 q의 x : ');
Yq = input('점 q의 y : ');
if isOnEC(Xq, Yq) ~= true
    error('(Xq, Yq)는 EC위의 점이 아닙니다.');
end


[Xr Yr] = ECaddition(Xp, Yp, Xq, Yq);
disp(sprintf('P(%d, %d) + Q(%d, %d) = R(%d, %d)', Xp, Yp, Xq, Yq, Xr, Yr));