package com.a.common;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ApiController {
	
	// 정연우
	// 카카오 api 키 가져오기
	@Value("#{loginApi['KAKAO.JS']}")
	String kakaoApi;
	
	@RequestMapping(value="/getKakaoApi.do", method=RequestMethod.POST)
	public String getKakaoApi() throws SQLException, Exception {
		System.out.println("ApiController getKakaoApi");
		return kakaoApi;
	}
	
}
