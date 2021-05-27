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
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.model.OAuth2AccessToken;

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
	public String memberInfo(MemberDto dto, HttpSession session) throws Exception {
		System.out.println("회원가입 정보 추가 + memberInfoPro.do"); 
		
		System.out.println(dto.getEmail());
		System.out.println(dto.getNickname());
		System.out.println(dto.getFlag());
		System.out.println(dto.getGoogleLogin());
		String memberPhotoName = fileManagement.FileUploader(dto.getMemberPhoto());
		dto.setMemberPhotoName(memberPhotoName);
		System.out.println("memberDto 값 2:" + dto);
		
		session.invalidate();
		
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
	@RequestMapping(value="memberNaverRegisterPro.do", method = {RequestMethod.POST, RequestMethod.GET}) 
	public Map<String, Object> memberNaverRegisterPro(@RequestParam Map<String,Object> paramMap,HttpSession session, MemberDto dto) throws SQLException, Exception {
		System.out.println("paramMap:" + paramMap);
		System.out.println("네이버 회원가입부분");
		String memberPhoto = fileManagement.FileUploader(dto.getMemberPhoto());
		paramMap.put("memberPhoto", memberPhoto);
		Map <String, Object> resultMap = new HashMap<String, Object>();
		Integer registerCheck = service.memberNaverRegisterPro(paramMap);
		System.out.println(registerCheck);
		
		if(registerCheck != null && registerCheck > 0) {
			MemberDto loginCheck = service.memberNaverLoginPro(paramMap);
			session.setAttribute("memberInfo", loginCheck);
			resultMap.put("JavaData", "YES");
		}else {
			resultMap.put("JavaData", "NO");
		}
		return resultMap;
	}
	
	// 카카오 회원 가입
	@RequestMapping(value="memberKakaoLoginPro.do", method=RequestMethod.POST)
	public Map<String, Object> memberkakaoLoginPro(Model model ,@RequestParam Map<String,Object> paramMap,HttpSession session) throws SQLException, Exception {
		System.out.println("memberKakaoLoginPro.do 의 paramMap:" + paramMap);
		Map <String, Object> resultMap = new HashMap<String, Object>();
		
		Map<String, Object> kakaoConnectionCheck = service.kakaoConnectionCheck(paramMap);
		System.out.println("카카오를 다녀온 컨넥션 첵크" + kakaoConnectionCheck);
		if(kakaoConnectionCheck == null) { //일치하는 이메일 없으면 가입
			resultMap.put("JavaData", "register");
		}else if(kakaoConnectionCheck.get("KAKAOLOGIN") == null && kakaoConnectionCheck.get("EMAIL") != null) { //이메일 가입 되어있고 카카오 연동 안되어 있을시
			System.out.println("카카오 로그인 프로 paramMap 값 : " + paramMap);
			service.setKakaoConnection(paramMap);
			MemberDto loginCheck = service.memberKakaoLoginPro(kakaoConnectionCheck);
			session.setAttribute("memberInfo", loginCheck);
			System.out.println("카카로 로그인 프로 연동 안되어 있을때 : " + loginCheck);
			resultMap.put("JavaData", "YES");
		}else{
			MemberDto loginCheck = service.memberKakaoLoginPro(kakaoConnectionCheck);
			session.setAttribute("memberInfo", loginCheck);
			System.out.println("카카로 로그인 프로 연동 되어 있을때 : " + loginCheck);
			resultMap.put("JavaData", "YES");
		}
		
		return resultMap;
	}
	
	// 회원가입 분류
	@RequestMapping(value="/memberSnsRegisterPro.do", method=RequestMethod.POST)
	public Map<String, Object> memberSnsRegisterPro(@RequestParam Map<String,Object> paramMap,HttpSession session, MemberDto dto) throws SQLException, Exception {
		System.out.println("멤버sns회원가입 paramMap:" + paramMap);
		String memberPhoto = fileManagement.FileUploader(dto.getMemberPhoto());
		paramMap.put("memberPhoto", memberPhoto);
		Map <String, Object> resultMap = new HashMap<String, Object>();
		String flag = (String) paramMap.get("flag");
		System.out.println("멤버sns회원가입 flag:" + flag);
		Integer registerCheck = null;
		if(flag.equals("kakao")) {
			registerCheck = service.memberKakaoRegisterPro(paramMap);
		}else if(flag.equals("naver")) {
			registerCheck = service.memberNaverRegisterPro(paramMap);
		}
		
		else if(flag.equals("google")) {
			registerCheck = service.memberGoogleRegisterPro(paramMap);
		}
		
		if(registerCheck != null && registerCheck > 0) {
			MemberDto loginCheck = null;
			if(flag.equals("kakao")) {
				loginCheck = service.memberKakaoLoginPro(paramMap);
			}else if(flag.equals("naver")) {
				loginCheck = service.memberNaverLoginPro(paramMap);
			}
			
			else if(flag.equals("google")) {
				loginCheck = service.memberGoogleLoginPro(paramMap);
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
	public Map<String, Object> googleLoginPro(Model model, @RequestParam Map<String,Object> paramMap,HttpSession session) throws SQLException, Exception {
		System.out.println("구글 로그인 프로 paramMap:" + paramMap);
		Map <String, Object> resultMap = new HashMap<String, Object>();
		Map <String, Object> googleConnectionCheck = service.googleConnectionCheck(paramMap);
		System.out.println("구글로그인프로 구글컨넥체크" + googleConnectionCheck);
		
		if(googleConnectionCheck == null) { //일치하는 이메일 없으면 가입
			resultMap.put("JavaData", "register");
		}else if(googleConnectionCheck.get("GOOGLELOGIN") == null && googleConnectionCheck.get("EMAIL") != null) { //이메일 가입 되어있고 네이버 연동 안되어 있을시
			service.setGoogleConnection(paramMap);
			MemberDto loginCheck = service.memberGoogleLoginPro(googleConnectionCheck);
			session.setAttribute("memberInfo", loginCheck);
			System.out.println("구글 로그인 이메일 확인 하기 : " + loginCheck);
			resultMap.put("JavaData", "YES");
		}else { //모두 연동 되어있을시
			MemberDto loginCheck = service.memberGoogleLoginPro(googleConnectionCheck);
			session.setAttribute("memberInfo", loginCheck);
			System.out.println("구글 로그인 연동 모두 확인: " + loginCheck);
			resultMap.put("JavaData", "YES");
		}

		return resultMap;
	}
	
	/*
	 정연우
	 네이버 로그인 이동
	*/
	@RequestMapping(value="memberNaverLoginPro.do",  method = {RequestMethod.GET,RequestMethod.POST})
	public String memberNaverLoginPro(Model model, MemberDto dto, @RequestParam Map<String,Object> paramMap, @RequestParam String code, @RequestParam String state,HttpSession session) throws SQLException, Exception {
		System.out.println("멤버 네이버 로그인 프로 paramMap:" + paramMap);
		Map <String, Object> resultMap = new HashMap<String, Object>();
		System.out.println("memberNaverLoginPro.do 실행");
		OAuth2AccessToken oauthToken;
		oauthToken = naverloginbo.getAccessToken(session, code, state);
		//로그인 사용자 정보를 읽어온다
		String apiResult = naverloginbo.getUserProfile(oauthToken);
		System.out.println("memberNaverLoginPro.do 값 apiResult =>"+apiResult);
		ObjectMapper objectMapper =new ObjectMapper();
		Map<String, Object> apiJson = (Map<String, Object>) objectMapper.readValue(apiResult, Map.class).get("response");
		apiJson.put("naverLogin", apiJson.get("id"));
		//apiJson.put("password",apiJson.get("id"));
		Map<String, Object> naverConnectionCheck = service.naverConnectionCheck(apiJson);
		
		//naverConnectionCheck가 null이면 첫 회원가입
		if(naverConnectionCheck == null) { //일치하는 이메일 없으면 가입
			// 뷰단으로 로그인 정보 보내주기 (memberInfo.jsp)
			model.addAttribute("email",apiJson.get("email"));
			model.addAttribute("naverLogin",apiJson.get("id"));
			model.addAttribute("flag","naver");
			return "member/memberInfo";
			
		// NAVERLOGIN이 null이지만 이메일 정보가 있을때 -> 네이버 연동 처리
		}else if(naverConnectionCheck.get("NAVERLOGIN") == null && naverConnectionCheck.get("EMAIL") != null) { //이메일 가입 되어있고 네이버 연동 안되어 있을시
			service.setNaverConnection(apiJson);
			MemberDto loginCheck = service.memberNaverLoginPro(apiJson);
			session.setAttribute("memberInfo", loginCheck);
			System.out.println("네이버로그인 1 세션 : " + session);
			System.out.println("네이버로그인 1 로그인체크 : " + loginCheck);
		}else { //이미 연동이 되어있고 가입이 되어있을 때
			MemberDto loginCheck = service.memberNaverLoginPro(apiJson);
			session.setAttribute("memberInfo", loginCheck);
			System.out.println("네이버로그인 2 세션 : " + session);
			System.out.println("네이버로그인 2 로그인체크 : " + loginCheck);
		}

		return "redirect:memberCon.do";
	}
}
