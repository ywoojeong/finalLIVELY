package com.a.mypage.service;

import java.sql.SQLException;
import java.util.Map;

public interface myPageService {

	public Map<String, Object> getNowCh(String email) throws SQLException;

}
