DROP TABLE CHALLENGE
CASCADE CONSTRAINTS;

DROP SEQUENCE CHAL_SEQ;

--CHALLENGE

CREATE TABLE CHALLENGE(
		CHALLENGESEQ NUMBER CONSTRAINT CHAL_PK PRIMARY KEY, 
		CATEGORY NUMBER,     --카테고리
		CHALLENGETITLE VARCHAR2 (200),
		CHALLENGETEXT VARCHAR2 (4000),
		CHALLENGESTART DATE,  --시작일
		CHALLENGEEND DATE,    --종료일
		CHALLENGEPERIOD NUMBER, --기간
		IDENTIFYFREQUENCY NUMBER, --인증 빈도
		IDENTIFYDAY VARCHAR2(50), --인증 날짜 -- 일, 월, 화 , 수, 목, 금, 토(1-7) ,로 잘라서 사용 (0일때false / 1일때 true)
		IDENTIFYTIME NUMBER, --인증 시간
		CHALLENGEPHOTO VARCHAR2(100), --이미지
		CHALLENGESAVEPHOTO VARCHAR2(200),  --이미지 파일 암호화
		CERTIFYPHOTO VARCHAR2(200),		--인증방법 이미지
		CERTIFYSAVEPHOTO VARCHAR2(200),	--인증방법 이미지 파일 암호화
		CERTIFY VARCHAR2(1000), 		--인증방법  
		RATINGAVG NUMBER, --별점 평균
		CHALLENGESTOP NUMBER, --정지
		CHALLENGEDEL NUMBER, --삭제
		HEADERNUM NUMBER,   --개설자,  관리자:0 유저:3
		POINTCOUNT NUMBER,  --기준 포인트(얼마 걸껀지)
		CHALLENGEMEMBER NUMBER,   --챌린지 전체 인원
		EMAIL VARCHAR2(50), 	  --개설자 이메일
		CHALLENGESDATE DATE,      --개설 날짜
		CONSTRAINT FK_CHAL FOREIGN KEY (EMAIL) 
        REFERENCES MEMBER(EMAIL)
) 
--컬럼 추가 CERTIFYPHOTO CERTIFYSAVEPHOTO CERTIFY
ALTER TABLE CHALLENGE ADD CERTIFYPHOTO VARCHAR(200);
ALTER TABLE CHALLENGE ADD CERTIFYSAVEPHOTO VARCHAR(200);
ALTER TABLE CHALLENGE ADD CERTIFY VARCHAR(1000);
ALTER TABLE CHALLENGE ADD CHALLENGESDATE DATE;

ALTER TABLE CHALLENGE MODIFY CHALLENGEPERIOD NUMBER
SELECT CURRENT_DATE FROM DUAL
--1	건강
--2	역량
--3	정서
--4	자산
--5	생활
--6	취미

--관리자 0, 멤버 3

CREATE SEQUENCE CHAL_SEQ
START WITH 1000
INCREMENT BY 1

SELECT CHALLENGESEQ, CERTIFYSAVEPHOTO  FROM CHALLENGE;
 

--IDENTIFYFREQUENCY 인증 빈도
--1 월 일 매일 인증하기
--2 월 금 매일 인증하기
--3 토 일 매일 인증하기
--4 주6일 인증하기
--5 주5일 인증하기
--4 주4일 인증하기
--3 주3일 인증하기
--2 주 2일 인증하기
--1 주 1일 인증하기

--IDENTIFYFREQUENCY TABLE만들기
--COLUMNS : IDENTIFYFREQUENCY, 요일7개

DROP TABLE IDENTIFYFREQUENCY
CASCADE CONSTRAINTS;


CREATE TABLE IDENTIFYFREQUENCY(
	CHALLENGESEQ NUMBER,
	IDENTIFYFREQUENCY NUMBER,
	SUNDAY NUMBER, --1
	MONDAY NUMBER, --2
	TUESDAY NUMBER, --3
	WEDNESDAY NUMBER, --4
	THURSDAY NUMBER, --5
	FRIDAY NUMBER, --6
	SATERDAY NUMBER, --7
	CONSTRAINT FK_IDEN FOREIGN KEY (CHALLENGESEQ) 
	REFERENCES CHALLENGE(CHALLENGESEQ)
)

SELECT * FROM IDENTIFYFREQUENCY;
UPDATE MEMBER
SET POINT = 100000
WHERE EMAIL = 'dlalstjs0226@naver.com'

INSERT INTO CHALLENGE(CHALLENGESEQ, CATEGORY, CHALLENGETITLE, CHALLENGETEXT,CHALLENGESTART, CHALLENGEEND,CHALLENGEPERIOD,
						IDENTIFYFREQUENCY, IDENTIFYDAY, IDENTIFYTIME, CHALLENGEPHOTO, RATINGAVG, CHALLENGESTOP, CHALLENGEDEL, 
						HEADERNUM, POINTCOUNT, EMAIL)
VALUES(CHAL_SEQ.NEXTVAL, 3, '물 1L먹기', '물을 많이 마셔봅시다.', '2021-05-03', '2021-05-17', '2주동안', 5,'0,1,1,0,0,1,0' , 19, 'SSFEL.jpg', 0, 0, 0, 0, 100, 'admin' )

SELECT M.AUTH FROM MEMBER M, CHALLENGE C WHERE M.EMAIL = C.EMAIL AND C.EMAIL = 'dlalstjs0226@naver.com'

SELECT * FROM CHALLENGE
ORDER BY CHALLENGEMEMBER DESC,  CHALLENGESTART DESC
DELETE CHALLENGE
WHERE EMAIL = 'dlalstjs0226@naver.com' 
SELECT *
	 	FROM (SELECT ROW_NUMBER()OVER(ORDER BY CHALLENGEMEMBER DESC, CHALLENGESTART DESC) AS RNUM,
				C.*,
	 			 M.NICKNAME, M.AUTH, M.MEMBERPHOTO
	  		  FROM CHALLENGE C, MEMBER M
	  		  WHERE C.EMAIL = M.EMAIL
			  ORDER BY CHALLENGEMEMBER DESC, CHALLENGESTART DESC) 
	WHERE RNUM BETWEEN 15 AND 27
	
	SELECT CHALLENGESEQ, CATEGORY, CHALLENGETITLE, CHALLENGETEXT, CHALLENGESTART, CHALLENGEEND, CHALLENGEPERIOD,
	 			  IDENTIFYFREQUENCY, IDENTIFYDAY, IDENTIFYTIME, CHALLENGEPHOTO, CHALLENGESAVEPHOTO, RATINGAVG, HEADERNUM, POINTCOUNT, CHALLENGEMEMBER, EMAIL,
	 			  NICKNAME, AUTH, MEMBERPHOTO
	 	FROM (SELECT ROW_NUMBER()OVER(ORDER BY CHALLENGEMEMBER DESC,  CHALLENGESTART DESC) AS RNUM,
				CHALLENGESEQ, CATEGORY, CHALLENGETITLE, CHALLENGETEXT, CHALLENGESTART, CHALLENGEEND, CHALLENGEPERIOD,
	 			IDENTIFYFREQUENCY, IDENTIFYDAY, IDENTIFYTIME, CHALLENGEPHOTO, CHALLENGESAVEPHOTO, RATINGAVG, HEADERNUM, POINTCOUNT, CHALLENGEMEMBER, C.EMAIL,
	 			 M.NICKNAME, M.AUTH, M.MEMBERPHOTO
	  		  FROM CHALLENGE C, MEMBER M
	  		  WHERE 1=1 
	  		  		AND C.EMAIL = M.EMAIL
		  		  		AND CHALLENGESTOP = 0 
		  		  			AND CHALLENGEDEL = 0
			  ORDER BY CHALLENGEMEMBER DESC, CHALLENGESTART DESC) 
	 	WHERE RNUM BETWEEN 19 AND 27
	
	 	
SELECT CM.CHALLENGMEMSEQ, M.EMAIL, M.NICKNAME, M.MEMBERPHOTONAME, M.POINT, CM.CHALLENGESEQ, CM.IDENTIFY
	FROM MEMBER M, CHALLENGEMEMBER CM
	WHERE M.EMAIL = CM.EMAIL
		AND CM.CHALLENGESEQ =1103
	ORDER BY CM.CHALLENGMEMSEQ DESC
	
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
			    END AS IDENTIFYFREQUENCY
FROM CHALLENGE
WHERE CHALLENGESEQ = 1000


SELECT *, FREQUENCY*CHALLENGEPERIOD AS TOTAL
FROM (SELECT CHALLENGESEQ, CATEGORY, CHALLENGETITLE, CHALLENGETEXT, CHALLENGESTART, 
		CHALLENGEEND, CHALLENGEPERIOD,  IDENTIFYFREQUENCY, IDENTIFYDAY, IDENTIFYTIME, 
		CHALLENGEPHOTO, CHALLENGESAVEPHOTO, CERTIFY, RATINGAVG, HEADERNUM, POINTCOUNT, 
		CHALLENGEMEMBER, EMAIL,	CASE IDENTIFYFREQUENCY
								WHEN 9 THEN 7
							    WHEN 8 THEN 5
							    WHEN 7 THEN 2
							    ELSE IDENTIFYFREQUENCY
							    END AS FREQUENCY
FROM CHALLENGE
WHERE CHALLENGESEQ = 1000)

SELECT *, CASE IDENTIFYFREQUENCY
		WHEN 9 THEN 7
	    WHEN 8 THEN 5
	    WHEN 7 THEN 2
	    ELSE IDENTIFYFREQUENCY
	    END AS FREQUENCY,
FROM CHALLENGE
WHERE CHALLENGESEQ = 1000


SELECT 	CASE IDENTIFYFREQUENCY
				WHEN 9 THEN 7
			    WHEN 8 THEN 5
			    WHEN 7 THEN 2
			    ELSE IDENTIFYFREQUENCY
			    END AS IDENTIFYFREQUENCY, CHALLENGEPERIOD
FROM CHALLENGE
WHERE CHALLENGESEQ

--인증데이터
SELECT RNUM, IDENTIFY, SUCCESS, CHALLENGESEQ, EMAIL, NICKNAME, MEMBERPHOTONAME, IDENTIFYFREQUENCY*CHALLENGEPERIOD AS TOTALDAY, ROUND(IDENTIFY/(IDENTIFYFREQUENCY*CHALLENGEPERIOD)*100,0) AS PERCENTS
FROM(SELECT ROW_NUMBER()OVER(ORDER BY CM.IDENTIFY DESC) AS RNUM, CM.IDENTIFY, CM.SUCCESS, CM.CHALLENGESEQ, M.EMAIL, M.NICKNAME, M.MEMBERPHOTONAME, 
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
	AND CM.CHALLENGESEQ = 1000)
	
--나만의 인증횟수
SELECT EMAIL, IDENTIFY, SUCCESS, NICKNAME, MEMBERPHOTONAME, IDENTIFYFREQUENCY*CHALLENGEPERIOD AS TOTALDAY, ROUND(IDENTIFY/(IDENTIFYFREQUENCY*CHALLENGEPERIOD)*100,0) AS PERCENTS
FROM (SELECT CM.IDENTIFY, CM.SUCCESS, CM.CHALLENGESEQ, M.EMAIL, M.NICKNAME, M.MEMBERPHOTONAME, 
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
	AND M.EMAIL = 'final.5623@gmail.com')
	
-- 전체 데이터 
SELECT CHALTOTALDAY, CERTICOUNT, ROUND(CHALTOTALDAY/CHALTOTALDAY,0) AS PERCENTS
FROM (SELECT IDENTIFYCOUNT*IDENTIFYFREQUENCY AS CHALTOTALDAY, CERTICOUNT
	FROM (SELECT CHALLENGEMEMBER*CHALLENGEPERIOD AS IDENTIFYCOUNT,
		(SELECT COUNT(*) FROM CERTIFY WHERE CHALLENGESEQ = 1000) AS CERTICOUNT,
		CASE IDENTIFYFREQUENCY
			WHEN 9 THEN 7
		    WHEN 8 THEN 5
		    WHEN 7 THEN 2
		    ELSE IDENTIFYFREQUENCY
		    END AS IDENTIFYFREQUENCY
	FROM CHALLENGE
	WHERE CHALLENGESEQ = 1000))
	
SELECT * FROM CHALLENGE

SELECT TO_CHAR(CHALLENGESTART, 'YYYYMMDD') FROM CHALLENGE

SELECT TO_CHAR(CURRENT_DATE, 'YYYYMMDD') FROM DUAL

SELECT TO_CHAR(CURRENT_DATE, 'YYYYMMDD')              --20200723
FROM dual

SELECT C.* FROM 
		(SELECT ROW_NUMBER()OVER(ORDER BY CHALLENGEMEMBER DESC) AS RNUM, CHALLENGESEQ, CATEGORY, CHALLENGETITLE, CHALLENGETEXT, CHALLENGESTART, CHALLENGEEND, CHALLENGEPERIOD,
	 	 IDENTIFYFREQUENCY, IDENTIFYDAY, IDENTIFYTIME, CHALLENGEPHOTO, CHALLENGESAVEPHOTO, RATINGAVG, HEADERNUM, POINTCOUNT, CHALLENGEMEMBER, EMAIL FROM CHALLENGE 
		 WHERE TO_CHAR(CHALLENGESTART, 'YYYYMMDD') = TO_CHAR(CURRENT_DATE, 'YYYYMMDD')
        ORDER BY DBMS_RANDOM.VALUE) C
WHERE ROWNUM <= 4
select * from CHALLENGE order by dbms_random.value;

출처: https://mobilenweb.tistory.com/75 [모바일앤웹]

select * 
from CHALLENGE 
WHERE TO_CHAR(CHALLENGESTART, 'YYYY-MM-DD') == TO_CHAR(CURRENT_DATE, 'YYYY-MM-DD')
order by rand() limit 4

