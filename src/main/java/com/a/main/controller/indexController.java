package com.a.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class indexController {
	
	@RequestMapping(value = "/")
		public String index() {
		System.out.println("index");
		return "include/main";
	}
}
