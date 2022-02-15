-- ict_practice2 스키마를 쓰도로 설정해주세요.
USE ict_practice2;

-- 키가 평균보다 큰 지역만 화면에 출력해주세요.
-- SELECT user_id, avg(height)  FROM userTbl
-- GROUP BY user_id HAVING avg(height) > 170.9091;
 SELECT addr, avg(height) FROM userTbl
 GROUP BY addr HAVING avg(height) > (SELECT avg(height) FROM userTbl);
-- GROUP BY addr HAVING avg(height)

-- SQL 구문의 분류
-- DML : Data Manipulation Language
-- 데이터 조작언어로 SELECT, INSERT, UPDATE, DELETE 구문을 의미
-- 테이블의 데이터를 조회하거나 변경하기 위해서 사용한다.

 -- DDL : data definition language
 -- 데이터 정의언어로 데이터베이스, 테이블, 뷰, 인덱스 등을 생성하고
 -- 삭제하는 구문으로 CREATE, DROP, ALTER가 있습니다.
 -- DML과는 달리 commit; 없이도 바로바로 서버에 반영됩니다.
 
 -- DCL : Data Control LANGUAGE
 -- 데이터 제어 언어로 특정 계정에 대한 권한을 부여하거나 뻈을 떄 사용합니다.alter
 -- GRANT, REVOKE, DENY 등이 있습니다.
 -- 뭐한다는 건지 몰루겠씁니다.
 
 -- 테이블 생성하기
 -- 테이블명 : testTbl1
 -- id int, user_name varchar(3), age int 형식으로 테이블을 생성해주세요.
 CREATE TABLE testTbl1 (
			id int PRIMARY KEY,
            user_name varchar(3),
            age int
            );

-- 테이블명 뒤에 컬럼 정보를 적지 않으면 CREATE TABLE 시 설정한
-- 컬럼 정보가 순서대로 대입됩ㄴ디ㅏ. (id user_name, age순으로)
INSERT INTO testTbl1 VALUES (1, '홍길동', 25);

-- id와 이름쪽에만 데이터를 넣을 떄는 컬럼명을 생략할 수 없습니다.
INSERT INTO testTbl1 (id, user_name) VALUES (2, '김길동');


-- 컬럼명 지정은 안했지만 age에 null 넣기
INSERT INTO testTbl1 VALUES (3, '김점순', null);

-- 만약 입력하는 컬럼(열)의 순서를 바꿔서 지정하는 경우는 (id , user_name, age)가 아닌 순으로 넣는 경우
-- 모든 컬럼에 값을 입려하는 상황이어도 컬럼명을 따로 기입해줘야합니다.
INSERT INTO testTbl1 ( user_name, age, id) VALUES ('채종훈', 10, 4);

-- 지금 testTbl1같은 경우는 id를 수동으로 입력해주고 있습니다.
-- 이 경우 매번 id값을 사용자가 계산해서 insert해야 하기 떄문에
-- 굉장히 불편한데 AUTO_INCREMENT 속성을 컬럼에 걸어주면
-- 데이터를 입력받지 못했을 떄 컴퓨터가 순차적으로 컬럼에 중복되지 않고
-- 증가하는 숫자를 자동으로 입력해줍니다.
CREATE TABLE testTbl2  (
		id  int AUTO_INCREMENT PRIMARY KEY,
        user_name varchar(3),
        age int
);

-- id 컬럼에는 AUTO_INCREMENT가 붙어있으므로null로 처리해도alter
-- 자동으로 1부터 숫자가 1씩 증가합니다.

INSERT INTO testTbl2 (user_name, age) VALUES ('이몽룡', 20);
INSERT INTO testTbl2 (user_name, age) VALUES ('성춘향', 16);
INSERT INTO testTbl2 (user_name, age) VALUES ('변사또', 35);

-- 현재 3ㅐ의 데이터가 들어갔으므로 AUTO_INCREMENT의 다음 값은 4입니다.
-- AUTO_INCREMENT의 기준값은 1부터 1씩 자동으로 증가하지만
-- 만약에 사용자가 임의로 값을 바꾸고 싶다면 ALTER TABLE을 이용해
-- AUTO_INCREMENT의 값을 수정할 수도 있습니다.
-- AUTO_INCREMENT의 현재 값을 1000으로 수정하는 구문
ALTER TABLE testTbl2 auto_increment = 1000;

INSERT INTO testTbl2 VALUES (null, '향단이', 14);
INSERT INTO testTbl2 VALUES (null, '이방', 40);

SELECT * FROM testTbl2;

-- CMD(커맨드라인)에서 testTbl2 컬럼에 데이터 3개를 더 입력해주시고alter
-- CMD에서 조회까지 마치세요.

-- AUTO_INCREMENT는 기본적으로 1씩 증가
-- 이 증가분을 수정하고 싶다면 서버 측 변수인
-- @@auto_increment를 바꿔야 합니다.
-- testTbl2와 조건이 가토 이름만 tbl3인 테이블을 만들어주세요.

CREATE TABLE testTbl3 (
		id	int AUTO_INCREMENT PRIMARY KEY,
        user_name varchar(3),
        age int
);

-- testTbl3의 초기 AUTO_INCREMENT값을 1500으로 고쳐보세요.
ALTER TABLE testTbl3 auto_increment = 1000;
-- 증가분을 1이 아닌 3으로 세팅하는 법
SET @@auto_increment_increment = 3;
-- 동물 3마리를 testTbl3에 또 추가해주세요.
-- 전체 테이블에 3씩 올라가도로 적용되어버립니다.
INSERT INTO testTbl3 (user_name, age) VALUES ('주작', 5000);
INSERT INTO testTbl3 (user_name, age) VALUES ('청룡', 10000);
INSERT INTO testTbl3 VALUES (null, '현무', 30000);
SELECT * FROM testTbl3;

-- testTbl2도 3씩 증가하는지 확인해보세요.
INSERT INTO testtbl2 VALUES (null , '심청', 15);
INSERT INTO testTbl2 VALUES (null, '심봉사', 50);
SELECT * FROM testTbl2;

-- 증가량을 다시 1로 돌려주시고
-- testTbl2에 또 2개의 데이터를 추가해 증가량이 돌아왔는지 체크해주세요.

-- 하나의 INSERT INTO 구문으로 여러 row를 추가할 떄는
-- VALUES 뒤쪽을 연달아 작성합니다.
INSERT INTO testTbl2 VALUES (null, '말', 4),
							(null, '여우', 5),
							(null, '거위', 20);
                            
SELECT * FROM testTbl2;     

-- UPDATE 구문은 기존에 입력되어 있는 값을 변경할 떄 사용합니다.
-- WHERE 조건절을 걸지 않는다면, 칼럼 하나의 값을 전부 바꿉니다.
-- 따라서 일반적으로는 무조건 조건절과 조합해서 사용합니다.
-- UPDATE 테이블명 SET 컬럼1 = 바꿀값1, 컬럼2 = 바꿀값2 ... ;

-- testTbl2의 user_name을 한 줄로 전부 '말'로  고쳐보세요.
UPDATE testTbl2 SET user_name = '말';     

-- 특정 나이대의 user_name을 여러분들이 좋아하는 동물로 교체해주세요.
-- WHERE을 이용해 age를 필터링해주세요.
-- 하나의 나이대만 우선 고쳐주세요.
-- SAFE UPDATE모드는 프라이머리 키를 웨얼로 넣는 경우만 변경됩니다.
-- CMD에서 처리하겠습니다.
UPDATE testTbl2 SET user_name= '미어캣' WHERE age = 2;

-- UPDATE 구문이 전체 컬럼에 적용될 수 있다는 것을 이용해 특정 컬럼의 값을
-- 일괄적으로 계산식에 따라 새로운 결과값으로 대입해주는 것도 가능합니다.
-- 변수에 * 2 해서 원본 변수에 대입해주는 걸 생각해보세요.

UPDATE testTbl2 SET age = (age * 2) ;      
-- 다시 원래대로 돌려주세요.
UPDATE testTbl2 SET age = ( age / 2); 

-- DELETE FROM 구문은 데이터를 삭제하는 구문입니다.
-- SELECT는 특정한 칼럼들만 조회하거나, 전체를 모두 조회하는 등의
-- 경우의 수가 있었기 떄문에 SELECT와 FOM 사이에 구체적인 컬럼명이나
-- 혹은 *를 붙여서 전체 컬럼을 조회했습니다.
-- DELETE 특정 컬럼만 삭제하는 경우가 없고, 삭제할 거면 전체 row를 삭제하거나
-- 삭제를 안 해 버리거나어기 떄문에
-- DELETE와 FROM 사이에 아무것도 적지 않습니다.
-- DELETE 역시 일반적으로 WHERE 절과 함꼐 사용합니다.
-- WHERE 없이 사용 시 해당 테이블의 전체 데이터를 다 삭제합니다.

-- id 1에 해당하는 데이터만 삭제해보세요 (WHERE 사용)
DELETE FROM testTbl2 WHERE id = 1;
SELECT * FROM testTbl2;

-- limit를 사용하면 상위 n개만 삭제할 수도 있습니다.
-- 검색 결과물 중 상위 2개만 삭제해보세요.

DELETE FROM testTbl2 WHERE id limit 2;
SELECT * FROM testTbl2;

-- WHERE 절 없이 삭제하면 전체 데이터 삭제
DELETE FROM testTbl2;

-- DELETE FROM은 삭제할 때 시간이 더 오래 걸리는 편인데 이유는
-- 트랜잭션 로그라는 것을 한 로우마다 작성하기 떄문입니다.
-- 따라서 속도를 끌어올리고 싶다면 TRUNCATE를 DELETE FROM 대신 쓰는 경우도 있습니다. 
TRUNCATE TABLE testTbl2;

-- TRUNCATE와 DELETE FROM의 속도 차이를 체험해뵈 위해서
-- employees 테이블의 자료를 복사해보ㅔㅆ습니다.
CREATE TABLE testTbl4 (
		id int,
        first_name varchar(50),
        last_name varchar(50)
        );
        
-- 재귀 보사 구문, 아래와 같이 INSERT INTO 테이블명(SELECT구문, 컬럼 수 일치시킬 시alter
-- 해당 테이블의 모든 내용이 INSERT INTO로 복사됩니다.)
INSERT INTO testTbl4 (SELECT emp_no, first_name, last_name
					FROM employees.employees);
                    
SELECT * FROM testTbl4;

DELETE FROM testTbl4;
TRUNCATE TABLE testTbl2;
