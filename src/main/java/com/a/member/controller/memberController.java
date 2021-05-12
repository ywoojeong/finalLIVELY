package com.a.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.a.common.NaverLoginBO;

@Controller
/* @RequestMapping("/member") */
public class memberController {
	
	@Autowired
	private NaverLoginBO naverloginbo;
	
	@RequestMapping(value = "/testmember")
	public String testmember() {
		System.out.println("testmember");
		return "member/testmember";
	}
	
	/*
	 정연우
	 member 로그인페이지 이동
	*/
	@RequestMapping(value = "/memberLogin")
	public String memberLogin(Model model, HttpSession session) {
		System.out.println("member login");
		String naverAuthUrl = naverloginbo.getAuthorizationUrl(session);
		model.addAttribute("naverUrl", naverAuthUrl);
		return "member/memberLogin";
	}
	
	//민선 테스트중 intro.jsp >> login 페이지
	@RequestMapping(value="memberlogin.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String memberlogin1() {
		System.out.print("민선 테스트중");
		return "member/memberLogin";
	}
	
	

	
}
