package com.a.manager.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface managerDao {
	
	public List<Map<String, Object>> managerList(Map<String, Object> mListParam) throws SQLException;

}
