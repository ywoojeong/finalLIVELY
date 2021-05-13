DROP TABLE MYLIKE
CASCADE CONSTRAINTS;

DROP SEQUENCE LIKE_SEQ;

--MBTI

CREATE TABLE MYLIKE(
		LIKESEQ VARCHAR2(10) CONSTRAINT MBTI_PRI PRIMARY KEY, 
		LIKECOUNT VARCHAR2(10),
		
		APPLYBBSSEQ VARCHAR2(10),
		EMAIL VARCHAR2(10),
					
  		CONSTRAINT FK_LIKE FOREIGN KEY (LIKESEQ) 
        REFERENCES MYLIKE(LIKESEQ),
        CONSTRAINT FK_LIKE2 FOREIGN KEY (EMAIL) 
        REFERENCES MEMBER(EMAIL)
)


CREATE SEQUENCE LIKE_SEQ
START WITH 5000
INCREMENT BY 1