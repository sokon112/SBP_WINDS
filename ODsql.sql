CREATE TABLE DOC_TAB(
    docNum NUMBER(10) CONSTRAINT pk_dn primary key,
    title VARCHAR2(200) not null,
    contents VARCHAR2(500) not null,
    authority VARCHAR2(20) not null,
    sign BLOB,
    attachFile BLOB,
    retentDate NUMBER(10) not null,
    send NUMBER(10) not null,
    dest NUMBER(10) not null,
    review NUMBER(10),
    state VARCHAR2(20) not null,
    storage VARCHAR2(20) not null,
    message VARCHAR2(200),
    regDate DATE DEFAULT SYSDATE
);

select * from DOC_TAB;

INSERT INTO DOC_TAB (docNum,title,contents,authority,sign,attachfile,retentDate,send,dest,review,state,storage,message,regDate)
VALUES(docNum.NEXTVAL,'테스트2','테스트 내용입니다.','사원','',
'1564879',-- 첨부 파일 있을 시 'filename.확장자' 파일명으로 
2, --만료기한(직접 설정)
12081345, --공문 작성자 사번(로그인 한 회원 사번)
13091455, --공문 수신자 사번(결재선 모달 확인 버튼 클릭시 선택한 결재자 사번으로 설정)
00084567, --공문 검토자 (위와 동일 검토자 사번으로 설정)
'요청', --공문 상태(가장 기본 DEFAULT값)
'wait', --보관함(가장 기본 DEFAULT값) / 임시저장 버튼 클릭시 '임시'로 설정
'', --상신 모달에서 검토자와 결재자가 메세지 작성시
SYSDATE);

CREATE TABLE USER_TAB(
    id NUMBER(20) CONSTRAINT pk_id PRIMARY KEY,
    password VARCHAR2(20) not null,
    name VARCHAR2(20) not null,
    telNum NUMBER(20) not null,
    email VARCHAR2(50) not null,
    deptNum NUMBER(20) not null
);

select * from DM_TAB;
CREATE TABLE DM_TAB(
    deptNum NUMBER(20) CONSTRAINT pk_dept PRIMARY KEY,
    deptName VARCHAR2(20) not null
);

CREATE TABLE AUTH_TAB(
    authority VARCHAR2(20) not null,
    id NUMBER(20) not null
);

CREATE SEQUENCE docNum;

ALTER TABLE USER_TAB ADD CONSTRAINT fk_user_tab FOREIGN KEY(deptNum) REFERENCES DM_TAB;

ALTER TABLE AUTH_TAB ADD CONSTRAINT fk_auth_tab FOREIGN KEY(id) REFERENCES USER_TAB;

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