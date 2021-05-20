package com.a.challenge.service;


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

	
	
}
