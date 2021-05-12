package com.a.challenge.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class challengeDaoImpl implements challengeDao {
	
	@Autowired
	SqlSession sqlSession;
	
	String namespace = "challenge.";
	
	
}
