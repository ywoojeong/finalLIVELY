DROP TABLE CHALLENGEMEMBER
CASCADE CONSTRAINTS;

DROP SEQUENCE CHALMEM_SEQ;

--CHALLENGEMEMBER

CREATE TABLE CHALLENGEMEMBER(
		CHALLENGMEMSEQ NUMBER CONSTRAINT CHALLMEM_PRI PRIMARY KEY,
		IDENTIFY NUMBER,  --인증 횟수
		SUCCESS NUMBER -- 성공실패 성공시1 85퍼이상 2 실패3
		CHALLENGESEQ NUMBER,
		EMAIL VARCHAR2(50) NOT NULL,
  		CONSTRAINT FK_CHALMEM FOREIGN KEY (EMAIL) 
        REFERENCES MEMBER(EMAIL), 
        CONSTRAINT FK_CHALMEM2 FOREIGN KEY (CHALLENGESEQ) 
        REFERENCES CHALLENGE(CHALLENGESEQ) 
)

ALTER TABLE CHALLENGEMEMBER ADD SUCCESS NUMBER;

CREATE SEQUENCE CHALMEM_SEQ
START WITH 100
INCREMENT BY 1

SELECT * FROM CHALLENGE

UPDATE MEMBER
SET POINT = 10000
WHERE EMAIL = 'final.5623@gmail.com'

UPDATE MEMBER
		SET POINT = POINT-5
		WHERE EMAIL = 'final.5623@gmail.com'
