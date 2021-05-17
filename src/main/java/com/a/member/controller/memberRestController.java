package com.a.member.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.a.common.NaverLoginBO;
import com.a.dto.MemberDto;
import com.a.member.service.memberService;
import com.a.util.FileManagement;

@RestController
/* @RequestMapping("/member") */
public class memberRestController {

	@Autowired
	memberService service;
	
	@Autowired
	NaverLoginBO naverloginbo;
	
	@Autowired
	private FileManagement FileManagement;
	
	// 가입 후 추가정보 입력 시 닉네임 체크
	@RequestMapping(value="nickCheck.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String nickCheck(MemberDto dto) throws Exception {
		System.out.println(dto.getNickname());
		System.out.println("회원가입 닉네임 중복 체크");
		int nicknameCheck = service.nickCheck(dto);
		String msg = "";
		if(nicknameCheck == 0) {
			msg = "YES";
		} else {
			msg = "NO";
		}
		return msg;
	}


	 // 회원가입 추가 정보
	 
	 @RequestMapping(value="memberInfoPro.do", method = {RequestMethod.POST,RequestMethod.GET}) 
	 public String memberInfo(MemberDto dto) throws Exception {
		System.out.print("회원가입 정보 추가"); 
		boolean regiPro =  service.memberInfoPro(dto);
		
		System.out.println("다녀왔니 : " + regiPro );
		String msg = "";
		
		if(regiPro) {
			return msg = "YES";
		}else {
			return msg = "NO";
		}
	 }
	 
	// 네이버 회원 가입 부분
	@RequestMapping(value="/memberNaverRegisterPro.do", method=RequestMethod.POST)
	public Map<String, Object> memberNaverRegisterPro(@RequestParam Map<String,Object> paramMap,HttpSession session) throws SQLException, Exception {
		System.out.println("paramMap:" + paramMap);
		System.out.println("네이버 회원가입부분");
		Map <String, Object> resultMap = new HashMap<String, Object>();
		Integer registerCheck = service.memberNaverRegisterPro(paramMap);
		System.out.println(registerCheck);
		
		if(registerCheck != null && registerCheck > 0) {
			Map<String, Object> loginCheck = service.memberNaverLoginPro(paramMap);
			session.setAttribute("userInfo", loginCheck);
			resultMap.put("JavaData", "YES");
		}else {
			resultMap.put("JavaData", "NO");
		}
		return resultMap;
	}
}
