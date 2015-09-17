disp('GF(19), q=19, a=10');
q = 19;
a = 10;

disp('=== �ʱ�ȭ ===');
disp('user A�� �ڽ��� key�� ���� (Diffie Hellman)');
disp('Xa < q�� ������ ��, Ya = a^Xa mod q');
[Ya Xa] = getDiffieHellmanKey(q, a);
ya = vpi2base(Ya, 2^32);
disp(sprintf('public key : %d, private key : %d', ya, Xa));
disp('user A�� user B���� �ڽ��� public key�� ����');

disp(' ');
disp('=== ������ �޼��� ��ȣȭ ===');
disp('user B�� A�� public key Ya�� ����, �̸� �̿��� �޼��� M�� ����');
M = input('���� message M�� �Է� (0<=M<=q-1) : ');

disp(' ');
disp('one time key K�� ���');
disp('K = [Ÿ���� public key] ^ k mod q, 1<=k<=q-1');
k = randi(q-1);
disp(sprintf('���� k = %d', k));
K = mod(Ya^k, q);
temp_K = vpi2base(K, 2^32);
disp(sprintf('one time key K = %d', temp_K));

disp('message M���� �� ���� ciphertext C1, C2�� ����');
C1 = mod(vpi(a)^k, q);
temp_C1 = vpi2base(C1, 2^32);
C2 = mod(K*M, q);
temp_C2 = vpi2base(C2, 2^32);
disp(sprintf('C1 = a^k mod q = %d, C2 = KM mod q = %d', temp_C1, temp_C2));

disp(' ');
disp('=== ������ ��ȣ�� ��ȣȭ ===');
disp('C1���� K��, C2���� M�� �����Ѵ�.');
recoveredK = vpi2base(mod(C1^Xa, q), 2^32);
disp(sprintf('K = C1^[�������� private key] mod q = %d', recoveredK));
recoveredM = mod(vpi2base(C2, 2^32)*multiplicativeInverseInGFp(q, recoveredK), q);
disp(sprintf('M = C2*(K^-1) mod q = %d', recoveredM));