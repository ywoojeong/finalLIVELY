package com.a.mypage.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.a.dto.MemberDto;
import com.a.mypage.service.myPageService;

@Controller
public class myPageController {
   
	@Autowired
	myPageService myService;
	
	// 마이페이지로 이동
	@RequestMapping(value="myMainPage2.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String myMainPage2(HttpSession session, Model model) throws Exception{
		System.out.println("myMainPage2로 넘어가기!");
		

		MemberDto memberInfo = (MemberDto)session.getAttribute("memberInfo");
		String email = memberInfo.getEmail();
		System.out.println("email ==>"+email);
		Map<String, Object> nowChallenge = myService.getNowCh(email);
		
		// 멤버 찜하기 갯수
		int memberWishCount = myService.memberWishCount(email);
		System.out.println("찜하기 갯수 찍히니 : " + memberWishCount);
		model.addAttribute("memberWishCount", memberWishCount);
		
		// 멤버 진행중인 챌린지 갯수
		int memberNowCount = myService.memberNowCount(email);
		System.out.println("진행중인 챌린지 갯수 찍히니 : " + memberNowCount);
		model.addAttribute("memberNowCount", memberNowCount);
		
		// 멤버 진행중인 챌린지 리스트
		List<Map<String, Object>> memNowCntList = myService.memNowCntList(email);
	      System.out.println("진행중인 챌린지 리스트 데려오니 : " + memNowCntList);
	      JSONArray jsonMemNowCntList = new JSONArray();
	      for(Map<String, Object> map: memNowCntList) {
	         JSONObject json = new JSONObject();
	         for(Map.Entry<String,Object> entry : map.entrySet()) {
	            String key = entry.getKey();
	            Object value = entry.getValue();
	            json.put(key,value);
	         }
	         
	         jsonMemNowCntList.put(json);
	      }
	      model.addAttribute("jsonMemNowCntList", jsonMemNowCntList);
	      model.addAttribute("memNowCntList", jsonMemNowCntList);
		
		// 멤버 종료된 챌린지 갯수
		int memEndCount = myService.memEndCount(email);
		System.out.println("종료된 챌린지 갯수 찍히니 : " + memEndCount);
		model.addAttribute("memEndCount", memEndCount);
		
		// 멤버 정보를 담고있는 애 memberInfoData
		Map<String, Object> memberInfoData = myService.memberInfoData(email);
		System.out.println("memberInfoData : " + memberInfoData);
		model.addAttribute("memberInfoData", memberInfoData);
		
		// 멤버 카테고리 갯수
		List<Map<String, Object>> memCategoryCount = myService.memCategoryCount(email);
			JSONArray jsonArray = new JSONArray();
			for(Map<String, Object> map: memCategoryCount) {
				JSONObject json = new JSONObject();
				for(Map.Entry<String,Object> entry : map.entrySet()) {
					String key = entry.getKey();
					Object value = entry.getValue();
					json.put(key,value);
				}
				
				jsonArray.put(json);
			}
	      
			model.addAttribute("memCategoryCount",  jsonArray);
	      
			Integer nowPercent = 0;
	      
	      if(nowChallenge!=null && !String.valueOf(nowChallenge.get("TOTAL")).equals("0")) {
	         nowPercent = Integer.parseInt(String.valueOf(nowChallenge.get("NOWCNT2"))) * 100 / Integer.parseInt(String.valueOf(nowChallenge.get("TOTAL")));
	         System.out.println("nowPercent ==>"+nowPercent);
	      }
	      
	      model.addAttribute("nowPercent", nowPercent);
      
		//완료한 챌린지
		Map<String, Object> compleChallenge = myService.getCompleCh(email);
		System.out.println("compleChallenge : " + compleChallenge);
		Integer complePercent = Integer.parseInt(String.valueOf(nowChallenge.get("TOTAL"))) * 100 - nowPercent; 
		System.out.println("complePercent : " + complePercent);
      
		model.addAttribute("complePercent", complePercent);
      
		return "myPage/myMainPage2";
	}
	
	
	
}