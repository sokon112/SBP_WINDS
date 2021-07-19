drop table user_tab;
drop table dm_tab;
drop table auth_tab;

CREATE TABLE USER_TAB(
    id varchar2(20) CONSTRAINT pk_id PRIMARY KEY,
    password VARCHAR2(20) not null,
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

--부서정보부여

insert into DM_TAB(deptNum,deptName)
values ('1000','인사팀');
insert into DM_TAB(deptNum,deptName)
values ('1001','기획팀');
insert into DM_TAB(deptNum,deptName)
values ('1002','재무팀');
insert into DM_TAB(deptNum,deptName)
values ('1003','개발팀');
insert into DM_TAB(deptNum,deptName)
values ('1004','홍보팀');
insert into DM_TAB(deptNum,deptName)
values ('1005','총무팀');


--imp정보부여

insert into USER_TAB (id,password,name,telnum,email,deptnum)
values('93080034','hyun2116~!','심태현','010-8508-7968','simthy0912@naver.com',1000);

insert into USER_TAB (id,password,name,telnum,email,deptnum)
values('99030012','pw0002','박아무개','010-9382-1726','park0001@naver.com',1000); 

insert into USER_TAB (id,password,name,telnum,email,deptnum)
values('10110013','pw0003','이아무개','010-2919-0932','lee0001@naver.com',1001); 

insert into USER_TAB (id,password,name,telnum,email,deptnum)
values('99030056','pw0001','김태촌','010-1234-1234','kim0001@naver.com',1000);

insert into USER_TAB (id,password,name,telnum,email,deptnum)
values('12030002','pw0004','김아무개','010-7865-6785','kim002@naver.com',1001); 

insert into USER_TAB (id,password,name,telnum,email,deptnum)
values('00120001','pw0005','김유식','010-0912-3214','kim0003@naver.com',1001);

insert into USER_TAB (id,password,name,telnum,email,deptnum)
values('03030003','pw0006','박상식','010-5142-3092','park0002@naver.com',1002);

insert into USER_TAB (id,password,name,telnum,email,deptnum)
values('01010001','pw0007','오그래','010-5556-5674','oh0001@naver.com',1002); 

insert into USER_TAB (id,password,name,telnum,email,deptnum)
values('02020002','pw0008','장치삼','010-2345-1234','jang0001@naver.com',1002);

insert into USER_TAB (id,password,name,telnum,email,deptnum)
values('02030002','pw0009','이진효','010-2313-0091','lee0002@naver.com',1003); 

insert into USER_TAB (id,password,name,telnum,email,deptnum)
values('02030005','pw0010','주시경','010-9828-0987','joo0001@naver.com',1003); 

insert into USER_TAB (id,password,name,telnum,email,deptnum)
values('02030008','pw0011','이규식','010-0192-0283','lee0003@naver.com',1003);

insert into USER_TAB (id,password,name,telnum,email,deptnum)
values('08090007','pw0012','박후민','010-0918-0192','park0003@naver.com',1004); 

insert into USER_TAB (id,password,name,telnum,email,deptnum)
values('08090011','pq0013','박영규','010-0912-0822','park0004@naver.com',1004);

insert into USER_TAB (id,password,name,telnum,email,deptnum)
values('09010001','pw0014','이창석','010-9990-0009','lee0004@naver.com',1004);

insert into USER_TAB (id,password,name,telnum,email,deptnum)
values('09010005','pw0015','김우람','010-9283-0293','kim0004@naver.com',1004);

insert into USER_TAB (id,password,name,telnum,email,deptnum)
values('11010003','pw0016','강태식','010-9283-0923','kang0001@naver.com',1004);

insert into USER_TAB (id,password,name,telnum,email,deptnum)
values('11040032','pw0017','이병진','010-9874-2378','lee0005@naver.com',1004);

insert into USER_TAB (id,password,name,telnum,email,deptnum)
values('12070002','pw0018','주희린','010-2934-7564','joo0002@naver.com',1005);  

insert into USER_TAB (id,password,name,telnum,email,deptnum)
values('18080123','pw0019','이아름','011-0923-9283','lee0006@naver.com',1005); 

insert into USER_TAB (id,password,name,telnum,email,deptnum)
values('20100234','pw0020','송창식','010-9283-0192','song0001@naver.com',1005);


--권한부여
--ad 
insert into auth_tab (authority,id)
values('ad','93080034');
insert into auth_tab (authority,id)
values('ad','10110013');
insert into auth_tab (authority,id)
values('ad','03030003');
insert into auth_tab (authority,id)
values('ad','08090007');
insert into auth_tab (authority,id)
values('ad','12070002');

--mg 
insert into auth_tab (authority,id)
values('mg','99030012');
insert into auth_tab (authority,id)
values('mg','12030002');
insert into auth_tab (authority,id)
values('mg','01010001');
insert into auth_tab (authority,id)
values('mg','02030005');
insert into auth_tab (authority,id)
values('mg','18080123');

--imp 
insert into auth_tab (authority,id)
values('imp','99030056');
insert into auth_tab (authority,id)
values('imp','00120001');
insert into auth_tab (authority,id)
values('imp','02020002');
insert into auth_tab (authority,id)
values('imp','02030008');
insert into auth_tab (authority,id)
values('imp','09010001');
insert into auth_tab (authority,id)
values('imp','09010005');
insert into auth_tab (authority,id)
values('imp','11010003');
insert into auth_tab (authority,id)
values('imp','11040032');
insert into auth_tab (authority,id)
values('imp','20100234');

