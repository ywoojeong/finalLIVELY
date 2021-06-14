package com.a.manager.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface managerService {
	
	public List<Map<String, Object>> managerList(Map<String, Object> mListParam) throws SQLException;
}
