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
	
	//new전체 글 가져오기 newChallengeData
	public List<Map<String, Object>> newChallengeData(Map<String,Object> searchParam);
	
	//전체 글 수 challengeDataCount
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
	
	//챌린지 가입하기
	public int challengeMemberInsert(Map<String, Object> memParam);
	
	//포인트 업데이트
	public int memberPointReducation(Map<String, Object> memParam);
	
	//챌린지 가입한 한사람 데려오기
	public Map<String, Object> challengeMember(Map<String, Object> likeData);
	
	//챌린지 멤버 업데이트
	public int challengeMemberCountUp(int challengeseq);
	
	//챌린지 가입멤버리스트 challengeAllMember
	public List<Map<String, Object>> challengeAllMember(int challengeseq);
	
	//팔로우 넣기 followInsert
	public int followInsert(Map<String, Object> followParam);
	
	//팔로우 삭제 followDelete
	public int followDelete(Map<String, Object> followParam);
	
	//팔로우 확인하기
	public int followCheck(Map<String, Object> followParam);

	//리뷰 넣기
	public int challengeReviewInsert(Map<String, Object> revParam);
	
	//리뷰 좋아요
	public int commentLike (Map<String, Object> likeParam);
	
	//리뷰 좋아요 해제
	public int commentLikeDel (Map<String, Object> likeParam);
	
	//리뷰 테이블에  +1
	public int challengeReviewLike(int chalcomseq);
	
	//리뷰테이블에 -1
	public int challengeReviewUnLike(int chalcomseq);
	
	//리뷰 좋아요 있나 없나 확인
	public int commentLikeCheck( Map<String,Object> revParam);
	
	//해당 리뷰 전체 가져오기
	public List<Map<String, Object>> challengereviewAll( Map<String,Object> revParam);
	
	//리뷰 결과 데이터 가져오기
	public int reviewCountAll(int challengeseq);
	public Double reviewAvg(int challengeseq);
	public int rateFive(int challengeseq);
	public int rateFour(int challengeseq);
	public int rateThree(int challengeseq);
	public int rateTwo(int challengeseq);
	public int rateOne(int challengeseq);
	
	//인증 insert indentifyInsert
	public int identifyInsert(Map<String, Object> certParam);
	
	//인증 데이터 전체 가져오기
	public List<Map<String, Object>> identifyAll(String email);
	
	//인증 되었는지 체크
	public int identifyCheck(String email);
	
}
