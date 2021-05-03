package com.a.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class memberController {
	@RequestMapping(value = "/testmember")
	public String testmember() {
	System.out.println("testmember");
	return "member/testmember";
}
}
