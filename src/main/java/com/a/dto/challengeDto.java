package com.a.dto;

import java.util.Arrays;

/* 
CREATE TABLE CHALLENGE(
		CHALLENGESEQ NUMBER CONSTRAINT CHAL_PK PRIMARY KEY, 
		CATEGORY NUMBER,     --카테고리
		CHALLENGETITLE VARCHAR2 (200),
		CHALLENGETEXT VARCHAR2 (4000),
		CHALLENGESTART DATE,  --시작일
		CHALLENGEEND DATE,    --종료일
		CHALLENGEPERIOD VARCHAR2(50), --기간
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
	private int limitdate;  //며칠 남았나...(현재시각 - 시작일)
	private int identifyfrequency; //인증 빈도
	private String identifyday; //월 화 수 목 금 토 일
	private String identifydayS; //평일 매일
	private String identifytime;
	private String challengephoto;
	private String challengesavephoto; 	//파일 이름 암호화
	private String certifyphoto;    //인증방법 포토
	private String certifysavephoto;	//인증방법 포토이름암호화
	private String certify;				//인증방법
	private double ratingavg;
	private int challengestop;
	private int challengedel;
	private int headernum;	//개설자
	private int pointcount;	//얼마 걸테냐...
	private int challengemember; //멤버 전체
	private String email;	//id와 같음
	
	public challengeDto() {
		// TODO Auto-generated constructor stub
	}

	public challengeDto(int challengeseq, int category, String challengetitle, String challengetext,
			String challengestart, String challengeend, String challengeperiod, int limitdate, int identifyfrequency,
			String identifyday, String identifydayS, String identifytime, String challengephoto,
			String challengesavephoto, String certifyphoto, String certifysavephoto, String certify, double ratingavg,
			int challengestop, int challengedel, int headernum, int pointcount, int challengemember, String email) {
		super();
		this.challengeseq = challengeseq;
		this.category = category;
		this.challengetitle = challengetitle;
		this.challengetext = challengetext;
		this.challengestart = challengestart;
		this.challengeend = challengeend;
		this.challengeperiod = challengeperiod;
		this.limitdate = limitdate;
		this.identifyfrequency = identifyfrequency;
		this.identifyday = identifyday;
		this.identifydayS = identifydayS;
		this.identifytime = identifytime;
		this.challengephoto = challengephoto;
		this.challengesavephoto = challengesavephoto;
		this.certifyphoto = certifyphoto;
		this.certifysavephoto = certifysavephoto;
		this.certify = certify;
		this.ratingavg = ratingavg;
		this.challengestop = challengestop;
		this.challengedel = challengedel;
		this.headernum = headernum;
		this.pointcount = pointcount;
		this.challengemember = challengemember;
		this.email = email;
	}

	public int getChallengeseq() {
		return challengeseq;
	}

	public void setChallengeseq(int challengeseq) {
		this.challengeseq = challengeseq;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public String getChallengetitle() {
		return challengetitle;
	}

	public void setChallengetitle(String challengetitle) {
		this.challengetitle = challengetitle;
	}

	public String getChallengetext() {
		return challengetext;
	}

	public void setChallengetext(String challengetext) {
		this.challengetext = challengetext;
	}

	public String getChallengestart() {
		return challengestart;
	}

	public void setChallengestart(String challengestart) {
		this.challengestart = challengestart;
	}

	public String getChallengeend() {
		return challengeend;
	}

	public void setChallengeend(String challengeend) {
		this.challengeend = challengeend;
	}

	public String getChallengeperiod() {
		return challengeperiod;
	}

	public void setChallengeperiod(String challengeperiod) {
		this.challengeperiod = challengeperiod;
	}

	public int getLimitdate() {
		return limitdate;
	}

	public void setLimitdate(int limitdate) {
		this.limitdate = limitdate;
	}

	public int getIdentifyfrequency() {
		return identifyfrequency;
	}

	public void setIdentifyfrequency(int identifyfrequency) {
		this.identifyfrequency = identifyfrequency;
	}

	public String getIdentifyday() {
		return identifyday;
	}

	public void setIdentifyday(String identifyday) {
		this.identifyday = identifyday;
	}

	public String getIdentifydayS() {
		return identifydayS;
	}

	public void setIdentifydayS(String identifydayS) {
		this.identifydayS = identifydayS;
	}

	public String getIdentifytime() {
		return identifytime;
	}

	public void setIdentifytime(String identifytime) {
		this.identifytime = identifytime;
	}

	public String getChallengephoto() {
		return challengephoto;
	}

	public void setChallengephoto(String challengephoto) {
		this.challengephoto = challengephoto;
	}

	public String getChallengesavephoto() {
		return challengesavephoto;
	}

	public void setChallengesavephoto(String challengesavephoto) {
		this.challengesavephoto = challengesavephoto;
	}

	public String getCertifyphoto() {
		return certifyphoto;
	}

	public void setCertifyphoto(String certifyphoto) {
		this.certifyphoto = certifyphoto;
	}

	public String getCertifysavephoto() {
		return certifysavephoto;
	}

	public void setCertifysavephoto(String certifysavephoto) {
		this.certifysavephoto = certifysavephoto;
	}

	public String getCertify() {
		return certify;
	}

	public void setCertify(String certify) {
		this.certify = certify;
	}

	public double getRatingavg() {
		return ratingavg;
	}

	public void setRatingavg(double ratingavg) {
		this.ratingavg = ratingavg;
	}

	public int getChallengestop() {
		return challengestop;
	}

	public void setChallengestop(int challengestop) {
		this.challengestop = challengestop;
	}

	public int getChallengedel() {
		return challengedel;
	}

	public void setChallengedel(int challengedel) {
		this.challengedel = challengedel;
	}

	public int getHeadernum() {
		return headernum;
	}

	public void setHeadernum(int headernum) {
		this.headernum = headernum;
	}

	public int getPointcount() {
		return pointcount;
	}

	public void setPointcount(int pointcount) {
		this.pointcount = pointcount;
	}

	public int getChallengemember() {
		return challengemember;
	}

	public void setChallengemember(int challengemember) {
		this.challengemember = challengemember;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "challengeDto [challengeseq=" + challengeseq + ", category=" + category + ", challengetitle="
				+ challengetitle + ", challengetext=" + challengetext + ", challengestart=" + challengestart
				+ ", challengeend=" + challengeend + ", challengeperiod=" + challengeperiod + ", limitdate=" + limitdate
				+ ", identifyfrequency=" + identifyfrequency + ", identifyday=" + identifyday + ", identifydayS="
				+ identifydayS + ", identifytime=" + identifytime + ", challengephoto=" + challengephoto
				+ ", challengesavephoto=" + challengesavephoto + ", certifyphoto=" + certifyphoto
				+ ", certifysavephoto=" + certifysavephoto + ", certify=" + certify + ", ratingavg=" + ratingavg
				+ ", challengestop=" + challengestop + ", challengedel=" + challengedel + ", headernum=" + headernum
				+ ", pointcount=" + pointcount + ", challengemember=" + challengemember + ", email=" + email + "]";
	}

	
	
}

	
