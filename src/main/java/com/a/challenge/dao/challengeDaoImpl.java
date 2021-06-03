package com.a.challenge.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.a.dto.MemberDto;
import com.a.dto.challengeDto;

@Repository
public class challengeDaoImpl implements challengeDao {
	
	@Autowired
	SqlSession sqlSession;
	
	String namespace = "challenge.";

	@Override
	public boolean challengeInsert(challengeDto dto) {
			
		int count = sqlSession.insert(namespace+"challengeInsert", dto);
		return count>0?true:false;
	}

	@Override
	public List<Map<String, Object>> hotChallengeData(Map<String, Object> searchParam) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+"hotChallengeData", searchParam);
	}

	@Override
	public int challengeDataCount(Map<String, Object> searchParam) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"challengeDataCount", searchParam);
	}

	@Override
	public Map<String, Object> createChallengeMember(String email) {
		
		return sqlSession.selectOne(namespace+"createChallengeMember", email);
	}

	@Override
	public challengeDto challengeDetail(int challengeseq) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"challengeDetail", challengeseq);
	}

	@Override
	public int challengelikeInsert(Map<String, Object> likeData) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace+"challengelikeInsert", likeData);
	}

	@Override
	public int challengelikeDelete(Map<String, Object> likeData) {
		// TODO Auto-generated method stub
		return sqlSession.delete(namespace+"challengelikeDelete", likeData);
	}

	@Override
	public Map<String, Object> challengelikeSeq(Map<String, Object> likeData) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"challengelikeSeq", likeData);
	}

	@Override
	public MemberDto userData(String email) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"userData", email);
	}

	@Override
	public int challengeMemberInsert(Map<String, Object> memParam) {
		
		return sqlSession.insert(namespace+"challengeMemberInsert", memParam);
	}

	@Override
	public int memberPointReducation(Map<String, Object> memParam) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+"memberPointReducation", memParam);
	}

	@Override
	public Map<String, Object> challengeMember(Map<String, Object> likeData) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"challengeMember", likeData);
	}

	@Override
	public int challengeMemberCountUp(int challengeseq) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+"challengeMemberCountUp", challengeseq);
	}

	@Override
	public List<Map<String, Object>> challengeAllMember(int challengeseq) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+"challengeAllMember", challengeseq);
	}

	@Override
	public int followInsert(Map<String, Object> followParam) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace+"followInsert", followParam);
	}

	@Override
	public int followDelete(Map<String, Object> followParam) {
		// TODO Auto-generated method stub
		return sqlSession.delete(namespace+"followDelete", followParam);
	}

	@Override
	public List<Map<String, Object>> followAllMember(String email) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+"followAllMember", email);
	}

	@Override
	public int challengeReviewInsert(Map<String, Object> revParam) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace+"challengeReviewInsert", revParam);
	}

	@Override
	public int challengeReviewLike(int chalcomseq) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+"challengeReviewLike", chalcomseq);
	}

	@Override
	public int challengeReviewUnLike(int chalcomseq) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+"challengeReviewUnLike", chalcomseq);
	}

	@Override
	public List<Map<String, Object>> challengereviewAll( Map<String,Object> revParam) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+"challengereviewAll", revParam);
	}
	
	
	
	
	
	
	
	
	
	
	
}
