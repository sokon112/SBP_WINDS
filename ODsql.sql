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

CREATE TABLE USER_TAB(
    id NUMBER(20) CONSTRAINT pk_id PRIMARY KEY,
    password VARCHAR2(20) not null,
    name VARCHAR2(20) not null,
    telNum NUMBER(20) not null,
    email VARCHAR2(50) not null,
    deptNum NUMBER(20) not null
);

CREATE TABLE DM_TAB(
    deptNum NUMBER(20) CONSTRAINT pk_dept PRIMARY KEY,
    deptName VARCHAR2(20) not null
);

CREATE TABLE AUTH_TAB(
    authority VARCHAR2(20) not null,
    id NUMBER(20) not null
);

CREATE SEQUENCE docNum;

--첨부파일 테이블 생성
create table doc_attach(
	uuid varchar2(100) not null,
	uploadPath varchar2(200) not null,
	fileName varchar2(100) not null,
	fileType char(1) default 'I',
	docNum NUMBER(10)
);

alter table doc_attach add constraint pk_attach primary key(uuid);
alter table doc_attach add constraint fk_doc_attach foreign key(docNum) references DOC_TAB(docNum);