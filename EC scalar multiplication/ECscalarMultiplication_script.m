disp('EC addition, y^2 = x^3 + x + 6, (Z11, mod)')
Xp = input('�� p�� x : ');
Yp = input('�� p�� y : ');
if isOnEC(Xp, Yp) ~= true
    error('(Xp, Yp)�� EC���� ���� �ƴմϴ�.');
end
K = input('���� ��Į�� ��� : ');

[Xr Yr] = ECscalarMultiplication_MSBfirst(K, Xp, Yp);

disp(sprintf('KP = (%d, %d)', Xr, Yr));