package com.a.dto;

/* 
CREATE TABLE CHALLENGE(
		CHALLENGESEQ NUMBER CONSTRAINT MEM_PRI PRIMARY KEY, 
		CATEGORY NUMBER,     --카테고리
		CHALLENGETITLE VARCHAR2 (200),
		CHALLENGETEXT VARCHAR2 (4000),
		CHALLENGESTART DATE,  --시작일
		CHALLENGEEND DATE,    --종료일
		IDENTIFYFREQUENCY NUMBER, --인증 빈도
		IDENTIFYDAY VARCHAR2(50),
		IDENTIFYTIME DATE, --인증 시간
		IDENTIFYCOUNT NUMBER, --인증 횟수
		CHALLENGEPHOTO VARCHAR2(100),
		RATINGAVG NUMBER, --별점 평균
		CHALLENGESTOP NUMBER, --정지
		CHALLENGEDEL NUMBER, --삭제
		HEADERNUM NUMBER,   --개설자,  관리자:0 유저:3
		POINTCOUNT NUMBER,  --기준 포인트(얼마 걸껀지)
		
		EMAIL VARCHAR2(50), 
		
		CONSTRAINT FK_CHAL FOREIGN KEY (EMAIL) 
        REFERENCES MEMBER(EMAIL)
)  
 
 */


public class challengeDto {

	private int challengeseq;
	private int category;
	private String challengetitle;
	private String challengetext;
	private String challengestart;
	private String challengeend;
	private String challengeperiod;
	private int identifyfrequency; //인증 빈도
	private int identifyday[]; //월 화 수 목 금 토 일
	private String identifytime;
	private String challengephoto;
	private double ratingavg;
	private int challengestop;
	private int challengedel;
	private int headernum;	//개설자
	private int pointcount;	//얼마 걸테냐...
	private int email;	//id와 같음
	
	public challengeDto() {
		
	}

	
	
}
