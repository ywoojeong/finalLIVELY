package com.a.member.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.a.common.NaverLoginBO;
import com.a.dto.MemberDto;
import com.a.member.service.memberService;
import com.a.util.FileManagement;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.model.OAuth2AccessToken;

@RestController
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
	
	// 회원정보 수정
	@RequestMapping(value="memberModify.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String memberModify (MemberDto dto, Model model, HttpSession session, @RequestParam("uploadFile")  MultipartFile memberPhoto) throws Exception {
		System.out.println("회원정보 수정");
		System.out.println("회원정보 수정 memberPhoto : " + memberPhoto);
		String memberPhotoName = fileManagement.FileUploader(memberPhoto);
		System.out.println("회원정보 수정 memberPhotoName : " + memberPhotoName);
		String memberPh2 = memberPhoto.getOriginalFilename();
		System.out.println("회원정보 수정 memberPhotoName : " + memberPhotoName);
		dto.setMemberPhotoName(memberPhotoName);
		dto.setMemberPhoto(memberPh2);
		
		service.memberModify(dto);
		return "memModifyCheck";
	}

	// 회원가입 추가 정보
	@RequestMapping(value="memberInfoPro.do", method = {RequestMethod.POST,RequestMethod.GET}) 
	public String memberInfoPro(MemberDto dto, HttpSession session,  @RequestParam("uploadFile")  MultipartFile memberPhoto) throws Exception {
		System.out.println("회원가입 정보 추가 + memberInfoPro.do"); 
		
		System.out.println(dto.getEmail());
		System.out.println(dto.getNickname());
		System.out.println(dto.getFlag());
		String memberPhotoName = fileManagement.FileUploader(memberPhoto);
		String memberPh = memberPhoto.getOriginalFilename();
		dto.setMemberPhotoName(memberPhotoName);
		dto.setMemberPhoto(memberPh);
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
	
	// 카카오 회원 가입
	@RequestMapping(value="memberKakaoLoginPro.do", method=RequestMethod.POST)
	public Map<String, Object> memberkakaoLoginPro(Model model ,@RequestParam Map<String,Object> paramMap,HttpSession session) throws SQLException, Exception {
		System.out.println("멤버카카오로그인.do 의 paramMap:" + paramMap);
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
	
	
}