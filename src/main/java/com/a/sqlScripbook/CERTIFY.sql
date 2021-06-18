DROP TABLE CERTIFY
CASCADE CONSTRAINTS;

DROP SEQUENCE CERT_SEQ;

CREATE TABLE CERTIFY(
		CERTIFYSEQ NUMBER CONSTRAINT CERT_PRI PRIMARY KEY, 
		CERTIFYPHOTO VARCHAR2(100), 
		CERTIFYPHOTONAME VARCHAR2(100),
		CERTIFYDATE DATE,
		EMAIL VARCHAR2(50),
		CHALLENGESEQ NUMBER,
		CONSTRAINT FK_CERT1 FOREIGN KEY(EMAIL) 
        REFERENCES MEMBER(EMAIL),
        CONSTRAINT FK_CERT2 FOREIGN KEY(CHALLENGESEQ) 
        REFERENCES CHALLENGE(CHALLENGESEQ)
)


CREATE SEQUENCE CERT_SEQ
START WITH 100
INCREMENT BY 1

SELECT * FROM CERTIFY
SELECT SYSDATE, SYSTIMESTAMP FROM DUAL
select DBTIMEZONE, SESSIONTIMEZONE FROM DUAL
SELECT CURRENT_DATE, CURRENT_TIMESTAMP, LOCALTIMESTAMP FROM DUAL ;

SELECT * FROM CHALLENGE CHALLENGEPERIOD
SELECT * FROM CHALLENGEMEMBER
SELECT * FROM CERTIFY
SELECT CERTIFYSEQ, CERTIFYPHOTO, CERTIFYPHOTONAME, CERTIFYDATE, EMAIL, CHALLENGESEQ, 
(SELECT COUNT(*)
FROM CERTIFY
WHERE EMAIL = 'final.5623@gmail.com'
	AND CERTIFYDATE >= TO_DATE(TO_CHAR(CURRENT_DATE, 'YYYY-MM-DD HH24'), 'YYYY-MM-DD HH24')
	AND CERTIFYDATE <= TO_DATE(TO_CHAR(CURRENT_DATE, 'YYYY-MM-DD HH24'), 'YYYY-MM-DD HH24')+(300/86400)) AS CERTIFYCHECK
FROM CERTIFY
WHERE EMAIL = 'final.5623@gmail.com'
	
(SELECT COUNT(*)
FROM CERTIFY
WHERE CERTIFYDATE >= TO_DATE(TO_CHAR(CURRENT_DATE, 'YYYY-MM-DD HH24'), 'YYYY-MM-DD HH24')
	AND CERTIFYDATE <= TO_DATE(TO_CHAR(CURRENT_DATE, 'YYYY-MM-DD HH24'), 'YYYY-MM-DD HH24')+(300/86400)) AS CERTIFYCHECK
FROM DUAL
SELECT
TO_DATE(TO_CHAR(CURRENT_DATE, 'YYYY-MM-DD HH24'), 'YYYY-MM-DD HH24'),
TO_DATE(TO_CHAR(CURRENT_DATE, 'YYYY-MM-DD HH24'), 'YYYY-MM-DD HH24')+(17400/86400)
FROM DUAL

UPDATE CHALLENGEMEMBER
SET IDENTIFY = 5
WHERE EMAIL = 'final.5623@gmail.com'
	AND CHALLENGESEQ = 1140
SELECT T.RNUM, T.EM, C.IDENTIFYTIME*14 AS TOTAL
FROM (SELECT ROW_NUMBER()OVER(ORDER BY CM.IDENTIFY DESC) AS RNUM, CM.IDENTIFY, CM.SUCCESS, CM.CHALLENGESEQ AS CHALSEQ, M.EMAIL AS EM, M.NICKNAME, M.MEMBERPHOTONAME
		FROM CHALLENGEMEMBER CM, MEMBER M
		WHERE M.EMAIL = CM.EMAIL
			AND CHALLENGESEQ = 1140) T, CHALLENGE C
WHERE C.CHALLENGESEQ = T.CHALSEQ

ALTER TABLE CHALLENGEMEMBER
ADD CONSTRAINT FK_CHALMEM2
FOREIGN KEY(CHALLENGESEQ)
REFERENCES CHALLENGE(CHALLENGESEQ)



SELECT ROW_NUMBER()OVER(ORDER BY CM.IDENTIFY DESC) AS RNUM, CM.IDENTIFY, CM.SUCCESS, CM.CHALLENGESEQ, M.EMAIL, M.NICKNAME, M.MEMBERPHOTONAME, 
CASE C.IDENTIFYFREQUENCY
	WHEN 9 THEN 7
    WHEN 8 THEN 5
    WHEN 7 THEN 2
    ELSE C.IDENTIFYFREQUENCY
    END AS IDENTIFYFREQUENCY, C.CHALLENGEPERIOD
FROM CHALLENGEMEMBER CM, MEMBER M, CHALLENGE C
WHERE M.EMAIL = CM.EMAIL
	AND C.CHALLENGESEQ = CM.CHALLENGESEQ
	AND M.EMAIL = CM.EMAIL
	AND CM.CHALLENGESEQ = 1000

(SELECT * FROM CHALLENGE
 IF IDENTIFYFREQUENCY == 9 THEN
 	IDENTIFYFREQUENCY = 7;
 ELSE IF IDENTIFYFREQUENCY == 8 THEN
 	IDENTIFYFREQUENCY = 5;
 ELSE IF IDENTIFYFREQUENCY == 7 THEN
 	IDENTIFYFREQUENCY = 2;
 ELSE
 	IDENTIFYFREQUENCY = IDENTIFYFREQUENCY;
 END IF;)
 
SELECT * FROM CERTIFY	
SELECT COUNT(*)
FROM CERTIFY
WHERE CHALLENGESEQ = 1000
SELECT 
	CASE IDENTIFYFREQUENCY
				WHEN 9 THEN 7
			    WHEN 8 THEN 5
			    WHEN 7 THEN 2
			    ELSE IDENTIFYFREQUENCY
			    END AS IDENTIFYFREQUENCY, CHALLENGETITLE, CHALLENGEPERIOD
FROM CHALLENGE
WHERE CHALLENGESEQ = 1000
 
SELECT * FROM CHALLENGE
INSERT INTO CHALLENGE(CHALLENGESEQ, CHALLENGETITLE, CHALLENGEPERIOD, IDENTIFYFREQUENCY)
VALUES(1000, '과자 그만 먹기', 4, 8)
UPDATE CHALLENGE
SET CHALLENGEMEMBER = 3
WHERE CHALLENGESEQ = 1000


SELECT CHALLENGETITLE, CHALLENGEPERCENT
FROM(SELECT ROW_NUMBER()OVER(ORDER BY PERCENT DESC) AS RNUM, PERCENT, CHALLENGESEQ, CHALLENGETITLE
FROM(SELECT ROUND(A.CERTIFYCOUNT / (C.IDENTIFYFREQUENCY*C.CHALLENGEPERIOD*C.CHALLENGEMEMBER) *100) AS PERCENT, C.CHALLENGESEQ, C.CHALLENGETITLE
FROM (SELECT COUNT(*) AS CERTIFYCOUNT, CHALLENGESEQ
 FROM CERTIFY
 GROUP BY CHALLENGESEQ) A, 
 (SELECT 
	CASE IDENTIFYFREQUENCY
				WHEN 9 THEN 7
			    WHEN 8 THEN 5
			    WHEN 7 THEN 2
			    ELSE IDENTIFYFREQUENCY
			    END AS IDENTIFYFREQUENCY, CHALLENGETITLE, CHALLENGEPERIOD, CHALLENGESEQ, CHALLENGEMEMBER
FROM CHALLENGE) C
WHERE C.CHALLENGESEQ = A.CHALLENGESEQ))
WHERE RNUM BETWEEN 1 AND 7

-- 챌린지 달성률
SELECT CHALLENGETITLE, PERCENT
FROM(SELECT ROW_NUMBER()OVER(ORDER BY PERCENT DESC) AS RNUM, PERCENT, CHALLENGESEQ, CHALLENGETITLE, CHALLENGEMEMBER
FROM(SELECT ROUND(A.CERTIFYCOUNT / (C.IDENTIFYFREQUENCY*C.CHALLENGEPERIOD*C.CHALLENGEMEMBER) *100) AS PERCENT, C.CHALLENGESEQ, C.CHALLENGETITLE, C.CHALLENGEMEMBER
FROM (SELECT COUNT(*) AS CERTIFYCOUNT, CHALLENGESEQ
 FROM CERTIFY
 GROUP BY CHALLENGESEQ) A, 
 (SELECT 
	CASE IDENTIFYFREQUENCY
				WHEN 9 THEN 7
			    WHEN 8 THEN 5
			    WHEN 7 THEN 2
			    ELSE IDENTIFYFREQUENCY
			    END AS IDENTIFYFREQUENCY, CHALLENGETITLE, CHALLENGEPERIOD, CHALLENGESEQ, CHALLENGEMEMBER
FROM CHALLENGE) C
WHERE C.CHALLENGESEQ = A.CHALLENGESEQ))
WHERE RNUM BETWEEN 1 AND 7
ORDER BY PERCENT DESC, CHALLENGEMEMBER DESC
--유저 달성률
SELECT T.EMAIL, T.TOTALPERCENT, M.NICKNAME
FROM (SELECT ROW_NUMBER()OVER(ORDER BY A.TOTALPERCENT DESC) AS RNUM, A.EMAIL, A.TOTALPERCENT
FROM (SELECT EMAIL, SUM(PERCENTS)/COUNT(*) AS TOTALPERCENT
FROM (SELECT NICKNAME, EMAIL, IDENTIFYFREQUENCY*CHALLENGEPERIOD AS TOTALDAY, ROUND(IDENTIFY/(IDENTIFYFREQUENCY*CHALLENGEPERIOD)*100,0) AS PERCENTS, MEMBERSDATE
		FROM (SELECT CM.IDENTIFY, CM.CHALLENGESEQ, M.NICKNAME, M.EMAIL, M.MEMBERSDATE,
					CASE C.IDENTIFYFREQUENCY
						WHEN 9 THEN 7
					    WHEN 8 THEN 5
					    WHEN 7 THEN 2
					    ELSE C.IDENTIFYFREQUENCY
					    END AS IDENTIFYFREQUENCY, C.CHALLENGEPERIOD
		FROM CHALLENGEMEMBER CM, MEMBER M, CHALLENGE C
		WHERE M.EMAIL = CM.EMAIL
			AND C.CHALLENGESEQ = CM.CHALLENGESEQ)
		ORDER BY PERCENTS DESC, MEMBERSDATE ASC)
GROUP BY EMAIL) A) T, MEMBER M
WHERE RNUM BETWEEN 1 AND 6
	AND T.EMAIL = M.EMAIL
ORDER BY  T.TOTALPERCENT DESC



SELECT * FROM CHALLENGE WHERE CHALLENGESEQ = 1140
SELECT *
FROM CERTIFY
WHERE CHALLENGESEQ = 1140