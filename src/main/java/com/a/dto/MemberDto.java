package com.a.dto;

import java.io.Serializable;
import java.util.Arrays;

import org.springframework.web.multipart.MultipartFile;

/*
CREATE TABLE MEMBER(
		MEMBERSEQ NUMBER,
		EMAIL VARCHAR2(50) CONSTRAINT MEM_PRI PRIMARY KEY, 
		NICKNAME VARCHAR2(50),
		MEMBERPHOTO VARCHAR2(200),
		NAVERLOGIN VARCHAR2(50),
		KAKAOLOGIN VARCHAR2(50),
		GOOGLELOGIN VARCHAR2(50),
		AUTH NUMBER,
		MEMBERDEL NUMBER,
		POINT NUMBER
)
--관리자 1, 멤버 3
*/
public class MemberDto implements Serializable{
	
	private String email;
	private String nickname;
	private String memberPhoto;
	private String memberPhotoName;
	private String naverLogin;
	private String kakaoLogin;
	private String googleLogin;
	private int auth;		//관리자 1, 멤버 3
	private int memberdel;
	private int point;
	private String flag;
	
	public MemberDto() {
	}

	public MemberDto(String email, String nickname, String memberPhoto, String memberPhotoName, String naverLogin,
			String kakaoLogin, String googleLogin, int auth, int memberdel, int point, String flag) {
		super();
		this.email = email;
		this.nickname = nickname;
		this.memberPhoto = memberPhoto;
		this.memberPhotoName = memberPhotoName;
		this.naverLogin = naverLogin;
		this.kakaoLogin = kakaoLogin;
		this.googleLogin = googleLogin;
		this.auth = auth;
		this.memberdel = memberdel;
		this.point = point;
		this.flag = flag;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getMemberPhoto() {
		return memberPhoto;
	}

	public void setMemberPhoto(String memberPhoto) {
		this.memberPhoto = memberPhoto;
	}

	public String getMemberPhotoName() {
		return memberPhotoName;
	}

	public void setMemberPhotoName(String memberPhotoName) {
		this.memberPhotoName = memberPhotoName;
	}

	public String getNaverLogin() {
		return naverLogin;
	}

	public void setNaverLogin(String naverLogin) {
		this.naverLogin = naverLogin;
	}

	public String getKakaoLogin() {
		return kakaoLogin;
	}

	public void setKakaoLogin(String kakaoLogin) {
		this.kakaoLogin = kakaoLogin;
	}

	public String getGoogleLogin() {
		return googleLogin;
	}

	public void setGoogleLogin(String googleLogin) {
		this.googleLogin = googleLogin;
	}

	public int getAuth() {
		return auth;
	}

	public void setAuth(int auth) {
		this.auth = auth;
	}

	public int getMemberdel() {
		return memberdel;
	}

	public void setMemberdel(int memberdel) {
		this.memberdel = memberdel;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	@Override
	public String toString() {
		return "MemberDto [email=" + email + ", nickname=" + nickname + ", memberPhoto=" + memberPhoto
				+ ", memberPhotoName=" + memberPhotoName + ", naverLogin=" + naverLogin + ", kakaoLogin=" + kakaoLogin
				+ ", googleLogin=" + googleLogin + ", auth=" + auth + ", memberdel=" + memberdel + ", point=" + point
				+ ", flag=" + flag + "]";
	}

	
	
	
}
