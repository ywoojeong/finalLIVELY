package com.a.mypage.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.a.dto.MemberDto;
import com.a.mypage.service.myPageService;

@RestController
public class myPageRestController {
	
	@Autowired
	myPageService myService;
	
	
	

}
