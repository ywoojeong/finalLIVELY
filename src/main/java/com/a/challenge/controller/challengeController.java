package com.a.challenge.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.a.challenge.service.challengeService;

@Controller
public class challengeController {
	
	@Autowired
	challengeService service;
	
	@RequestMapping(value = "hotChallenge.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String hotChallenge() {
		
		return "challenge/hotChallenge";
	}
	
	@RequestMapping(value = "newChallenge.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String newChallenge() {
		
		return "challenge/newChallenge";
	}
	
	//챌린지 만들기 페이지로 이동
	@RequestMapping(value = "challengeMake.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String challengeMake() {
		return "challenge/challengeMake";
	}
}
