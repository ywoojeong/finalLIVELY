package com.a.mypage.dao;

import java.sql.SQLException;
import java.util.Map;

import com.a.dto.MemberDto;

public interface myPageDao {
	
	public Map<String, Object> getNowCh(String email) throws SQLException;
	
	public Map<String, Object> getCompleCh(String email) throws SQLException;
	
	// 멤버 정보
	public Map<String, Object> memberInfoData(String email) throws SQLException;
	
	// 멤버 찜하기 갯수
	public int memberWishCount(String email) throws SQLException;
	
	// 멤버 진행중인 갯수
	public int memberNowCount(String email) throws SQLException;
	
	// 멤버 진행중인 챌린지 리스트
	public Map<String, Object> memNowCntList(String email) throws SQLException;
	
	
}
