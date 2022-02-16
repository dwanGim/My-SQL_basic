-- ict_practice2 스키마를 쓰도록 설정해주세요.
use ict_practice2;

-- 조건부로 데이터 입력하기
-- 예를 들어 100개의 데이터를 입력하려고 하는데 첫번째 자료만
-- 기본 데이터의 id와 중복되는 값이 있고, 이후 99 건은 PK가 중복되지 않는다고 해도
-- SQL 시스템 상 전체 데이터가 입력되지 않는 문제가 발생합니다.
-- 따라서 이 떄 중복되는 데이터 1건은 중복된다면 무시하고
-- 이후 나머지 99개 데이터는 중단 없이 정상적으로 입력하도록 만들 수 있습니다.

CREATE TABLE memberTbl (
		user_id varchar (6) PRIMARY KEY,
        user_name varchar (3) NOT NULL,
        addr varchar (3) NOT NULL
        );
        
-- MySQL은 구문을 통쨰로 묶어서 실행할 경우 모두 실행하거나 모두 실행하지 않습니다.
INSERT INTO memberTbl VALUES ('LSH', '이상혁', '서울');
INSERT INTO memberTbl VALUES  ('HS', '허수', '울산');
INSERT INTO memberTbl VALUES ('JJH', '정지훈', '인천');

-- 푸가 데이터를 입력하되 한 건은 중복, 두 건은 중복 없도록 세팅
-- INSERT INTO memberTbl VALUES ('LSH', '이상혁', '서울');
-- INSERT INTO memberTbl VALUES ('KHK', '김혁규', '경기');
-- INSERT INTO memberTbl VALUES ('PDH', '박도현', '충청');

-- 만약 PRIMARY KEY가 겹치면 무시하고 그렇지 않으면 입력해주는 코드로 변환
-- INSERT 와 INTO 사이에 IGNORE
INSERT IGNORE INTO memberTbl VALUES ('LSH', '이상혁', '서울');
INSERT IGNORE INTO memberTbl VALUES ('KHK', '김혁규', '경기');
INSERT IGNORE INTO memberTbl VALUES ('PDH', '박도현', '충청');

-- 만약 IGNORE 구문은 ㅣ존 데이터를 유지하고 신규 데이터를 마는 구문이었는데
-- 이미 존재하는 데이터가 있어도 신규 데이터로 갱신해서 넣고 싶은 경우
-- ON DUPLICATE KEY UPDATE user = '여성혁', addr = '제주'

INSERT INTO memberTbl VALUES ('LSH', '이성혁', '제주');

INSERT INTO memberTbl VALUES ('LSH', '이성혁', '제주')
	ON DUPLICATE KEY UPDATE user_name = '이성혁', addr = '제주';

-- ON DUPLICATE KEY UPDATE는 자료가 없으면 INSERT INTO에 적힌 대로 데이터를 넣고
-- 자료가 겹치는 상황인 경우에 ON DUPLICATE KEY UPDATE를 실행하는 구문이기 떄문에
-- 만약 데이터가 겹치지 않았을 경우 그대로INSERT INTO를 실행합니다.
-- 기존 데이블 요소와 겹치지 않는 것을 넣어서 잘 들어가는지 CMD를 이용해 실행한 후 확인해주세요.

-- [사용자 계정 관리하기]
-- 현재 root 계정은 모든 권한(수정, 삭제, 조회, 변경, 계정 생성 등)
-- 을 가지고 있는 계정입니다.
-- 그렇지만 모든 사람이 모든 권한을 가지는 일은 그만큼 DB접근이 용이해져 위험을 내포하ㅗ 있으며
-- 작년 초에 유명 게임사에서 DB를 날려먹는 사건이 발생한 만큼
-- 일정 규모 이상의 개발사에서는 직급이나 권한 별로 DB계정을 나눠서 관리합니다.
-- 이제 ROOT가 아닌 사용자를 만들고, 그 사용자에 대해서
-- 권한 부여를 하는 방법과 권한 ㅐ념에 대해 알아보겠습니다.

-- workbench에서 계정생성 및 권한부여하기.
-- 1. 좌측의 navigator에서 Administration 탭을 클릭합니다.
-- 2. Users and Pravileges를 클릭합니다.
-- 3. 열리는 화면에서 좌하단 Add Account를 클릭하신다음
--   Login name, password 등을 입력합니다.
--  4. 우하단 apply를 누르면 계정생성이 완료됩니다.
-- 5. Account Limit는 시간 당 기능 사용 가능 횟수를 설정합니다.
-- 6. Administrative Roles 는 어떤 구문 실행까지 허용할 지 입니다.

-- CMD환경에서 생성하는 경우는
-- CREATE USER 계정명@'%' IDENTIFIED BY '비밀번호';
-- GRANT ALL on *,* TO 계정명@'%' WITH GRANT OPTION;

-- 위 두 줄로 생성할 수 있습니다.
-- ict02 계정은 CMD 환경에서 여러분들이 만들어주세요. 비밀번호는 ictict02입니다.

-- 계정 접속 방법
-- CMD 접속시 mysql -u 계정명 -p 로 연결가능
-- 접속 후 show databases;를 이용해 DB(스키마)목록 확인가능.
-- 계정 목록(현재 mysql에서 쓸 수 있는 생성된 계정 전체) 조회를 하고 싶은 경우
-- 1. use mysql;
-- 2. SELECT user, host FROM user;를 하면 DB에 등록된 ㄱㅖ정 전체를 볼 수 있습니다.

-- Workbench에서 추가
-- Navigator 하단 Adminstation에서 유저 선택 후 Adminstractive Roles에서
-- 주고 싶은 권한을 모두 체크해주시면 도비니다.(DBA 선택 시 root와 동일한 권한 획득)

-- CMD에서는 위에 피리한 내용을 전체 권한으로 줄 수 있고
-- 일부 권한을 줄 때는 아래와 같이 줍니다.
-- GRANT 권한1, 권한2 ... ON DB명, 테이블명 TO 아이디@'%';
-- ict_practice2 데이터 베이스(스키마)의 testTbl3 테이블에
-- 가지도록 icttest02계정에 권한을 부여한다면
-- GRANT SELECT, DELETE ON ict_practice2.testTbl3 to icttest02@'%';
GRANT SELECT, DELETE ON ict_practice2.testTbl3 to icttest02@'%';

-- cmd에서 testTbl3의 내용을 SELECT로 조회해서 캡처해서 보내주세요.
-- DELETE로 하나 ㅇㅏ무거나 삭제해서 보내주세요.
-- INSERT 구문이 안 먹히는 것 까지 캡처해서 보내주세요.

-- 권한 뺏기.
-- GRANT 대신 REVOKE를 쓰면 권한을 뺏어올 수 있씁니다.
-- REVOKE 권한1, 권한2 ... DB명.테이블명 FROM 계정명;
-- 로그아웃 후 ict02로 로그인해서 icttest02의 SELECT권한을 뺐어주세요.
-- 그 다음 SELECT testtbl3가 거부되는지 확인해보세요.
REVOKE SELECT ON ict_practice2.testTbl3 FROM ictTest02@'%';



SELECT * FROM memberTbl;

