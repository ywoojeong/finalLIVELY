package com.a.manager.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class managerDaoImpl implements managerDao{

	
	@Autowired
	SqlSession managerSql;
	
	String ns = "manager.";
	
	@Override
	public List<Map<String, Object>> managerList(Map<String, Object> mListParam) throws SQLException {
		// TODO Auto-generated method stub
		System.out.println("mListParam===========>"+mListParam);
		return managerSql.selectList("manager.managerList", mListParam);
	}
	
	@Override
	public List<Map<String, Object>> memberCntList(Map<String, Object> memListParam) throws SQLException {
		// TODO Auto-generated method stub
		System.out.println("memListParam********>"+memListParam);
		return managerSql.selectList("manager.memberCntList", memListParam);
	}
	
	@Override
	public Map<String, Object> memberData(String email) throws SQLException {
		// TODO Auto-generated method stub
		return managerSql.selectOne("manager.memberData", email);
	}
	
	
	//회원 정지
	@Override
	public int memberStop(Map<String, Object> param) throws SQLException{
		// TODO Auto-generated method stub
		return managerSql.update("manager.memberStop", param);
	}
	@Override
	public int memberPlay(Map<String, Object> param) throws SQLException {
		// TODO Auto-generated method stub
		System.out.println("memberPlay  ********>"+param);
		return managerSql.update("manager.memberPlay", param);
	}
	
	//챌린지 정지
	@Override
	public int challStop(Map<String, Object> param) throws SQLException {
		// TODO Auto-generated method stub
		System.out.println("challStop  ********>"+param);
		return managerSql.update("manager.challStop", param);
	}
	@Override
	public int challPlay(Map<String, Object> param) throws SQLException {
		// TODO Auto-generated method stub
		System.out.println("challPlay  ********>"+param);
		return managerSql.update("manager.challPlay", param);
	}
	
	
   //민선 부분
   @Override
   public int userAllCount() {
      // TODO Auto-generated method stub
      return managerSql.selectOne(ns+"userAllCount");
   }

   @Override
   public int challengeAllCount() {
      // TODO Auto-generated method stub
      return managerSql.selectOne(ns+"challengeAllCount");
   }

   @Override
   public List<Map<String, Object>> challengeAdd() {
      // TODO Auto-generated method stub
      return managerSql.selectList(ns+"challengeAdd");
   }

   @Override
   public List<Map<String, Object>> challengeCategory() {
      // TODO Auto-generated method stub
      return managerSql.selectList(ns+"challengeCategory");
   }

   @Override
   public List<Map<String, Object>> challengeMemberMax() {
      // TODO Auto-generated method stub
      return managerSql.selectList(ns+"challengeMemberMax");
   }

   @Override
   public List<Map<String, Object>> userAdd() {
      // TODO Auto-generated method stub
      return managerSql.selectList(ns+"userAdd");
   }

   @Override
   public List<Map<String, Object>> userFollowingMax() {
      // TODO Auto-generated method stub
      return managerSql.selectList(ns+"userFollowingMax");
   }

   @Override
   public List<Map<String, Object>> userPointMax() {
      // TODO Auto-generated method stub
      return managerSql.selectList(ns+"userPointMax");
   }



   @Override
   public List<Map<String, Object>> challengeIdentifyMax() {
      // TODO Auto-generated method stub
      return  managerSql.selectList(ns+"challengeIdentifyMax");
   }



   @Override
   public List<Map<String, Object>> userIdentify() {
      // TODO Auto-generated method stub
      return managerSql.selectList(ns+"userIdentify");
   }
   
   

   
}