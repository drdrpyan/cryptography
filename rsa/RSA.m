disp('RSA');

disp('=== RSA 초기화 ===');
disp('prime p, q 선택');
p = input('p 입력 : ');
q = input('q 입력 : ');
disp(sprintf('p = %d, q = %d', p, q));

disp(' ');
disp('p, q를 이용해 key 생성');

N = p * q;
disp(sprintf('N = p * q = %d * %d = %d', p, q, N));

disp('N의 euler totient를 구한다. (N=p*q이므로 phi(N) = (p-1) * (q-1))');
eulerTotient = (p-1)*(q-1);
disp(sprintf('phi(N) = %d', eulerTotient));

disp('phi(N)보다 작고 phi(N)와 서로소인 key e를 선택한다.')
e = getRandomRelativePrime(eulerTotient);
disp(sprintf('e = %d', e));

disp('d*e mod phi(N) = 1 를 만족하는 d를 선택한다.');
d = 2;
while mod((e * d), eulerTotient) ~= 1
    d = d + 1;
    if d == e
        d = d + 1;
    end
end
disp(sprintf('d = %d', d));

disp(' ');
disp('key 생성 결과');
disp(sprintf('public key : (N, e) = (%d, %d)', N, e));
disp(sprintf('private key : (N, d) = (%d, %d)', N, d));

disp(' ');
disp('=== 메세지 교환 ===');
disp('메세지를 암호화 : 타인이 공개된 public key를 이용해 암호문을 작성해 전달');
m = input('전달할 message m 입력 : ');
disp(sprintf('입력받은 message m=%d를 암호화', M));
c = vpi2base(mod(vpi(m)^e, N), 2^32);
disp(sprintf('암호문 c = m^e mod N = %d', c));

disp(' ');
disp(sprintf('외부에서 전달받은 암호문 c=%d를 복호화', c));
recovered_m = vpi2base(mod(vpi(c)^d, N), 2^32);
disp(sprintf('복호문 m = c^d mod N = %d', recovered_m));



