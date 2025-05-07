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

