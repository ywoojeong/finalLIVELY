package com.a.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class memberDaoImpl implements memberDao {
	
	@Autowired
	SqlSession sqlSession;
	
	String namespace = "member.";
	
	
}
