package com.a.manager.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.a.manager.dao.managerDao;

@Service
public class managerServiceImpl implements managerService {

	@Autowired
	managerDao managerdao;
	
	@Override
	public List<Map<String, Object>> managerList(Map<String, Object> mListParam) throws SQLException {
		// TODO Auto-generated method stub
		return managerdao.managerList(mListParam);
	}
}
