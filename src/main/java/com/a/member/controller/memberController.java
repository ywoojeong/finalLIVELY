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
import com.a.dto.MemberDto;
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
	
	//처음 진입
	@RequestMapping(value = "/")
	public String include2() {
	System.out.println("intro");
	return "introTiles";
	}
		
	//다른데서 홈 진입
	@RequestMapping(value = "intro.do", method = {RequestMethod.GET, RequestMethod.POST}) public String intro() {
	return "introTiles";		
	}
	
	/*
	 정연우
	 home으로 이동
	 */
	@RequestMapping(value="memberCon.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String memberlogin2(Model model, HttpSession session) {
		System.out.print("홈으로 이동");
		
		MemberDto memberInfo = (MemberDto)session.getAttribute("memberInfo");
		model.addAttribute("memberInfo", memberInfo);
		
		return "home/home";
	}
	
	/*
	 정연우
	 member 로그인페이지 이동
	*/
	@RequestMapping(value = "memberLogin.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String memberLogin(Model model, HttpSession session) {
		String naverAuthUrl = naverloginbo.getAuthorizationUrl(session);
		model.addAttribute("naverUrl", naverAuthUrl);
		System.out.println("로그인 메소드!");
		return "member/memberLogin";
	}
	
	/*
	 정연우
	 네이버, 카카오, 구글 로그인 후 추가 작성
	 */
	@RequestMapping(value="memberInfo.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String memberInfo() {
		System.out.print("나 테스트 중 + memberInfo.do");
		return "member/memberInfo";
	}
	
	
	/*
	 정연우
	 카카오 로그인 이동
	*/
	@RequestMapping(value="addInfo.do")
	public String setMemberInfo(Model model,HttpSession session,@RequestParam Map<String,Object> paramMap) {
		System.out.println("set addInfo param ==>"+paramMap);
		
		String flag = (String)paramMap.get("flag");
		if(flag.equals("kakao")){
			model.addAttribute("email",paramMap.get("email"));
			model.addAttribute("kakaoLogin",paramMap.get("id"));
			model.addAttribute("flag",paramMap.get("flag"));
		}
		else {
			model.addAttribute("email",paramMap.get("email"));
			model.addAttribute("googleLogin",paramMap.get("id"));
			model.addAttribute("flag",paramMap.get("flag"));
		}
		return "member/memberInfo";
	}
	
	@RequestMapping(value="logOut.do")
	public String logOut(Model model,HttpSession session) {
		System.out.println("로그아웃 실행");	
		session.invalidate();
		return "redirect:intro.do";
	}
	
}
