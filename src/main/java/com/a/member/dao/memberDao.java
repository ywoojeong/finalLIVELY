package com.a.member.dao;

import java.sql.SQLException;
import java.util.Map;

import com.a.dto.MemberDto;

public interface memberDao {

	// 회원가입 추가 정보
	public int memberInfoPro(MemberDto dto) throws Exception;
	// 닉네임 중복 확인
	public int nickCheck(MemberDto dto) throws Exception;
	// 네이버 이메일 가입 확인(중복)
	public Map<String, Object> naverConnectionCheck(Map<String, Object> apiJson) throws SQLException;
	public Integer setNaverConnection (Map<String, Object> paramMap) throws SQLException;
	public Integer memberNaverRegisterPro (Map<String, Object> paramMap) throws SQLException;
	public MemberDto memberNaverLoginPro (Map<String, Object> apiJson) throws SQLException;
	// 카카오
	public Map<String, Object> kakaoConnectionCheck (Map<String, Object> apiJson) throws SQLException;
	public Integer setKakaoConnection (Map<String, Object> apiJson) throws SQLException;
	public MemberDto memberKakaoLoginPro (Map<String, Object> apiJson) throws SQLException;
	public Integer memberKakaoRegisterPro (Map<String, Object> paramMap) throws SQLException;

	// 구글
	public Map<String, Object> googleConnectionCheck (Map<String, Object> paramMap) throws SQLException;
	public Integer setGoogleConnection (Map<String, Object> paramMap) throws SQLException;
	public MemberDto memberGoogleLoginPro (Map<String, Object> paramMap) throws SQLException;
	public Integer memberGoogleRegisterPro (Map<String, Object> paramMap) throws SQLException;
	
	// Session
	public MemberDto memberSession(String email) throws SQLException;
}
