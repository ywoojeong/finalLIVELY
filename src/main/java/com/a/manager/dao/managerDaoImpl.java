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
	
	@Override
	public List<Map<String, Object>> managerList(Map<String, Object> mListParam) throws SQLException {
		// TODO Auto-generated method stub
		System.out.println("mListParam===========>"+mListParam);
		return managerSql.selectList("manager.managerList", mListParam);
	}
}
