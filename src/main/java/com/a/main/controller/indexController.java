package com.a.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class indexController {
	
	@RequestMapping(value = "/")
		public String index() {
		System.out.println("index");
		return "include/main";
	}
	
	
	/*
	  @RequestMapping(value = "intro.do", method = {RequestMethod.GET,
	  RequestMethod.POST}) public String intro() {
	  
	 	return }
	 */
}
