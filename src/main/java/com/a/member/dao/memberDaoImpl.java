package com.a.member.dao;

import java.sql.SQLException;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.a.dto.MemberDto;

@Repository
public class memberDaoImpl implements memberDao {
	
	@Autowired
	SqlSession sql;
	
	String namespace = "member.";
	
	// 회원가입 추가 정보
	@Override
	public int memberInfoPro(MemberDto dto) throws Exception {
		return sql.insert("member.memberInfoPro", dto);
	}

	// 닉넴임 중복 확인
	@Override
	public int nickCheck(MemberDto dto) throws Exception {
		return sql.selectOne("member.nickCheck", dto);
	}
	
	// 네이버 가입 확인
	@Override
	public Map<String, Object> naverConnectionCheck(Map<String, Object> apiJson) throws SQLException {
		return sql.selectOne("member.naverConnectionCheck", apiJson);
	}

	@Override
	public Integer setNaverConnection(Map<String, Object> paramMap) throws SQLException {
		return sql.update("member.setNaverConnection", paramMap);
	}

	@Override
	public Integer memberNaverRegisterPro(Map<String, Object> paramMap) throws SQLException {
		return sql.insert("member.memberNaverRegisterPro", paramMap);
	}

	@Override
	public Map<String, Object> memberNaverLoginPro(Map<String, Object> apiJson) throws SQLException {
		return sql.selectOne("member.memberNaverLoginPro", apiJson);
	}

	@Override
	public Map<String, Object> kakaoConnectionCheck(Map<String, Object> apiJson) throws SQLException {
		return sql.selectOne("member.kakaoConnectionCheck", apiJson);
	}

	@Override
	public Integer setKakaoConnection(Map<String, Object> apiJson) throws SQLException {
		return sql.update("member.setKakaoConnection", apiJson);
	}

	@Override
	public Map<String, Object> memberKakaoLoginPro(Map<String, Object> apiJson) throws SQLException {
		return sql.selectOne("member.memberKakaoLoginPro", apiJson);
	}

	@Override
	public Integer memberKakaoRegisterPro(Map<String, Object> paramMap) throws SQLException {
		return sql.insert("member.memberKakaoRegisterPro", paramMap);
	}
	
	
	
}
