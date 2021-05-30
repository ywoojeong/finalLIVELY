package com.a.mypage.dao;

import java.sql.SQLException;
import java.util.Map;

public interface myPageDao {
	
	public Map<String, Object> getNowCh(String email) throws SQLException;

}
