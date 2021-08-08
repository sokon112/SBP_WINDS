-- 게시판 테이블 Table Create SQL
CREATE TABLE board_table
(
    bno NUMBER PRIMARY KEY NOT NULL, 
    nickname VARCHAR2(100) NOT NULL, 
    title VARCHAR2(100) NOT NULL, 
    uploaddate  DATE default sysdate NOT NULL, 
    views number(8) default 0,
    password VARCHAR2(100) NOT NULL, 
    contents VARCHAR2(2000) NOT NULL
);
-- 게시판 테이블 시퀸스 생성
create SEQUENCE board_tb_seq
start with 1;




-- 동호회 테이블 Table Create SQL
CREATE TABLE hobby_table
(
    hno          NUMBER     PRIMARY KEY       NOT NULL, 
    hwriter      VARCHAR2(100)      NOT NULL, 
    htitle       VARCHAR2(100)      NOT NULL, 
    huploaddate        DATE     default sysdate          NOT NULL, 
    hpassword    VARCHAR2(100)      NOT NULL, 
    hcontents    VARCHAR2(2000)    NOT NULL,
    hviews number(8) default 0
);
--동호회 테이블 시퀸스 생성
create SEQUENCE hobby_tb_seq;


-- 이벤트 테이블 Table Create SQL
CREATE TABLE event_table
(
    eno          NUMBER    PRIMARY KEY         NOT NULL, 
    ewriter      VARCHAR2(100)      NOT NULL, 
    etitle       VARCHAR2(100)      NOT NULL, 
    euploaddate        DATE     default sysdate          NOT NULL, 
    epassword    VARCHAR2(100)      NOT NULL, 
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
    dnickname    VARCHAR2(50)      NOT NULL, 
    uploaddate        DATE      default sysdate        NOT NULL, 
    password    VARCHAR2(100)      NOT NULL, 
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
values(board_tb_seq.nextval,'김명준','자격증 공부','1234','자격증 공부 같이 하실붕 구합니다~! ');
insert into board_table(bno,nickname,title,  password, contents)
values(board_tb_seq.nextval,'차은우','1층 카페','1234','카페 알바 안 구하나 카페 알바하구 시퍼 ㅜㅜ');
insert into board_table(bno,nickname,title,  password, contents)
values(board_tb_seq.nextval,'윤산하','오늘진짜.','1234','너무 졸리다 퇴근시간 언제와');
insert into board_table(bno,nickname,title, password, contents)
values(board_tb_seq.nextval,'전전국','퇴근시켜줘','1234','퇴근마렵다');

--게시판 테이블 검색
select * from board_table;





--동호회 테이블 정보 입력
insert into hobby_table(hno,hwriter,htitle,  hpassword, hcontents)
values(hobby_tb_seq.nextval,'이채은','new프로젝트','2345','새로운 프로젝트 같이 만드실분 모집합니다.');
insert into hobby_table(hno,hwriter,htitle,  hpassword, hcontents)
values(hobby_tb_seq.nextval,'김명준','등산동호회','2345','매주 토요일 등산하실 분 모집합니다.');
insert into hobby_table(hno,hwriter,htitle,  hpassword, hcontents)
values(hobby_tb_seq.nextval,'박민혁','댄스동호회','2345','취미생활로 춤추고 싶으신분들 모집합니다.');


--동호회 테이블 검색
select * from hobby_table;






--이벤트 테이블 정보 입력
insert into event_table(eno,ewriter,etitle,  epassword, econtents)
values(event_tb_seq.nextval,'이채은','롤 대회','3456','롤 대회를 개최합니다. 참여하고싶으신분들은 연락주세요~!! 010-1234-5678');
insert into event_table(eno,ewriter,etitle,  epassword, econtents)
values(event_tb_seq.nextval,'문빈','칼바람 대회','2345','이기면 간식을 쏩니다~!! 연락주세요~!!');
insert into event_table(eno,ewriter,etitle,  epassword, econtents)
values(event_tb_seq.nextval,'윤산하','체육대회','1234','부서 대항전!! 이기면 부서별로 포상휴가 획득의 기회를~!! ');

--이벤트 테이블 검색
select * from event_table;








--댓글 테이블 검색
select  * from comment_table;


--댓글 테이블 정보 입력
insert into comment_table(dno,bno,nickname, password, contents)
values(comment_tb_seq.nextval, 1,'이채은','1234','나두할래');
insert into comment_table(dno,bno,nickname, password, contents)
values(comment_tb_seq.nextval,3,'차은우','1234','이기면 1일 휴가');
insert into comment_table(dno,bno,nickname, password, contents)
values(comment_tb_seq.nextval,4,'이동민','1234','부서 대항전');
              
        

--조회수
update board_table set views = views + 1 where bno = 1;
update event_table set eviews = eviews + 1 where eno = 1;
update hobby_table set hviews = hviews + 1 where hno = 1;



select * from special_attach;


drop table board_table;
drop SEQUENCE board_tb_seq;


drop table hobby_table;
drop SEQUENCE hobby_tb_seq;

drop table event_table;
drop SEQUENCE event_tb_seq;

drop table special_attach; 

drop table comment_table;
drop SEQUENCE comment_tb_seq;
 











