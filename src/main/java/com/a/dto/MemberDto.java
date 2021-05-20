package com.a.dto;

import java.io.Serializable;
import java.util.Arrays;

import org.springframework.web.multipart.MultipartFile;

/*
CREATE TABLE MEMBER(
		MEMBERSEQ NUMBER,
		EMAIL VARCHAR2(20) CONSTRAINT MEM_PRI PRIMARY KEY, 
		NICKNAME VARCHAR2(20),
		MEMBERPHOTO VARCHAR2(50),
		NAVERLOGIN VARCHAR2(20),
		KAKAOLOGIN VARCHAR2(20),
		GOOGLELOGIN VARCHAR2(20),
		AUTH NUMBER,
		MEMBERDEL NUMBER
)
--관리자 1, 멤버 3
*/
public class MemberDto implements Serializable{
	
	private String email;
	private String nickname;
	private MultipartFile[] memberPhoto;
	private String naverLogin;
	private String kakaoLogin;
	private String googleLogin;
	private int auth;		//관리자 1, 멤버 3
	private int memberdel;	
	
	public MemberDto() {
	}

	public MemberDto(String email, String nickname, MultipartFile[] memberPhoto, String naverLogin, String kakaoLogin,
			String googleLogin, int auth, int memberdel) {
		super();
		this.email = email;
		this.nickname = nickname;
		this.memberPhoto = memberPhoto;
		this.naverLogin = naverLogin;
		this.kakaoLogin = kakaoLogin;
		this.googleLogin = googleLogin;
		this.auth = auth;
		this.memberdel = memberdel;
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

	public MultipartFile[] getMemberPhoto() {
		return memberPhoto;
	}

	public void setMemberPhoto(MultipartFile[] memberPhoto) {
		this.memberPhoto = memberPhoto;
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

	@Override
	public String toString() {
		return "MemberDto [email=" + email + ", nickname=" + nickname + ", memberPhoto=" + Arrays.toString(memberPhoto)
				+ ", naverLogin=" + naverLogin + ", kakaoLogin=" + kakaoLogin + ", googleLogin=" + googleLogin
				+ ", auth=" + auth + ", memberdel=" + memberdel + "]";
	}

	
	
}
