package com.a.manager.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.a.manager.service.managerService;

@RestController
public class managerRestController {
	
	@Autowired
	managerService mService;
	
	// 매니저 챌린지 꺼내오는 부분
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
		
		System.out.println("startPagestartPagestartPagestartPage : "+startPage);
		
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

		return managerList;
	}
	
	// 멤버 매니저  꺼내오는 부분
	@RequestMapping(value = "memberCntList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public List<Map<String, Object>> memberCntList(@RequestParam Map<String,Object> memListParam) throws SQLException {
		System.out.println("memberCntList memListParam-----> : " + memListParam);
		
		int startPage = (Integer.parseInt((String)memListParam.get("page"))-1) * 6;
		String searchs = (String)memListParam.get("searchs");
		String categorys = (String)memListParam.get("categorys");
		int endPage = startPage + 7;
		
		memListParam.put("searchs", searchs);
		memListParam.put("categorys", categorys);
		memListParam.put("startPage", startPage);
		memListParam.put("endPage", endPage);
		
		List<Map<String, Object>> memberCntList = mService.memberCntList(memListParam);
		System.out.println("memListParam 왜 안보이니 : " + memListParam);
		
		return memberCntList;
	}
	
	// 회원 정지
	@RequestMapping(value="memberStop.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String memberStop(@RequestParam Map<String,Object> param) throws Exception {
		System.out.println("값아 뭐니? ->>>>>>>>>>>> " + param);
		
		boolean states = mService.memberStop(param);
		String msg = "";
		
		if(states) {
			return msg = "YES";
		}else {
			return msg = "NO";
		}
	}
	
}
