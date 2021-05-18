DROP TABLE MEMBER
CASCADE CONSTRAINTS;

DROP SEQUENCE MEM_SEQ;
--MEMBER

SELECT * FROM MEMBER

CREATE TABLE MEMBER(
		MEMBERSEQ NUMBER,
		EMAIL VARCHAR2(20) CONSTRAINT MEM_PRI PRIMARY KEY, 
		NICKNAME VARCHAR2(20),
		MEMBERPHOTO VARCHAR2(50),
		NAVERLOGIN VARCHAR2(20),
		KAKAOLOGIN VARCHAR2(20),
		GOOGLELOGIN VARCHAR2(20),
		AUTH NUMBER,
		MEMBERDEL NUMBER,
		POINT NUMBER 		--포인트
)
--관리자 1, 멤버 3

CREATE SEQUENCE MEM_SEQ
START WITH 1
INCREMENT BY 1

INSERT INTO MEMBER (MEMBERSEQ, EMAIL, NICKNAME, MEMBERPHOTO, NAVERLOGIN, KAKAOLOGIN, GOOGLELOGIN, AUTH, MEMBERDEL)
VALUES(MEM_SEQ.NEXTVAL, 'admin', '매니저', '0', null, null, null, 1, 0);