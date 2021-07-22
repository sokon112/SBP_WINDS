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



CREATE SEQUENCE docNum_seq;

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

--공문 더미 데이터 -미결
INSERT INTO DOC_TAB (docNum,title,contents,authority,sign,attachfile,retentDate,send,dest,review,state,storage,message,regDate)
VALUES(docNum.NEXTVAL, --공문번호
'테스트제목', --공문 제목
'테스트 내용입니다. 테스트 테스트 무야호~', --공문 내용
'emp', --권한
'123456', --첨부 파일 사인
'123456',-- 첨부 파일 있을 시 'filename.확장자' 파일명으로 
3, --만료기한(직접 설정)
'19080010', --공문 작성자 사번(로그인 한 회원 사번)
'10030001', --공문 수신자 사번(결재선 모달 확인 버튼 클릭시 선택한 결재자 사번으로 설정)
'15080002', --공문 검토자 (위와 동일 검토자 사번으로 설정)
'요청', --공문 상태(가장 기본 DEFAULT값)
'미결', --보관함(가장 기본 DEFAULT값) / 임시저장 버튼 클릭시 '임시'로 설정
'', --상신 모달에서 검토자와 결재자가 메세지 작성시
SYSDATE);

--공문 더미 데이터 -결재완료
INSERT INTO DOC_TAB (docNum,title,contents,authority,sign,attachfile,retentDate,send,dest,review,state,storage,message,regDate)
VALUES(docNum.NEXTVAL, --공문번호
'테스트제목', --공문 제목
'테스트 내용입니다. 테스트 테스트 무야호~', --공문 내용
'emp', --권한
'123456', --첨부 파일 사인
'123456',-- 첨부 파일 있을 시 'filename.확장자' 파일명으로 
3, --만료기한(직접 설정)
'19080010', --공문 작성자 사번(로그인 한 회원 사번)
'10030001', --공문 수신자 사번(결재선 모달 확인 버튼 클릭시 선택한 결재자 사번으로 설정)
'15080002', --공문 검토자 (위와 동일 검토자 사번으로 설정)
'완료', --공문 상태(가장 기본 DEFAULT값)
'결재완료', --보관함(가장 기본 DEFAULT값) / 임시저장 버튼 클릭시 '임시'로 설정
'ㅇㅋㅇㅋ', --상신 모달에서 검토자와 결재자가 메세지 작성시
SYSDATE);

--공문 더미 데이터 -임시
INSERT INTO DOC_TAB (docNum,title,contents,authority,sign,attachfile,retentDate,send,dest,review,state,storage,message,regDate)
VALUES(docNum.NEXTVAL, --공문번호
'테스트제목', --공문 제목
'테스트 내용입니다. 테스트 테스트 무야호~', --공문 내용
'emp', --권한
'123456', --첨부 파일 사인
'123456',-- 첨부 파일 있을 시 'filename.확장자' 파일명으로 
3, --만료기한(직접 설정)
'19080010', --공문 작성자 사번(로그인 한 회원 사번)
'10030001', --공문 수신자 사번(결재선 모달 확인 버튼 클릭시 선택한 결재자 사번으로 설정)
'15080002', --공문 검토자 (위와 동일 검토자 사번으로 설정)
'요청', --공문 상태(가장 기본 DEFAULT값)
'임시', --보관함(가장 기본 DEFAULT값) / 임시저장 버튼 클릭시 '임시'로 설정
'', --상신 모달에서 검토자와 결재자가 메세지 작성시
SYSDATE);



