package com.a.manager.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface managerService {

	//연우 부분
	public List<Map<String, Object>> managerList(Map<String, Object> mListParam) throws SQLException;
	
	public List<Map<String, Object>> memberCntList(Map<String, Object> memListParam) throws SQLException;
	
	// 회원 정보 뿌리기
	public Map<String, Object> memberData(String email) throws SQLException;
	
	// 회원 정지
	public boolean memberStop(Map<String, Object> param) throws SQLException;
	public boolean memberPlay(Map<String, Object> param) throws SQLException;
	
	//챌린지 정지
	public boolean challStop(Map<String, Object> param) throws SQLException;
	public boolean challPlay(Map<String, Object> param) throws SQLException;
	
   //민선 부분
   
   //전체 사용자 수 userAllCount + 전체 챌린지 수 challengeAllCount
   public Map<String, Object> allCount();
   
   //월별 챌린지 생성 개수 challengeAdd
   public Map<String, Object> challengeAdd();
   
   //카테고리별 챌린지 개수  challengeCategory
   public Map<String, Object> challengeCategory();
   
   //챌린지 가입인원 수 challengeMemberMax
   public List<Map<String, Object>> challengeMemberMax();
   
   //월별 사용자 가입수 userAdd
   public Map<String, Object> userAdd();
   
   //좋아요 많이 받은 순(following) userFollowingMax
   public List<Map<String, Object>> userFollowingMax();
   
   //포인트가 많은 사용자 순 userPointMax
   public List<Map<String, Object>> userPointMax();
   
   //챌린지 인증 퍼센트 높은 순 (유저 많은 순) challengeIdentifyMax
   public List<Map<String, Object>> challengeIdentifyMax();
   
   //인증률이 높은 유저 순(6명) userIdentify
   public List<Map<String, Object>> userIdentify();
}