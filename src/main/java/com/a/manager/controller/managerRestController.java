package com.a.manager.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.a.manager.service.managerService;

@RestController
public class managerRestController {
	
	@Autowired
	managerService mService;
	
	@RequestMapping(value = "managerList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public List<Map<String, Object>> managerList(@RequestParam Map<String,Object> mListParam) throws SQLException {
		
		System.out.println("mListParam-----> : " + mListParam);
		
		int startPage = (Integer.parseInt((String)mListParam.get("page"))-1) * 5;
		String mSearch = (String)mListParam.get("mSearch");
		String category = (String)mListParam.get("category");
		String datestart = (String)mListParam.get("datestart");
		datestart = datestart.replace("/", "-");
		
		String dateend = (String)mListParam.get("dateend");
		dateend = dateend.replace("/", "-");
		
		int endPage = startPage + 6;
		mListParam.put("startPage", startPage);
		mListParam.put("endPage", endPage);
		mListParam.put("mSearch", mSearch);
		mListParam.put("category", category);
		mListParam.put("datestart", datestart);
		mListParam.put("dateend", dateend);
		
		System.out.println("왜 안들어가?");
		System.out.println(mListParam.toString());
		
		List<Map<String, Object>> managerList = mService.managerList(mListParam);
		System.out.println("mListParam : " + managerList);
		System.out.println(mSearch.toString());
		return managerList;
	}
	
	
	
}
