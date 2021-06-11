package com.a.mypage.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.a.dto.MemberDto;
import com.a.mypage.dao.myPageDao;

@Service
public class myPageServiceImpl implements myPageService{
	
	@Autowired
	myPageDao mypagedao;

	@Override
	public Map<String, Object> getNowCh(String email) throws SQLException {
		return mypagedao.getNowCh(email);
	}
	
	@Override
	public Map<String, Object> getCompleCh(String email) throws SQLException {
		return mypagedao.getCompleCh(email);
	}
	
	@Override
	public Map<String, Object> memberInfoData(String email) throws SQLException {
		return mypagedao.memberInfoData(email);
	}
	
	@Override
	public int memberWishCount(String email) throws SQLException {
		return mypagedao.memberWishCount(email);
	}
	
	@Override
	public int memberNowCount(String email) throws SQLException {
		return mypagedao.memberNowCount(email);
	}
	
	@Override
	public List<Map<String, Object>> memNowCntList(String email) throws SQLException {
		return mypagedao.memNowCntList(email);
	}
	
	@Override
	public int memEndCount(String email) throws SQLException {
		return mypagedao.memEndCount(email);
	}
	
	@Override
	public List<Map<String, Object>> memChallList(Map<String, Object> getChallInfo) throws SQLException {
		return mypagedao.memChallList(getChallInfo);
	}
	
	@Override
	public List<Map<String, Object>> memCategoryCount(String email) throws SQLException {
		return mypagedao.memCategoryCount(email);
	}
	
	@Override
	public List<Map<String, Object>> memDailyChallList(Map<String, Object> getDailyChallInfo) throws SQLException {
		return mypagedao.memDailyChallList(getDailyChallInfo);
	}
	
	@Override
	public boolean writeSuggest(Map<String, Object> param) throws SQLException {
		return mypagedao.writeSuggest(param)>0?true:false;
	}
	
	@Override
	public List<Map<String, Object>> suggestList(Map<String, Object> param) throws SQLException {
		// TODO Auto-generated method stub
		return mypagedao.suggestList(param);
	}
	
	@Override
	public boolean suggestMyLikeDel(Map<String, Object> myLikeParam) throws SQLException {
		// TODO Auto-generated method stub
		return mypagedao.suggestMyLikeDel(myLikeParam)>0?true:false;
	}
	
	@Override
	public boolean suggestMyLikeInsert(Map<String, Object> likeParam) throws SQLException {
		// TODO Auto-generated method stub
		return mypagedao.suggestMyLikeInsert(likeParam)>0?true:false;
	}
	
	@Override
	public boolean writeComment(Map<String, Object> commentParam) throws SQLException {
		// TODO Auto-generated method stub
		return mypagedao.writeComment(commentParam)>0?true:false;
	}
	
	@Override
	public List<Map<String, Object>> commentList(Map<String,Object> comListParam) throws SQLException {
		// TODO Auto-generated method stub
		return mypagedao.commentList(comListParam);
	}
	
	@Override
	public int suggestBbsCnt(Map<String, Object> searchParam) throws SQLException {
		// TODO Auto-generated method stub
		return mypagedao.suggestBbsCnt(searchParam);
	}
	
}
