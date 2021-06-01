package com.a.mypage.dao;

import java.sql.SQLException;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.a.dto.MemberDto;

@Repository
public class myPageDaoImpl implements myPageDao {
	
	@Autowired
	SqlSession sql;
	
	@Override
	public Map<String, Object> getNowCh(String email) throws SQLException {
		return sql.selectOne("myPage.getNowCh", email);
	}
	
	@Override
	public Map<String, Object> getCompleCh(String email) throws SQLException {
		return sql.selectOne("myPage.getCompleCh", email);
	}
	
	@Override
	public MemberDto memberModifyInfo(String email) throws SQLException {
		return sql.selectOne("member.memberModifyInfo", email);
	}
}
