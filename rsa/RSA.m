disp('RSA');

disp('=== RSA �ʱ�ȭ ===');
disp('prime p, q ����');
p = input('p �Է� : ');
q = input('q �Է� : ');
disp(sprintf('p = %d, q = %d', p, q));

disp(' ');
disp('p, q�� �̿��� key ����');

N = p * q;
disp(sprintf('N = p * q = %d * %d = %d', p, q, N));

disp('N�� euler totient�� ���Ѵ�. (N=p*q�̹Ƿ� phi(N) = (p-1) * (q-1))');
eulerTotient = (p-1)*(q-1);
disp(sprintf('phi(N) = %d', eulerTotient));

disp('phi(N)���� �۰� phi(N)�� ���μ��� key e�� �����Ѵ�.')
e = getRandomRelativePrime(eulerTotient);
disp(sprintf('e = %d', e));

disp('d*e mod phi(N) = 1 �� �����ϴ� d�� �����Ѵ�.');
d = 2;
while mod((e * d), eulerTotient) ~= 1
    d = d + 1;
    if d == e
        d = d + 1;
    end
end
disp(sprintf('d = %d', d));

disp(' ');
disp('key ���� ���');
disp(sprintf('public key : (N, e) = (%d, %d)', N, e));
disp(sprintf('private key : (N, d) = (%d, %d)', N, d));

disp(' ');
disp('=== �޼��� ��ȯ ===');
disp('�޼����� ��ȣȭ : Ÿ���� ������ public key�� �̿��� ��ȣ���� �ۼ��� ����');
m = input('������ message m �Է� : ');
disp(sprintf('�Է¹��� message m=%d�� ��ȣȭ', M));
c = vpi2base(mod(vpi(m)^e, N), 2^32);
disp(sprintf('��ȣ�� c = m^e mod N = %d', c));

disp(' ');
disp(sprintf('�ܺο��� ���޹��� ��ȣ�� c=%d�� ��ȣȭ', c));
recovered_m = vpi2base(mod(vpi(c)^d, N), 2^32);
disp(sprintf('��ȣ�� m = c^d mod N = %d', recovered_m));



