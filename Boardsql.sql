-- 게시판 테이블 Table Create SQL
CREATE TABLE board_table
(
    bno NUMBER PRIMARY KEY NOT NULL, 
    nickname VARCHAR2(20) NOT NULL, 
    title VARCHAR2(20) NOT NULL, 
    uploaddate  DATE default sysdate NOT NULL, 
    views number(8) default 0,
    password VARCHAR2(20) NOT NULL, 
    contents VARCHAR2(2000) NOT NULL
);
-- 게시판 테이블 시퀸스 생성
create SEQUENCE board_tb_seq
start with 1
INCREMENT BY 1;


-- 동호회 테이블 Table Create SQL
CREATE TABLE hobby_table
(
    hno          NUMBER     PRIMARY KEY       NOT NULL, 
    hwriter      VARCHAR2(20)      NOT NULL, 
    htitle       VARCHAR2(100)      NOT NULL, 
    huploaddate        DATE     default sysdate          NOT NULL, 
    hpassword    VARCHAR2(20)      NOT NULL, 
    hcontents    VARCHAR2(2000)    NOT NULL,
    hviews number(8) default 0
);
--동호회 테이블 시퀸스 생성
create SEQUENCE hobby_tb_seq;


-- 이벤트 테이블 Table Create SQL
CREATE TABLE event_table
(
    eno          NUMBER    PRIMARY KEY         NOT NULL, 
    ewriter      VARCHAR2(20)      NOT NULL, 
    etitle       VARCHAR2(100)      NOT NULL, 
    euploaddate        DATE     default sysdate          NOT NULL, 
    epassword    VARCHAR2(20)      NOT NULL, 
    econtents    VARCHAR2(2000)    NOT NULL,
    eviews number(8) default 0
);
--이벤트 테이블 시퀸스 생성
create SEQUENCE event_tb_seq;



-- 댓글 테이블 Table Create SQL
CREATE TABLE comment_table
(
    dno         NUMBER     PRIMARY KEY        NOT NULL, 
    bno         NUMBER            NOT NULL, 
    dnickname    VARCHAR2(20)      NOT NULL, 
    uploaddate        DATE      default sysdate        NOT NULL, 
    password    VARCHAR2(20)      NOT NULL, 
    content   VARCHAR2(1000)    NOT NULL 
    
);
--댓글 테이블 시퀸스 생성
create SEQUENCE comment_tb_seq;

-- 댓글테이블과 게시판 테이블 번호 연결
ALTER TABLE comment_table
    ADD CONSTRAINT FK_board_table_bno FOREIGN KEY (bno)
        REFERENCES board_table (bno);


-- 파일 첨부 테이블        
create table special_attach(
	uuid varchar2(100) not null,
	uploadPath varchar2(200) not null,
	fileName varchar2(100) not null,
	fileType char(1) default 'I',
	sno NUMBER ,
	seltable char(1)  
);

alter table special_attach add constraint pk_sp_attach_uuid primary key(uuid);






--게시판 테이블 정보 입력
insert into board_table(bno,nickname,title, password, contents)
values(board_tb_seq.nextval,'김명준','엠제이','1234','참가번호 777 ');
insert into board_table(bno,nickname,title,  password, contents)
values(board_tb_seq.nextval,'차은우','아스트로','1234','잘생겼다');
insert into board_table(bno,nickname,title,  password, contents)
values(board_tb_seq.nextval,'윤산하','아스트로막내','1234','뿌뿌');
insert into board_table(bno,nickname,title, password, contents)
values(board_tb_seq.nextval,'전전국','방탄막내','1234','토끼');

--게시판 테이블 검색
select * from board_table;






insert into hobby_table(hno,hwriter,htitle,  hpassword, hcontents)
values(hobby_tb_seq.nextval,'이채은','마술부','2345','테스트를 해보자');
insert into hobby_table(hno,hwriter,htitle,  hpassword, hcontents)
values(hobby_tb_seq.nextval,'김명준','아스트로','2345','맏형이다');
insert into hobby_table(hno,hwriter,htitle,  hpassword, hcontents)
values(hobby_tb_seq.nextval,'박민혁','댄스동호회','2345','댄스부 모집');


--동호회 테이블 검색
select * from hobby_table;






--이벤트 테이블 정보 입력
insert into event_table(eno,ewriter,etitle,  epassword, econtents)
values(event_tb_seq.nextval,'이채은','롤 대회','3456','나두할래');
insert into event_table(eno,ewriter,etitle,  epassword, econtents)
values(event_tb_seq.nextval,'이채은','칼바람 대회','2345','이기면 1일 휴가');
insert into event_table(eno,ewriter,etitle,  epassword, econtents)
values(event_tb_seq.nextval,'bts','체육대회','1234','부서 대항전');

--이벤트 테이블 검색
select * from event_table;








--댓글 테이블 검색
select  * from comment_table;


--댓글 테이블 정보 입력
insert into comment_table(dno,bno,nickname, password, contents)
values(comment_tb_seq.nextval, 2,'이채은','3456','나두할래');
insert into comment_table(dno,bno,nickname, password, contents)
values(comment_tb_seq.nextval,3,'차은우','2345','이기면 1일 휴가');
insert into comment_table(dno,bno,nickname, password, contents)
values(comment_tb_seq.nextval,4,'이동민','1234','부서 대항전');
              
        

--조회수
update board_table set views = views + 1 where bno = 1;
update event_table set eviews = eviews + 1 where eno = 1;
update hobby_table set hviews = hviews + 1 where hno = 1;



select * from special_attach;


drop table board_table;
drop SEQUENCE board_tb_seq;

drop table special_attach; 

drop table hobby_table;
drop SEQUENCE hobby_tb_seq;

drop table event_table;
drop SEQUENCE event_tb_seq;


drop table comment_table;
drop SEQUENCE comment_tb_seq;
 











