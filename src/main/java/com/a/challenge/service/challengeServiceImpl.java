package com.a.challenge.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.a.challenge.dao.challengeDao;
import com.a.dto.MemberDto;
import com.a.dto.challengeDto;

@Service
public class challengeServiceImpl implements challengeService {
	

	@Autowired
	challengeDao dao;

	@Override
	public boolean challengeInsert(challengeDto dto) {
		
		return dao.challengeInsert(dto);
	}

	@Override
	public List<Map<String, Object>> hotChallengeData(Map<String, Object> searchParam) {
		// TODO Auto-generated method stub
		return dao.hotChallengeData(searchParam);
	}
	
	@Override
	public List<Map<String, Object>> newChallengeData(Map<String, Object> searchParam) {
		// TODO Auto-generated method stub
		return dao.newChallengeData(searchParam);
	}

	@Override
	public int challengeDataCount(Map<String, Object> searchParam) {
		// TODO Auto-generated method stub
		return dao.challengeDataCount(searchParam);
	}
	
	@Override
	public Map<String, Object> createChallengeMember(String email) {
		// TODO Auto-generated method stub
		return dao.createChallengeMember(email);	
	}

	@Override
	public challengeDto challengeDetail(int challengeseq) {
		// TODO Auto-generated method stub
		return dao.challengeDetail(challengeseq);
	}

	@Override
	public boolean challengelikeInsert(Map<String, Object> likeData) {
		int count = dao.challengelikeInsert(likeData);
		return count>0?true:false;
	}

	@Override
	public boolean challengelikeDelete(Map<String, Object> likeData) {
		int count = dao.challengelikeDelete(likeData);
		return count>0?true:false;
	}

	@Override
	public Map<String, Object> challengelikeSeq(Map<String, Object> likeData) {
		// TODO Auto-generated method stub
		return dao.challengelikeSeq(likeData);
	}

	@Override
	public MemberDto userData(String email) {
		// TODO Auto-generated method stub
		return dao.userData(email);
	}

	@Override
	public boolean challengeMemberInsert(Map<String, Object> memParam) {
		int count = dao.challengeMemberInsert(memParam);
		return count>0?true:false;
	}

	@Override
	public boolean memberPointReducation(Map<String, Object> memParam) {
		int count = dao.memberPointReducation(memParam);
		return count>0?true:false;
	}

	@Override
	public Map<String, Object> challengeMember(Map<String, Object> likeData) {
		// TODO Auto-generated method stub
		return dao.challengeMember(likeData);
	}

	@Override
	public boolean challengeMemberCountUp(int challengeseq) {
		int count = dao.challengeMemberCountUp(challengeseq);
		return count>0?true:false;
	}

	@Override
	public List<Map<String, Object>> challengeAllMember(int challengeseq) {
		// TODO Auto-generated method stub
		return dao.challengeAllMember(challengeseq);
	}

	@Override
	public boolean followInsert(Map<String, Object> followParam) {
		int count = dao.followInsert(followParam);
		return count>0?true:false;
	}

	@Override
	public boolean followDelete(Map<String, Object> followParam) {
		int count = dao.followDelete(followParam);
		return count>0?true:false;
	}

	@Override
	public int followCheck(Map<String, Object> followParam) {
		// TODO Auto-generated method stub
		return dao.followCheck(followParam);
	}

	@Override
	public boolean challengeReviewInsert(Map<String, Object> revParam) {
		// TODO Auto-generated method stub
		return dao.challengeReviewInsert(revParam)>0?true:false;
	}

	@Override
	public boolean commentLike(Map<String, Object> likeParam) {
		// TODO Auto-generated method stub
		return dao.commentLike(likeParam)>0?true:false;
	}

	@Override
	public boolean commentLikeDel(Map<String, Object> likeParam) {
		// TODO Auto-generated method stub
		return dao.commentLikeDel(likeParam)>0?true:false;
	}

	
	@Override
	public boolean challengeReviewLike(int chalcomseq) {
		// TODO Auto-generated method stub
		return  dao.challengeReviewLike(chalcomseq)>0?true:false;
	}

	@Override
	public boolean challengeReviewUnLike(int chalcomseq) {
		// TODO Auto-generated method stub
		return dao.challengeReviewUnLike(chalcomseq)>0?true:false;
	}
	
	@Override
	public int commentLikeCheck(Map<String, Object> revParam) {
		// TODO Auto-generated method stub
		return dao.commentLikeCheck(revParam);
	}

	@Override
	public List<Map<String, Object>> challengereviewAll( Map<String,Object> revParam) {
		// TODO Auto-generated method stub
		return dao.challengereviewAll(revParam);
	}

	@Override
	public Map<String, Object> reviewResult(int challengeseq) {
		Map<String, Object> reviewResult = new HashMap<String, Object>();
		reviewResult.put("reviewCountAll", dao.reviewCountAll(challengeseq));
		reviewResult.put("reviewAvg", dao.reviewAvg(challengeseq));
		reviewResult.put("rateFive", dao.rateFive(challengeseq));
		reviewResult.put("rateFour", dao.rateFour(challengeseq));
		reviewResult.put("rateThree", dao.rateThree(challengeseq));
		reviewResult.put("rateTwo", dao.rateTwo(challengeseq));
		reviewResult.put("rateOne", dao.rateOne(challengeseq));
		
		return reviewResult;
	}
	
	
	
	
	
	
	

	
	
}
