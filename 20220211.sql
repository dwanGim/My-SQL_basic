-- AUTO_INCREMENT(자동증가)
-- INT(정수) 자료형이 붙은 칼럼에만 붙일 수 있고, 이게 붙은 컬럼은 자동으로
-- 1씩 증가하는 숫자를 배정받습니다. 시작은 1입니다.alter
-- INSERT INTO 구문이 실행될 때마다 해당 컬럼에 들어갈 숫자를 자동으로 배정해줍니다.
-- 한 번 사용된 숫자는 다시는 사용되지 않습니다.

-- FOREIGN KEY (외래 키)
-- 쇼핑몰의 구매자는 반드시 회원이어야 합니다.
-- 특정 테이블에 존재하는 값만 해당 컬럼에 들어올 수 있도록 거는 제약조건
-- FOREIGN KEY 를 거는 컬럼의 자료형과 크기는 참조하는 쪽과 원본 모두 같아야 합니다. 
-- 참조컬럼에 있는 값만(user_id에 존재하는 값만) buyTbl의 user_id에 올 수 있습니다.

use ict_practice2;

CREATE TABLE buyTbl (
		order_number int AUTO_INCREMENT PRIMARY KEY,
        user_id varchar (8) NOT NULL,
        prod_name varchar (6) NOT NULL,
        group_name varchar (4) ,
        price int (7) NOT NULL,
        amount int (3) NOT NULL,
        FOREIGN KEY(user_id) REFERENCES userTbl(user_id)
        );
        
        SELECT * FROM buyTbl;
        
        INSERT INTO userTbl VALUES ('CJH', '채종훈', '2000', '경기', '01111111111', 175, '2020-3-5');
        INSERT INTO userTbl VALUES ('SHM', '손흥민', '1993', '영국', '00000000000', 180, '2021-3-5');
		INSERT INTO userTbl VALUES ('EM', '일론머스크', '1971', '화성', '4829589851', 171, '2021-12-5');
		
        select * from userTbl;

		-- 가입한 회원이 물건을 산 이력이 남도록하겠습니다.
        
        INSERT INTO buyTBL VALUES(null, 'CJH', '기계식키보드', '주변기기', '200000', 1);
		-- order_number 컬럼은 값을 안 주면(null을 주면) AUTO_INCREMENT에 의해 자동으로
        -- 1씩 증가된 숫자를 배정받습니다.
        
        INSERT INTO buyTbl VALUE (null, 'CJH', '듀얼모니터', '전자기기', '20000', 1);
        
        -- userTbl의 user_id에 없는 회원 아이들 INSERT INTO로 넣어보세요.
        
        -- INSERT INTO buyTbl VALUE (null, 'HHH', '기관총', '무기' ,'1000', 5);
        
        
        -- 회원 3명 대한 구매이력을 1개씩 추가로 남겨주시고 저한테 쿼리문을 보내주세요.
        INSERT INTO buyTbl VALUE (null, 'EM', '3090 ', '전자기기', '20000', 1);
        INSERT INTO buyTbl VALUE (null, 'SHM', 'usb', '전자기기', '30000', 2);
        INSERT INTO buyTbl VALUE (null, 'CJH', '마우스', '주변기기', '10000', 1);
        
        -- user를 두 명 더 추가해주세요.
        -- 정보는 전부 여러분들이 알아서 넣어주시도, 키는 한 명은 160대로 해주시면 됩니다.
        
        INSERT INTO userTbl VALUES ('CTN', '쿠티뉴','2015', '브라질', '3333333333', 160, '2000-01-01');
        
        INSERT INTO userTbl VALUES ('JRJ', '조르지뉴', '1999', '이탈리아', '55555555555', 150, '2022-02-02');
        
        -- 새로 추가한 2명의 구매내역 추가
         INSERT INTO buyTbl VALUE (null, 'CTN', '축구화', '축구용품', '2000000', 1);
         INSERT INTO buyTbl VALUE (null, 'JRJ', '각도기', '수학용품', '10000', 2);
		 
        -- 여태까지의 SELECT 구문은 조건 없이 모든 데이터를 다 조회했습니다.
        -- 극단적인 경우 employees의 테이블의 모든 row를 다 조회하는(cmd환경) 경우
        -- 조회시간이 말도 안되게 오래 잡히는 경우가 발생합니다.
        -- 따라서 조건에 맞도록 필터링 하기 위해 WHERE 구문을 사용합니다.
        -- SELECT 컬럼명1, 컬럼명2... FROM 테이블명 WHERE 컬럼명 = 조건식;
        
       -- SELECT * FROM employees.employees;
        
        -- 아래는 이름이 손흥민인 사람만 조회하는 구문입니다.
        SELECT * FROM userTbl WHERE user_name = '손흥민';
        SELECT * FROM userTbl WHERE addr = '경기';
        
        -- 관계연산자를 이용해서 대소비교를 하거나
        -- AND, OR을 이용해 조건 여러 개를 연결할 수 있습니다.
        -- 키 180 이상인 사람을 조회해주세요.
        SELECT * FROM userTbl WHERE height >= 180;
        
		-- AND 를 이용해 91~99 년생까지만 조회하도록 해주세요
        SELECT * FROM userTbl WHERE birth_year >= 1991 AND birth_year <= 1999;
        
        -- BETWEEN ~ AND 구문을 사용하면 컬럼을 한 번만 찍고도 범위 조회가 가능합니다.
        SELECT * FROM userTbl WHERE birth_year BETWEEN 1991 AND 1999;
        -- 91 이상 99 이하입니다. 포함하는 개념.
		-- 위와 같이 숫자는 연속된 범위를 갖기 떄문에 범위 연산자로 처리가 가능하지만
        -- addr같은 자료는 서울이 더 크다 영국이 더 작다 하는 연산적 처리가 불가능합니다.
        -- 먼저 지역이 서울이거나 화성인 사람의 정보를 WHERE로 조회해주세요.
        SELECT * FROM userTbl WHERE addr = '화성' OR addr = '경기';
		-- in 키워드를 사용하면 컬럼명 in (데이터1, 2, 3, 4 ... );
        -- 특정 컬럼에 괄호에 담긴 데이터가 포함되는 경우를 전부 출력합니다.
        SELECT * FROM userTbl WHERE addr in ('경기', '화성', '영국');
        
        -- like 연산자는 일종의 표현 양식을 만들어줍니다.
        -- like 연산자를 이용하면 %라고 불리는 와일드 카드나 혹은 _라고 불리는
        -- 와일드카드 문자를 이용해 매칭되는 문자나 문자열을 찾습니다.
        
        -- 채씨를 찾는 케이스(%는 몇 글자가 오더라도 상관없음)
        -- 아래 구문은 채로 시작하는 모든 요소를 다 가져옵니다. '채'도 포함
        SELECT *  FROM userTbl WHERE user_name like '채%';
        
        -- 휴대폰 번호가 01로 시작하는 모든 사람을 찾는 쿼리문을 작성해주세요.
        SELECT * FROM userTbl WHERE phone_nomber like '01%';
        
        -- 두 글자인 경우만 찾는 케이스(_ 하나에 한 글자임_
        SELECT * FROM userTbl WHERE user_name like '__';
        
        -- user_id 가 3글자이면서 H로 끝나는 사람만 조회하는 커리문을 날려주세요.
        SELECT * FROM userTbl WHERE user_id like '__h';
        
        -- 서브쿼리(하위쿼리) 란 1차적 결과를 얻어놓고,
        -- 거기서 다시 조회구문을 중첩해서 날리는 것을 의미합니다.
        -- 채종훈보다 키가 큰 사람을 조회하는 예시를 보겠습니다.
        
        -- 원시적인 방법 
        -- 1. 채종훈의 키를 WHERE절을 이용해 확인합니다.
        -- SELECT height from userTbl WHERE user_name like '채종훈';
        SELECT height from userTbl WHERE user_name = '채종훈';
        -- 2. 확인한 채종훈의 키를 쿼리문에 넣는다.
        -- 175보다 큰 사람의 이름과 키만 조회해보겠습니다.
        SELECT user_name, height from userTbl WHERE height > 175;
        
        -- 서브쿼리 활용 방법
        -- 서브쿼리는 FROM 절 다음에 () 로 이용해서
        -- SELECT 구문을 한 번 더 활용합니다.
        SELECT user_name, height FROM userTbl WHERE height >
        (SELECT height FROM userTbl WHERE user_name = '채종훈');
        
        -- 서브쿼리를 이용해 '페이커'보다 먼저 태어난 사람들만 골라내보세요.
        -- 생년월일(날짜나 연도)도 대소 비교가 가느합니다. 큰 쪽이 더 최근, 작은 쪽이 더 이전
        SELECT user_name, birth_year FROM userTbl WHERE birth_year <
        (SELECT birth_year FROM userTbl WHERE user_name = '조르지뉴');
        
        -- 최대값은 내장함수 max()로 구합니다.
        -- 현재 userTbl 테이블에서 가장 나이가 적은 사람의 생년 조회
        SELECT max(birth_year) FROM userTbl;
        
        -- user_id에 M에 포함된 사람들 중 키가 제일 작은 사람보다
        -- 키가 더 큰 사람을 구하시오.(min을 활용하세요)
		
        -- SELECT user_name, user_id, height FROM userTbl WHERE user_id like '%M%' AND height >
        -- (SELECT min(height) FROM userTbl);
       
       SELECT * FROM userTbl WHERE height >
       (SELECT min(height) FROM userTbl WHERE user_id like '%m%'); 
        
        
        -- 2021년 가입자 중 가입일이 제일 빠른 사람보다 키가 큰 사람을 조회해주세요.
        -- 날짜도 부등호로 조회 가능합니다.
        
         
	-- SELECT * FROM	
   SELECT height FROM userTbl WHERE height >	
   (SELECT min(reg_date)FROM userTbl WHERE reg_date like '2021%') ;
	
      
      
        select * from usertbl;
        SELECT * FROM buyTbl;
        
       
        
        










