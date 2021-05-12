package com.a.challenge.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import com.a.challenge.service.challengeService;


@RestController
public class challengeRestController {

	@Autowired
	challengeService service;
	
	
	
}
