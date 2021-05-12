package com.a.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.a.common.NaverLoginBO;
import com.a.member.service.memberService;

@RestController
@RequestMapping("/member")
public class memberRestController {

	@Autowired
	memberService service;
	
	@Autowired
	NaverLoginBO naverloginbo;
	
	
}
