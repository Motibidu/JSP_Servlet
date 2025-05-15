alter session set "_ORACLE_SCRIPT"=true;

CREATE USER musthave IDENTIFIED BY 1234; 
GRANT CONNECT, RESOURCE, unlimited tablespace TO musthave;

SELECT tablespace_name, status, contents FROM dba_tablespaces;

SELECT tablespace_name, sum(bytes), max(bytes) from dba_free_space
    GROUP BY tablespace_name;
    
SELECT username, default_tablespace  FROM dba_users
    WHERE username in upper('musthave');



CREATE TABLE member
(
	id VARCHAR2(30) NOT NULL,
	pass VARCHAR2(40) NOT NULL,
	name VARCHAR2(50) NOT NULL,
	regidate DATE DEFAULT SYSDATE,
	PRIMARY KEY (id)
);

insert into member (id, pass, name) values ('test', '1234', '테스트');

ALTER USER musthave QUOTA 5m ON users;

SELECT * FROM member;

SELECT id, pass, rownum FROM member;

SELECT * FROM (
    SELECT Tb.*, rownum AS rNum FROM (
        SELECT * FROM board ORDER BY num DESC
    ) Tb
)
 WHERE rNum 
 BETWEEN 1 AND 10;

create table myfile (
    idx number primary key,
    title varchar2(200) not null,
    cate varchar2(100),
    ofile varchar2(100) not null,
    sfile varchar2(30) not null,
    postdate date default sysdate not null
);

SELECT * 
 FROM myfile;
 
create table mvcboard (
	idx number primary key, 
	name varchar2(50) not null, 
	title varchar2(200) not null, 
	content varchar2(2000) not null, 
	postdate date default sysdate not null, 
	ofile varchar2(200), 
	sfile varchar2(30), 
	downcount number(5) default 0 not null, 
	pass varchar2(50) not null, 
	visitcount number default 0 not null
);

insert into mvcboard (idx, name, title, content, pass)
    values (seq_board_num.nextval, '김유신', '자료실 제목1 입니다.','내용','1234');
insert into mvcboard (idx, name, title, content, pass)
    values (seq_board_num.nextval, '장보고', '자료실 제목2 입니다.','내용','1234');
insert into mvcboard (idx, name, title, content, pass)
    values (seq_board_num.nextval, '이순신', '자료실 제목3 입니다.','내용','1234');
insert into mvcboard (idx, name, title, content, pass)
    values (seq_board_num.nextval, '강감찬', '자료실 제목4 입니다.','내용','1234');
insert into mvcboard (idx, name, title, content, pass)
    values (seq_board_num.nextval, '대조영', '자료실 제목5 입니다.','내용','1234');

commit;


