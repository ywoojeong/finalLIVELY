package com.a.member.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
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
	private FileManagement fileManagement;
	
	// 가입 후 추가정보 입력 시 닉네임 체크
	@RequestMapping(value="nickCheck.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String nickCheck(MemberDto dto) throws Exception {
		System.out.println(dto.getNickname());
		System.out.println("회원가입 닉네임 중복 체크 + nickCheck.do");
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
		System.out.println("회원가입 정보 추가 + memberInfoPro.do"); 
		
		System.out.println(dto.getEmail());
		System.out.println(dto.getNickname());
		ArrayList memberPhoto = fileManagement.FileUploader(dto.getMemberPhoto());
		System.out.println("멤버포토 들어왔니 " + memberPhoto);
		System.out.println(dto);
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
			session.setAttribute("memberInfo", loginCheck);
			resultMap.put("JavaData", "YES");
		}else {
			resultMap.put("JavaData", "NO");
		}
		return resultMap;
	}
	
	// 카카오 회원 가입
	@RequestMapping(value="memberKakaoLoginPro.do", method=RequestMethod.POST)
	public Map<String, Object> memberkakaoLoginPro(@RequestParam Map<String,Object> paramMap,HttpSession session) throws SQLException, Exception {
		System.out.println("memberKakaoLoginPro.do 의 paramMap:" + paramMap);
		Map <String, Object> resultMap = new HashMap<String, Object>();
		
		Map<String, Object> kakaoConnectionCheck = service.kakaoConnectionCheck(paramMap);
		if(kakaoConnectionCheck == null) { //일치하는 이메일 없으면 가입
			resultMap.put("JavaData", "register");
		}else if(kakaoConnectionCheck.get("KAKAOLOGIN") == null && kakaoConnectionCheck.get("EMAIL") != null) { //이메일 가입 되어있고 카카오 연동 안되어 있을시
			System.out.println("kakaoLogin");
			service.setKakaoConnection(paramMap);
			Map<String, Object> loginCheck = service.memberKakaoLoginPro(paramMap);
			session.setAttribute("memberInfo", loginCheck);
			resultMap.put("JavaData", "YES");
		}else{
			Map<String, Object> loginCheck = service.memberKakaoLoginPro(paramMap);
			session.setAttribute("memberInfo", loginCheck);
			resultMap.put("JavaData", "YES");
		}
		
		return resultMap;
	}
	
	// 회원가입 분류
	@RequestMapping(value="/memberSnsRegisterPro.do", method=RequestMethod.POST)
	public Map<String, Object> memberSnsRegisterPro(@RequestParam Map<String,Object> paramMap,HttpSession session) throws SQLException, Exception {
		System.out.println("memberSnsRegisterPro.do의 paramMap:" + paramMap);
		Map <String, Object> resultMap = new HashMap<String, Object>();
		String flag = (String) paramMap.get("flag");
		Integer registerCheck = null;
		if(flag.equals("kakao")) {
			registerCheck = service.memberKakaoRegisterPro(paramMap);
		}else if(flag.equals("naver")) {
			registerCheck = service.memberNaverRegisterPro(paramMap);
		}
		
		else if(flag.equals("google")) {
			registerCheck = service.memberNaverRegisterPro(paramMap);
		}
		
		if(registerCheck != null && registerCheck > 0) {
			Map<String, Object> loginCheck = null;
			if(flag.equals("kakao")) {
				loginCheck = service.memberKakaoLoginPro(paramMap);
			}else if(flag.equals("naver")) {
				loginCheck = service.memberNaverLoginPro(paramMap);
			}
			
			else if(flag.equals("google")) {
				loginCheck = service.memberNaverLoginPro(paramMap);
			}
			
			session.setAttribute("memberInfo", loginCheck);
			resultMap.put("JavaData", "YES");
		}else {
			resultMap.put("JavaData", "NO");
		}
		return resultMap;
	}
	
	// 구글 로그인
	@RequestMapping(value="/googleLoginPro.do",  method = {RequestMethod.GET,RequestMethod.POST})
	public Map<String, Object> googleLoginPro(Model model,@RequestParam Map<String,Object> paramMap,HttpSession session) throws SQLException, Exception {
		System.out.println("paramMap:" + paramMap);
		Map <String, Object> resultMap = new HashMap<String, Object>();
		Map <String, Object> googleConnectionCheck = service.googleConnectionCheck(paramMap);
		System.out.println(googleConnectionCheck);
		
		if(googleConnectionCheck == null) { //일치하는 이메일 없으면 가입
			resultMap.put("JavaData", "register");
		}else if(googleConnectionCheck.get("GOOGLELOGIN") == null && googleConnectionCheck.get("EMAIL") != null) { //이메일 가입 되어있고 네이버 연동 안되어 있을시
			service.setGoogleConnection(paramMap);
			Map<String, Object> loginCheck = service.memberGoogleLoginPro(paramMap);
			session.setAttribute("memberInfo", loginCheck);
			resultMap.put("JavaData", "YES");
		}else { //모두 연동 되어있을시
			Map<String, Object> loginCheck = service.memberGoogleLoginPro(paramMap);
			session.setAttribute("memberInfo", loginCheck);
			resultMap.put("JavaData", "YES");
		}

		return resultMap;
	}
}
