package com.a.mypage.service;

import java.sql.SQLException;
import java.util.Map;

import com.a.dto.MemberDto;

public interface myPageService {

	public Map<String, Object> getNowCh(String email) throws SQLException;
	
	public Map<String, Object> getCompleCh(String email) throws SQLException;

	public Map<String, Object> memberInfoData(String email) throws SQLException;
}
