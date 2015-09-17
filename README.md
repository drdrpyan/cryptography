# cryptography
2015 computer security lecture

cryptography Matlab script


0. VPI : RSA, Diffie Hellman에서 지수 연산을 위해 이용한 가변 크기 정수 타입

1. RSA
	RSA.m : RSA 프로토콜 스크립트
	getRandomRelatedPrime.m : RSA에서 e를 구하기 위해 사용한 함수

2. DiffieHellman
	DiffieHellman.m : Diffie Hellman 프로토콜 스크립트
	getDiffieHellmanKey : Diffie Hellman 프로토콜에서 생성하는 key를 생성하는 함수

3. ElGamal
	ElGamal.m : El-Gamal 메시지 교환 프로토콜 스크립트
	multiplicativeInverseInGFp.m : GF(p)에서의 multiplicative inverse를 구하는 함수

4. EC addition doubling
	ECaddition_script.m : 사용자로부터 EC 위의 점을 입력받아 EC addition을 수행하는 스크립트
	ECdoubling_script.m : 사용자로부터 EC 위의 점을 입력받아 EC doubling을 수행하는 스크립트
	ECaddition.m : EC의 두 점에 대한 addition을 수행하는 함수
	ECdoubling.m : EC의 한 점에 대한 doubling을 수행하는 함수
	isEqualECPoint.m : EC의 두 점이 동일한 점인지를 검사하는 함수
	isOnEC.m : 입력받은 점이 주어진 EC 위의 점인지를 검사하는 함수

5. EC scalar multiplication
	ECscalarMultiplication_script.m : 사용자로부터 EC 위의 점과 곱할 스칼라 상수를 입력받아 EC scalar multiplication을 수행하는 스크립트.
	ECscalarMultiplication_MSBfirst.m : EC scalar multiplication (MSB first)를 수행하는 함수
