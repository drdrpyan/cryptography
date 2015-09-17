disp('EC addition, y^2 = x^3 + x + 6, (Z11, mod)')
Xp = input('�� p�� x : ');
Yp = input('�� p�� y : ');
if isOnEC(Xp, Yp) ~= true
    error('(Xp, Yp)�� EC���� ���� �ƴմϴ�.');
end


[Xr Yr] = ECdoubling(Xp, Yp);
disp(sprintf('P(%d, %d) + P(%d, %d) = R(%d, %d)', Xp, Yp, Xp, Yp, Xr, Yr));