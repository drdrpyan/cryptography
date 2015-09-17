disp('GF(19), q=19, a=10');
q = 19;
a = 10;

disp('=== 초기화 ===');
disp('user A가 자신의 key를 선택 (Diffie Hellman)');
disp('Xa < q인 임의의 수, Ya = a^Xa mod q');
[Ya Xa] = getDiffieHellmanKey(q, a);
ya = vpi2base(Ya, 2^32);
disp(sprintf('public key : %d, private key : %d', ya, Xa));
disp('user A는 user B에게 자신의 public key를 전달');

disp(' ');
disp('=== 전달할 메세지 암호화 ===');
disp('user B가 A의 public key Ya를 수신, 이를 이용해 메세지 M을 전달');
M = input('보낼 message M을 입력 (0<=M<=q-1) : ');

disp(' ');
disp('one time key K를 계산');
disp('K = [타켓의 public key] ^ k mod q, 1<=k<=q-1');
k = randi(q-1);
disp(sprintf('난수 k = %d', k));
K = mod(Ya^k, q);
temp_K = vpi2base(K, 2^32);
disp(sprintf('one time key K = %d', temp_K));

disp('message M에서 두 개의 ciphertext C1, C2를 생성');
C1 = mod(vpi(a)^k, q);
temp_C1 = vpi2base(C1, 2^32);
C2 = mod(K*M, q);
temp_C2 = vpi2base(C2, 2^32);
disp(sprintf('C1 = a^k mod q = %d, C2 = KM mod q = %d', temp_C1, temp_C2));

disp(' ');
disp('=== 수신한 암호문 복호화 ===');
disp('C1에서 K를, C2에서 M을 복원한다.');
recoveredK = vpi2base(mod(C1^Xa, q), 2^32);
disp(sprintf('K = C1^[수신자의 private key] mod q = %d', recoveredK));
recoveredM = mod(vpi2base(C2, 2^32)*multiplicativeInverseInGFp(q, recoveredK), q);
disp(sprintf('M = C2*(K^-1) mod q = %d', recoveredM));