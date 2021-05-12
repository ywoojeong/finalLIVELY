package com.a.member.service;


import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.a.member.dao.memberDao;

@Service
public class memberServiceImpl implements memberService {
	
	@Autowired
	memberDao memberDao;

	
	
	
}
