package com.a.challenge.service;

import java.util.List;
import java.util.Map;

import com.a.dto.MemberDto;
import com.a.dto.challengeDto;

public interface challengeService {

	//챌린지 만들기
	public boolean challengeInsert(challengeDto dto);
	
	//hot챌린지 전체 가져오기
	public List<Map<String, Object>> hotChallengeData(Map<String,Object> searchParam);

	//hot 챌린지 전체 글 수
	public int challengeDataCount(Map<String,Object> searchParam);
	
	//챌린지 생성한 사람의 데이
	public Map<String, Object> createChallengeMember(String email);
	
	//챌린지 디테일 하나 가져오기 challengeDetail
	public challengeDto challengeDetail(int challengeseq);
	
	//챌린지 찜하기 INSERT challengelikeInsert
	public boolean challengelikeInsert(Map<String, Object> likeData);
	
	//챌린지 찜하기 DELETE challengelikeDelete
	public boolean challengelikeDelete(Map<String, Object> likeData);
	
	//챌린지 데이터 가져오기 challengelikeSeq
	public Map<String, Object> challengelikeSeq(Map<String, Object> likeData);
	
	//세션에 담긴 사람 데이터 가져오기 userData
	public MemberDto userData(String email);
	
	//챌린지 가입하기
	public boolean challengeMemberInsert(Map<String, Object> memParam);
	
	//포인트 업데이트
	public boolean memberPointReducation(Map<String, Object> memParam);
	
	//챌린지 가입한 한사람 데려오기
	public Map<String, Object> challengeMember(Map<String, Object> likeData);
	
	//챌린지 멤버 업데이트
	public boolean challengeMemberCountUp(int challengeseq);
}
