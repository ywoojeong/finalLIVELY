DROP TABLE CHALLENGECOMMENT
CASCADE CONSTRAINTS;

DROP SEQUENCE CHALCOM_SEQ;

--CHALLENGECOMMENT

CREATE TABLE CHALLENGECOMMENT(
		CHALCOMSEQ NUMBER CONSTRAINT CHALCOM_PRI PRIMARY KEY, 
		CHALCOMCONTENT VARCHAR2(4000),  
		CHALCOMDATE DATE,  
		CHALCOMRATING NUMBER,   --별점   
		CHALCOMDEL NUMBER,
		CHALLENGESEQ NUMBER,
		EMAIL VARCHAR2(50) NOT NULL,
		CHALLLIKE NUMBER,
  		CONSTRAINT FK_CHALCOM FOREIGN KEY (EMAIL) 
        REFERENCES MEMBER(EMAIL),
        CONSTRAINT FK_CHALCOM2 FOREIGN KEY (CHALLENGESEQ) 
        REFERENCES CHALLENGE(CHALLENGESEQ)
)

CREATE SEQUENCE CHALCOM_SEQ
START WITH 1000
INCREMENT BY 1


DROP TABLE COMMENTLIKE
CASCADE CONSTRAINTS;

DROP SEQUENCE CLIKE_SEQ;

-- 후기 좋아요
CREATE TABLE COMMENTLIKE(
		CLIKESEQ NUMBER CONSTRAINT CLIKE_PRI PRIMARY KEY, 
		COMMENTLIKE NUMBER,  
		LIKEEMAIL VARCHAR2(50),
		CHALCOMSEQ NUMBER, 
  		CONSTRAINT FK_CLIKE FOREIGN KEY (LIKEEMAIL) 
        REFERENCES MEMBER(EMAIL),
        CONSTRAINT FK_CLIKE2 FOREIGN KEY (CHALCOMSEQ) 
        REFERENCES CHALLENGECOMMENT(CHALCOMSEQ)
)

CREATE SEQUENCE CLIKE_SEQ
START WITH 2000
INCREMENT BY 1

SELECT * FROM CHALLENGECOMMENT

SELECT * FROM CHALLENGECOMMENT
SELECT * FROM MEMBER
SELECT  COUNT(*) AS COMMENTTOTAL
FROM CHALLENGECOMMENT

SELECT  ROUND(AVG(CHALCOMRATING), 1) AS COMMAVG
FROM CHALLENGECOMMENT
WHERE CHALLENGESEQ = 1122

SELECT  COUNT(CHALCOMRATING) AS RATEFIVE
FROM CHALLENGECOMMENT
WHERE CHALCOMRATING=5

SELECT  COUNT(CHALCOMRATING) AS RATEFIVE
FROM CHALLENGECOMMENT
WHERE CHALCOMRATING=4


SELECT  COUNT(CHALCOMRATING) AS RATEFIVE
FROM CHALLENGECOMMENT
WHERE CHALCOMRATING=3


SELECT  COUNT(CHALCOMRATING) AS RATEFIVE
FROM CHALLENGECOMMENT
WHERE CHALCOMRATING=2


SELECT  COUNT(CHALCOMRATING) AS RATEFIVE
FROM CHALLENGECOMMENT
WHERE CHALCOMRATING=1


(SELECT COUNT(CHALCOMRATING) AS RATEFIVE
FROM CHALLENGECOMMENT
WHERE CHALCOMRATING=5) AS CFIVE, (SELECT  COUNT(CHALCOMRATING) AS RATEFOUR
FROM CHALLENGECOMMENT
WHERE CHALCOMRATING=4) AS CFOUR, (SELECT  COUNT(CHALCOMRATING) AS RATETHREE
FROM CHALLENGECOMMENT
WHERE CHALCOMRATING=3) AS CTHREE, (SELECT  COUNT(CHALCOMRATING) AS RATETWO
FROM CHALLENGECOMMENT
WHERE CHALCOMRATING=2) AS CTWO, (SELECT  COUNT(CHALCOMRATING) AS RATEONE
FROM CHALLENGECOMMENT
WHERE CHALCOMRATING=1) AS CONE 
FROM CHALLENGECOMMENT

SELECT COUNT(CHALCOMRATING) OVER(PARTITION BY CHALCOMRATING) AS COMMCOUNT, 
	SUM(CHALCOMRATING) OVER(PARTITION BY CHALCOMRATING) COMMSUM, 
	AVG(CHALCOMRATING) OVER(PARTITION BY CHALCOMRATING) AS COMMAVG
FROM CHALLENGECOMMENT
GROUP BY CHALCOMRATING


, AVG(CHALCOMRATING) AS COMMENTAVG
SELECT 
		(SELECT COUNT(*) FROM CHALLENGECOMMENT WHERE CHALCOMRATING=5) AS COMMFIVE, 
		(SELECT COUNT(*) FROM CHALLENGECOMMENT WHERE CHALCOMRATING=4) AS COMMFOUR, 
		(SELECT COUNT(*) FROM CHALLENGECOMMENT WHERE CHALCOMRATING=3) AS COMMTHREE, 
		(SELECT COUNT(*) FROM CHALLENGECOMMENT WHERE CHALCOMRATING=2) AS COMMTWO, 
		(SELECT COUNT(*) FROM CHALLENGECOMMENT WHERE CHALCOMRATING=1) AS COMMONE 
FROM CHALLENGECOMMENT
GROUP BY CHALCOMRATING



SELECT CC.CHALCOMSEQ, CC.CHALCOMCONTENT, CC.CHALCOMDATE, CC.CHALCOMRATING, CC.CHALLENGESEQ, CC.EMAIL, CC.CHALLLIKE, M.NICKNAME, M.MEMBERPHOTONAME,
(SELECT COUNT(*) AS LIKECHECK FROM )
FROM CHALLENGECOMMENT CC, MEMBER M, MEMBER MB, COMMENTLIKE CL
WHERE CC.EMAIL = M.EMAIL
	AND CC.CHALLENGESEQ = #{challengeseq}

UPDATE COMMENTLIKE
SET COMMENTLIKE = 0
WHERE USERLIKECHECK IS NULL


