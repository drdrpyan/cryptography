disp('EC addition, y^2 = x^3 + x + 6, (Z11, mod)')
Xp = input('점 p의 x : ');
Yp = input('점 p의 y : ');
if isOnEC(Xp, Yp) ~= true
    error('(Xp, Yp)는 EC위의 점이 아닙니다.');
end


[Xr Yr] = ECdoubling(Xp, Yp);
disp(sprintf('P(%d, %d) + P(%d, %d) = R(%d, %d)', Xp, Yp, Xp, Yp, Xr, Yr));