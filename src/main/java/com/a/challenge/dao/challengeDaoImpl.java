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
	public List<Map<String, Object>> newChallengeData(Map<String, Object> searchParam) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+"newChallengeData", searchParam);
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
	public int challengeUpdate(Map<String, Object> challParam) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+"challengeUpdate", challParam);
	}

	@Override
	public Map<String, Object> challengeDetailMap(int challengeseq) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"challengeDetailMap", challengeseq);
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
	public int followCheck(Map<String, Object> followParam) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"followCheck", followParam);
	}

	@Override
	public int challengeReviewInsert(Map<String, Object> revParam) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace+"challengeReviewInsert", revParam);
	}

	@Override
	public int commentLike(Map<String, Object> likeParam) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace+"commentLike", likeParam);
	}

	@Override
	public int commentLikeDel(Map<String, Object> likeParam) {
		// TODO Auto-generated method stub
		return sqlSession.delete(namespace+"commentLikeDel", likeParam);
	}
	
	@Override
	public int challengeReviewLike(int chalcomseq) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+"challengeReviewLike", chalcomseq);
	}

	@Override
	public int challengeReviewUnLike(int chalcomseq) {
		// TODO Auto-generated method stub
		return  sqlSession.update(namespace+"challengeReviewUnLike", chalcomseq);
	}

	@Override
	public List<Map<String, Object>> challengereviewAll( Map<String,Object> revParam) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+"challengereviewAll", revParam);
	}

	@Override
	public int commentLikeCheck( Map<String,Object> revParam) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"commentLikeCheck", revParam);
	}

	@Override
	public int reviewCountAll(int challengeseq) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"reviewCountAll", challengeseq);
	}

	@Override
	public Double reviewAvg(int challengeseq) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"reviewAvg", challengeseq);
	}

	@Override
	public int rateFive(int challengeseq) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"rateFive", challengeseq);
	}

	@Override
	public int rateFour(int challengeseq) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"rateFour", challengeseq);
	}

	@Override
	public int rateThree(int challengeseq) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"rateThree", challengeseq);
	}

	@Override
	public int rateTwo(int challengeseq) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"rateTwo", challengeseq);
	}

	@Override
	public int rateOne(int challengeseq) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"rateOne", challengeseq);
	}

	@Override
	public int identifyInsert(Map<String, Object> certParam) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace+"identifyInsert", certParam);
	}
	
	@Override
	public int identifyUpdate(Map<String, Object> certParam) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+"identifyUpdate", certParam);
	}

	@Override
	public List<Map<String, Object>> identifyAll(Map<String, Object> certParam) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+"identifyAll", certParam);
	}

	@Override
	public int identifyCheck(Map<String, Object> certParam) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"identifyCheck", certParam);
	}

	@Override
	public List<Map<String, Object>> identifyResult(int challengeseq) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+"identifyResult", challengeseq);
	}

	@Override
	public Map<String, Object> identifyResultUser(Map<String, Object> resultParam) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"identifyResultUser", resultParam);
	}

	@Override
	public Map<String, Object> challResultAllOne(int challengeseq) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"challResultAllOne", challengeseq);
	}

	@Override
	public List<Map<String, Object>> ChoiceTodayStart() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+"ChoiceTodayStart");
	}
	
	@Override
	public List<Map<String, Object>> ChoiceSuggestChallenge() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+"ChoiceSuggestChallenge");
	}

	@Override
	public int reviewDone(Map<String, Object> commParam) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"reviewDone", commParam);
	}

	@Override
	public int pointUpdate(Map<String, Object> pointParam) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+"pointUpdate", pointParam);
	}

	@Override
	public int successUpdate(Map<String, Object> pointParam) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+"successUpdate", pointParam);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
