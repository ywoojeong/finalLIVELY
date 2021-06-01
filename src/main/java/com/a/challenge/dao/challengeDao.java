package com.a.challenge.dao;

import java.util.List;
import java.util.Map;

import com.a.dto.MemberDto;
import com.a.dto.challengeDto;

public interface challengeDao {

	//챌린지 만들기
	public boolean challengeInsert(challengeDto dto);
	
	//hot전체 글 가져오기 hotChallengeData
	public List<Map<String, Object>> hotChallengeData(Map<String,Object> searchParam);
	
	//hot전체 글 수 challengeDataCount
	public int challengeDataCount(Map<String,Object> searchParam);
	
	//챌란자 생성한 사람 데이터 createChallengeMember
	public Map<String, Object> createChallengeMember(String email);
	
	//챌린지 디테일 하나 가져오기 challengeDetail
	public challengeDto challengeDetail(int challengeseq);
	
	//챌린지 찜하기 INSERT challengelikeInsert
	public int challengelikeInsert(Map<String, Object> likeData);
	
	//챌린지 찜하기 DELETE challengelikeDelete
	public int challengelikeDelete(Map<String, Object> likeData);
	
	//챌린지 데이터 가져오기 challengelikeSeq
	public Map<String, Object> challengelikeSeq(Map<String, Object> likeData);
	
	//세션에 담긴 사람 데이터 가져오기 userData
	public MemberDto userData(String email);
}
