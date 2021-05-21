package com.a.challenge.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.a.challenge.service.challengeService;
import com.a.dto.MemberDto;
import com.a.dto.challengeDto;

@Controller
public class challengeController {
	
	@Autowired
	challengeService service;
	
	@RequestMapping(value = "hotChallenge.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String hotChallenge(Model model) {
		
		return "challenge/hotChallenge";
	}
	
	@RequestMapping(value = "newChallenge.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String newChallenge(Model model) {
		
		return "challenge/newChallenge";
	}
	
	//챌린지 만들기 페이지로 이동
	@RequestMapping(value = "challengeMake.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String challengeMake(Model model, HttpSession session) {
		
		
		HashMap<String, Object> member = (HashMap<String, Object>)session.getAttribute("memberInfo");
		
		 //*{NICKNAME=LemonLime, GOOGLELOGIN=112957813385668127996, EMAIL=final.5623@gmail.com}
		
		 //model.addAttribute("memberInfo",member);

	    model.addAttribute("memberInfo", member);	//${NICKNAME}, ${}   
		return "challenge/challengeMake";
	}
	
	
	//챌린지 디테일 페이지로 이돌(challengeseq가지고)
	@RequestMapping(value = "challengeDetail.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String challengeDetail(Model model/* , int challengeseq */) {
		
		//challengeDto dto = service.challengeDetail(challengeseq);
		//챌린지 가능 요일 받아오기(없어도 맞게 처리하기, 있으면 가져오기)
		//받아오면 set으로 dto에 넣어주기(배열로)
	
		
		//model.addAllAttributes("challengeDto", dto);
		return "challenge/challengeDetail";
	}
}
