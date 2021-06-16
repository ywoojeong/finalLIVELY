package com.a.manager.service;

import java.sql.SQLException;
import java.util.HashMap;
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

	
	//민선 부분
	//전체
	@Override
	public Map<String, Object> allCount() {
		
		Map<String, Object> count = new HashMap<String, Object>();

		count.put("userall", managerdao.userAllCount());
		count.put("challengeall", managerdao.challengeAllCount());
		
		return count;
	}

	@Override
	public Map<String, Object> challengeAdd() {

		List<Map<String, Object>> challengeAdd; 

		  int index=0;
		  challengeAdd = managerdao.challengeAdd();
		  Map<String, Object> map  = new HashMap<String, Object>();
		  for (Map<String, Object> map1 : challengeAdd) {
		          for (Map.Entry<String, Object> entry : map1.entrySet()) {
		 	       // String key = entry.getKey();
		 	        Object value = entry.getValue();
		 	        String month = (index+1)+"";
		 	        map.put(month,value);
		 	        System.out.println("왜안나와"+ "|" + month +" " + value);
		 	    }
		       index++;
		  }
	
	    return map;
	}

	@Override
	public Map<String, Object> challengeCategory() {
		  int index=0;
		  List<Map<String, Object>> challengeCategory = managerdao.challengeCategory();
		  Map<String, Object> challCate  = new HashMap<String, Object>();
		  for (Map<String, Object> map : challengeCategory) {
		          for (Map.Entry<String, Object> entry : map.entrySet()) {
		 	       // String key = entry.getKey();
		 	        Object value = entry.getValue();
		 	        String category = (index+1)+"";
		 	       challCate.put(category,value);
		 	        System.out.println("challengeCategory"+ "|" + category +" " + value);
		 	    }
		       index++;
		  }
	    return challCate;
	}

	@Override
	public List<Map<String, Object>> challengeMemberMax() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> userAdd() {

		  int index=0;
		  List<Map<String, Object>> userAdd = managerdao.userAdd();
		  Map<String, Object> userCount  = new HashMap<String, Object>();
		  for (Map<String, Object> map : userAdd) {
		          for (Map.Entry<String, Object> entry : map.entrySet()) {
		 	       // String key = entry.getKey();
		 	        Object value = entry.getValue();
		 	        String month = (index+1)+"";
		 	       userCount.put(month,value);
		 	        System.out.println("userCount"+ "|" + month +" " + value);
		 	    }
		       index++;
		  }
	    return userCount;
	}

	@Override
	public List<Map<String, Object>> userFollowingMax() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Map<String, Object>> userPointMax() {
		// TODO Auto-generated method stub
		return null;
	}

	
}
