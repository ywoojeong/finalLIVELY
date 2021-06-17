package com.a.manager.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.a.manager.service.managerService;

@Controller
public class managerController {
	
	@Autowired
	managerService mService;
	
	@RequestMapping(value="managerPage.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String managerPage(HttpSession session, Model model) throws Exception{
		
		//민선 부분
		//전체 수 가져오기
		Map<String, Object> allCount = mService.allCount();
		//월별 챌린지 생성 개수 가져오기
		Map<String, Object> challengeMonth = mService.challengeAdd();
		//월별 유저 가입 수 가져오기
		Map<String, Object> userMonth = mService.userAdd();
		//카테고리별챌린지개수가져오기challengeCategory
		Map<String, Object> challengeCategory = mService.challengeCategory();
		
		
		
		
		model.addAttribute("allCount", allCount);
		model.addAttribute("challengeMonth", challengeMonth);
		model.addAttribute("userMonth", userMonth);
		model.addAttribute("challengeCategory", challengeCategory);
		
		return "manager/managerPage";
	}
	
}
