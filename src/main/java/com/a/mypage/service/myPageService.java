package com.a.mypage.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestParam;

import com.a.dto.MemberDto;

public interface myPageService {

	public Map<String, Object> getNowCh(String email) throws SQLException;
	
	public Map<String, Object> getCompleCh(String email) throws SQLException;

	public Map<String, Object> memberInfoData(String email) throws SQLException;
	
	// 멤버 찜하기 갯수
	public int memberWishCount(String email) throws SQLException;
	
	// 멤버 진행중인 갯수
	public int memberNowCount(String email) throws SQLException;
	
	// 멤버 진행중인 챌린지 리스트
	public List<Map<String, Object>> memNowCntList(String email) throws SQLException;
	
	public int memEndCount(String email) throws SQLException;
	
	public List<Map<String, Object>> memChallList(Map<String, Object> getChallInfo) throws SQLException;
	
	public List<Map<String, Object>> memCategoryCount(String email) throws SQLException;
	
	public List<Map<String, Object>> memDailyChallList(Map<String, Object> getDailyChallInfo) throws SQLException;
	
	public boolean writeSuggest(Map<String, Object> param) throws SQLException;
	
	public List<Map<String, Object>> suggestList(Map<String, Object> param) throws SQLException;
	
	public boolean suggestMyLikeDel(Map<String,Object> myLikeParam) throws SQLException;
	
	public boolean suggestMyLikeInsert(Map<String,Object> likeParam) throws SQLException;
	
	public boolean writeComment(Map<String,Object> commentParam) throws SQLException;
	
	public List<Map<String, Object>> commentList(Map<String,Object> comListParam) throws SQLException;
	
	public int suggestBbsCnt(Map<String,Object> searchParam) throws SQLException;
	
}
