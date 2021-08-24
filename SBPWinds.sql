--8~42행까지만 선택하여 선택된 텍스트 Excute 할것.
--테이블 전체 삭제 (필요시 실행)
drop table auth_tab;
drop table user_tab;
drop table dm_tab;

test for git

-- 생성 
CREATE TABLE USER_TAB(
    id varchar2(20) CONSTRAINT pk_id PRIMARY KEY,
    password VARCHAR2(100) not null,
    name VARCHAR2(20) not null,
    telNum varchar2(20) not null,
    email VARCHAR2(50) not null,
    deptNum NUMBER not null
);

CREATE TABLE DM_TAB(
    deptNum NUMBER CONSTRAINT pk_dept PRIMARY KEY,
    deptName VARCHAR2(20) not null
);

CREATE TABLE AUTH_TAB(
    authority VARCHAR2(20) not null,
    id varchar2(20) not null
);

ALTER TABLE USER_TAB ADD CONSTRAINT fk_user_tab FOREIGN KEY(deptNum) REFERENCES DM_TAB;

ALTER TABLE AUTH_TAB ADD CONSTRAINT fk_auth_tab FOREIGN KEY(id) REFERENCES USER_TAB;

insert into DM_TAB(deptNum,deptName)
values ('1000','대표이사');
insert into DM_TAB(deptNum,deptName)
values ('1001','인사팀');
insert into DM_TAB(deptNum,deptName)
values ('1002','기획팀');
insert into DM_TAB(deptNum,deptName)
values ('1003','개발팀');
insert into DM_TAB(deptNum,deptName)
values ('1004','재무홍보팀');
insert into DM_TAB(deptNum,deptName)
values ('1005','총무팀');

--확인
select * from USER_TAB;
select * from AUTH_TAB;


-- 로그인용 정보 메모
-- id		pw		auth
-- 10030001 pw001	ad

-- 15080002 pw002	mg(이하 emp 전까지 동일)
-- 		~
-- 15080006 pw006

-- 17030007 pw007	emp(이하 전체 동일)
-- 		~
-- 17030009 pw009
-- 19080010 pw010
-- 		~
-- 19080014	pw014
-- 21030015 pw015
-- 		~
-- 21030020 pw020


-- 로그인/로그아웃 중 테이블 없다고 에러시
select * from PERSISTENT_LOGINS;

create table persistent_logins(
   username varchar(64) not null,
   series varchar(64) not null,
   token varchar(64) not null,
   last_used timestamp not null
);


