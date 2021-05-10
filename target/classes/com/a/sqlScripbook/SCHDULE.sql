DROP TABLE SCHEDULE
CASCADE CONSTRAINTS;

DROP SEQUENCE SCH_SEQ;
--SCHEDULE

CREATE TABLE SCHEDULE(
		SCHEDULESEQ NUMBER CONSTRAINT SCH_PRI PRIMARY KEY, 
		ID VARCHAR2(20),
		CLUBSEQ NUMBER,
		CLUBTITLE VARCHAR2(200),
		SCHSTART DATE,
		SCHEND DATE,
  		CONSTRAINT FK_BBS FOREIGN KEY (ID) 
        REFERENCES MEMBER(ID),
        CONSTRAINT FK_CSEQ FOREIGN KEY (CLUBSEQ) 
        REFERENCES CLUB(CLUBSEQ),
        CONSTRAINT FK_TIT FOREIGN KEY (CLUBTITLE) 
        REFERENCES CLUB(CLUBTITLE) 
)

ALTER SEQUENCE SCH_SEQ
INCREMENT BY 1
START BY 100

 