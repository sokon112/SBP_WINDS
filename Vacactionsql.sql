-- 휴가테이블 Table Create SQL
CREATE TABLE vacationScedule
(

    id           NUMBER          NOT NULL, 
    name          VARCHAR2(20)    NOT NULL, 
    VacationCnt    INT             NULL, 
    CONSTRAINT PK_vacationScedule PRIMARY KEY (id)
);
--시퀀스 문서 번호를 업데이트하는 정보 값
CREATE SEQUENCE vacationAppNum_SEQ
START WITH 1
INCREMENT BY 1;
--시퀀스 삭제하는 정보 값
drop SEQUENCE vacationAppNum_SEQ;


--신청서테이블 Table Create SQL
CREATE TABLE vacationApplicationTable
(
    vacationAppNum      NUMBER           NOT NULL, 
    id             NUMBER           NOT NULL, 
    type               VARCHAR2(20)     NOT NULL, 
    startterm          DATE             NOT NULL, 
    endterm            DATE             NOT NULL, 
    state              VARCHAR2(10)     DEFAULT '신청' NOT NULL, 
    applicationDate    DATE             NOT NULL, 
    approvalDate       DATE             , 
    reason             VARCHAR2(200)    NOT NULL, 
    refusalReason      VARCHAR2(200)    , 
    CONSTRAINT PK_vacationApplicationTable PRIMARY KEY (vacationAppNum)
);
--applicationTable테이블 요소에 holidayScedule테이블의 값을 참조로 넣음
ALTER TABLE vacationApplicationTable add CONSTRAINT fk_id FOREIGN KEY (id) REFERENCES vacationScedule(id);
--혹시모를 테이블 삭제구문
drop table vacationScedule;

drop table vacationApplicationTable;

--임의의 사원데이터 입력
insert into vacationScedule values(1,'홍길동',20);
insert into vacationScedule values(2,'김길동',20);
insert into vacationScedule values(3,'감식혜',20);
insert into vacationScedule values(4,'호캉스',20);
select * from vacationScedule;

--신청서를 제출한 사람을 추하는 구문
insert into vacationApplicationTable(vacationAppNum,id,type,startterm,endterm,state,applicationDate,reason) 
values(vacationAppNum_SEQ.nextval,1,'조퇴','2012-05-05','2012-05-05','신청',sysdate,'병원');

insert into vacationApplicationTable(vacationAppNum,id,type,startterm,endterm,applicationDate,reason) 
values(vacationAppNum_SEQ.nextval,2,'조퇴','2012-05-05','2012-05-05',sysdate,'강아지 산책');

insert into vacationApplicationTable(vacationAppNum,id,type,startterm,endterm,applicationDate,reason) 
values(vacationAppNum_SEQ.nextval,3,'조퇴','2012-04-15','2012-04-15',sysdate,'집안사정');

insert into vacationApplicationTable(vacationAppNum,id,type,startterm,endterm,applicationDate,reason) 
values(vacationAppNum_SEQ.nextval,4,'조퇴','2012-06-14','2012-06-17',sysdate,'호캉스');

select * from vacationScedule;
select * from vacationApplicationTable;
select * from vacationApplicationTable where id=4;
--신청서 보기 list(관리자가 보는방법-전체
select vacationAppNum,id,name,type,startterm,endterm,state,applicationDate,approvalDate,reason,refusalreason
from vacationApplicationTable vat, vacationScedule hs
where vat.id=hs.id and state not in('신청') order by vacationAppNum;

--기간 분리 수정(휴가 시작 기간과, 끝나는 기간 따로 분리 하기)
--날짜별로 검색한 것
select vacationAppNum,id,name,type,startterm,endterm,state,applicationDate,approvalDate,reason,refusalreason
from vacationApplicationTable vat, vacationScedule hs
where vat.id=hs.id and startterm >= '20120401' and startterm < '20120501' 
order by vacationAppNum;
select vacationAppNum,id,name,type,startterm,endterm,state,applicationDate,approvalDate,reason,refusalreason
from vacationApplicationTable vat, vacationScedule hs
where vat.id=hs.id and startterm >= '20120401' and startterm < '20120501' and state not in('신청') 
order by vacationAppNum;


		select VacationCnt
		from vacationScedule 
		where id=2;

--관리자가 신청으로 표시된 것을 거절, 승인시 처리 구문
update(select v.approvaldate, v.state,vs.vacationcnt
        from vacationApplicationTable v join vacationScedule vs
        on v.id=vs.id)
set v.approvalDate = sysdate, v.state = '승인',vs.VacationCnt = 3
where vacationAppNum=2;

update  vacationApplicationTable
set approvalDate=sysdate, state='거절',refusalreason='회사 규정상 허가 불가능합니다.' 
where vacationAppNum=2;

select count(*) from vacationScedule;
--신청서 신청 cnt 계산 됨
update vacationScedule set VacationCnt =(select count(id) from vacationApplicationTable where id=1 and state not in('거절'))
where id = 1;



--관리자페이지에 휴가신청버튼을 누르면 신청으로 표시된게 나옴
select vacationAppNum,id,name,type,startterm,endterm,reason,state
from vacationApplicationTable vat, vacationScedule vs
where vat.id=vs.id and vat.state like '신청' order by vacationAppNum;
--관리자페이지에 휴가신청버튼 집계하는 구문
select count(*)
from vacationApplicationTable vat, vacationScedule vs
where vat.id=vs.id and vat.state like '신청';

--사용자 페이지(id =2번 사용자가 휴가신청 페이지에 들어올때 불러올 페이지) 
select vacationAppNum,id,type,startterm,endterm,state,applicationDate,approvalDate
from vacationApplicationTable where id=1;

--신청서 불러오기 (사용자가 원하는 문서를 선택시 값이 넘어와 해당하는 문서의정보를 볼 수 잇음)
select vacationAppNum,id,name,type,startterm,endterm,state,applicationDate,approvalDate,reason,refusalreason
from vacationApplicationTable where id=1 and vacationAppNum=4;

--사용자가 신청서 수정하는 경우
update vacationApplicationTable set type='휴일',startterm='2021-07-06',endterm='2021-07-07',applicationDate=sysdate+1
where id=1 and vacationAppNum=5;

delete from vacationApplicationTable where id=1 and vacationAppNum=5;



update vacationApplicationTable 
set approvaldate=sysdate, state='승인'  
where  id=1 and vacationAppNum=3;


 


select type,startterm,endterm,state,applicationDate(sysdate)
from vacationApplicationTable where id=2;


select * from vacationApplicationTable; 







