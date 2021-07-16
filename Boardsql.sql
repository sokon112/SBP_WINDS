-- 게시판 테이블 Table Create SQL
CREATE TABLE board_table
(
    bno NUMBER PRIMARY KEY NOT NULL, 
    nickname VARCHAR2(20) NOT NULL, 
    title VARCHAR2(20) NOT NULL, 
    uploaddate  DATE default sysdate NOT NULL, 
    views NUMBER NOT NULL, 
    password VARCHAR2(20) NOT NULL, 
    contents VARCHAR2(2000) NOT NULL
);

-- 게시판 테이블 시퀸스 생성
create SEQUENCE board_tb_seq;





--테이블 삭제
DROP TABLE board_table;
DROP TABLE event_hobby_table;

--게시판 테이블 정보 입력
insert into board_table(bno,nickname,title, views, password, contents)
values(board_tb_seq.nextval,'김명준','엠제이',1,'1234','참가번호 777 ');
insert into board_table(bno,nickname,title, views, password, contents)
values(board_tb_seq.nextval,'차은우','아스트로',2,'1234','잘생겼다');
insert into board_table(bno,nickname,title, views, password, contents)
values(board_tb_seq.nextval,'윤산하','아스트로막내',3,'1234','뿌뿌');

--게시판 테이블 검색
select * from board_table;

--게시판 테이블 리스트 보기(사용자)
select bno, nickname,title,views,contents,uploaddate
from board_table
where bno=3;

--게시판 테이블 리스트에서 목록을 누르는 경우(사용자)
select bno,nickname,title, views, contents,uploaddate
from board_table

--게시판 테이블 리스트에서 글쓰기 수정하는 경우
update board_table 
set title='아로하', contents='5기 모집', uploaddate=sysdate
where bno=3;

--게시판 테이블 리스트에서 삭제하는 경우
delete from board_table
where bno=1;

select * from board_table
where bno=2 and views=1;




-- 동호회 테이블 Table Create SQL
CREATE TABLE hobby_table
(
    no          NUMBER     PRIMARY KEY       NOT NULL, 
    writer      VARCHAR2(20)      NOT NULL, 
    title       VARCHAR2(20)      NOT NULL, 
    uploaddate        DATE     default sysdate          NOT NULL, 
    password    VARCHAR2(20)      NOT NULL, 
    contents    VARCHAR2(2000)    NOT NULL, 
    images      BLOB              NULL 
);
--동호회 테이블 시퀸스 생성
create SEQUENCE hobby_tb_seq;

insert into hobby_table(no,writer,title,  password, contents)
values(hobby_tb_seq.nextval,'이채은','마술부','2345','테스트를 해보자');
insert into hobby_table(no,writer,title,  password, contents)
values(hobby_tb_seq.nextval,'김명준','아스트로','2345','맏형이다');
insert into hobby_table(no,writer,title,  password, contents)
values(hobby_tb_seq.nextval,'박민혁','댄스동호회','2345','댄스부 모집');


--동호회 테이블 검색
select * from hobby_table;


--동호회 테이블 리스트 보기(사용자)
select no, writer,title,contents,uploaddate
from hobby_table
where no=3;

--동호회 테이블 리스트에서 목록을 누르는 경우(사용자)
select no, writer,title,contents,uploaddate
from hobby_table

--동호회 테이블 리스트에서 글쓰기 수정하는 경우
update hobby_table 
set title='아로하', contents='5기 모집', uploaddate=sysdate
where no=3;

--게시판 테이블 리스트에서 삭제하는 경우
delete from hobby_table
where no=3;




-- 이벤트 테이블 Table Create SQL
CREATE TABLE event_table
(
    no          NUMBER    PRIMARY KEY         NOT NULL, 
    writer      VARCHAR2(20)      NOT NULL, 
    title       VARCHAR2(20)      NOT NULL, 
    uploaddate        DATE     default sysdate          NOT NULL, 
    password    VARCHAR2(20)      NOT NULL, 
    contents    VARCHAR2(2000)    NOT NULL, 
    images      BLOB              NULL
);

--이벤트 테이블 삭제
DROP TABLE special_table;

--이벤트 테이블 시퀸스 생성
create SEQUENCE event_tb_seq;

--이벤트 테이블 정보 입력
insert into event_table(no,writer,title,  password, contents)
values(event_tb_seq.nextval,'이채은','롤 대회','3456','나두할래');
insert into event_table(no,writer,title,  password, contents)
values(event_tb_seq.nextval,'이채은','칼바람 대회','2345','이기면 1일 휴가');
insert into event_table(no,writer,title,  password, contents)
values(event_tb_seq.nextval,'이채은','체육대회','1234','부서 대항전');

--이벤트 테이블 검색
select * from event_table;


--이벤트 테이블 리스트 보기(사용자)
select no, writer,title,contents,uploaddate
from event_table
where no=3;

--동호회 테이블 리스트에서 목록을 누르는 경우(사용자)
select no, writer,title,contents,uploaddate
from hobby_table

--동호회 테이블 리스트에서 글쓰기 수정하는 경우
update hobby_table 
set title='아로하', contents='5기 모집', uploaddate=sysdate
where no=3;







-- 댓글 테이블 Table Create SQL
CREATE TABLE comment_table
(
    dno         NUMBER     PRIMARY KEY        NOT NULL, 
    bno         NUMBER            NOT NULL, 
    nickname    VARCHAR2(20)      NOT NULL, 
    uploaddate        DATE      default sysdate        NOT NULL, 
    password    VARCHAR2(20)      NOT NULL, 
    contents    VARCHAR2(1000)    NOT NULL 
    
);

--댓글 테이블 시퀸스 생성
create SEQUENCE comment_tb_seq;

--댓글 테이블 삭제
DROP TABLE comment_table;

--댓글 테이블 검색
select  * from comment_table;


--댓글 테이블 정보 입력
insert into comment_table(dno,bno,nickname, password, contents)
values(comment_tb_seq.nextval, 2,'이채은','3456','나두할래');
insert into comment_table(dno,bno,nickname, password, contents)
values(comment_tb_seq.nextval,3,'차은우','2345','이기면 1일 휴가');
insert into comment_table(dno,bno,nickname, password, contents)
values(comment_tb_seq.nextval,4,'이동민','1234','부서 대항전');


--댓글 테이블 리스트 보기(사용자)
select dno,bno,nickname, password, contents,uploaddate
from comment_table
where dno=4;

--댓글 테이블 리스트에서 목록을 누르는 경우(사용자)
select dno,bno,nickname, password, contents,uploaddate
from comment_table

--댓글 테이블 리스트에서 글쓰기 수정하는 경우
update comment_table 
set contents='5기 모집', uploaddate=sysdate
where bno=3;

--댓글 테이블 리스트에서 삭제하는 경우
delete from comment_table
where bno=4;


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
	sno NUMBER 
);

DROP TABLE special_attach;

alter table special_attach add constraint pk_sp_attach_uuid primary key(uuid);
alter table special_attach add constraint fk_sp_attach foreign key(sno) references special_table(sno);



















