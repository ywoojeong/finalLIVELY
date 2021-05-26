package com.a.mypage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.a.mypage.dao.myPageDao;

@Service
public class myPageServiceImpl implements myPageService{
	
	@Autowired
	myPageDao mypagedao;
}
