package com.a.challenge.dao;

import java.util.List;
import java.util.Map;

import com.a.dto.challengeDto;

public interface challengeDao {

	//챌린지 만들기
	public boolean challengeInsert(challengeDto dto);
	
	//hot전체 글 가져오기 hotChallengeData
	public List<challengeDto> hotChallengeData(Map<String,Object> searchParam);
	
	//hot전체 글 수 challengeDataCount
	public int challengeDataCount(Map<String,Object> searchParam);
	
}
