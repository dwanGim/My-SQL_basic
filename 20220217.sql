-- [조인(JOIN)]
-- 테이블 2개를 합쳐주는 기능입니다.
-- 연관된 데이터를 여러 테이블에 나눠담았을 때
-- 그것을 다시 재조립해줍니다.
-- 조인 문법
-- SELECT 테이블1.컬럼1, 테이블1.컬럼2, 테이블2.컬럼1, 테이블2.컬럼2...
-- 		FROM 테이블1 조인구문 테이블2
-- 		ON 테이블1.공통컬럼 = 테이블2.공통컬럼;

use ict_practice2;
-- useTbl과 buyTbl을 조회해보겠습니다.
-- cmd에서도 조회해서 캡처해주세요.
SELECT * FROM userTbl;
SELECT * FROM buyTbl;

-- 조인구문으로 테이블 2개를 합치기
SELECT * FROM buyTbl INNER JOIN userTbl
ON buyTbl.user_id = userTbl.user_id;

-- 지금 현재 구매자 정보를 조회하려고 하는데 필요한 정보는,
-- buyTbl의 구매물품정보 전체에, 구매자 정보는 택배를 받기 위해서
-- 이름, 주소, 핸드폰 번호만 있으면 되는 상황입니다.
-- 조인 구문을 활용해 필요한 컬럼만 출력되게 수정해주세요.

SELECT buyTbl.order_number, buyTbl.user_id, buyTbl.prod_name,
buyTbl.group_name, buyTbl.price, buyTbl.amount,
userTbl.user_name, userTbl.addr, userTbl. phone_number 
 FROM buyTbl INNER JOIN userTbl
ON buyTbl.user_id = userTbl.user_id;

-- 위의 경우처럼 특정 테이블이 전체 데이터를 출력하는 경우는
-- 테이블명.*로 대체할 수 있습니다.
SELECT buyTbl.*,
	userTbl.user_name, userTbl.addr, userTbl.phone_number
    FROM buyTbl INNER JOIN userTbl
    ON buyTbl.user_id = userTbl.user_id;

-- FROM 구문에서 테이블 명만 적는 게 아니라, 테이블명 별명형식으로 적을 경우
-- 테이블명을 풀로 적지 않고 별명으로 대체해서 호출할 수 있습니다.
-- buyTbl은 b라는 별명을 붙이고 userTbl은 u라는 별명을 붙이겠습니다.

SELECT * FROM buyTbl b INNER JOIN userTbl u
	ON b.user_id = u.user_id;

-- buyTbl의 구매 물품정보 전체에, 구매자 정보는 이름, 주소, 휴대폰 번호만
-- 조회되도록 만들어주세요.
SELECT b.order_number, b.user_id, b.prod_name,
b.group_name, b.price, b.amount,
u.user_name, u.addr, u.phone_number
 FROM buyTbl b INNER JOIN userTbl u ON b.user_id = u.user_id;
 
 SELECT buyTbl.order_number, buyTbl.user_id, buyTbl.prod_name,
buyTbl.group_name, buyTbl.price, buyTbl.amount,
userTbl.user_name, userTbl.addr, userTbl. phone_number 
 FROM buyTbl INNER JOIN userTbl
ON buyTbl.user_id = userTbl.user_id;

-- WHERE절 역시 JOIN문 뒤에 붙여서 쓸 수 있고, 필터링을 담당합니다.
-- 위의 구문에 구매물품 가격이 50000원 이상인 것만 남도록 처리해보세요.

SELECT b.order_number, b.user_id, b.prod_name, 
b.group_name, b.price, b.amount, 
u.user_name, u.addr, u.phone_number 
FROM buyTbl b INNER JOIN userTbl u 
ON b.user_id = u.user_id WHERE b.price >= 50000;

-- 위쪽 JOIN구문을 활용하시되, 가격이 200000 이하인 품목만 남겨주세요.
-- 그리고 가격 순으로 내림차순 출력해주세요.

SELECT b.order_number, b.user_id, b.prod_name, 
b.group_name, b.price, b.amount, 
u.user_name, u.addr, u.phone_number 
FROM buyTbl b INNER JOIN userTbl u 
ON b.user_id = u.user_id WHERE b.price <= 200000 
ORDER BY b.price DESC;

-- LEFT JOIN, RIGHT JOIN은 '공통 데이터가 아닌 데이터'도 방향에 따라
-- 출력이 되기 떄문에 공통데이터(INNER)가 아닌 데이터(OUTER)까지
-- 출력된다는 점을 이용해 OUTER JOIN이라고 부릅니다.
-- LEFT OUTER JOIN은 JOIN시 왼쪽 테이블의 자료는 모두 출력하고
-- 오른쪽 테이블 데이터는 왼쪽 기준컬럼과 일치할 떄만 출력합니다.
-- 반대로 RIGHT OUTER JOIN은 JOIN구문의 오른쪽 테이블 자료를 전부 출력하고
-- 왼쪽 테이블 데이터는 오른쪽 테이블의 기준컬럼과 일치할 떄만 출력합니다.
SELECT * FROM userTbl;
SELECT * FROM buyTbl;

SELECT * FROM userTbl u LEFT JOIN buyTbl b
 ON u.user_id = b.user_id;
 
SELECT * FROM userTbl u RIGHT JOIN buyTbl b
 ON u.user_id = b.user_id;
 
-- 이해를 돕기 위한 추가 테이블 추가
CREATE TABLE student(
		user_name varchar (3) primary key,
        user_addr char (2) not null
		);
        
CREATE TABLE membership (
		user_name varchar (3) primary key,
        user_point INT NOT NULL
        );
        
INSERT INTO student VALUES ('강건마', '서울');
INSERT INTO student VALUES ('노영웅', '수원');
INSERT INTO student VALUES ('이상용', '인천');
SELECT * FROM student;

INSERT INTO membership VALUES ('강건마', '15000');
INSERT INTO membership VALUES ('노영웅', '37000');
INSERT INTO membership VALUES ('김철수', '2800');
SELECT * FROM membership;

-- user_name을 공통 컬럼으로 해서 INNER JOIN을 수행해보세요.
-- 출력컬럼은 전부 다 입니다.

SELECT * FROM student s INNER JOIN membership m
	ON s.user_name = m.user_name;

-- user_name을 공통 컬럼으로 해서 LEFT JOIN을 수행해보겠습니다.

SELECT * FROM student s LEFT JOIN membership m
	ON s.user_name = m.user_name;

-- user_name을 공통 컬럼으로 해서 RIGHT JOIN을 수행해보겠습니다.
SELECT * FROM student s RIGHT JOIN membership m
	on s.user_name = m.user_name;
    
-- MYSQL에는 full OUTER JOIN(양쪽의 모든 데이터를 다 살림)이 안 됩니다.
-- LEFT JOIN 구문과 RIGHT JOIN 구문 사이에 UNION을 집어넣어 구현합니다.
-- 2줄의 쿼리문 사이에 UNION 키워드를 배치해 하나로 연결해 실행하면 됩니다.

SELECT * FROM student s RIGHT JOIN membership m
	ON s.user_name = m.user_name
    UNION SELECT * FROM student s LEFT JOIN membership m
	ON s.user_name = m.user_name;
;

CREATE TABLE player(
		user_name varchar (3) primary key,
        user_goal int not null
		);
CREATE TABLE pk (
		user_name varchar (3) primary key,
        user_pk INT NOT NULL
        );
INSERT INTO player VALUES ('메시', '10');
INSERT INTO player VALUES ('호날두', '20');
INSERT INTO player VALUES ('레반돞', '30');

DROP TABLE pk;

SELECT * FROM player;

INSERT INTO pk VALUES ('메시', '5');
INSERT INTO pk VALUES ('호날두', '10');
INSERT INTO pk VALUES ('라모스', '15');
SELECT * FROM pk;

SELECT * FROM player p INNER JOIN pk k
	ON p.user_name = k.user_name;

SELECT * FROM player p INNER JOIN pk k
	ON p.user_name = k.user_name;



SELECT * FROM player p LEFT JOIN pk k
	ON p.user_name = k.user_name;


SELECT * FROM player p RIGHT JOIN pk k
	on p.user_name = k.user_name;
    

SELECT * FROM student s RIGHT JOIN membership m
	ON s.user_name = m.user_name
    UNION SELECT * FROM student s LEFT JOIN membership m
	ON s.user_name = m.user_name;
    
    SELECT * FROM player p RIGHT JOIN pk k
	on p.user_name = k.user_name
    WHERE k.user_pk <= 10 
	ORDER BY k.user_pk DESC;