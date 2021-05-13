package com.a.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class indexController {
	/*
	@RequestMapping(value = "/")
		public String index() {
		System.out.println("index");
		return "include/main";
	}
	*/
	
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

}
