package com.a.mypage.dao;

import java.sql.SQLException;
import java.util.Map;

import com.a.dto.MemberDto;

public interface myPageDao {
	
	public Map<String, Object> getNowCh(String email) throws SQLException;
	
	public Map<String, Object> getCompleCh(String email) throws SQLException;
	
	// 멤버 정보
	public MemberDto memberModifyInfo(String email) throws SQLException;
}
