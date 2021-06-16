package com.a.manager.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface managerService {
	
	public List<Map<String, Object>> managerList(Map<String, Object> mListParam) throws SQLException;
	
	
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
}
