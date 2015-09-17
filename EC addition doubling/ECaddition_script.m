disp('EC addition, y^2 = x^3 + x + 6, (Z11, mod)')
Xp = input('�� p�� x : ');
Yp = input('�� p�� y : ');
if isOnEC(Xp, Yp) ~= true
    error('(Xp, Yp)�� EC���� ���� �ƴմϴ�.');
end
Xq = input('�� q�� x : ');
Yq = input('�� q�� y : ');
if isOnEC(Xq, Yq) ~= true
    error('(Xq, Yq)�� EC���� ���� �ƴմϴ�.');
end


[Xr Yr] = ECaddition(Xp, Yp, Xq, Yq);
disp(sprintf('P(%d, %d) + Q(%d, %d) = R(%d, %d)', Xp, Yp, Xq, Yq, Xr, Yr));