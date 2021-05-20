package com.a.challenge.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.a.dto.challengeDto;

@Repository
public class challengeDaoImpl implements challengeDao {
	
	@Autowired
	SqlSession sqlSession;
	
	String namespace = "challenge.";

	@Override
	public boolean challengeInsert(challengeDto dto) {
			
		int count = sqlSession.insert(namespace+"challengeInsert", dto);
		return count>0?true:false;
	}

	
	
}
