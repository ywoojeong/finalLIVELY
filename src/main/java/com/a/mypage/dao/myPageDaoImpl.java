package com.a.mypage.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.a.dto.MemberDto;

@Repository
public class myPageDaoImpl implements myPageDao {
	
	@Autowired
	SqlSession sql;
	
	@Override
	public Map<String, Object> getNowCh(String email) throws SQLException {
		return sql.selectOne("myPage.getNowCh", email);
	}
	
	@Override
	public Map<String, Object> getCompleCh(String email) throws SQLException {
		return sql.selectOne("myPage.getCompleCh", email);
	}
	
	@Override
	public Map<String, Object> memberInfoData(String email) throws SQLException {
		return sql.selectOne("myPage.memberInfoData", email);
	}
	
	@Override
	public int memberWishCount(String email) throws SQLException {
		return sql.selectOne("myPage.memberWishCount", email);
	}
	
	@Override
	public int memberNowCount(String email) throws SQLException {
		return sql.selectOne("myPage.memberNowCount", email);
	}
	
	@Override
	public List<Map<String, Object>> memNowCntList(String email) throws SQLException {
		return sql.selectList("myPage.memNowCntList", email);
	}
	
	@Override
	public int memEndCount(String email) throws SQLException {
		return sql.selectOne("myPage.memEndCount", email);
	}
	
	@Override
	public List<Map<String, Object>> memChallList(Map<String, Object> getChallInfo) throws SQLException {
		return sql.selectList("myPage.memChallList", getChallInfo);
	}
	
	@Override
	public List<Map<String, Object>> memCategoryCount(String email) throws SQLException {
		return sql.selectList("myPage.memCategoryCount", email);
	}
	
	@Override
	public List<Map<String, Object>> memDailyChallList(Map<String, Object> getDailyChallInfo) throws SQLException {
		return sql.selectList("myPage.memDailyChallList", getDailyChallInfo);
	}
	
	@Override
	public int writeSuggest(Map<String, Object> param) throws SQLException {
		return sql.insert("myPage.writeSuggest", param);
	}
	
	@Override
	public List<Map<String, Object>> suggestList(Map<String, Object> param) throws SQLException {
		// TODO Auto-generated method stub
		return sql.selectList("myPage.suggestList", param);
	}
	
	@Override
	public int suggestMyLikeDel(Map<String, Object> myLikeParam) throws SQLException {
		// TODO Auto-generated method stub
		return sql.delete("myPage.suggestMyLikeDel", myLikeParam);
	}
	
	@Override
	public int suggestMyLikeInsert(Map<String, Object> likeParam) throws SQLException {
		// TODO Auto-generated method stub
		return sql.insert("myPage.suggestMyLikeInsert", likeParam);
	}
}
