package com.a.mypage.service;

import java.sql.SQLException;
import java.util.List;
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
	
	@Override
	public int memberWishCount(String email) throws SQLException {
		return mypagedao.memberWishCount(email);
	}
	
	@Override
	public int memberNowCount(String email) throws SQLException {
		return mypagedao.memberNowCount(email);
	}
	
	@Override
	public List<Map<String, Object>> memNowCntList(String email) throws SQLException {
		return mypagedao.memNowCntList(email);
	}
	
	@Override
	public int memEndCount(String email) throws SQLException {
		return mypagedao.memEndCount(email);
	}
	
	@Override
	public List<Map<String, Object>> memChallList(Map<String, Object> getChallInfo) throws SQLException {
		return mypagedao.memChallList(getChallInfo);
	}
	
	@Override
	public List<Map<String, Object>> memCategoryCount(String email) throws SQLException {
		return mypagedao.memCategoryCount(email);
	}
	
	
}
