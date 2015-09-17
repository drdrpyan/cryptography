disp('===초기화===');
disp('large prime q와 primitive root을 선정');
%q = 353;
%a = 3;
q = input('q 입력 : ');
a = input('a 입력 : ');
disp(sprintf('q = %d, a = %d', q, a));

%disp(' ');
%disp('각 user는 주어진 q, a로 key를 생성');
%disp('private key K_pr : K_pr < q인 수를 선정');
%disp('public key K_pu : a^K_pr mod q');
%[A_kpu, A_kpr] = getDiffieHellmanKey(q, a);
%[B_kpu, B_kpr] = getDiffieHellmanKey(q, a);
%kpu = vpi2base(A_kpu, 2^32);
%disp(sprintf('user A의 public key : %d, private key : %d', kpu, A_kpr));
%kpu = vpi2base(B_kpu, 2^32);
%disp(sprintf('user B의 public key : %d, private key : %d', kpu, B_kpr));

disp(' ');
disp('===키 교환===');
disp('---- A에서 B로 ----');
disp('A가 자신의 private key, public key를 생성');
disp('private key K_pr : K_pr < q인 수를 선정');
disp('public key K_pu : a^K_pr mod q');
[A_kpu, A_kpr] = getDiffieHellmanKey(q, a);
kpu = vpi2base(A_kpu, 2^32);
disp(sprintf('user A의 public key : %d, private key : %d', kpu, A_kpr));
disp('A는 B에게 자신의 public key를 전달');

disp(' ');
disp('---- B의 수신 ----');
disp('B가 자신의 private key, public key를 생성');
disp('private key K_pr : K_pr < q인 수를 선정');
disp('public key K_pu : a^K_pr mod q');
[B_kpu, B_kpr] = getDiffieHellmanKey(q, a);
kpu = vpi2base(B_kpu, 2^32);
disp(sprintf('user B의 public key : %d, private key : %d', kpu, B_kpr));

disp(' ');
disp('user B는 A의 public key와 자신의 private key로 session key 계산 (B_sk = A_kpu^B_pkr mod q)');
B_sk = mod(vpi(A_kpu)^B_kpr, q);
disp(sprintf('B의 session key B_sk = %d', vpi2base(B_sk, 2^32)));

disp(' ');
disp('---- B에서 A로 ----');
disp('user B는 user A에게 자신의 public key를 전달');

disp(' ');
disp('---- A의 수신 ----');
disp('user A는 B의 public key를 이용해 B와 마찬가지로 session key를 계산');
A_sk = mod(vpi(B_kpu)^A_kpr, q);
disp(sprintf('A의 session key A_sk = %d', vpi2base(A_sk, 2^32)));