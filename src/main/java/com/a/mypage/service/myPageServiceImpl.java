package com.a.mypage.service;

import java.sql.SQLException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.a.dto.MemberDto;
import com.a.mypage.dao.myPageDao;

@Service
public class myPageServiceImpl implements myPageService{
	
	@Autowired
	myPageDao mypagedao;

	@Override
	public Map<String, Object> getNowCh(String email) throws SQLException {
		return mypagedao.getNowCh(email);
	}
	
	@Override
	public Map<String, Object> getCompleCh(String email) throws SQLException {
		return mypagedao.getCompleCh(email);
	}
	
	@Override
	public Map<String, Object> memberInfoData(String email) throws SQLException {
		return mypagedao.memberInfoData(email);
	}
}
