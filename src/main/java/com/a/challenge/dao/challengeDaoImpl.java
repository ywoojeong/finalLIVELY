package com.a.challenge.dao;

import java.util.List;
import java.util.Map;

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

	@Override
	public List<Map<String, Object>> hotChallengeData(Map<String, Object> searchParam) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+"hotChallengeData", searchParam);
	}

	@Override
	public int challengeDataCount(Map<String, Object> searchParam) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"challengeDataCount", searchParam);
	}

	@Override
	public Map<String, Object> createChallengeMember(String email) {
		
		return sqlSession.selectOne(namespace+"createChallengeMember", email);
	}

	@Override
	public challengeDto challengeDetail(int challengeseq) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"challengeDetail", challengeseq);
	}
	
	
	
	
	
}
