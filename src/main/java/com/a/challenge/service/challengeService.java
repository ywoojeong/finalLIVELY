package com.a.challenge.service;

import java.util.List;
import java.util.Map;

import com.a.dto.challengeDto;

public interface challengeService {

	//챌린지 만들기
	public boolean challengeInsert(challengeDto dto);
	
	//hot챌린지 전체 가져오기
	public List<challengeDto> hotChallengeData(Map<String,Object> searchParam);

	//hot 챌린지 전체 글 수
	public int challengeDataCount(Map<String,Object> searchParam);
}
