package com.a.challenge.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.a.challenge.service.challengeService;
import com.a.dto.MemberDto;
import com.a.dto.challengeDto;

@Controller
public class challengeController {
	
	@Autowired
	challengeService service;
	
	@RequestMapping(value = "hotChallenge.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String hotChallenge(Model model, HttpSession session) {
		
		MemberDto memberInfo = (MemberDto)session.getAttribute("memberInfo");
		model.addAttribute("memberInfo", memberInfo);
		
		return "challenge/hotChallenge";
	}
	
	@RequestMapping(value = "newChallenge.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String newChallenge(Model model) {
		
		return "challenge/newChallenge";
	}
	
	//챌린지 만들기 페이지로 이동
	@RequestMapping(value = "challengeMake.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String challengeMake(Model model, HttpSession session) {
		
		
			MemberDto member = (MemberDto)session.getAttribute("memberInfo");
		
		 //*{NICKNAME=LemonLime, GOOGLELOGIN=112957813385668127996, EMAIL=final.5623@gmail.com}
		
		 //model.addAttribute("memberInfo",member);

	    model.addAttribute("memberInfo", member);	//${NICKNAME}, ${}   
		return "challenge/challengeMake";
	}
	
	
	//챌린지 디테일 페이지로 이돌(challengeseq가지고)
	@RequestMapping(value = "challengeDetail.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String challengeDetail(Model model, int challengeseq, HttpSession session) {
		System.out.println("오긴왔냐??");
		challengeDto challDto = service.challengeDetail(challengeseq);
		//챌린지 가능 요일 받아오기(없어도 맞게 처리하기, 있으면 가져오기)
		//받아오면 set으로 dto에 넣어주기(배열로)
		
	
		//System.out.println(member.toString());
		//IDENTIFYFREQUENCY
		if(challDto.getIdentifyfrequency()==9) {
			challDto.setIdentifyday("매일"); 
		}else if(challDto.getIdentifyfrequency()==8) {
			challDto.setIdentifyday("주말"); 
		}else if(challDto.getIdentifyfrequency()==7) {
			challDto.setIdentifyday("평일 매일"); 
		}else {
			for(int i=6;i>0;i--){
				if(i==challDto.getIdentifyfrequency()){
					challDto.setIdentifyday("주 "+i+"회");
				}
				
			}
		}
		
		//[1,2,3,4,5,6,7] >> 데이터화..?
		/*
		 * String dateWeek =
		 * 
		 */
		
		MemberDto member = (MemberDto)session.getAttribute("memberInfo");				 
//		if(member!=null || !member.getEmail().equals("")) {
//			Map<String, Object> likeData = new HashMap<String, Object>();
//			likeData.put("challengeseq", challengeseq);
//			likeData.put("email", member.getEmail());
//			
//			Map<String, Object> challLike = new HashMap<String, Object>();
//			challLike = service.challengelikeSeq(likeData);
//			model.addAttribute("challLike", challLike);
//			
//		}

	
	    model.addAttribute("memberInfo", member);
		model.addAttribute("challDto", challDto);
		return "challenge/challengeDetail";
	}
}
