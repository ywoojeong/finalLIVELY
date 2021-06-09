package com.a.mypage.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.a.dto.MemberDto;
import com.a.mypage.service.myPageService;

@RestController
public class myPageRestController {
	
	@Autowired
	myPageService myService;
	
	/*
	// 진행중인 챌린지 ajax로 보내기
	@RequestMapping(value = "memNowCntList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public List<Map<String, Object>> memNowCntList (Model model, String email) throws Exception{

		// 멤버 진행중인 챌린지 리스트
		List<Map<String, Object>> memNowCntList = myService.memNowCntList(email);
		System.out.println("진행중인 챌린지 리스트 데려오니 : " + memNowCntList);
		
		//model.addAttribute("memNowCntList", memNowCntList);
		
		return memNowCntList;
	}
	*/
	
	// 유저의 진행 전, 중, 후 챌린지 리스트를 데려옴
	@RequestMapping(value = "memChallList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public List<Map<String, Object>> memChallList (String name, HttpSession session) throws Exception{
		
		System.out.println(name);
		
		MemberDto memberInfo = (MemberDto)session.getAttribute("memberInfo");
		String email = memberInfo.getEmail();
		
		Map<String, Object> getChallInfo = new HashMap<String, Object>();
		getChallInfo.put("email", email);
		getChallInfo.put("name", name);
		
		List<Map<String, Object>> memList = myService.memChallList(getChallInfo);
		System.out.println(memList.toString());
		return memList;
	}
	
	// 유저의 데일리 챌린지 불러옴 (리스트로 불러오기)
	@RequestMapping(value = "memDailyChallList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public List<Map<String, Object>> memDailyChallList (String number, HttpSession session) throws Exception{
		System.out.println("number가 무엇일까 : " + number);
		
		MemberDto memberInfo = (MemberDto)session.getAttribute("memberInfo");
		String email = memberInfo.getEmail();
		
		Map<String, Object> getDailyChallInfo = new HashMap<String, Object>();
		getDailyChallInfo.put("email", email);
		getDailyChallInfo.put("number", number);
		
		List<Map<String, Object>> memDailyList = myService.memChallList(getDailyChallInfo);
		System.out.println(memDailyList.toString());
		
		return memDailyList;
	}
	
	// 제안하기 insert
	@RequestMapping(value = "writeSuggest.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String writeSuggest(@RequestParam Map<String,Object> param) throws Exception{
		System.out.println("param이 뭐니 : " + param.toString());
		
		boolean finished = myService.writeSuggest(param);
		String msg = "";
		if(finished) {
			msg="success";
		}else {
			msg="fail";
		}
		return msg;
	}
	
	// 좋아요 및 페이징 등등등 다 가지고 있는 애
	@RequestMapping(value = "suggestMyLike.do", method = {RequestMethod.GET, RequestMethod.POST})
	public List<Map<String, Object>> suggestMyLike(@RequestParam Map<String,Object> myLikeParam, HttpSession session) throws SQLException {
		
		System.out.println("myLikeParam -> " + myLikeParam);
		System.out.println(myLikeParam.toString());
		
		MemberDto memberInfo = (MemberDto)session.getAttribute("memberInfo");
		String email = memberInfo.getEmail();
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("email", email);
		
		int startPage = (Integer.parseInt((String)myLikeParam.get("page"))*5) + 1;
		int endPage = (Integer.parseInt((String)myLikeParam.get("page"))+1) *5;
//		int endPage = (startPage + 1)*5;
		param.put("startPage", startPage);
		param.put("endPage", endPage);
		
		List<Map<String, Object>> suggestList = myService.suggestList(param);
		System.out.println("suggestList :" + suggestList.toString());
		/*
		boolean likeDel = myService.suggestMyLikeDel(myLikeParam);
		System.out.println("myLikeParam : " + myLikeParam);
		*/
		return suggestList;
	}
	
	// 좋아요 delete
	@RequestMapping(value = "suggestMyLikeDel.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String suggestMyLikeDel(@RequestParam Map<String,Object> myLikeParam, HttpSession session) throws SQLException {
		System.out.println("myLikeParam -> " + myLikeParam);
		System.out.println(myLikeParam.toString());
		
		boolean likeDel = myService.suggestMyLikeDel(myLikeParam);
		System.out.println("myLikeParam : " + myLikeParam);
		String msg = "";
		if(likeDel) {
			msg="success";
		}else {
			msg="fail";
		}
		return msg;
	}
	
	// 좋아요 insert
	@RequestMapping(value = "suggestMyLikeInsert.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String suggestMyLikeInsert(@RequestParam Map<String,Object> likeParam, HttpSession session) throws SQLException {
		System.out.println("myLikeParam -> " + likeParam);
		System.out.println(likeParam.toString());
		
		boolean likeInsert = myService.suggestMyLikeInsert(likeParam);
		System.out.println("likeParam : " + likeParam);
		String msg = "";
		if(likeInsert) {
			msg="success";
		}else {
			msg="fail";
		}
		return msg;
	}
	
	// 댓글 insert
	@RequestMapping(value = "writeComment.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String writeComment(@RequestParam Map<String,Object> commentParam) throws SQLException {
		System.out.println("commentParam -> " + commentParam);
		System.out.println(commentParam.toString());
		
		boolean commentInsert = myService.writeComment(commentParam);
		System.out.println("commentParam : " + commentParam);
		String msg = "";
		if(commentInsert) {
			msg="success";
		}else {
			msg="fail";
		}
		return msg;
	}

	// 댓글 데려오기
	@RequestMapping(value = "commentList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public List<Map<String, Object>> commentList(int suggestbbsseq) throws SQLException {
		
		System.out.println("tydgjgjhgsuggestbbsseq :" + suggestbbsseq);
		
		/*
		 * Map<String, Object> param = new HashMap<String, Object>(); param.put("email",
		 * email); System.out.println("commentList param:" + param);
		 */
		List<Map<String, Object>> commentList = myService.commentList(suggestbbsseq);
		System.out.println("commentList :" + commentList.toString());
		
		return commentList;
	}
	
	// 제안하기 게시글 총 수 가져오기
	@RequestMapping(value = "suggestListPage.do", method = {RequestMethod.GET, RequestMethod.POST})
	public int suggestBbsCnt(@RequestParam Map<String,Object> searchParam) throws SQLException {
		System.out.println("searchParam ---- " + searchParam);
		
		int suggestBbsCnt = myService.suggestBbsCnt(searchParam);
		System.out.println("전체 제안하기 총 수 :" + searchParam);
		
		return suggestBbsCnt;
	}

}
