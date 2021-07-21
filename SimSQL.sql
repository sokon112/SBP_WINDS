CREATE TABLE DOC_TAB(
    docNum NUMBER(10) CONSTRAINT pk_dn primary key,
    title VARCHAR2(200) not null,
    contents VARCHAR2(500) not null,
    authority VARCHAR2(20) not null,
    sign BLOB,
    attachFile BLOB,
    retentDate NUMBER(10) not null,
    send VARCHAR2(20) not null,
    dest VARCHAR2(20) not null,
    review VARCHAR2(20),
    state VARCHAR2(20) not null,
    storage VARCHAR2(20) not null,
    message VARCHAR2(200),
    regDate DATE DEFAULT SYSDATE
);


select docNum,title,contents,authority,retentDate,send,dest,review,state,storage,message,regDate from DOC_TAB;

INSERT INTO DOC_TAB (docNum,title,contents,authority,sign,attachfile,retentDate,send,dest,review,state,storage,message,regDate)
VALUES(docNum.NEXTVAL,'테스트2','테스트 내용입니다.','사원','123456',
'123456',-- 첨부 파일 있을 시 'filename.확장자' 파일명으로 
2, --만료기한(직접 설정)
'15080002', --공문 작성자 사번(로그인 한 회원 사번)
'10030001', --공문 수신자 사번(결재선 모달 확인 버튼 클릭시 선택한 결재자 사번으로 설정)
'10030001', --공문 검토자 (위와 동일 검토자 사번으로 설정)
'요청', --공문 상태(가장 기본 DEFAULT값)
'임시', --보관함(가장 기본 DEFAULT값) / 임시저장 버튼 클릭시 '임시'로 설정
'ㅇㅋ', --상신 모달에서 검토자와 결재자가 메세지 작성시
SYSDATE);

INSERT INTO DOC_TAB (docNum,title,contents,authority,sign,attachfile,retentDate,send,dest,review,state,storage,message,regDate)
VALUES(docNum.NEXTVAL,'테스트3','테스트 내용입니다.','사원','123456',
'123456',-- 첨부 파일 있을 시 'filename.확장자' 파일명으로 
1, --만료기한(직접 설정)
12081345, --공문 작성자 사번(로그인 한 회원 사번)
13091455, --공문 수신자 사번(결재선 모달 확인 버튼 클릭시 선택한 결재자 사번으로 설정)
00084567, --공문 검토자 (위와 동일 검토자 사번으로 설정)
'완료', --공문 상태(가장 기본 DEFAULT값)
'결재완료', --보관함(가장 기본 DEFAULT값) / 임시저장 버튼 클릭시 '임시'로 설정
'ㅇㅋ', --상신 모달에서 검토자와 결재자가 메세지 작성시
SYSDATE);

INSERT INTO DOC_TAB (docNum,title,contents,authority,sign,attachfile,retentDate,send,dest,review,state,storage,message,regDate)
VALUES(docNum.NEXTVAL,'테스트4','테스트 내용입니다.','사원','198756',
'123456',-- 첨부 파일 있을 시 'filename.확장자' 파일명으로 
1, --만료기한(직접 설정)
15080002, --공문 작성자 사번(로그인 한 회원 사번)
13091455, --공문 수신자 사번(결재선 모달 확인 버튼 클릭시 선택한 결재자 사번으로 설정)
00084567, --공문 검토자 (위와 동일 검토자 사번으로 설정)
'임시', --공문 상태(가장 기본 DEFAULT값)
'임시	보관', --보관함(가장 기본 DEFAULT값) / 임시저장 버튼 클릭시 '임시'로 설정
'ㄴㄴ', --상신 모달에서 검토자와 결재자가 메세지 작성시
SYSDATE);

CREATE SEQUENCE docNum;

ALTER TABLE DOC_TAB ADD CONSTRAINT fk_doc_tab_send FOREIGN KEY(send) REFERENCES USER_TAB(id);
ALTER TABLE DOC_TAB ADD CONSTRAINT fk_doc_tab_dest FOREIGN KEY(dest) REFERENCES USER_TAB(id);
ALTER TABLE DOC_TAB ADD CONSTRAINT fk_doc_tab_review FOREIGN KEY(review) REFERENCES USER_TAB(id);
--첨부파일 테이블 생성
create table doc_attach(
	uuid varchar2(100) not null,
	uploadPath varchar2(200) not null,
	fileName varchar2(100) not null,
	fileType char(1) default 'I',
	docNum NUMBER(10)
);

alter table doc_attach add constraint pk_attach_uuid primary key(uuid);
alter table doc_attach add constraint fk_doc_attach foreign key(docNum) references DOC_TAB(docNum);

SELECT docNum,title,state,retentDate,regDate FROM DOC_TAB 
 WHERE storage = 'wait';
 
SELECT docNum,title,D2.deptName,U.name,retentDate,state,regDate 
 FROM DOC_TAB D1
 INNER JOIN USER_TAB U
 ON D1.send = U.id
 INNER JOIN DM_TAB D2
 ON D2.deptNum = U.deptNum
 WHERE D1.storage = 'wait';

INSERT INTO DOC_TAB (docNum,title,contents,authority,retentDate,send,dest,state,storage,regDate)
 (SELECT docNum.NEXTVAL,title,contents,authority,retentDate,send,dest,state,storage,regDate 
 from DOC_TAB);

SELECT docNum,title,state,regDate,storage,send  FROM DOC_TAB where send=15080002; -- 12081345
select * from USER_TAB;


select rownum rn,docNum,title,name,regDate 
from (select docNum,title,U.name name,regDate 
from DOC_TAB D1 inner join USER_TAB U on D1.send = U.id 
where D1.storage like '%미결%' order by regDate desc) where rownum between 0 and 10 order by rn desc;


select  from DOC_TAB where send=15080002;
select * from USER_TAB where id=15080002; -- 12081345
-- 10030001
-- 15080002


select * from USER_TAB;

select * from( select rownum rn, docNum,title,state,regDate,storage 
               from DOC_TAB 
              where title like '%'||'테스트'||'%' and rownum <= (1*10)) where rn > ((1-1)*10);

select docNum,title,U.name name,regDate 
from DOC_TAB D1 inner join USER_TAB U on D1.send = U.id 
where D1.storage like '%임시보관%' order by regDate desc;

select docNum,title,name,regDate,storage from(
select docNum,title,U.name name,regDate,storage
from DOC_TAB D1 inner join USER_TAB U on D1.send = U.id )

where storage='임시보관';
