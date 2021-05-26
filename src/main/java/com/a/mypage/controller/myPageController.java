package com.a.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.a.mypage.service.myPageService;

@Controller
public class myPageController {
	
	@Autowired
	myPageService myService;
	
	@RequestMapping(value="myMainPage.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String myMainPage(){
		System.out.println("myMainPage로 넘어가기!");
		
		return "myPage/myMainPage";
	}
	
	@RequestMapping(value="myMainPage2.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String myMainPage2(){
		System.out.println("myMainPage로 넘어가기!");
		
		return "myPage/myMainPage2";
	}
}
