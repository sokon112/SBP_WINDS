--시퀀스 삭제하는 정보 값
drop SEQUENCE vacationAppNum_SEQ;
--혹시모를 테이블 삭제구문
drop table vacationScedule;
drop table vacationApplicationTable;


-- 휴가 신청자 테이블 생성
create table vacationScedule as
    select id, name from user_tab;

--휴가 신청서 테이블 pk부여, cnt값 부여 
select * from vacationScedule;
alter table vacationScedule add CONSTRAINT PK_vacationScedule PRIMARY KEY (id);
alter table vacationScedule add VacationCnt INT default 0 not null;

CREATE TABLE vacationApplicationTable
(
    vacationAppNum      NUMBER           NOT NULL, 
    id             varchar2(20)           NOT NULL, 
    type               VARCHAR2(20)     NOT NULL, 
	term          DATE             NOT NULL, 
    state              VARCHAR2(10)     DEFAULT '신청' NOT NULL, 
    applicationDate    DATE             NOT NULL, 
    approvalDate       DATE             , 
    reason             VARCHAR2(200)    NOT NULL, 
    refusalReason      VARCHAR2(200)    , 
    CONSTRAINT PK_vacationApplicationTable PRIMARY KEY (vacationAppNum)
);

--시퀀스 문서 번호를 업데이트하는 정보 값
CREATE SEQUENCE vacationAppNum_SEQ
START WITH 1
INCREMENT BY 1;
--applicationTable테이블 요소에 holidayScedule테이블의 값을 참조로 넣음
ALTER TABLE vacationApplicationTable add CONSTRAINT fk_vacationSceduleid FOREIGN KEY (id) REFERENCES vacationScedule(id);

--신청서 분류별로 삽입하는 구문
insert into vacationApplicationTable(vacationAppNum,id,type,term,applicationDate,reason,state,approvalDate) 
values(vacationAppNum_SEQ.nextval,'10030001','반차','2021-07-20',sysdate,'병원','승인',sysdate);


insert into vacationApplicationTable(vacationAppNum,id,type,term,applicationDate,reason,state,approvalDate) 
values(vacationAppNum_SEQ.nextval,'10030001','반차','2021-07-30',sysdate,'병원','승인',sysdate);

insert into vacationApplicationTable(vacationAppNum,id,type,term,applicationDate,reason,state,refusalReason,approvalDate) 
values(vacationAppNum_SEQ.nextval,'10030001','반차','2021-07-05',sysdate,'병원','거절','회사 사정으로 인해 불가능',sysdate);

insert into vacationApplicationTable(vacationAppNum,id,type,term,state,applicationDate,reason) 
values(vacationAppNum_SEQ.nextval,'10030001','반차','2021-07-06','신청',sysdate,'병원');

insert into vacationApplicationTable(vacationAppNum,id,type,term,state,applicationDate,reason) 
values(vacationAppNum_SEQ.nextval,'19080014','반차','2021-07-05','신청',sysdate,'병원');

insert into vacationApplicationTable(vacationAppNum,id,type,term,state,applicationDate,reason)  
values(vacationAppNum_SEQ.nextval,'19080013','반차','2021-07-05',sysdate,'강아지 산책');

insert into vacationApplicationTable(vacationAppNum,id,type,term,state,applicationDate,reason) 
values(vacationAppNum_SEQ.nextval,'19080013','반차','2021-08-05',sysdate,'집안사정');

insert into vacationApplicationTable(vacationAppNum,id,type,term,state,applicationDate,reason) 
values(vacationAppNum_SEQ.nextval,'19080013','월차','2021-08-05',sysdate,'호캉스');

select * from vacationScedule;
select * from vacationApplicationTable;






--------------------------------------------------------------------- 실행 시켜주세요 
alter table vacationApplicationTable drop column endterm;
alter table vacationApplicationTable rename column startterm to term;





