package com.a.manager.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.a.manager.service.managerService;

@Controller
public class managerController {
	
	@Autowired
	managerService mService;
	
	@RequestMapping(value="managerPage.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String managerPage(HttpSession session, Model model) throws Exception{
		
		return "manager/managerPage";
	}
	
}
