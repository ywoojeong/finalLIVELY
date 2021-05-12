package com.a.member.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.a.common.NaverLoginBO;
import com.a.member.service.memberService;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.model.OAuth2AccessToken;

@Controller
//@RequestMapping("/member")
public class memberController {
	
	@Autowired
	memberService service;
	
	@Autowired
	private NaverLoginBO naverloginbo;
	
	/*
	 정연우
	 member 로그인페이지 이동
	*/
	@RequestMapping(value = "memberLogin.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String memberLogin(Model model, HttpSession session) {
		System.out.println("member login");
		String naverAuthUrl = naverloginbo.getAuthorizationUrl(session);
		model.addAttribute("naverUrl", naverAuthUrl);
		return "member/memberLogin";
	}

	@RequestMapping(value="memberCon.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String memberlogin2() {
		System.out.print("나 테스트 중");
		return "home/home";
	}
	
	@RequestMapping(value="memberInfo.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String memberInfo() {
		System.out.print("나 테스트 중");
		return "member/memberInfo";
	}
	
	//네이버 로그인
	@RequestMapping(value="memberNaverLogin.do",  method = {RequestMethod.GET,RequestMethod.POST})
	public String userNaverLoginPro(Model model,@RequestParam Map<String,Object> paramMap, @RequestParam String code, @RequestParam String state,HttpSession session) throws SQLException, Exception {
		System.out.println("paramMap:" + paramMap);
		Map <String, Object> resultMap = new HashMap<String, Object>();

		OAuth2AccessToken oauthToken;
		oauthToken = naverloginbo.getAccessToken(session, code, state);
		//로그인 사용자 정보를 읽어온다
		String apiResult = naverloginbo.getUserProfile(oauthToken);
		System.out.println("apiResult =>"+apiResult);
		ObjectMapper objectMapper =new ObjectMapper();
		Map<String, Object> apiJson = (Map<String, Object>) objectMapper.readValue(apiResult, Map.class).get("response");
		
		return "home/home";
	}

	
}
