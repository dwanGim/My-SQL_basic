-- 조회구문에 조건을 걸기 위해서 WHERE이라는 구문을 사용합니다.
-- SELECT 조회 컬럼 FROM 테이블명 WHERE 컬럼명 = '조건에 맞는 값';
-- 이름이 김자바인 사람만 출력하기
SELECT * FROM users WHERE user_name = '김자바';
-- 여러분들의 기준으로 필터링을 해보세요
-- 아이디 기준으로 찾아보세요.
SELECT * FROM users WHERE id = 'abc1234';
SELECT * FROM users WHERE id = 'adasd13';

-- 조건 여러 개를 걸 경우 AND, OR키워드를 쓰시면 됩니다.
-- 아이디가 javajava이거나 이름이 스프링 맨인걸 가져오기
SELECT * FROM users WHERE id = 'javajava' OR user_name ='스프링맨';
-- AND 키워드를 이용해서 특정 조건을 2개 만족하는 데이터를 하나 가져와보세요.
SELECT * FROM users WHERE id = 'hello1' AND pw = 'qwer';

-- 데이터 수정하기
-- UPDATE 테이블명 SET 컬럼ㅁ명 = '값1', 컬럼명2 = '값2' .. ;
-- 주의하실 점은 WHERE을 걸지 않으면 해당 컬럼의 모든 값이 일괄적으로 바뀝니다.
-- users 테이블의 pw를 전부 'pppp'로 바꾸기
-- UPDATE users SET pw = 'pppp';
SET SQL_SAFE_UPDATES = 1; -- 0이면 안전모드 비활성화 

SELECT * FROM users;

-- WHERE구문을 이용해 pw컬럼에 있는 5개의 값을 전부 다르게 바꿔주세요.
UPDATE users SET pw = 'aaaa' WHERE id = 'abc1234';
UPDATE users SET pw = 'bbbb' WHERE id = 'adasd13';
UPDATE users SET pw = 'cccc' WHERE id = 'Aufwiedersehen';
UPDATE users SET pw = 'dddd' WHERE id = 'hello1';
UPDATE users SET pw = 'eeee' WHERE id = 'qwer123';
UPDATE users SET pw  = 'ffff' WHERE id = 'seramatpagi';
UPDATE users SET user_name = '바뀜' WHERE id = 'seramatpagi';
-- 마지막 하나는 이름과 비밀번호를 함께 바꿔주세요.
select * from users;

-- 데이터 삭제
-- DELETE FROM 테이블명;을 할 경우 테이블 전체 데이터가 싹 날아갑니다.
-- DELETE 구문도 역시 일반적으로 WHERE과 조합해서 사용합니다.
-- 제일 위쪾에 있는 (abc1234) 회원정보를 삭제해보겠습니다.
DELETE FROM users WHERE id = 'abc1234';

SELECT * FROM users;

-- 도서관 테이블 구성하기
CREATE TABLE library(
	book_name varchar (30) primary key,
    book_price int(7) not null,
    book_pub varchar(20) not null,
    book_writer varchar(10) not null,
    book_page int(5) not null
);

SELECT * FROM library;
-- insert into 구문을 이용해서 책을 6권 넣어보겠습니다.
INSERT INTO library VALUES ('비트겐슈타인 평전', '25000', '김번역', '지은이', '400');
INSERT INTO library VALUES ('논리철학논고', '9000', '김엮음', '비트겐슈타인', '100');
INSERT INTO library VALUES ('의지와 표상으로서의 세계', '20000', '홍길동', '쇼펜하우어', '300');
INSERT INTO library VALUES ('이 사람을 보라', '10000', '임꺽정', '니체', '200');
INSERT INTO library VALUES ('실천이성비판', '15000', '성춘향', '칸트', '500');
INSERT INTO library VALUES ('점프 투 자바', '13000', '향단이', '기억안남', '150');

SELECT * FROM library;

-- employees를 사용 스키마로 지정해주세요.(명령어로)
USE employees;

-- employees 내부의 employees테이블을 조회해주세요.
-- SQL구문 명령구문은 무조건 대문자. 테이블명이나 호칭 등은
-- 소문자로 작성하는 것이 관례입니다.
-- 무조건 지키지 않아도 실행은 가능하지만 가독성을 위해 고수해주세요.
SELECT * FROM employees;

-- 원래 테이블을 조회할 떄는 스키마명.테이블명으로 모두 표기해야 합니다.
SELECT * FROM employees.employees;

-- 스키마명.테이블명으로 조회할 떄는 use중이지 않은 스키마의 테이블도 조회할 수 있습니다.
-- ict_practice의 library를 조회해보세요.

SELECT * FROM ict_practice2.library;

-- 컬럼을 전체가 아닌 임의로 가져올 떄는 컬럼명을 , 로 구분합니다.
-- 이 경우 모든 컬럼이 아닌 일부 컬럼만 조회할 수도 있으며
-- 심지어 한 개의 컬럼만 조회하는 등 개수조절도 가능합니다.
-- 컬럼의 순서도 바꿔서 호출할 수 있습니다.
SELECT gender, first_name, last_name FROM employees;

-- CMD 환경에서는 좌측 스키마처럼 스키마 목록을 보여주는 창이 없으므로
-- 아래 명령어를 이용해 SCHEMA 목록을 확인할 수 있습니다.
SHOW databases;

-- CMD 환경에서는 좌측 스키마처럼 스키마 목록을 보여주는 창이 없으므로
-- 아래 명령어를 이용해 SCHEMA 목록을 확인할 수 있습니다.
-- CMD 환경 로그인 명령어 -> mysql -u 계정명 -p

-- 현재 DB정보를 조회하기 위해서는
SHOW TABLE STATUS;

-- 특정 테이블의 컬럼 정보를 보고 싶다면 아래 명령어를 씁니다.
-- DESCRIBE 테이블명 혹은 DESC 테이블명;
DESCRIBE employees;

DESC employees;

-- ict_practice2를 디폴트 스키마로 잡아주세요.

USE ict_practice2;
-- 테이블을 생성합니다.
-- 테이블 생성 시 적힌 제약 조건과 컬럼명을 이용해 만들어주세요.

CREATE TABLE userTbl (
		user_id varchar (8) PRIMARY KEY,
        user_name varchar (10) NOT NULL,
        birth_year int (4) NOT NULL,
        addr varchar (4) NOT NULL,
        phone_nomber varchar (11) ,
        height int (3) ,
        reg_date DATE
        );

SELECT * FROM userTbl;




