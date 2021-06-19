package com.a.manager.controller;

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
import com.a.manager.service.managerService;

@Controller
public class managerController {
	
	@Autowired
	managerService mService;
	
	
	@RequestMapping(value="managerPage.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String managerPage(HttpSession session, Model model) throws Exception{
		
		//민선 부분
		//전체 수 가져오기
		Map<String, Object> allCount = mService.allCount();
		//월별 챌린지 생성 개수 가져오기
		Map<String, Object> challengeMonth = mService.challengeAdd();
		//월별 유저 가입 수 가져오기
		Map<String, Object> userMonth = mService.userAdd();
		//카테고리별챌린지개수가져오기challengeCategory
		Map<String, Object> challengeCategory = mService.challengeCategory();
		//챌린지 멤버 수 많은 순
		List<Map<String, Object>> challengeMemberMax = mService.challengeIdentifyMax();
			JSONArray challengeMem = new JSONArray();
			for(Map<String, Object> map: challengeMemberMax) {
				JSONObject json = new JSONObject();
				for(Map.Entry<String,Object> entry : map.entrySet()) {
					String key = entry.getKey();
					Object value = entry.getValue();
					json.put(key,value);
				}
				
				challengeMem.put(json);
			}
		//팔로잉 수 많은 순
		List<Map<String, Object>> userFollowingMax = mService.userFollowingMax();
		JSONArray userFollowing = new JSONArray();
		for(Map<String, Object> map: userFollowingMax) {
			JSONObject json = new JSONObject();
			for(Map.Entry<String,Object> entry : map.entrySet()) {
				String key = entry.getKey();
				Object value = entry.getValue();
				json.put(key,value);
			}
			userFollowing.put(json);
		}
		
		//포인트 많은 순
		List<Map<String, Object>> userPointMax = mService.userPointMax();
		JSONArray userPoint = new JSONArray();
		for(Map<String, Object> map: userPointMax) {
			JSONObject json = new JSONObject();
			for(Map.Entry<String,Object> entry : map.entrySet()) {
				String key = entry.getKey();
				Object value = entry.getValue();
				json.put(key,value);
			}
			userPoint.put(json);
		}
		//챌린지 인증 많은 순
		List<Map<String, Object>> challengeIdentifyMax = mService.challengeIdentifyMax();
		JSONArray challengeIdentify = new JSONArray();
		for(Map<String, Object> map: challengeIdentifyMax) {
			JSONObject json = new JSONObject();
			for(Map.Entry<String,Object> entry : map.entrySet()) {
				String key = entry.getKey();
				Object value = entry.getValue();
				json.put(key,value);
			}
			challengeIdentify.put(json);
		}
		
		//유저 인증 많은 순
		List<Map<String, Object>> userIdentify = mService.userIdentify();
		JSONArray userIdenti = new JSONArray();
		for(Map<String, Object> map: userIdentify) {
			JSONObject json = new JSONObject();
			for(Map.Entry<String,Object> entry : map.entrySet()) {
				String key = entry.getKey();
				Object value = entry.getValue();
				json.put(key,value);
			}
			userIdenti.put(json);
		}
		
		MemberDto memberInfo = (MemberDto)session.getAttribute("memberInfo");
		
		model.addAttribute("allCount", allCount);
		model.addAttribute("challengeMonth", challengeMonth);
		model.addAttribute("userMonth", userMonth);
		model.addAttribute("challengeCategory", challengeCategory);
		model.addAttribute("challengeMemberMax", challengeMem);
		model.addAttribute("userFollowingMax", userFollowing);
		model.addAttribute("userPointMax", userPoint);
		model.addAttribute("challengeIdentifyMax", challengeIdentify);
		model.addAttribute("userIdentify", userIdenti);
		
		
		return "manager/managerPage";
	}
	
	// 연우 부분
	// 회원 정보 뿌려주는 애
	@RequestMapping(value="memberData.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String memberData(HttpSession session, Model model) throws Exception{
		
		MemberDto memberInfo = (MemberDto)session.getAttribute("memberInfo");
		String email = memberInfo.getEmail();
		System.out.println("email ==>"+email);
		
		Map<String, Object> memberData = mService.memberData(email);
		System.out.println("memberData******************** : " + memberData);
		model.addAttribute("memberData", memberData);
		
		return "include/header";
	}
	
}
