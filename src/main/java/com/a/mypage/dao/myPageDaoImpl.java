package com.a.mypage.dao;

import java.sql.SQLException;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class myPageDaoImpl implements myPageDao {
	
	@Autowired
	SqlSession sql;

	@Override
	public Map<String, Object> getNowCh(String email) throws SQLException {
		return sql.selectOne("myPage.getNowCh", email);
	}
	
	
}
