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
	public String challengeInsert(challengeDto dto, String dateWeek[], @RequestParam("uploadFile")  MultipartFile uploadFile,  @RequestParam("uploadFileCer")  MultipartFile uploadFileCer, HttpServletRequest req) throws Exception{
		System.out.println("챌린지 파일이 받아와 지나요?:"+uploadFile);
		System.out.println("파일이 받아와지나요?(인증방법) : "+ uploadFileCer);
		String dateStr = Arrays.toString(dateWeek);
		
		if(!uploadFile.isEmpty()){
			String filename = uploadFile.getOriginalFilename();
			String saveFileName=fileManagement.FileUploader(uploadFile);
			System.out.println("전체 파일파일 이름:"+filename+" "+"암호화 파일 이름 : "+ saveFileName);
			dto.setChallengephoto(filename);
			dto.setChallengesavephoto(saveFileName);			
		}else {
			dto.setChallengephoto("0");
			dto.setChallengesavephoto("0");	
		}
		
		if(!uploadFileCer.isEmpty()){
			String certifyfilename = uploadFileCer.getOriginalFilename();
			String certifysaveFileName=fileManagement.FileUploader(uploadFileCer);
			System.out.println("인증방법 파일 이름:"+certifyfilename+" "+"암호화 파일 이름 : "+ certifysaveFileName);
			dto.setCertifyphoto(certifyfilename);
			dto.setCertifysavephoto(certifysaveFileName);
		}else {
			dto.setCertifyphoto("0");
			dto.setCertifysavephoto("0");	
		}
		
		if(dto.getCertify()==null || dto.getCertify().equals("")) {
			dto.setCertify("none");
		}
		
		dto.setIdentifyday(dateStr);
	
		System.out.println("요일 들어간거String "+dateStr);
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
	
	
	//챌린지 찜하기 challengelikeInsert
	@RequestMapping(value = "challengelikeInsert.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String challengelikeInsert(@RequestParam Map<String,Object> likeData) throws Exception{
		
		boolean success = service.challengelikeInsert(likeData);
		String msg = "";
		if(success) {
			msg="SUCCESS";
		}else {
			msg="FAIL";
		}
		return msg;
	}
	
	//챌린지 찜하기 challengelikeDelete
		@RequestMapping(value = "challengelikeDelete.do", method = {RequestMethod.GET, RequestMethod.POST})
		public String challengelikeDelete(@RequestParam Map<String,Object> likeData) throws Exception{
			
			boolean success = service.challengelikeDelete(likeData);
			String msg = "";
			if(success) {
				msg="SUCCESS";
			}else {
				msg="FAIL";
			}
			return msg;
		}
}
