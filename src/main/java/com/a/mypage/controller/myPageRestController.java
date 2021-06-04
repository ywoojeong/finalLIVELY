package com.a.mypage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.a.dto.MemberDto;
import com.a.mypage.service.myPageService;

@RestController
public class myPageRestController {
	
	@Autowired
	myPageService myService;
	
	/*
	// 진행중인 챌린지 ajax로 보내기
	@RequestMapping(value = "memNowCntList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public List<Map<String, Object>> memNowCntList (Model model, String email) throws Exception{

		// 멤버 진행중인 챌린지 리스트
		List<Map<String, Object>> memNowCntList = myService.memNowCntList(email);
		System.out.println("진행중인 챌린지 리스트 데려오니 : " + memNowCntList);
		
		//model.addAttribute("memNowCntList", memNowCntList);
		
		return memNowCntList;
	}
	*/
	@RequestMapping(value = "memChallList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public List<Map<String, Object>> memChallList (String name, HttpSession session) throws Exception{
		
		System.out.println(name);
		
		MemberDto memberInfo = (MemberDto)session.getAttribute("memberInfo");
		String email = memberInfo.getEmail();
		
		Map<String, Object> getChallInfo = new HashMap<String, Object>();
		getChallInfo.put("email", email);
		getChallInfo.put("name", name);
		
		List<Map<String, Object>> memList = myService.memChallList(getChallInfo);
		System.out.println(memList.toString());
		return memList;
	}
}
