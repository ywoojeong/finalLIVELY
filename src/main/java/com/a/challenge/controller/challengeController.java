package com.a.challenge.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
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
import com.a.util.dataUtil;

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
		MemberDto user = service.userData(member.getEmail());

		model.addAttribute("user", user);
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
		
		//limitDate제어 (오늘시간 - challengestart)
		//Date nowDate = new Date();
		Calendar cal = Calendar.getInstance();
		String year = String.valueOf(cal.get(Calendar.YEAR));
		String month = String.valueOf(cal.get(Calendar.MONTH)+1);
		String date = String.valueOf(cal.get(Calendar.DATE));
		System.out.println("시간 int 모양"+year+" "+month+" "+ date);
		try {
		SimpleDateFormat startformat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date startParse = startformat.parse(challDto.getChallengestart());
		System.out.println("파싱한 데이터 : "+startParse);
		
		Date nowDate = startformat.parse(year+"-"+dataUtil.two(month)+"-"+dataUtil.two(date)+" 00:00:00");
		System.out.println("현재시간 어케 나와"+nowDate);
			
		
		long milisec = startParse.getTime()-nowDate.getTime();
		int limitDate = (int) (milisec / (1000*60*60*24));
		System.out.println("일수 차이" +limitDate);
		challDto.setLimitdate(limitDate);
		
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
	
		/*
		 * String dateWeek =
		 * 
		 */
		
		//챌린지 전체 멤버 가져오기
		List<Map<String, Object>> challengeMember = service.challengeAllMember(challengeseq);
//		if(challengeMember != null) {
//			model.addAttribute("challengeMember", challengeMember);
//		}
		for(int i=0;i<challengeMember.size();i++) {
			System.out.println(challengeMember.toString());
		}
		
		MemberDto member = (MemberDto)session.getAttribute("memberInfo");	
		
		if(member!=null && !member.getEmail().equals("")) {
			Map<String, Object> WishParam = new HashMap<String, Object>();
			WishParam.put("challengeseq", challengeseq);
			WishParam.put("email", member.getEmail());
			
			//찜하기 멤버 
			Map<String, Object> challWish = service.challengelikeSeq(WishParam);
			if(challWish != null && !challWish.get("email").equals("")) {
				model.addAttribute("challWish", challWish);
			//	 System.out.print("챌린지 데이터 받아오기"+challWish.toString());		
			}
			
			Map<String, Object> challMem = service.challengeMember(WishParam);
			if(challMem != null && !challMem.get("email").equals("")) {
				model.addAttribute("challMem", challMem);
			}
			//세션에 담은 유저 데이터
			MemberDto user = service.userData(member.getEmail());
			model.addAttribute("user", user);
		}
		
		model.addAttribute("challengeMember", challengeMember);
		model.addAttribute("challDto", challDto);
		return "challenge/challengeDetail";
	}
	
	
	//챌린지 수정 페이지로 이동
	@RequestMapping(value = "challengeUpdate.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String challengeUpdate(Model model, HttpSession session, int challengeseq) {
		
		MemberDto mem = (MemberDto) session.getAttribute("memberInfo");
		challengeDto challenge = service.challengeDetail(challengeseq);
		
		model.addAttribute("memberInfo", mem);
		model.addAttribute("challenge", challenge);	
	
		return "challenge/challengeUpdate";
	}
}
