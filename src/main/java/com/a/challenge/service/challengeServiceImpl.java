package com.a.challenge.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.a.challenge.dao.challengeDao;
import com.a.dto.challengeDto;

@Service
public class challengeServiceImpl implements challengeService {
	

	@Autowired
	challengeDao dao;

	@Override
	public boolean challengeInsert(challengeDto dto) {
		
		return dao.challengeInsert(dto);
	}

	@Override
	public List<Map<String, Object>> hotChallengeData(Map<String, Object> searchParam) {
		// TODO Auto-generated method stub
		return dao.hotChallengeData(searchParam);
	}

	@Override
	public int challengeDataCount(Map<String, Object> searchParam) {
		// TODO Auto-generated method stub
		return dao.challengeDataCount(searchParam);
	}
	
	@Override
	public Map<String, Object> createChallengeMember(String email) {
		// TODO Auto-generated method stub
		return dao.createChallengeMember(email);	
	}
	
	

	
	
}
