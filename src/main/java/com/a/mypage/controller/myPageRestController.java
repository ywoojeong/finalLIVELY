package com.a.mypage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	// 유저의 진행 전, 중, 후 챌린지 리스트를 데려옴
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
	
	// 유저의 데일리 챌린지 불러옴 (리스트로 불러오기)
	@RequestMapping(value = "memDailyChallList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public List<Map<String, Object>> memDailyChallList (String number, HttpSession session) throws Exception{
		System.out.println("number가 무엇일까 : " + number);
		
		MemberDto memberInfo = (MemberDto)session.getAttribute("memberInfo");
		String email = memberInfo.getEmail();
		
		Map<String, Object> getDailyChallInfo = new HashMap<String, Object>();
		getDailyChallInfo.put("email", email);
		getDailyChallInfo.put("number", number);
		
		List<Map<String, Object>> memDailyList = myService.memChallList(getDailyChallInfo);
		System.out.println(memDailyList.toString());
		
		return memDailyList;
	}
	
	// 제안하기 insert
	@RequestMapping(value = "writeSuggest.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String writeSuggest(@RequestParam Map<String,Object> param) throws Exception{
		System.out.println("param이 뭐니 : " + param.toString());
		
		boolean finished = myService.writeSuggest(param);
		String msg = "";
		if(finished) {
			msg="success";
		}else {
			msg="fail";
		}
		return msg;
	}
	
	// 좋아요 안좋아요
	/*
	@RequestMapping(value = "suggestMyLike.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String suggestMyLike(@RequestParam int sugSeq, HttpSession session) {
		Map<String,Object> resultMap = null;
	    Map<String,Object> sugSeqMap = new HashMap<>();
	    int sugIndex = sugSeq;
	    int memIndex = 0;
	    
	    Map<String,Object> userInfo = (Map<String, Object>) session.getAttribute("userInfo");
	    memIndex = Integer.parseInt(userInfo.get("sugSeq").toString());
	    
	}
	*/
}
