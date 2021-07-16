select * from BOARD;
select * from SPRING_BOARD;

select * from SPRING_MEMBER;

select * from User_tab;
insert into USER_TAB (id,password,name,telnum,email,deptnum)
values('00000912','hyun2116~!','심태현',01085087968,'simthy0912@naver.com','0001');

insert into DM_Tab (deptnum,deptName) values(0001,'test');


create table spring_member(
	userid varchar2(50) not null primary key,
	userpw varchar2(100) not null,
	username varchar2(100) not null,
	regdate date default sysdate,
	updatedate date default sysdate,
	enabled char(1) default '1'
);

create table spring_member_auth(
	userid varchar2(50) not null,
	auth varchar2(50) not null,
	constraint fk_member_auth foreign key(userid) references spring_member(userid)
);

insert into spring_member(userid,userpw)

