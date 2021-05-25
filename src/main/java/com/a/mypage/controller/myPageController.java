package com.a.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class myPageController {
	
	
	@RequestMapping(value="myMainPage.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String myMainPage(){
		System.out.println("myMainPage로 넘어가기!");
		
		return "myPage/myMainPage2";
	}
}
