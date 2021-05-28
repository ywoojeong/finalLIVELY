package com.a.challenge.controller;

import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.a.challenge.service.challengeService;
import com.a.dto.challengeDto;
import com.a.util.FileManagement;


@RestController
public class challengeRestController {

	@Autowired
	challengeService service;
	
	@Autowired
	private FileManagement fileManagement;
	
	//챌린지 insert
	@RequestMapping(value = "challengeInsert.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String challengeInsert(challengeDto dto, String dateWeek[], @RequestParam("uploadFile")  MultipartFile uploadFile, HttpServletRequest req) throws Exception{
	
		String dateStr = Arrays.toString(dateWeek);
		
		String filename = uploadFile.getOriginalFilename();
		String saveFileName=fileManagement.FileUploader(uploadFile);
		System.out.println("파일 이름:"+filename+" "+"암호화 파일 이름 : "+ saveFileName);
		dto.setChallengephoto(filename);
		dto.setChallengesavephoto(saveFileName);
		dto.setIdentifyday(dateStr);
	
		System.out.println(dateStr);
		System.out.println(dto.toString());
		
		boolean success = service.challengeInsert(dto);
		System.out.println("insert되었냐? : "+success);
		
		String msg ="";
		if(success) {
			msg = "SUCCESS";
		}else {
			msg="FAIL";
		}
		return msg;
	}

	
	
}
