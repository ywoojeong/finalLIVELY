package com.a.manager.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class managerDaoImpl implements managerDao{
	
	@Autowired
	SqlSession managerSql;
	
	String ns = "manager.";
	
	@Override
	public List<Map<String, Object>> managerList(Map<String, Object> mListParam) throws SQLException {
		// TODO Auto-generated method stub
		System.out.println("mListParam===========>"+mListParam);
		return managerSql.selectList("manager.managerList", mListParam);
	}

	
	
	//민선 부분
	@Override
	public int userAllCount() {
		// TODO Auto-generated method stub
		return managerSql.selectOne(ns+"userAllCount");
	}

	@Override
	public int challengeAllCount() {
		// TODO Auto-generated method stub
		return managerSql.selectOne(ns+"challengeAllCount");
	}

	@Override
	public List<Map<String, Object>> challengeAdd() {
		// TODO Auto-generated method stub
		return managerSql.selectList(ns+"challengeAdd");
	}

	@Override
	public List<Map<String, Object>> challengeCategory() {
		// TODO Auto-generated method stub
		return managerSql.selectList(ns+"challengeCategory");
	}

	@Override
	public List<Map<String, Object>> challengeMemberMax() {
		// TODO Auto-generated method stub
		return managerSql.selectList(ns+"challengeMemberMax");
	}

	@Override
	public List<Map<String, Object>> userAdd() {
		// TODO Auto-generated method stub
		return managerSql.selectList(ns+"userAdd");
	}

	@Override
	public List<Map<String, Object>> userFollowingMax() {
		// TODO Auto-generated method stub
		return managerSql.selectList(ns+"userFollowingMax");
	}

	@Override
	public List<Map<String, Object>> userPointMax() {
		// TODO Auto-generated method stub
		return managerSql.selectList(ns+"userPointMax");
	}

	
}
