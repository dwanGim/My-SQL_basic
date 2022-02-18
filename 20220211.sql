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
        
         use ict_practice2;
	-- SELECT * FROM	
   SELECT height FROM userTbl WHERE height >	
   (SELECT min(reg_date)FROM userTbl WHERE reg_date like '2021%') ;
	
      -- 2021년 가입자중 가입일이 제일 빠른 사람보다 키가 큰 사람을 조회해주세요.
-- 날짜도 부등호로 조회 가능합니다.(작다 : 이전날짜, 크다 : 이후날짜)

-- 1. 2021년 가입자중 가입일이 제일 빠른 사람의 가입일자 구하기
SELECT min(reg_date) FROM usertbl WHERE reg_date >= '2021-01-01';
-- 2. 1의 쿼리문을 조건으로 해서 가입일이 제일 빠른 사람의 키 구하기.
SELECT height FROM userTbl WHERE reg_date=
    (SELECT min(reg_date) FROM usertbl WHERE reg_date >= '2021-01-01');
-- 3. 2에서 구한 키를 조건으로 해서 최종적인 명단을 얻어냄
SELECT * from userTbl WHERE height>
  (SELECT height FROM userTbl WHERE reg_date=
  (SELECT min(reg_date) FROM usertbl WHERE reg_date >= '2021-01-01'));
  

-- 유저를 여섯명 더 추가해보겠습니다.
INSERT INTO userTbl VALUES ('KJV', '김자바', 1983, '서울', '01112341234', 171, '2020-08-15');
INSERT INTO userTbl VALUES ('ADR', '압둘라', 1995, '경기', '01113131313', 183, '2021-04-01');
INSERT INTO userTbl VALUES ('YSO', '야스오', 2001, '부산', '01043214321', 165, '2021-10-08');
INSERT INTO userTbl VALUES ('ZYA', '장위안', 1985, '부산', '01155555555', 164, '2020-02-28');
INSERT INTO userTbl VALUES ('SPR', '스프링', 1987, '강원', '01066666666', 184, '2021-12-31');
INSERT INTO userTbl VALUES ('JSP', '쟈스피', 1989, '전라', '01077777777', 177, '2022-01-01');

SELECT * FROM userTbl;

-- ANY, ALL , SOME 구문은 서브쿼리와 조합해서 사용합니다.
-- 지역이 서울인 사람보다 키가 작은 사람을 찾는 쿼리문
-- 1. 서울사람의 키 전체 리스트 가져오기
SELECT height FROM userTbl WHERE addr='서울';

-- 위 구문을 서브쿼리로 해서 서울사람보다 키가 작은 사람을 찾을 경우 에러가 납니다.
-- 현재 데이터셋은 169, 171, 186 3개인데 어느데이터를 기반으로
-- height을 잡아줄지 모호하기 때문에 에러가 납니다.
SELECT * FROM userTbl WHERE height <
	(SELECT height FROM userTbl WHERE addr='서울');

-- ANY구문을 사용하면 169, 171, 186 모든 데이터에 대해 OR로 처리가 됩니다.
-- 개별값 모두에 대해 OR처리가 붙고 그래서 아래와 같이
-- (height < 169) OR (height < 171) OR (height < 186)
-- 3개 조건이 OR로 연결됩니다.
-- ANY는 OR로 연결된다는 특성상 범위가 가장 넓은 조건 하나로 통일됩니다.
-- 현재 코드에서는 186보다 작은 데이터는 전부 잡혀서 나옵니다.
-- ANY와 SOME은 사실상 차이가 없는 구문입니다.
-- ANY가 들어갈 자리에 SOME을 대신 넣어도 똑같이 작동합니다.
SELECT * FROM userTbl WHERE height < SOME
	(SELECT height FROM userTbl WHERE addr='서울');

-- ALL구문을 사용하면 169, 171, 186 모든 데이터가 AND로 처리됩니다.
-- 개별값 모두에 대해 AND처리가 붙고 그래서 아래와 같이
-- (height < 169) AND (height<171) AND (height < 186)
-- 쿼리문을 작성해서 AND구문을 이용해(직접 ALL키워드를 기입해서 작성해주세요) 조회해보세요.
SELECT * FROM userTbl WHERE height < ALL
	(SELECT height FROM userTbl WHERE addr = '서울');
	
-- ORDER BY는 결과물의 개수나 종류에는 영향을 미치지 않지만
-- 결과물을 순서대로(오름차순, 내림차순)정렬하는 기능을 가집니다.
-- SELECT 컬럼명 FROM 테이블명 ORDER BY 기준컬럼 정렬기준;
-- 정렬기준은 ASC(오름차순), DESC(내림차순) 이 있으며
-- 입력이 따로 없는 경우는 기본은 ASC로 잡습ㄴ디ㅏ.
-- 가입한 날짜순(reg_date 순으로 오름차순)으로 조회해보겠습니다.
SELECT * FROM userTbl ORDER BY reg_date ASC;
-- 키 큰 순, 내림차순으로 조회하는 구문을 작성해보세요.
SELECT * FROM userTbl ORDER BY height DESC;

-- 정렬시 동점인 부분을 처리하기 위해 ORDER BY 절을 두 개 이상 동시에 나열할 수도 있습니다.
-- 아래 코드는 키로 오름차순을 하되, 동적이면 생년 내림차순으로 처리합니다.
SELECT * FROM userTbl ORDER BY height ASC, birth_year DESC;

-- 만약에 문자를 내림차/오름차 순으로 나열한다면, 아스키코드 순으로 ORDER BY 정렬이 들어갑ㄴ다.
-- user_name 으로 ORDER BY를 걸어보세요.
-- 아무것도 안 적고 컬럼지정만 하면 ASC
SELECT * FROM userTbl ORDER BY user_name DESC;

-- 지역을 가나다라 역순으로 나열해주시되, 만약 지역이 같다면 이름 오름차순으로 정렬해주세요.
SELECT * FROM userTbl ORDER BY addr DESC, user_name ASC;

-- DISTINCT는 결과물로 나온 컬럼의 중복값을 다 제거하고
-- 고유값(각 값을 1개씩만 남긴 결과값)을 남겨줍다.
-- 아래 코드는 지역종류 7개(데이터 개수는 11개)를 파악하기 어렵습니다.
SELECT addr FROM userTbl;

-- 중복값을 하나로 집계하기 위해 출력컬럼 앞에 distinct를 붙입니다.
SELECT DISTINCT addr FROM userTbl;

-- employees 스키마 지정을 키워드로 해 주세요.
use employees;

-- 출력요소의 개수를 제한할 때는 limit 구문을 사용합니다.
-- 데이터가 300000개에 가깝다 보니 모든 데이터를 보여주지 않고 1000개만 보여줍니다.
SELECT * FROM employees;

-- 테이블명 뒤에 limit 숫자; 가 오는 경우는 적은 숫자 개수만큼만
-- 결과창에 보여줍니다.
-- 숫자를 하나만 적으면 자동으로 0번자료부터 n개를 보여줍니다.
-- 10개 출력해보세요.
SELECT * FROM employees limit 10;

-- limit는 ORDER BY와 결합해 쓸 수 있습니다.
SELECT * FROM employees ORDER BY hire_date DESC limit 10;

-- 서브쿼리를 써야 하는 문제. 첫 10개를 입사일자 순으로 내림차순 처리해보세요.
-- SELECT * FROM employees limit 10; <- 이 자료를 입사일자 순으로 나열하면 됩니다.
-- FROM절 다음에 서브쿼리를 써 주세요.
-- 일정 데이터셋을 먼저 얻어놓고, 얻어놓은 데이터셋을 내부적으로 정렬시킬때도 서브쿼리를 씁니다.
SELECT * FROM (SELECT * FROM employees limit 10) e ORDER BY hire_date DESC;

-- 만약 limit 숫자1, 숫자2; 와 같이 숫자 2개를 넣는 경우는
-- 숫자 1번부터 숫자 2에 기입한 갯수만큼 보여줍니다.
SELECT * FROM employees limit 5, 10;

-- employees에 대해서 20번 부터 30개를 출력해보세요.
SELECT * FROM employees limit 20, 30;
SELECT * FROM employees limit 19, 30;

-- GROUP BY는 같은 데이터를 하나의 그룹으로 묶어줍니다.
-- 조건절은 WHERE이 아닌 HAVING 절로 처리하게 됩니다.
-- ict_practice2를 잡아주세요.
use ict_practice2;

-- 하기 데이터에서 각 인물별로 구매한 개수 총합을 구해보겠습니다.
SELECT user_id, amount FROM buyTbl ORDER BY user_id;

-- SELECT 컬렴명, 집계함수(컬럼명2)... FROM 테이블명 GROUP BY 묶어서집계할컬럼명;
SELECT user_id, sum(amount) FROM buyTbl GROUP BY user_id;

-- 각 유저별 총 구매액을 구해주세요.
-- 총 구매액은 가격 * 개수의 결과를 다 더한것입니다.
-- 가격은 price컬럼에, 개수는 amount컬럼에 있습니다.
-- 집계함수 sum의 소괄호 사이에서 +, * 등의 연산을 할 수 있습니다.
SELECT user_id, sum(price * amount) as '총구매액' FROM buyTbl GROUP BY user_id;
SELECT * FROM buyTbl;

-- 각 유저별 구매 물품의 평균가를 구해세요(총액 아님). 평균은 avg()로 처리합니다.
-- avg()로 처리한 평균가 컬럼의 명칭은 "평균구매금액" 으로 변경해보세요.
SELECT user_id, avg(price) as '평균구매금액' FROM buyTbl GROUP BY user_id;

-- 자주쓰는 집계함수 정리(통계적 결과를 얻기 위해 사용)
-- AVG() 평균
-- MIN() 최소값
-- MAX() 최대값
-- COUNT() 결과 row의 개수
-- COUNT(DISTINCT) 종류 개수
-- STDEV() 표준편차
-- VAR_SAMP() 분산

-- userTbl에서 키가 제일 큰 회원의 이름과 키를 표시해주세요.
-- 서브쿼리로 height 절을 처리해야 합니다.
-- SELECT user_name, max(height) FROM usertbl;(함정코드)
SELECT user_name, height FROM userTbl WHERE height = 
	(SELECT max(height) FROM userTbl);

-- userTbl에서 키가 가장 작은 회원의 키와 이름을 표시해주세요.
SELECT user_name, height FROM userTbl WHERE height = 
	(SELECT min(height) FROM userTbl);
    
-- userTbl 테이블의 가입자 전체의 평균 키를 구해주세요.
SELECT avg(height) FROM userTbl;


-- 기존 쿼리문에서의 조건절은 WHERE절을 이용해서 처리했었습니다.
-- 하지만 GROUP BY 를 통해 집계하는 경우, WHERE절을 받을 수가 없습니다.
-- 대신 조건절을 HAVING으로 대체해 사용합니다.
-- WHERE과 사용법은 완전히 동일합니다.
-- 우선 사용자별 총 금액을(buyTbl)다시 구해보겠습니다.
-- sum(price * amount)를 활용해서 작성해주세요.
SELECT user_id, sum(price * amount) as '총구매액' FROM buyTbl GROUP BY user_id;
SELECT user_id, sum(price * amount) as '총구매액' FROM buyTbl GROUP BY user_id;


-- 구매액이 250000을 넘는 사람만 남겨보겠습니다.
-- WHERE처럼 사용하시되 HAVING이라고 적어서 조건식을 붙여보세요.
-- 집계함수를 사용한 컬럼은 명칭이 없으므로 별명을 붙여서 조건식을 써야 합니다.
SELECT user_id, sum(price * amount) b FROM buyTbl 
	GROUP BY user_id HAVING b > 250000;






      
        select * from usertbl;
        SELECT * FROM buyTbl;
        
       
        
        










