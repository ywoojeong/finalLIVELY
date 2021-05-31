package com.a.challenge.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
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
	
	//hotChallenge 뿌리기 hotChallengeData.do
	@RequestMapping(value = "hotChallengeData.do", method = {RequestMethod.GET, RequestMethod.POST})
	public List<Map<String, Object>> hotChallengeData(@RequestParam Map<String,Object> searchParam) throws Exception{
		System.out.println("hotChallengeData 들어갔다고 얘기해!");
		System.out.println(searchParam.toString());
 		//paging 처리
		int sn = Integer.parseInt(searchParam.get("nowpageNumber").toString());
		int startPage = sn * 9 + 1;	//1  11
		int endPage = (sn+1) * 9; 		//10 20
 
		searchParam.put("startPage", startPage);
		searchParam.put("endPage", endPage);
		System.out.println("가기전 searchParam"+searchParam.toString());
		
		 List<Map<String, Object>> challengeList = service.hotChallengeData(searchParam);
//		 if(challengeList==null) {
//			 System.out.println("데이터 없음"); 
//		 }
//		 System.out.println("갔다온 리스트 : "+challengeList.toString());

	 return challengeList;
	}
	
	//challengeDataCount 글의 총 수 가져오기 paramMap search / category
	@RequestMapping(value = "challengeDataCount.do", method = {RequestMethod.GET, RequestMethod.POST})
	public int challengeDataCount(@RequestParam Map<String,Object> searchParam) throws Exception{
		System.out.println("challengeDataCount 들어갔다고 얘기해!");
		System.out.println(searchParam.toString());
		
		int challengeCount = service.challengeDataCount(searchParam);
		System.out.println("전체 글의 총 수  challengeDataCount:"+challengeCount);
			
		return challengeCount;
	}
	
	//challengeReviewInsert 리뷰작성데이터
	
	
}
