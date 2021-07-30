--시퀀스 삭제하는 정보 값
drop table vacationScedule;
drop table vacationApplicationTable;
drop SEQUENCE vacationAppNum_SEQ;


-- 휴가 신청자 테이블 생성
create table vacationScedule as
    select id, name from user_tab;


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
--휴가 신청서 테이블 pk부여, cnt값 부여 
alter table vacationScedule add CONSTRAINT PK_vacationScedule PRIMARY KEY (id);
alter table vacationScedule add VacationCnt INT default 0 not null;

--applicationTable테이블 요소에 holidayScedule테이블의 값을 참조로 넣음
ALTER TABLE vacationApplicationTable add CONSTRAINT fk_vacationSceduleid FOREIGN KEY (id) REFERENCES vacationScedule(id);

--신청서 분류별로 삽입하는 구문
--승인 된 데이터(신청 안되는 거 보여주실 꺼면 사용해 주세요...)
insert into vacationApplicationTable(vacationAppNum,id,type,term,applicationDate,reason,state,approvalDate) 
values(vacationAppNum_SEQ.nextval,'21030020','반차','2021-06-05','2021-06-05','테스트 입니다1.','승인',sysdate);
insert into vacationApplicationTable(vacationAppNum,id,type,term,applicationDate,reason,state,approvalDate) 
values(vacationAppNum_SEQ.nextval,'21030020','반차','2021-06-05','2021-06-05','테스트 입니다2.','승인',sysdate);

insert into vacationApplicationTable(vacationAppNum,id,type,term,applicationDate,reason,state,approvalDate) 
values(vacationAppNum_SEQ.nextval,'21030020','월차','2021-06-07','2021-06-05','테스트 입니다3.','승인',sysdate);

insert into vacationApplicationTable(vacationAppNum,id,type,term,applicationDate,reason,state,approvalDate) 
values(vacationAppNum_SEQ.nextval,'21030020','월차','2021-06-07','2021-06-05','테스트 입니다4.','승인',sysdate);

insert into vacationApplicationTable(vacationAppNum,id,type,term,applicationDate,reason,state,approvalDate) 
values(vacationAppNum_SEQ.nextval,'21030020','월차','2021-06-08','2021-06-05','테스트 입니다5.','승인',sysdate);

insert into vacationApplicationTable(vacationAppNum,id,type,term,applicationDate,reason,state,approvalDate) 
values(vacationAppNum_SEQ.nextval,'21030020','월차','2021-06-11','2021-06-05','테스트 입니다6.','승인',sysdate);

insert into vacationApplicationTable(vacationAppNum,id,type,term,applicationDate,reason,state,approvalDate) 
values(vacationAppNum_SEQ.nextval,'21030020','월차','2021-06-12','2021-06-05','테스트 입니다7.','승인',sysdate);

insert into vacationApplicationTable(vacationAppNum,id,type,term,applicationDate,reason,state,approvalDate) 
values(vacationAppNum_SEQ.nextval,'21030020','월차','2021-06-16','2021-06-05','테스트 입니다8.','승인',sysdate);

insert into vacationApplicationTable(vacationAppNum,id,type,term,applicationDate,reason,state,approvalDate) 
values(vacationAppNum_SEQ.nextval,'21030020','반차','2021-07-08','2021-06-05','테스트 입니다9.','승인',sysdate);

insert into vacationApplicationTable(vacationAppNum,id,type,term,applicationDate,reason,state,approvalDate) 
values(vacationAppNum_SEQ.nextval,'21030020','반차','2021-07-08','2021-06-05','테스트 10','승인',sysdate);

insert into vacationApplicationTable(vacationAppNum,id,type,term,applicationDate,reason,state,approvalDate) 
values(vacationAppNum_SEQ.nextval,'21030020','반차','2021-07-12','2021-06-05','테스트 11','승인',sysdate);

insert into vacationApplicationTable(vacationAppNum,id,type,term,applicationDate,reason,state,approvalDate) 
values(vacationAppNum_SEQ.nextval,'21030020','반차','2021-07-09','2021-06-05','테스트 12','승인',sysdate);
insert into vacationApplicationTable(vacationAppNum,id,type,term,applicationDate,reason,state,approvalDate) 
values(vacationAppNum_SEQ.nextval,'21030020','반차','2021-07-08','2021-06-05','테스트 13','승인',sysdate);

insert into vacationApplicationTable(vacationAppNum,id,type,term,applicationDate,reason,state,approvalDate) 
values(vacationAppNum_SEQ.nextval,'21030020','반차','2021-07-08','2021-06-05','테스트 ','승인',sysdate);

insert into vacationApplicationTable(vacationAppNum,id,type,term,applicationDate,reason,state,approvalDate) 
values(vacationAppNum_SEQ.nextval,'21030020','반차','2021-07-12','2021-06-05','테스트','승인',sysdate);

insert into vacationApplicationTable(vacationAppNum,id,type,term,applicationDate,reason,state,approvalDate) 
values(vacationAppNum_SEQ.nextval,'21030020','반차','2021-07-09','2021-06-05','테스트','승인',sysdate);

insert into vacationApplicationTable(vacationAppNum,id,type,term,applicationDate,reason,state,approvalDate) 
values(vacationAppNum_SEQ.nextval,'21030020','월차','2021-07-05','2021-06-05','테스트','승인',sysdate);

insert into vacationApplicationTable(vacationAppNum,id,type,term,applicationDate,reason,state,approvalDate) 
values(vacationAppNum_SEQ.nextval,'21030020','반차','2021-07-08','2021-06-05','테스트','승인',sysdate);

insert into vacationApplicationTable(vacationAppNum,id,type,term,applicationDate,reason,state,approvalDate) 
values(vacationAppNum_SEQ.nextval,'21030020','반차','2021-07-08','2021-06-05','테스트','승인',sysdate);

insert into vacationApplicationTable(vacationAppNum,id,type,term,applicationDate,reason,state,approvalDate) 
values(vacationAppNum_SEQ.nextval,'21030020','반차','2021-08-05','2021-06-05','테스트','승인',sysdate);

insert into vacationApplicationTable(vacationAppNum,id,type,term,applicationDate,reason,state,approvalDate) 
values(vacationAppNum_SEQ.nextval,'21030020','반차','2021-07-08','2021-06-05','테스트','승인',sysdate);

insert into vacationApplicationTable(vacationAppNum,id,type,term,applicationDate,reason,state,approvalDate) 
values(vacationAppNum_SEQ.nextval,'21030020','반차','2021-07-08','2021-06-05','테스트','승인',sysdate);

insert into vacationApplicationTable(vacationAppNum,id,type,term,applicationDate,reason,state,approvalDate) 
values(vacationAppNum_SEQ.nextval,'21030020','반차','2021-08-05','2021-06-05','테스트','승인',sysdate);

insert into vacationApplicationTable(vacationAppNum,id,type,term,applicationDate,reason,state,approvalDate) 
values(vacationAppNum_SEQ.nextval,'21030020','월차','2021-08-09','2021-06-05','테스트','승인',sysdate);

insert into vacationApplicationTable(vacationAppNum,id,type,term,applicationDate,reason,state,approvalDate) 
values(vacationAppNum_SEQ.nextval,'21030020','월차','2021-08-09','2021-10-05','테스트.','승인',sysdate);

insert into vacationApplicationTable(vacationAppNum,id,type,term,applicationDate,reason,state,approvalDate) 
values(vacationAppNum_SEQ.nextval,'21030020','월차','2021-08-10','2021-09-05','병원에 가야 합니다.','승인',sysdate);

insert into vacationApplicationTable(vacationAppNum,id,type,term,applicationDate,reason,state,approvalDate) 
values(vacationAppNum_SEQ.nextval,'21030020','월차','2021-08-13','2021-04-05','병원에 가야 합니다.','승인',sysdate);

insert into vacationApplicationTable(vacationAppNum,id,type,term,applicationDate,reason,state,approvalDate) 
values(vacationAppNum_SEQ.nextval,'21030020','월차','2021-06-14','2021-05-05','병원에 가야 합니다.','승인',sysdate);

update vacationScedule set vacationcnt=vacationcnt+40 where id='21030020';
-- // 여기까지


--승인 데이터
insert into vacationApplicationTable(vacationAppNum,id,type,term,applicationDate,reason,state,approvalDate) 
values(vacationAppNum_SEQ.nextval,'15080004','월차','2021-07-10','2021-06-05','테스트승인','승인',sysdate);

insert into vacationApplicationTable(vacationAppNum,id,type,term,applicationDate,reason,state,approvalDate) 
values(vacationAppNum_SEQ.nextval,'10030001','월차','2021-07-11','2021-06-05','테스트승인','승인',sysdate);

insert into vacationApplicationTable(vacationAppNum,id,type,term,applicationDate,reason,state,approvalDate) 
values(vacationAppNum_SEQ.nextval,'15080004','월차','2021-07-12','2021-06-05','테스트승인','승인',sysdate);

insert into vacationApplicationTable(vacationAppNum,id,type,term,applicationDate,reason,state,approvalDate) 
values(vacationAppNum_SEQ.nextval,'10030001','반차','2021-07-10','2021-06-06','테스트승인','승인',sysdate);


insert into vacationApplicationTable(vacationAppNum,id,type,term,applicationDate,reason,state,approvalDate) 
values(vacationAppNum_SEQ.nextval,'17030008','반차','2021-07-31','2021-07-07','테스트승인','승인',sysdate);


insert into vacationApplicationTable(vacationAppNum,id,type,term,applicationDate,reason,state,approvalDate) 
values(vacationAppNum_SEQ.nextval,'15080004','반차','2021-07-12','2021-07-08','테스트승인','승인',sysdate);


insert into vacationApplicationTable(vacationAppNum,id,type,term,applicationDate,reason,state,approvalDate) 
values(vacationAppNum_SEQ.nextval,'10030001','반차','2021-07-31','2021-07-25','테스트승인','승인',sysdate);

insert into vacationApplicationTable(vacationAppNum,id,type,term,applicationDate,reason,state,approvalDate) 
values(vacationAppNum_SEQ.nextval,'17030008','월차','2021-08-07','2021-07-25','테스트승인','승인',sysdate);

insert into vacationApplicationTable(vacationAppNum,id,type,term,applicationDate,reason,state,approvalDate) 
values(vacationAppNum_SEQ.nextval,'10030001','월차','2021-08-07','2021-07-25','테스트승인','승인',sysdate);

update vacationScedule set vacationcnt=vacationcnt+14 where id='10030001';

--거절된 데이터
insert into vacationApplicationTable(vacationAppNum,id,type,term,applicationDate,reason,state,approvalDate,refusalReason) 
values(vacationAppNum_SEQ.nextval,'15080004','반차','2021-06-05','2021-05-05','테스트거절','거절',sysdate,'거절이유');

insert into vacationApplicationTable(vacationAppNum,id,type,term,applicationDate,reason,state,approvalDate,refusalReason) 
values(vacationAppNum_SEQ.nextval,'10030001','반차','2021-08-07','2021-07-05','테스트거절','거절',sysdate,'거절이유');

insert into vacationApplicationTable(vacationAppNum,id,type,term,applicationDate,reason,state,approvalDate,refusalReason) 
values(vacationAppNum_SEQ.nextval,'17030008','월차','2021-07-05','2021-06-05','테스트거절','거절',sysdate,'거절이유');

insert into vacationApplicationTable(vacationAppNum,id,type,term,applicationDate,reason,state,approvalDate,refusalReason) 
values(vacationAppNum_SEQ.nextval,'10030001','반차','2021-06-25','2021-06-15','테스트거절','거절',sysdate,'거절이유');

insert into vacationApplicationTable(vacationAppNum,id,type,term,applicationDate,reason,state,approvalDate,refusalReason) 
values(vacationAppNum_SEQ.nextval,'15080004','월차','2021-08-07','2021-07-15','테스트거절','거절',sysdate,'거절이유');

insert into vacationApplicationTable(vacationAppNum,id,type,term,applicationDate,reason,state,approvalDate,refusalReason) 
values(vacationAppNum_SEQ.nextval,'10030001','반차','2021-07-05','2021-07-04','테스트거절','거절',sysdate,'거절이유');

insert into vacationApplicationTable(vacationAppNum,id,type,term,applicationDate,reason,state,approvalDate,refusalReason) 
values(vacationAppNum_SEQ.nextval,'15080004','월차','2021-07-07','2021-07-05','테스트거절','거절',sysdate,'거절이유');

insert into vacationApplicationTable(vacationAppNum,id,type,term,applicationDate,reason,state,approvalDate,refusalReason) 
values(vacationAppNum_SEQ.nextval,'17030008','반차','2021-08-07','2021-07-05','테스트거절','거절',sysdate,'거절이유');

--신청 데이터
insert into vacationApplicationTable(vacationAppNum,id,type,term,applicationDate,reason) 
values(vacationAppNum_SEQ.nextval,'10030001','반차','2021-07-09','2021-07-05','신청테스트');

insert into vacationApplicationTable(vacationAppNum,id,type,term,applicationDate,reason) 
values(vacationAppNum_SEQ.nextval,'15080004','월차','2021-07-30','2021-07-05','신청테스트');

insert into vacationApplicationTable(vacationAppNum,id,type,term,applicationDate,reason) 
values(vacationAppNum_SEQ.nextval,'10030001','반차','2021-07-31','2021-07-05','신청테스트');

insert into vacationApplicationTable(vacationAppNum,id,type,term,applicationDate,reason) 
values(vacationAppNum_SEQ.nextval,'15080004','월차','2021-08-09','2021-07-05','신청테스트');

insert into vacationApplicationTable(vacationAppNum,id,type,term,applicationDate,reason) 
values(vacationAppNum_SEQ.nextval,'10030001','반차','2021-08-10','2021-07-05','신청테스트');

insert into vacationApplicationTable(vacationAppNum,id,type,term,applicationDate,reason) 
values(vacationAppNum_SEQ.nextval,'17030008','월차','2021-08-29','2021-07-05','신청테스트');

insert into vacationApplicationTable(vacationAppNum,id,type,term,applicationDate,reason) 
values(vacationAppNum_SEQ.nextval,'15080004','반차','2021-08-05','2021-07-05','신청테스트');


select * from vacationScedule;
select * from vacationApplicationTable;









