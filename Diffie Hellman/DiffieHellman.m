disp('===�ʱ�ȭ===');
disp('large prime q�� primitive root�� ����');
%q = 353;
%a = 3;
q = input('q �Է� : ');
a = input('a �Է� : ');
disp(sprintf('q = %d, a = %d', q, a));

%disp(' ');
%disp('�� user�� �־��� q, a�� key�� ����');
%disp('private key K_pr : K_pr < q�� ���� ����');
%disp('public key K_pu : a^K_pr mod q');
%[A_kpu, A_kpr] = getDiffieHellmanKey(q, a);
%[B_kpu, B_kpr] = getDiffieHellmanKey(q, a);
%kpu = vpi2base(A_kpu, 2^32);
%disp(sprintf('user A�� public key : %d, private key : %d', kpu, A_kpr));
%kpu = vpi2base(B_kpu, 2^32);
%disp(sprintf('user B�� public key : %d, private key : %d', kpu, B_kpr));

disp(' ');
disp('===Ű ��ȯ===');
disp('---- A���� B�� ----');
disp('A�� �ڽ��� private key, public key�� ����');
disp('private key K_pr : K_pr < q�� ���� ����');
disp('public key K_pu : a^K_pr mod q');
[A_kpu, A_kpr] = getDiffieHellmanKey(q, a);
kpu = vpi2base(A_kpu, 2^32);
disp(sprintf('user A�� public key : %d, private key : %d', kpu, A_kpr));
disp('A�� B���� �ڽ��� public key�� ����');

disp(' ');
disp('---- B�� ���� ----');
disp('B�� �ڽ��� private key, public key�� ����');
disp('private key K_pr : K_pr < q�� ���� ����');
disp('public key K_pu : a^K_pr mod q');
[B_kpu, B_kpr] = getDiffieHellmanKey(q, a);
kpu = vpi2base(B_kpu, 2^32);
disp(sprintf('user B�� public key : %d, private key : %d', kpu, B_kpr));

disp(' ');
disp('user B�� A�� public key�� �ڽ��� private key�� session key ��� (B_sk = A_kpu^B_pkr mod q)');
B_sk = mod(vpi(A_kpu)^B_kpr, q);
disp(sprintf('B�� session key B_sk = %d', vpi2base(B_sk, 2^32)));

disp(' ');
disp('---- B���� A�� ----');
disp('user B�� user A���� �ڽ��� public key�� ����');

disp(' ');
disp('---- A�� ���� ----');
disp('user A�� B�� public key�� �̿��� B�� ���������� session key�� ���');
A_sk = mod(vpi(B_kpu)^A_kpr, q);
disp(sprintf('A�� session key A_sk = %d', vpi2base(A_sk, 2^32)));