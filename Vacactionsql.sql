--시퀀스 삭제하는 정보 값

drop table vacationApplicationTable;
drop table vacationScedule;
drop SEQUENCE vacationAppNum_SEQ;


-- 휴가 신청자 테이블 생성
create table vacationScedule as
    select id, name from user_tab;

CREATE TABLE vacationApplicationTable
(
    vacationAppNum      NUMBER           NOT NULL, 
    id             varchar2(20)           NOT NULL, 
    type               VARCHAR2(20)     NOT NULL, 
	startterm          DATE             NOT NULL, 
    endterm          DATE             NOT NULL, 
    term          number             NOT NULL, 
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
--휴가 신청서 테이블 pk부여, cnt값 부여 
alter table vacationScedule add CONSTRAINT PK_vacationScedule PRIMARY KEY (id);
alter table vacationScedule add VacationCnt INT default 0 not null;

--applicationTable테이블 요소에 holidayScedule테이블의 값을 참조로 넣음
ALTER TABLE vacationApplicationTable add CONSTRAINT fk_vacationSceduleid FOREIGN KEY (id) REFERENCES vacationScedule(id);

--신청서 분류별로 삽입하는 구문
--신청서 분류별로 삽입하는 구문
--승인
insert into vacationApplicationTable(vacationAppNum,id,type,startterm,endterm,term,applicationDate,reason,state,approvalDate) 
values(vacationAppNum_SEQ.nextval,'10030001','반차','2021-07-05','2021-07-05',1,'2021-07-05','승인 테스트 입니다1.','승인',sysdate);

insert into vacationApplicationTable(vacationAppNum,id,type,startterm,endterm,term,applicationDate,reason,state,approvalDate) 
values(vacationAppNum_SEQ.nextval,'21030020','월차','2021-07-07','2021-07-08',2,'2021-07-05','승인 테스트 입니다2.','승인',sysdate);

insert into vacationApplicationTable(vacationAppNum,id,type,startterm,endterm,term,applicationDate,reason,state,approvalDate) 
values(vacationAppNum_SEQ.nextval,'10030001','반차','2021-08-05','2021-08-05',1,'2021-07-05','승인 테스트 입니다3.','승인',sysdate);

insert into vacationApplicationTable(vacationAppNum,id,type,startterm,endterm,term,applicationDate,reason,state,approvalDate) 
values(vacationAppNum_SEQ.nextval,'15080003','월차','2021-08-07','2021-08-08',2,'2021-07-05','승인 테스트 입니다4.','승인',sysdate);

insert into vacationApplicationTable(vacationAppNum,id,type,startterm,endterm,term,applicationDate,reason,state,approvalDate) 
values(vacationAppNum_SEQ.nextval,'21030020','반차','2021-08-10','2021-08-10',1,'2021-07-05','승인 테스트 입니다5.','승인',sysdate);

insert into vacationApplicationTable(vacationAppNum,id,type,startterm,endterm,term,applicationDate,reason,state,approvalDate) 
values(vacationAppNum_SEQ.nextval,'10030001','월차','2021-08-24','2021-08-27',4,'2021-07-05','승인 테스트 입니다6.','승인',sysdate);

insert into vacationApplicationTable(vacationAppNum,id,type,startterm,endterm,term,applicationDate,reason,state,approvalDate) 
values(vacationAppNum_SEQ.nextval,'15080003','반차','2021-08-16','2021-08-16',1,'2021-07-05','승인 테스트 입니다7.','승인',sysdate);

insert into vacationApplicationTable(vacationAppNum,id,type,startterm,endterm,term,applicationDate,reason,state,approvalDate) 
values(vacationAppNum_SEQ.nextval,'10030001','월차','2021-06-05','2021-06-05',1,'2021-07-05','승인 테스트 입니다8.','승인',sysdate);

insert into vacationApplicationTable(vacationAppNum,id,type,startterm,endterm,term,applicationDate,reason,state,approvalDate) 
values(vacationAppNum_SEQ.nextval,'21030020','반차','2021-06-05','2021-06-05',1,'2021-07-05','승인 테스트 입니다9.','승인',sysdate);

--거절
insert into vacationApplicationTable(vacationAppNum,id,type,startterm,endterm,term,applicationDate,reason,state,approvalDate) 
values(vacationAppNum_SEQ.nextval,'10030001','반차','2021-07-05','2021-07-05',1,'2021-07-05','거절 테스트 입니다1.','거절',sysdate);

insert into vacationApplicationTable(vacationAppNum,id,type,startterm,endterm,term,applicationDate,reason,state,approvalDate) 
values(vacationAppNum_SEQ.nextval,'15080003','월차','2021-07-07','2021-07-08',2,'2021-07-05','거절 테스트 입니다2.','거절',sysdate);

insert into vacationApplicationTable(vacationAppNum,id,type,startterm,endterm,term,applicationDate,reason,state,approvalDate) 
values(vacationAppNum_SEQ.nextval,'10030001','반차','2021-08-05','2021-08-05',1,'2021-07-05','거절 테스트 입니다3.','거절',sysdate);

insert into vacationApplicationTable(vacationAppNum,id,type,startterm,endterm,term,applicationDate,reason,state,approvalDate) 
values(vacationAppNum_SEQ.nextval,'15080003','월차','2021-08-07','2021-08-08',2,'2021-07-05','거절 테스트 입니다4.','거절',sysdate);

insert into vacationApplicationTable(vacationAppNum,id,type,startterm,endterm,term,applicationDate,reason,state,approvalDate) 
values(vacationAppNum_SEQ.nextval,'21030020','반차','2021-08-10','2021-08-10',1,'2021-07-05','거절 테스트 입니다5.','거절',sysdate);

insert into vacationApplicationTable(vacationAppNum,id,type,startterm,endterm,term,applicationDate,reason,state,approvalDate) 
values(vacationAppNum_SEQ.nextval,'10030001','월차','2021-08-24','2021-08-27',4,'2021-07-05','거절 테스트 입니다6.','거절',sysdate);

insert into vacationApplicationTable(vacationAppNum,id,type,startterm,endterm,term,applicationDate,reason,state,approvalDate) 
values(vacationAppNum_SEQ.nextval,'21030020','반차','2021-08-16','2021-08-16',1,'2021-07-05','거절 테스트 입니다7.','거절',sysdate);

insert into vacationApplicationTable(vacationAppNum,id,type,startterm,endterm,term,applicationDate,reason,state,approvalDate) 
values(vacationAppNum_SEQ.nextval,'15080003','월차','2021-06-05','2021-06-05',1,'2021-07-05','거절 테스트 입니다8.','거절',sysdate);
insert into vacationApplicationTable(vacationAppNum,id,type,startterm,endterm,term,applicationDate,reason,state,approvalDate) 
values(vacationAppNum_SEQ.nextval,'21030020','반차','2021-06-05','2021-06-05',1,'2021-07-05','거절 테스트 입니다9.','거절',sysdate);

--신청
insert into vacationApplicationTable(vacationAppNum,id,type,startterm,endterm,term,applicationDate,reason,approvalDate) 
values(vacationAppNum_SEQ.nextval,'21030020','반차','2021-06-05','2021-06-05',1,'2021-07-05','신청 테스트 입니다1.',sysdate);

insert into vacationApplicationTable(vacationAppNum,id,type,startterm,endterm,term,applicationDate,reason,approvalDate) 
values(vacationAppNum_SEQ.nextval,'21030020','반차','2021-06-05','2021-06-05',1,'2021-07-05','신청 테스트 입니다2.',sysdate);

insert into vacationApplicationTable(vacationAppNum,id,type,startterm,endterm,term,applicationDate,reason,approvalDate) 
values(vacationAppNum_SEQ.nextval,'10030001','반차','2021-06-05','2021-06-05',1,'2021-07-05','신청 테스트 입니다3.',sysdate);

insert into vacationApplicationTable(vacationAppNum,id,type,startterm,endterm,term,applicationDate,reason,approvalDate) 
values(vacationAppNum_SEQ.nextval,'15080003','반차','2021-06-05','2021-06-05',1,'2021-07-05','신청 테스트 입니다4.',sysdate);

insert into vacationApplicationTable(vacationAppNum,id,type,startterm,endterm,term,applicationDate,reason,approvalDate) 
values(vacationAppNum_SEQ.nextval,'10030001','반차','2021-06-05','2021-06-05',1,'2021-07-05','신청 테스트 입니다5.',sysdate);

insert into vacationApplicationTable(vacationAppNum,id,type,startterm,endterm,term,applicationDate,reason,approvalDate) 
values(vacationAppNum_SEQ.nextval,'21030020','반차','2021-06-05','2021-06-05',1,'2021-07-05','신청 테스트 입니다6.',sysdate);

insert into vacationApplicationTable(vacationAppNum,id,type,startterm,endterm,term,applicationDate,reason,approvalDate) 
values(vacationAppNum_SEQ.nextval,'10030001','반차','2021-06-05','2021-06-05',1,'2021-07-05','신청 테스트 입니다7.',sysdate);

insert into vacationApplicationTable(vacationAppNum,id,type,startterm,endterm,term,applicationDate,reason,approvalDate) 
values(vacationAppNum_SEQ.nextval,'21030020','반차','2021-06-05','2021-06-05',1,'2021-07-05','신청 테스트 입니다8.',sysdate);

insert into vacationApplicationTable(vacationAppNum,id,type,startterm,endterm,term,applicationDate,reason,approvalDate) 
values(vacationAppNum_SEQ.nextval,'21030020','반차','2021-06-05','2021-06-05',1,'2021-07-05','신청 테스트 입니다9.',sysdate);

insert into vacationApplicationTable(vacationAppNum,id,type,startterm,endterm,term,applicationDate,reason,approvalDate) 
values(vacationAppNum_SEQ.nextval,'15080003','반차','2021-06-05','2021-06-05',1,'2021-07-05','신청 테스트 입니다10.',sysdate);

insert into vacationApplicationTable(vacationAppNum,id,type,startterm,endterm,term,applicationDate,reason,approvalDate) 
values(vacationAppNum_SEQ.nextval,'15080003','반차','2021-06-05','2021-06-05',1,'2021-07-05','신청 테스트 입니다11.',sysdate);

insert into vacationApplicationTable(vacationAppNum,id,type,startterm,endterm,term,applicationDate,reason,approvalDate) 
values(vacationAppNum_SEQ.nextval,'21030020','반차','2021-06-05','2021-06-05',1,'2021-07-05','신청 테스트 입니다12.',sysdate);


select * from vacationScedule;
select * from vacationApplicationTable;
