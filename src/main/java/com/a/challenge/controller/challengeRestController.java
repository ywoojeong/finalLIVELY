package com.a.challenge.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.text.StyledEditorKit.BoldAction;

import org.apache.ibatis.annotations.Param;
import org.apache.tiles.request.collection.KeySet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.a.challenge.service.challengeService;
import com.a.dto.MemberDto;
import com.a.dto.challengeDto;
import com.a.util.FileManagement;


@RestController
public class challengeRestController {

	@Autowired
	challengeService service;
	
	@Autowired
	private FileManagement fileManagement;
	
	//챌린지 insert
	@RequestMapping(value = "challengeInsert.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String challengeInsert(challengeDto dto, String dateWeek[], @RequestParam("uploadFile")  MultipartFile uploadFile,  @RequestParam("uploadFileCer")  MultipartFile uploadFileCer, HttpServletRequest req) throws Exception{
		System.out.println("챌린지 파일이 받아와 지나요?:"+uploadFile);
		System.out.println("파일이 받아와지나요?(인증방법) : "+ uploadFileCer);
		String dateStr = Arrays.toString(dateWeek);
		dateStr = dateStr.substring(1, dateStr.length()-1);
		System.out.println(dateStr);
		
		if(!uploadFile.isEmpty()){
			String filename = uploadFile.getOriginalFilename();
			String saveFileName=fileManagement.FileUploader(uploadFile);
			System.out.println("전체 파일파일 이름:"+filename+" "+"암호화 파일 이름 : "+ saveFileName);
			dto.setChallengephoto(filename);
			dto.setChallengesavephoto(saveFileName);			
		}else {
			dto.setChallengephoto("0");
			dto.setChallengesavephoto("0");	
		}
		
		if(!uploadFileCer.isEmpty()){
			String certifyfilename = uploadFileCer.getOriginalFilename();
			String certifysaveFileName=fileManagement.FileUploader(uploadFileCer);
			System.out.println("인증방법 파일 이름:"+certifyfilename+" "+"암호화 파일 이름 : "+ certifysaveFileName);
			dto.setCertifyphoto(certifyfilename);
			dto.setCertifysavephoto(certifysaveFileName);
		}else {
			dto.setCertifyphoto("0");
			dto.setCertifysavephoto("0");	
		}
		
		if(dto.getCertify()==null || dto.getCertify().equals("")) {
			dto.setCertify("none");
		}
		
		dto.setIdentifyday(dateStr);
	
		System.out.println("요일 들어간거String "+dateStr);
		System.out.println(dto.toString());
		
		boolean success = service.challengeInsert(dto);
		System.out.println("insert되었냐? : "+success);
		
		String msg ="";
		if(success) {
			msg = "SUCCESS";
		}else {
			msg="FAIL";
		}
		return msg;
	}
	
	//hotChallenge 뿌리기 hotChallengeData.do
	@RequestMapping(value = "hotChallengeData.do", method = {RequestMethod.GET, RequestMethod.POST})
	public List<Map<String, Object>> hotChallengeData(@RequestParam Map<String,Object> searchParam) throws Exception{
		System.out.println("hotChallengeData 들어갔다고 얘기해!");
		System.out.println(searchParam.toString());
 		//paging 처리
		int sn = Integer.parseInt(searchParam.get("nowpageNumber").toString());
		int startPage = sn * 9 + 1;	//1  9
		int endPage = (sn+1) * 9; 		//10 20
 
		searchParam.put("startPage", startPage);
		searchParam.put("endPage", endPage);
		System.out.println("가기전 searchParam"+searchParam.toString());
		
		 List<Map<String, Object>> challengeList = service.hotChallengeData(searchParam);

		 System.out.println("갔다온 리스트 : "+challengeList.toString());

	 return challengeList;
	}
	
	//newChallenge 뿌리기 newChallengeData.do
	@RequestMapping(value = "newChallengeData.do", method = {RequestMethod.GET, RequestMethod.POST})
	public List<Map<String, Object>> newChallengeData(@RequestParam Map<String,Object> searchParam) throws Exception{
		System.out.println("newChallengeData 들어갔다고 얘기해!");
		System.out.println(searchParam.toString());
 		//paging 처리
		int sn = Integer.parseInt(searchParam.get("nowpageNumber").toString());
		int startPage = sn * 9 + 1;	//1  9
		int endPage = (sn+1) * 9; 		//10 20
 
		searchParam.put("startPage", startPage);
		searchParam.put("endPage", endPage);
		System.out.println("가기전 searchParam"+searchParam.toString());
		
		 List<Map<String, Object>> challengeList = service.newChallengeData(searchParam);

		 System.out.println("갔다온 리스트 : "+challengeList.toString());

	 return challengeList;
	}
	
	//challengeDataCount 글의 총 수 가져오기 paramMap search / category
	@RequestMapping(value = "challengeDataCount.do", method = {RequestMethod.GET, RequestMethod.POST})
	public int challengeDataCount(@RequestParam Map<String,Object> searchParam) throws Exception{
		System.out.println("challengeDataCount 들어갔다고 얘기해!");
		System.out.println(searchParam.toString());
		
		int challengeCount = service.challengeDataCount(searchParam);
		System.out.println("전체 글의 총 수  challengeDataCount:"+challengeCount);
			
		return challengeCount;
	}
	
	//challengeReviewInsert 리뷰작성데이터
	@RequestMapping(value = "challengeReviewInsert.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String challengeReviewInsert(@RequestParam Map<String,Object> revParam) throws Exception{
		System.out.println(revParam.toString());
		boolean success = service.challengeReviewInsert(revParam);
		String msg = "";
		if(success) {
			msg="SUCCESS";
		}else {
			msg="FAIL";
		}
		return msg;
	}
	
	//챌린지 찜하기 challengelikeInsert
	@RequestMapping(value = "challengelikeInsert.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String challengelikeInsert(@RequestParam Map<String,Object> likeData) throws Exception{
		
		boolean success = service.challengelikeInsert(likeData);
		String msg = "";
		if(success) {
			msg="SUCCESS";
		}else {
			msg="FAIL";
		}
		return msg;
	}
	
	//챌린지 찜하기 challengelikeDelete
		@RequestMapping(value = "challengelikeDelete.do", method = {RequestMethod.GET, RequestMethod.POST})
		public String challengelikeDelete(@RequestParam Map<String,Object> likeData) throws Exception{
			
			boolean success = service.challengelikeDelete(likeData);
			String msg = "";
			if(success) {
				msg="SUCCESS";
			}else {
				msg="FAIL";
			}
			return msg;
		}
		
		//challengeMemberInsert챌린지 멤버 넣기
		@RequestMapping(value = "challengeMemberInsert.do", method = {RequestMethod.GET, RequestMethod.POST})
		public String challengeMemberInsert(@RequestParam Map<String,Object> memParam) throws Exception{
		
			String msg = "";
			System.out.println(memParam.toString());
			//포인트 차감
			//포인트가 없으면?
			String email = String.valueOf(memParam.get("email"));
			int point = Integer.parseInt(String.valueOf(memParam.get("point")));
			int challengeseq = Integer.parseInt(String.valueOf(memParam.get("challengeseq")));
			
			MemberDto mem = service.userData(email);
			
			if(mem.getPoint()>=point) {
				//챌린지 멤버 넣기
				boolean success = service.challengeMemberInsert(memParam);
				//포인트 차감
				boolean pointS = service.memberPointReducation(memParam);
				System.out.println("포인트 차감이 성공했나요?? "+pointS);
				//챌린지 전체인원 수 +1
				boolean countUp = service.challengeMemberCountUp(challengeseq);
				System.out.println("멤버전체인원증가 성공했나요?? "+countUp);
								
				if(success) {
					msg = "SUCCESS";
				}else {
					msg = "FAIL";
				}		
			}else {				
				msg="POINTFAIL";
			}	
		 return msg;	
		}
		
		//팔로우 넣기 followInsert
		@RequestMapping(value = "followInsert.do", method = {RequestMethod.GET, RequestMethod.POST})
		public String followInsert(@RequestParam Map<String,Object> followParam) {
			System.out.println(followParam.toString());
			
			boolean success = service.followInsert(followParam);
			
			String msg = "";
			if(success) {
				msg = "SUCCESS";
			}else {
				msg = "FAIL";
			}		
		
			return msg;	
			
		}
		
		//팔로우 삭제 followDelete
		@RequestMapping(value = "followDelete.do", method = {RequestMethod.GET, RequestMethod.POST})
		public String followDelete(@RequestParam Map<String,Object> followParam) {
			//System.out.println(followParam);
			System.out.println(followParam.toString());
			
			boolean success = service.followDelete(followParam);
			
			String msg = "";
			
			if(success) {
				msg = "SUCCESS";
			}else {
				msg = "FAIL";
			}		
		
			return msg;	
		}
		
		
		//후기 좋아요 업데이트 challengeReviewLike  
		@RequestMapping(value = "commentLike.do", method = {RequestMethod.GET, RequestMethod.POST})
		public String commentLike(@RequestParam Map<String,Object> likeParam) {
			System.out.println(likeParam);
			
			//commentLikeCheck
			
			
			
			int chalcomseq =  Integer.parseInt(likeParam.get("chalcomseq").toString());
			
			boolean success = service.commentLike(likeParam);
			
			String msg = "";
			
			if(success) {
				boolean s = service.challengeReviewLike(chalcomseq);
				System.out.println("아성공인가요? "+s);
				msg = "SUCCESS";
			}else {
				msg = "FAIL";
			}		
		
			return msg;	
		
		}
		//후기 좋아요 해제 challengeReviewUnLike
		@RequestMapping(value = "commentLikeDel.do", method = {RequestMethod.GET, RequestMethod.POST})
		public String commentLikeDel(@RequestParam Map<String,Object> likeParam) {
			
			int chalcomseq =  Integer.parseInt(likeParam.get("chalcomseq").toString());
			//System.out.println(followParam);
			boolean success = service.commentLikeDel(likeParam);
			
			String msg = "";
			
			if(success) {
				boolean s = service.challengeReviewUnLike(chalcomseq);
				System.out.println("1빼는게 성공인가요? "+s);
				msg = "SUCCESS";
			}else {
				msg = "FAIL";
			}		
		
			return msg;	
		
		}
		
		//후기 전체 데이터 가져오기 challengereviewAll
		@RequestMapping(value = "challengereviewAll.do", method = {RequestMethod.GET, RequestMethod.POST})
		public List<Map<String, Object>> challengereviewAll(@RequestParam Map<String,Object> revParam){
			System.out.println(revParam.toString());
			
			List<Map<String, Object>> revAll = service.challengereviewAll(revParam);
			
			if(revParam.get("email") !=null) {
				
				int likeC = 0;
				
				for(Map<String, Object> item : revAll){
					/* 매 루프마다 "item"(List 배열의 한개 항목) 가 가지고 있는 맵 엔트리(Entry) 개수 만큼 루프문 실행 */
					for(Map.Entry<String, Object> review: item.entrySet()){
						/*맵 엔트리 키(key) 저장*/
						String key = review.getKey();
						
						/*맵 엔트리에 값(value) 저장*/
						Object value = review.getValue();
					
						/*키(key)값이 "NAME" 인 엔트리(Entry)의 경우 myValue 에 값(value)을 저장*/
	
						if(key.equals("chalcomseq")){
							int chalcomseq = Integer.parseInt(value.toString());
							Map<String, Object> likeParam = new HashMap<String, Object>();
							likeParam.put("email", revParam.get("email"));
							likeParam.put("chalcomseq", chalcomseq);
							likeC = service.commentLikeCheck(likeParam);
						}	
					}
					item.put("likecheck",likeC);
				}	
			}
			System.out.println(revAll.toString());
			return revAll;
		}	
		
		//챌린지 멤버 가져오기 
		@RequestMapping(value = "challengeAll.do", method = {RequestMethod.GET, RequestMethod.POST})
		public List<Map<String, Object>> challengeAll(int challengeseq){
		
			List<Map<String, Object>> challengeMember = service.challengeAllMember(challengeseq);
			return challengeMember;
		}
		
		//인증방법 insert indentifyInsert
		@RequestMapping(value = "insertIdentify.do", method = {RequestMethod.GET, RequestMethod.POST})
		public String insertIdentify(@RequestParam Map<String,Object> identParam, @RequestParam("uploadFile")  MultipartFile uploadFile){
			System.out.println("인증방법 파일이 받아와 지나요?:"+identParam.toString());
			
			try {
			String filename = uploadFile.getOriginalFilename();
			String saveFileName = fileManagement.FileUploader(uploadFile);
			identParam.put("certifyPhoto", filename);
			identParam.put("certifyPhotoname", saveFileName);
			
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("데이터 들어갔나요?:"+identParam.toString());
			String msg = "";
			boolean success = service.identifyInsert(identParam);
			
			if(success) {	
				boolean succ = service.identifyUpdate(identParam);
				System.out.println("인증 업데이트가 되었나요?? "+succ);
				msg = "SUCCESS";
			}else {
				msg = "FAIL";
			}		
			return msg;	
		}
		
		//추천하기 4개뿌리기 ChoiceTodayStart
		@RequestMapping(value = "ChoiceTodayStart.do", method = {RequestMethod.GET, RequestMethod.POST})
		public List<Map<String, Object>> ChoiceTodayStart(){
			
			List<Map<String, Object>> ChoiceTodayStart = service.ChoiceTodayStart();
			
			return ChoiceTodayStart;

		}
		
		//제안하기에서 만들어진 4개 뿌리기
		@RequestMapping(value = "ChoiceSuggestChallenge.do", method = {RequestMethod.GET, RequestMethod.POST})
		public List<Map<String, Object>> ChoiceSuggestChallenge(){
			
			List<Map<String, Object>> choiceSuggestChallenge = service.ChoiceSuggestChallenge();
			
			return choiceSuggestChallenge;

		}
		
		
		//결과값 넘겨주기(100퍼센트 시 2배 / 85퍼센트이상 시 1.5배  / 이하면 차감)
		
		
		
		//챌린지 업데이트 challengeUpdate
		@RequestMapping(value = "challengeUpdateData.do", method = {RequestMethod.GET, RequestMethod.POST})
		public String challengeUpdateData(@RequestParam Map<String,Object> challParam, String dateWeek[], @RequestParam("uploadFile")  MultipartFile uploadFile,  @RequestParam("uploadFileCer")  MultipartFile uploadFileCer)  throws Exception{
			
			System.out.println("챌린지 파일이 받아와 지나요?:"+uploadFile);
			System.out.println("파일이 받아와지나요?(인증방법) : "+ uploadFileCer);
			String dateStr = Arrays.toString(dateWeek);
			dateStr = dateStr.substring(1, dateStr.length()-1);
			System.out.println(dateStr);
			
			if(!uploadFile.isEmpty()){
				String filename = uploadFile.getOriginalFilename();
				String saveFileName=fileManagement.FileUploader(uploadFile);
				System.out.println("전체 파일파일 이름:"+filename+" "+"암호화 파일 이름 : "+ saveFileName);
				challParam.put("challengephoto", filename);
				challParam.put("challengesavephoto", saveFileName);		
			}else {
				challParam.put("challengephoto", "0");
				challParam.put("challengesavephoto", "0");		
			}
			
			if(!uploadFileCer.isEmpty()){
				String certifyfilename = uploadFileCer.getOriginalFilename();
				String certifysaveFileName=fileManagement.FileUploader(uploadFileCer);
				System.out.println("인증방법 파일 이름:"+certifyfilename+" "+"암호화 파일 이름 : "+ certifysaveFileName);
				challParam.put("certifyphoto", certifyfilename);
				challParam.put("certifysavephoto", certifysaveFileName);		
			}else {
				challParam.put("certifyphoto", "0");
				challParam.put("certifysavephoto", "0");		
			}
			challParam.put("identifyday", dateStr);	
		
			System.out.println("요일 들어간거String "+dateStr);
			System.out.println(challParam.toString());
			
			boolean success = service.challengeUpdate(challParam);
			System.out.println("update되었냐? : "+success);
			
			String msg ="";
			if(success) {
				msg = "SUCCESS";
			}else {
				msg="FAIL";
			}
			return msg;
		}
			
		
		//pointUpdate
		@RequestMapping(value = "pointUpdate.do", method = {RequestMethod.GET, RequestMethod.POST})
		public String pointUpdate(@RequestParam Map<String,Object> pointParam){
			
			int userpercent = Integer.parseInt(pointParam.get("userpercent").toString());
			int point = Integer.parseInt(pointParam.get("point").toString());
			int pointUpdate = 0;
			String msg = "";
			boolean success = true;
			if(userpercent==100) {
				pointParam.put("point", point*2);	
			}else if(userpercent>= 85 && userpercent<100) {
				pointParam.put("point", point*1.5);
			}
			System.out.println("pointparam은 뭐요"+pointParam.toString());
			success = service.pointUpdate(pointParam);
			if(success) {
				msg="SUCCESS";
			}else {
				msg="FAIL";
			}
			return msg;
		}
		
		//챌린지 채팅 해당 챌린지만
		
}
