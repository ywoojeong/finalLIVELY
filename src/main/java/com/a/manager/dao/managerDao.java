package com.a.manager.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface managerDao {
   
   // 챌린지 리스트
   public List<Map<String, Object>> managerList(Map<String, Object> mListParam) throws SQLException;
   
   
   // 멤버 리스트
   public List<Map<String, Object>> memberCntList(Map<String, Object> memListParam) throws SQLException;
   
   
   
   //민선 차트 부분
   
   //전체 사용자 수 userAllCount
   public int userAllCount();

   //전체 챌린지 수 challengeAllCount
   public int challengeAllCount();
   
   //월별 챌린지 생성 개수 challengeAdd
   public List<Map<String, Object>> challengeAdd();
   
   //카테고리별 챌린지 개수  challengeCategory
   public List<Map<String, Object>> challengeCategory();
   
   //챌린지 가입인원 수 challengeMemberMax
   public List<Map<String, Object>> challengeMemberMax();
   
   //월별 사용자 가입수 userAdd
   public List<Map<String, Object>> userAdd();
   
   //좋아요 많이 받은 순(following) userFollowingMax
   public List<Map<String, Object>> userFollowingMax();
   
   //포인트가 많은 사용자 순 userPointMax
   public List<Map<String, Object>> userPointMax();
   
   //챌린지 인증 퍼센트 높은 순 (유저 많은 순) challengeIdentifyMax
   public List<Map<String, Object>> challengeIdentifyMax();
   
   //인증률이 높은 유저 순(6명) userIdentify
   public List<Map<String, Object>> userIdentify();
}