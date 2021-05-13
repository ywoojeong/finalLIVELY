package com.a.dto;

import java.io.Serializable;

/*
CREATE TABLE MEMBER(
		EMAIL VARCHAR2(20) CONSTRAINT MEM_PRI PRIMARY KEY, 
		NICKNAME VARCHAR2(20),
		MEMBERPHOTO VARCHAR2(50),
		AUTH NUMBER,
		MEMBERDEL NUMBER
)
--관리자 1, 멤버 3
*/
public class MemberDto implements Serializable{
	
	private String email;
	private String nickname;
	private String memberphoto;
	private int auth;
	private int memberdel;	//관리자 1, 멤버 3
	
	public MemberDto() {
	}

	public MemberDto(String email, String nickname, String memberphoto, int auth, int memberdel) {
		super();
		this.email = email;
		this.nickname = nickname;
		this.memberphoto = memberphoto;
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

	public String getMemberphoto() {
		return memberphoto;
	}

	public void setMemberphoto(String memberphoto) {
		this.memberphoto = memberphoto;
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
		return "MemberDto [email=" + email + ", nickname=" + nickname + ", memberphoto=" + memberphoto + ", auth="
				+ auth + ", memberdel=" + memberdel + "]";
	}
	
}
