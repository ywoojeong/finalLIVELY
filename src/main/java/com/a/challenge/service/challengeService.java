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
	
	//new전체 글 가져오기 newChallengeData
	public List<Map<String, Object>> newChallengeData(Map<String,Object> searchParam);

	//챌린지 전체 글 수
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
	
	//챌린지 가입멤버리스트 challengeAllMember
	public List<Map<String, Object>> challengeAllMember(int challengeseq);
	
	//팔로우 넣기 followInsert
	public boolean followInsert(Map<String, Object> followParam);
	
	//팔로우 삭제 followDelete
	public boolean followDelete(Map<String, Object> followParam);
	
	//팔로우 확인하기
	public int followCheck(Map<String, Object> followParam);
	
	//리뷰 넣기
	public boolean challengeReviewInsert(Map<String, Object> revParam);
	
	//리뷰 좋아요
	public boolean commentLike (Map<String, Object> likeParam);
	
	//리뷰 좋아요 해제
	public boolean commentLikeDel (Map<String, Object> likeParam);
	
	//리뷰 테이블에  +1
	public boolean challengeReviewLike(int chalcomseq);
	
	//리뷰테이블에 -1
	public boolean challengeReviewUnLike(int chalcomseq);
		
	//리뷰 좋아요 있나 없나 확인
	public int commentLikeCheck( Map<String,Object> revParam);
	
	//해당 리뷰 전체 가져오기
	public List<Map<String, Object>> challengereviewAll( Map<String,Object> revParam);
	
	//리뷰 결과 한번에
	public Map<String, Object> reviewResult(int challengeseq);
}
