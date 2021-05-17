package com.a.member.service;


import java.sql.SQLException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.a.dto.MemberDto;
import com.a.member.dao.memberDao;

@Service
public class memberServiceImpl implements memberService {
	
	@Autowired
	memberDao memberDao;
	
	// 회원가입
	@Override
	public boolean memberInfoPro(MemberDto dto) throws Exception {
		int count = memberDao.memberInfoPro(dto);
		return count>0?true:false;
	}

	// 닉네임 중복 체크
	@Override
	public int nickCheck(MemberDto dto) throws Exception {
		return memberDao.nickCheck(dto);
	}

	@Override
	public Map<String, Object> naverConnectionCheck(Map<String, Object> apiJson) throws SQLException {
		return memberDao.naverConnectionCheck(apiJson);
	}

	@Override
	public Integer setNaverConnection(Map<String, Object> paramMap) throws SQLException {
		return memberDao.setNaverConnection(paramMap);
	}

	@Override
	public Integer memberNaverRegisterPro(Map<String, Object> paramMap) throws SQLException {
		return memberDao.memberNaverRegisterPro(paramMap);
	}

	@Override
	public Map<String, Object> memberNaverLoginPro(Map<String, Object> paramMap) throws SQLException {
		return memberDao.memberNaverLoginPro(paramMap);
	}
	
	
}
