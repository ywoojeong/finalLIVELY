package com.a.member.service;

import java.sql.SQLException;
import java.util.Map;

import com.a.dto.MemberDto;

public interface memberService {

	public int nickCheck(MemberDto dto) throws Exception;
	public boolean memberInfoPro(MemberDto dto) throws Exception;
	public Map<String, Object> naverConnectionCheck(Map<String, Object> apiJson) throws SQLException; 
	Integer setNaverConnection (Map<String, Object> paramMap) throws SQLException;
	Integer memberNaverRegisterPro (Map<String, Object> paramMap) throws SQLException;
	Map<String, Object> memberNaverLoginPro (Map<String, Object> paramMap) throws SQLException;
}
