package com.a.dto;

import java.util.Arrays;

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
		IDENTIFYDAY VARCHAR2(50) --인증 날짜(요일)1 -7
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
	private String identifyday; //월 화 수 목 금 토 일
	private String identifytime;
	private String challengephoto;
	private String challengesavephoto; 	//파일 이름 암호화
	private double ratingavg;
	private int challengestop;
	private int challengedel;
	private int headernum;	//개설자
	private int pointcount;	//얼마 걸테냐...
	private String email;	//id와 같음
	
	public challengeDto() {
		// TODO Auto-generated constructor stub
	}

	public challengeDto(int challengeseq, int category, String challengetitle, String challengetext,
			String challengestart, String challengeend, String challengeperiod, int identifyfrequency,
			String identifyday, String identifytime, String challengephoto, String challengesavephoto, double ratingavg,
			int challengestop, int challengedel, int headernum, int pointcount, String email) {
		super();
		this.challengeseq = challengeseq;
		this.category = category;
		this.challengetitle = challengetitle;
		this.challengetext = challengetext;
		this.challengestart = challengestart;
		this.challengeend = challengeend;
		this.challengeperiod = challengeperiod;
		this.identifyfrequency = identifyfrequency;
		this.identifyday = identifyday;
		this.identifytime = identifytime;
		this.challengephoto = challengephoto;
		this.challengesavephoto = challengesavephoto;
		this.ratingavg = ratingavg;
		this.challengestop = challengestop;
		this.challengedel = challengedel;
		this.headernum = headernum;
		this.pointcount = pointcount;
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
				+ ", challengeend=" + challengeend + ", challengeperiod=" + challengeperiod + ", identifyfrequency="
				+ identifyfrequency + ", identifyday=" + identifyday + ", identifytime=" + identifytime
				+ ", challengephoto=" + challengephoto + ", challengesavephoto=" + challengesavephoto + ", ratingavg="
				+ ratingavg + ", challengestop=" + challengestop + ", challengedel=" + challengedel + ", headernum="
				+ headernum + ", pointcount=" + pointcount + ", email=" + email + "]";
	}

	
}

	
