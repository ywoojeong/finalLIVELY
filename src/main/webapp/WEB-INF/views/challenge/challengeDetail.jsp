<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="./css/challengeDetail.css" />
<link rel="stylesheet" href="./css/starRate/starRate.css" />
<!-- core tag -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- format 사용시 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- jsp태그 -->
<jsp:useBean id="now" class="java.util.Date" />
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:parseDate var='start' value="${challDto.challengestart}" pattern="yyyy-MM-dd"/>
<fmt:parseDate var='end' value="${challDto.challengeend}" pattern="yyyy-MM-dd"/>

<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">

<canvas id="canvas" style="z-index:25410;pointer-events: none;position: fixed;top: 0;transform: scale(1.1);"></canvas>

<script>
$(document).ready(function(){
// 	console.log( '${user.email}' == '${identifyResultUser.email}')	
	let user = '${user.email}';
	let result = '${identifyResultUser.email}';
			 if(user != "" && user == result){
				 $("#resultDiv").hide();
			 }	
			 
	 if('${challDto.challengesavephoto}' == '0'){
		 document.getElementById("_backDiv").style.background = "url('./image/challenge1.png')";
	}else{
		 document.getElementById("_backDiv").style.backgroundImage = "url('https://s3.ap-northeast-2.amazonaws.com/livelybucket/${challDto.challengesavephoto }')";
	}	
	 
	 var currentPosition = parseInt($(".quickmenu").css("top")); 
	 $(window).scroll(function() { 
		 var position = $(window).scrollTop(); 
	 	$(".quickmenu").stop().animate({"top":position+currentPosition+"px"},500);
	 });
	 
	 
	let action =  function reAction(){
	  	$("#startButton").trigger("click");
	  	setTimeout(function(){
	  		$("#stopButton").trigger("click");
	  	}, 3000);
	  }

	
	  
});

console.log("받아온 데이터야라리ㅏ너롬리"+"${challMem.email}"+"dsfdsafd팔로잉되엇냐?"+"${challengeMember}"+"dsFdfdsgfsg"+"${reviewResult}")
console.log("아오얘왜이래!  "+'${identifycheck}'+"챌위시? challWish"+"${challWish}")
console.log("결과 데이터 함 볼까?! challengeResult "+'${challengeResult}'+ "   "+ "${fn:length(challengeResult)}")
console.log("전체 결과 데이터 challResultAllOne"+"${challResultAllOne}")
console.log("나만의 데이터 identifyResultUser"+"${identifyResultUser}")

console.log("인증 데이터 identify"+"${identify}")
console.log("몇명인데 유저"+'${fn:length(challengeMember)}')
console.log("비교가 되나?  ${now}<${start}")
</script>

<c:forEach var="challUser" items="${challengeMember}" varStatus="status">
	<c:if test="${user.email != null && challUser.email==user.email}">
		<a class="quickmenu" style="position:absolute;width:90px;top:25%;padding:30px;right:10%;background:#000;"  data-toggle="modal" data-target="#myModal5"></a>
	</c:if>
</c:forEach>


<div class="backDiv" id="_backDiv">
	<div class="container challHeader" style="padding-left: 35px;">
		<div>
			<h1 style="font-weight: 600;">${challDto.challengetitle}
				<c:if test="${user.email != null && challDto.limitdate>=0 && challMem.email == null}">
					<button type="button" class="btn challStartBtn" data-toggle="modal" data-target="#myModal3">START JOIN</button>
				</c:if>

					<a data-toggle='popover' data-trigger='hover' data-content='인증 사진을 올리세요.'>
						<span id="identifyBtn">
<!-- 							<img data-toggle='modal' data-target='#myModal4' src='image/identify.svg' style='height: 48px;margin-top: -8px;margin-left: 15px' onmouseover=\"this.src='image/identifyhover.svg'\" onmouseout=\"this.src='image/identify.svg'\"> -->
						</span>
					</a>
					
						
				
				</h1>
				<c:forEach var="challUser" items="${challengeMember }">
					<c:if test="${identifyResultUser.email != null && challUser.success eq 0 && user.email eq challUser.email}">
						<span class="chall-buttons"> 
							<button type="button" class="chall-btn-hover" style="margin: 3px 0 0 0; background-image: linear-gradient(to right, #ffd622, #8b63da, #8b63da, #ffd622);opacity:95%;box-shadow: 0 4px 15px 0 rgba(116, 79, 168, 0.75);margin-right: 10px"  data-toggle="modal" id="startButton" data-target="#myModal6">보 상 받 기</button>
						</span>	
					</c:if>
				</c:forEach>
<%-- 
 				<c:forEach var="challUser" items="${challengeMember}" varStatus="status">
 					<c:if test="${user.email != null && challUser.email==user.email}">
 						<a href="#" data-toggle="popover" data-trigger="hover"	data-content="인증 사진을 올리세요."> 
 							<img data-toggle="modal" data-target="#myModal4" src="image/identify.svg" style="height: 48px;margin-top: -8px;margin-left: 15px" onmouseover="this.src='image/identifyhover.svg'" onmouseout="this.src='image/identify.svg'">
 						</a>	
 					</c:if>		 
 				</c:forEach>  --%>
			
			<span style="display: flex">
				<c:if test="${user.email != null && user.email == challDto.email && now<start}">
					  <a href="#" data-toggle="popover" data-trigger='hover' data-placement="left" data-content="챌린지를 수정하세요">
					<img src="image/modify.png" style="width:56px;margin-right: 25px" onclick="challengeUpdate(${challDto.challengeseq})" onmouseover="this.src='image/modifyhover.png'" onmouseout="this.src='image/modify.png'">
					</a>
				</c:if>
	
				<a href="#" data-toggle="popover" data-trigger="hover"	data-content="챌린지를 찜하세요" style="margin-right: 30px;">
					 <c:choose>
						<c:when test="${user.email != null && challWish.email eq null}">
							<div id="likeChallenge">
								<img onclick="checkChallenge()" class="checkImg" src="image/check.svg"	onmouseover="this.src='image/checkhover.svg'" onmouseout="this.src='image/check.svg'">
							</div>
						</c:when>
						<c:when
							test="${user.email != null && user.email eq challWish.email}">
							<div id="likeChallenge">
								<img onclick="checkDelChallenge()" src='image/checkFill.svg'
									class='checkImg'>
							</div>
						</c:when>
					</c:choose>
				</a>
			</span>
		</div>

		<p id="limitD"></p>
		<label id="_category" style="background-color:rgba(0,0,0,0.5);color: white;"></label></label><label>${challDto.identifydayS }</label><label>${challDto.challengeperiod }주동안</label><span class="period" id="periodDate"></span><br>
		 <span	class="explain">${challDto.identifydayS } ${challDto.challengeperiod }주동안, 하루에 1번 ${challDto.identifytime}시에 인증해야 합니다.</span>
		 
	</div>
</div>

<div class="container" style="padding:0 0px 50px 0;box-shadow: 0px 30px 19px 8px rgb(0 0 0 / 10%);">
	<table class="attend" style="margin-left: 35px">
		<col width="30px">
		<col width="100px">
		<col width="300px">
		<tr>
			<td><i class="fas fa-coins"></i></td>
			<td>참가 포인트</td>
			<td>${challDto.pointcount }point</td>
		</tr>
		<tr>
			<td><i class="fas fa-user"></i></td>
			<td>참가 인원</td>
			<td><span style="padding-right: 50px;">${challDto.challengemember }명</span>
				<c:choose>
					<c:when	test="${challengeMember != null && fn:length(challengeMember) <= 5}">
						<c:forEach var="challUser" items="${challengeMember}"
							varStatus="status">
							<img class="userWrap"
								src="https://s3.ap-northeast-2.amazonaws.com/livelybucket/${challUser.memberphotoname }"
								onerror="this.src='image/user_80px.jpg'">
						</c:forEach>
					</c:when>
					<c:when
						test="${challengeMember != null && fn:length(challengeMember) >= 5 }">
						<c:forEach var="challUser" items="${challengeMember}" begin="0"	end="5">
							<img class="userWrap"
								src="https://s3.ap-northeast-2.amazonaws.com/livelybucket/${challUser.memberphotoname }"
								onerror="this.src='image/user_80px.jpg'">
						</c:forEach>
					</c:when>
				</c:choose> 
				<a class="modalBtn" data-toggle="modal" data-target="#myModal">
					<i style="color: #cfcbd2" class="fas fa-angle-right"></i></a>
			</td>
		</tr>
	</table>	
	
	<hr class="one" style="margin-bottom: 0">
	<label class="challengetext" >챌린지 소개</label>
	<div class="challengetextMain" style="margin-left: 40px;margin-right: 60px">${challDto.challengetext }</div>
	
	<!-- 참가 설명 -->
	<div class="row pointExplain">
		<div class="col-sm-6" style="margin-top:5px;margin-bottom: 7px;padding-left: 40px">
			<table>
				<col width="200px">
				<col width="300px">
				<tr>
					<td><span class="highlight">100% 성공</span></td>
					<td><span class="highlight">참가 포인트 X2배</span></td>
				</tr>
				<tr>
					<td>85%이상 성공</td>
					<td>참가포인트 X1.5배</td>
				</tr>
				<tr>
					<td>85%미만 성공</td>
					<td>참가포인트 차감</td>
				</tr>
			</table>
		</div>
		<div class="col-sm-6" style="margin-top:5px;margin-bottom: 5px">
			<label>챌린지 인증 시간</label>
			<p>
				<span class="highlight timeData"></span>에 이미지를 올려주세요
			</p>
		</div>
	</div>
	<!-- 챌린지 인증방법 -->
	<div class="certify">
		<div class="row">
			<div class='col-sm-8'>
				<label class="challengetext">챌린지 인증방법</label>
	
					<div class="row" style="display: flex;margin-left: 30px">
						<c:if test="${challDto.certifysavephoto != '0' }">
							<div class="col-sm-5">
								<img src="https://s3.ap-northeast-2.amazonaws.com/livelybucket/${challDto.certifysavephoto }"
								style="width: 300px">
							</div>
						</c:if>
						<div class="col-sm-7" style="padding-left: 30px; width: 350px">
							<c:choose>
								<c:when test="${challDto.certify eq 'none'}">
		      						자유롭게 인증해 주세요.
		   						 </c:when>
								<c:otherwise>
		      						${challDto.certify }
		   						 </c:otherwise>
							</c:choose>
						</div>
					</div>
		
			</div>
			<div class='col-sm-4 d-none d-sm-block' style="padding-left: 0">
				<c:if test="${fn:length(identify) != 0}">
					<label class="challengetext" style="margin-left: -56px">나의 인증 현황</label>
				</c:if>
				<div>
					<div class='row'>
						<c:choose>
							<c:when	test="${identify != null && fn:length(identify) <= 12}">
								<c:forEach var="identify" items="${identify}" varStatus="status">
									<div class='col-sm-3' style="padding: 0 8px 16px 8px">
										<img class='identifyImg' src='https://s3.ap-northeast-2.amazonaws.com/livelybucket/${identify.certifyphotoname }'>
									</div>
								</c:forEach>
							</c:when>
							<c:when	test="${identify != null && fn:length(identify) >= 12 }">
								<c:forEach var="identify" items="${identify}" begin="0"	end="11">
									<div class='col-sm-3' style="padding: 0 8px 16px 8px">
										<img class='identifyImg' src='https://s3.ap-northeast-2.amazonaws.com/livelybucket/${identify.certifyphotoname }'>
									</div>
								</c:forEach>
								<a href='#'>이미지 모아보기</a>
							</c:when>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</div>
	<hr class="one" style="margin-top: 30px">
	<!-- 주의사항 -->
	<div class="precautions" style="padding: 15px 0;margin-top: 17px;background-color:#e9e9eaff ">
		<label class="challengetext" style="margin-top: 0;margin-left: 9px">챌린지 주의사항</label>
		<table style="margin-left: 53px">
			<col width="200px">
			<col width="300px">
			<tr>
				<td style="font-weight: 500;">인증 가능 요일</td>
				<td>
					<ul id="idendate">
						<li>일</li>
						<li>월</li>
						<li>화</li>
						<li>수</li>
						<li>목</li>
						<li>금</li>
						<li>토</li>
					</ul>
				</td>
			</tr>
			<tr>
				<td style="font-weight: 500;">인증 빈도</td>
				<td>${challDto.identifydayS }</td>
			</tr>
			<tr>
				<td style="font-weight: 500;">하루 인증 횟수</td>
				<td>1회</td>
			</tr>
			<tr>
				<td style="font-weight: 500;">인증 활성 시간</td>
				<td>5분</td>
			</tr>
		</table>
	</div>
	<hr class="one" style="border-color: rgba(166,166,166,0.3)">

	<!--//////////////////////////////// 탭 부분  /////////////////////////////// -->
	<div class="headerC" style="text-align: center;padding: 47px 0 46px 0;">
 		<h5>CHALLENGE ACTIVITY</h5>
 		<p>Participate our challenge</p>
 	</div> 	
 	

	<!-- 메인 탭부분 -->
	<div class="main">
		<!-- Nav pills -->
		<ul class="nav nav-pills" role="tablist">
			<li class="nav-item" style="margin-right: 30px"><a class="nav-link active" id="resultNav"
				data-toggle="pill" href="#home">현재 결과</a></li>
			<li class="nav-item" style="margin-right: 30px"><a class="nav-link" id="reviewNav"
				data-toggle="pill" href="#category1">후 기</a></li>
		</ul>
	
		<!-- Tab panes -->
		<div class="tab-content">
			<!-- 현재 결과 -->
	
			<div id="home" class="container tab-pane active">
					<hr class="one">
				<c:if test="${challResultAllOne == null && fn:length(challengeMember) == 0}">
					<div class="noneData">
						<h3>참가 인원이 없습니다. 챌린지에 참가해서 활동해 보세요.</h3>
					</div>	
				</c:if>
				<c:if test="${fn:length(challengeMember) > 0}">
					<div style="width: 100%;background-color: #f2f2f2;padding: 30px 0" id="resultDiv">
						<div class="row" style="    background-color: white;width: 900px;margin: 0 auto;border: 1px solid rgba(207, 203, 210,0.5);padding: 21px;box-shadow: 0px 0px 10px 5px rgb(0 0 0 / 10%);border-radius: 10px;" >
							<div class="col-sm-6" style="width: 400px;margin: 0 auto 20px auto;">
								<canvas id="totalChart" width="400" height="400"></canvas>
							</div>
							<div class="col-sm-6" style="display: flex;flex-direction: column;justify-content: center;padding-left: 18px">
								<h2 style="margin-bottom: 40px;width:400px;text-align: center;font-weight: 700;letter-spacing: 2px;">얼마나 달성되었나요?</h2>
								<div style="position: relative;width: 200px">
									<div style="left: 100%;width: 200px;background-color: #8b63da;height: 35px"></div>
										<h5 style="margin: 20px 0  5px 0;font-size: 13pt;font-weight: 600;">인증 완료</h5>
										<div style="width: 180px;font-size: 11pt;color: rgba(0,0,0,0.7);">해당 챌린지는 현재까지 <span style='font-weight: 600'>${challResultAllOne.certicount }회</span> 성공하였습니다.</div>
									<div style="position: absolute;left: 100%;top:0%;width: 200px">
										<div style="width: 200px;background-color: #fbc2eb;height: 35px"></div>
										<h5 style="margin: 20px 0  5px 0;font-size: 13pt;font-weight: 600;">인증 진행중</h5>
										<div style="width: 175px;font-size: 11pt;color: rgba(0,0,0,0.7);">앞으로 총 <span style='font-weight: 600'>${challResultAllOne.chaltotalday - challResultAllOne.certicount }회</span>의 인증을 받아야 합니다.</div>
									</div>
								</div>					
							</div>
						</div>
					</div>
				</c:if>
				
				<c:if test="${user.email !=null && user.email == identifyResultUser.email}"> 	
					<div style="width: 100%;background-color: #f2f2f2;padding: 40px 0">		
						<div class="row"  style="padding: 21px;width: 900px;margin: 0 auto;border: 1px solid rgba(207, 203, 210,0.5);background-color:white;box-shadow: 0px 0px 10px 5px rgb(0 0 0 / 10%);border-radius: 10px">
							<div class="col-sm-6"  style="width: 400px;height:400px;margin-bottom:20px;">
								<canvas id="totalChart1" width="400" height="400"></canvas>
							</div>
							<div class="col-sm-6" style="display: flex;flex-direction: column;justify-content: center;padding-left: 18px">						
								<h2 style="margin-bottom: 40px;width:400px;text-align: center;font-weight: 700;letter-spacing: 2px;">얼마나 달성되었나요?</h2>
								<div style="position: relative;width: 200px">
									<div style="left: 100%;width: 200px;background-color: rgb(207, 203, 210);height: 35px"></div>
										<h5 style="margin: 10px 0  5px 0;font-size: 13pt;font-weight: 600">전체 인증 완료</h5>
										<div style="width: 180px;font-size: 11pt;color: rgba(0,0,0,0.7);">해당 챌린지는 현재까지 <span style='font-weight: 600'>${challResultAllOne.certicount }회</span> 인증되었습니다.</div>
									<div style="position: absolute;left: 100%;top:0%;width: 200px">
										<div style="width: 200px;background-color: rgb(230,227,232);height: 35px"></div>
										<h5 style="margin: 10px 0  5px 0;font-size: 13pt;font-weight: 600">전체 인증 진행중</h5>
										<div style="width: 180px;font-size: 11pt;color: rgba(0,0,0,0.7);">완료까지  <span style='font-weight: 600'>${challResultAllOne.chaltotalday - challResultAllOne.certicount }회</span>의 인증을 받을 수 있습니다.</div>
									</div>
								</div>
								<div style="position: relative;width: 200px;margin-top: 30px;">
									<div style="left: 100%;width: 200px;background-color: #8b63da;height: 35px"></div>
										<h5 style="margin: 10px 0  5px 0;font-size: 13pt;font-weight: 600">나의 인증 성공</h5>
										<div style="width: 180px;font-size: 11pt;color: rgba(0,0,0,0.7);">해당 챌린지에서 현재까지의 인증 횟수는 <span style='font-weight: 600'>${identifyResultUser.identify }회</span> 입니다.</div>
									<div style="position: absolute;left: 100%;top:0%;width: 200px">
										<div style="width: 200px;background-color: rgb(226,199,245);height: 35px"></div>
										<h5 style="margin: 10px 0  5px 0;font-size: 13pt;font-weight: 600">나의 인증 진행중</h5>
										<div style="width: 180px;font-size: 11pt;color: rgba(0,0,0,0.7);">종료까지 <span style='font-weight: 600'>${identifyResultUser.totalday - identifyResultUser.identify }회</span>의 인증을 할 수 있습니다.</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="identify text-center">
						<img class="userWrap60" src="https://s3.ap-northeast-2.amazonaws.com/livelybucket/${identifyResultUser.memberphotoname }" onerror="this.src='image/user_80px.jpg'"> 
						<span>${identifyResultUser.nickname }님의 인증 횟수는?</span><br>
						<div class="inCount">
							<div style="display: flex; flex-direction: column;">
							<c:forEach  var="result" items="${challengeResult }">
								<c:if test="${result.email == user.email }">
 									<h5 style="margin-bottom: 0; font-size: 13pt; color: #8b63da">${result.rnum }위</h5> 
 								</c:if>
 							</c:forEach>
								<img src="image/mytrophy1.svg" style="height: 85px; filter: drop-shadow(3px 3px 2px rgba(0, 0, 0, 0.2));">
							</div>
							<span class="d-none d-sm-block"> 
							<c:forEach begin="1" end="${identifyResultUser.identify}" varStatus="status">	
								 <img src="image/identify1.png" style="background-color:#8b63da">
							</c:forEach>
							<c:forEach begin="${identifyResultUser.identify+1}" end="${identifyResultUser.totalday}" varStatus="status">	
								 <img src="image/identify1.png" style="background-color:white">
							</c:forEach>
								 <span style="font-size: 11pt; color: #7a777d; margin-left: 10px;">${identifyResultUser.identify } / ${identifyResultUser.totalday } 회</span>
							</span>
						</div>
					</div>
				</c:if>

				<hr class="one">
				<!-- 순위 보여주기 -->
				<div class="grade" style="margin-top: 70px">
					<div style="text-align: center;font-size: 24pt;font-weight: 700;letter-spacing: 2px;margin-bottom: 45px;">
						CHALLENGE RANKING
					</div>	
					<div class="row text-center" style="width: 80%; margin: 30px auto 20px auto">
						<c:choose>
							<c:when test="${fn:length(challengeResult) >3 }">
								<c:forEach var="result" items="${challengeResult}" begin="0"	end="2" varStatus="status">	
									<div class="col-sm-4 gradeTop${result.rnum}">
										<h5 style="font-size: 13pt; margin-bottom: 0">${result.rnum}위</h5>
										<img src="image/trophy${result.rnum }.svg" style="height: 85px; filter: drop-shadow(3px 3px 2px rgba(0, 0, 0, 0.2));">
										<h5 style="margin-top: 10px;">${result.nickname }</h5>
									</div>
								</c:forEach>
							</c:when>
							<c:when test="${fn:length(challengeResult) <=3 }">
								<c:forEach var="result" items="${challengeResult}" varStatus="status">	
									<div class="col-sm-4 gradeTop${result.rnum}">
										<h5 style="font-size: 13pt; margin-bottom: 0">${result.rnum}위</h5>
										<img src="image/trophy${result.rnum }.svg" style="height: 85px; filter: drop-shadow(3px 3px 2px rgba(0, 0, 0, 0.2));">
										<h5 style="margin-top: 10px;">${result.nickname }</h5>
									</div>
								</c:forEach>
								<c:forEach begin="${fn:length(challengeResult)+1}" end="3" varStatus="status">	
									<div class="col-sm-4 gradeTop${status.index}">
										<h5 style="font-size: 13pt; margin-bottom: 0">${status.index}위</h5>
										<img src="image/trophy${status.index}.svg" style="height: 85px; filter: drop-shadow(3px 3px 2px rgba(0, 0, 0, 0.2));">
										<h5 style="margin-top: 10px;">?</h5>
									</div>
								</c:forEach>
							</c:when>
						</c:choose>
					</div> 
			
					<div style="height: 20px; width: 80%; background-color: #e9e9eaff; box-shadow: 0 2px 7px 0 rgba(0, 0, 0, 0.2) inset; margin: 0 auto 50px auto;"></div>
					<c:if test="${fn:length(challengeResult) > 0 }">
					<h3 style="margin: 50px 0 0 140px; font-size: 16pt;font-weight: 600">TOP 10</h3>
					</c:if>
					<c:forEach var="result" items="${challengeResult}" varStatus="status">	
						<div class="grade5">
							<div class="topNumber">${result.rnum }</div>
							<div class="proId">
								<p>${result.nickname }</p>
								<div style="display: flex">
									<div class="meter red">
										<span style="width:${result.percents}%"></span>
									</div>
									<span style="margin-left: 15px; font-size: 11pt; color: #bdbdbd">${result.identify }/${result.totalday}회
									</span>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>

			</div>

			<!--///////////////////////// 현재 결과 끝 /////////////////////-->

			<!-- 후기 -->
			<div id="category1" class="container tab-pane fade" style="padding-left: 45px;padding-right: 45px">
		
				<!-- 챌린지 참가한 사람들만 보이게 제어(한번 작성하면 버튼 hide) -->
				<c:forEach var="challUser" items="${challengeMember}" varStatus="status">
					<c:if test="${user.email== challUser.email && challUser.reviewdone == 0}">			
						<div class="chall-buttons" id="reviewMakeBtn">
							<a class="modalBtn" data-toggle="modal" data-target="#myModal2">
								<button type="button" class="chall-btn-hover color-3">후기 작성</button>
							</a>
						</div>
					</c:if>
				</c:forEach>

				<!-- ///////////////후기 작성 끝////////////////// -->
				<div class="row review">
					<div class="col-sm-6" style="border-right: 1px solid #edf0f2;display:flex;flex-direction: column;align-items: center;">
						<c:if test="${reviewResult.reviewAvg !=null}">
						<h1 style="margin-top: 12px">${reviewResult.reviewAvg }</h1>
						<div style="background-color: #f2f2f2;width: 150px" >
							<div style="background-color: #8b63da; width: ${reviewResult.reviewAvg/5*100}%">
								<img src="image/star.png" style="width: 150px">
							</div>
						</div>
						<p style="color: #878787">${reviewResult.reviewCountAll } 건</p>
						</c:if>
						<c:if test="${reviewResult.reviewAvg ==null}">
							<h1 style="margin-top: 12px">0.0</h1>
							<div style="background-color: #f2f2f2;width: 150px">
								<img src="image/star.png" style="width: 150px">
							</div>
							<p style="color: #878787">0 건</p>
						</c:if>	
					</div>
					<div class="col-sm-6 text-center progressMain">
						<table>
							<col width="40px">
							<col width="210px">
							<col width="30px">
							<tr>
								<td class="proTd1">5점</td>
								<td>
									<div class="progress">
										<div class="progress-bar six-sec-ease-in-out"
											role="progressbar" aria-valuenow="60" aria-valuemin="0"
											aria-valuemax="100" style="width: ${reviewResult.rateFive/reviewResult.reviewCountAll *100 }%;">
										
										</div>
									</div>
								</td>
								<td class="proTd">
									<c:if test="${reviewResult.reviewCountAll !=0 }">
										<fmt:formatNumber value="${reviewResult.rateFive/reviewResult.reviewCountAll}" type="percent"/>
									</c:if>			
								</td>
							</tr>
							<tr>
								<td class="proTd1">4점</td>
								<td>
									<div class="progress">
										<div class="progress-bar six-sec-ease-in-out"
											role="progressbar" aria-valuenow="60" aria-valuemin="0"
											aria-valuemax="100" style="width: ${reviewResult.rateFour/reviewResult.reviewCountAll *100 }%;">

										</div>
									</div>
								</td>
								<td class="proTd">
									<c:if test="${reviewResult.reviewCountAll !=0 }">
										<fmt:formatNumber value="${reviewResult.rateFour/reviewResult.reviewCountAll}" type="percent"/>
									</c:if>
								</td>
							</tr>
							<tr>
								<td class="proTd1">3점</td>
								<td>
									<div class="progress">
										<div class="progress-bar six-sec-ease-in-out"
											role="progressbar" aria-valuenow="60" aria-valuemin="0"
											aria-valuemax="100" style="width: ${reviewResult.rateThree/reviewResult.reviewCountAll *100 }%;">
											<span>65%</span>
										</div>
									</div>
								</td>
								<td class="proTd">
									<c:if test="${reviewResult.reviewCountAll !=0 }">
										<fmt:formatNumber value="${reviewResult.rateThree/reviewResult.reviewCountAll}" type="percent"/>
									</c:if>
								</td>
							</tr>
							<tr>
								<td class="proTd1">2점</td>
								<td>
									<div class="progress">
										<div class="progress-bar six-sec-ease-in-out"
											role="progressbar" aria-valuenow="60" aria-valuemin="0"
											aria-valuemax="100" style="width: ${reviewResult.rateTwo/reviewResult.reviewCountAll *100 }%;">
							
										</div>
									</div>
								</td>
								<td class="proTd">
									<c:if test="${reviewResult.reviewCountAll !=0 }">
										<fmt:formatNumber value="${reviewResult.rateTwo/reviewResult.reviewCountAll}" type="percent"/>
									</c:if>
								</td>
							</tr>
							<tr>
								<td class="proTd1">1점</td>
								<td>
									<div class="progress">
										<div class="progress-bar six-sec-ease-in-out"
											role="progressbar" aria-valuenow="60" aria-valuemin="0"
											aria-valuemax="100" style="width: ${reviewResult.rateOne/reviewResult.reviewCountAll *100 }%;">
										</div>
									</div>
								</td>
								<td class="proTd">
									<c:if test="${reviewResult.reviewCountAll !=0 }">
										<fmt:formatNumber value="${reviewResult.rateOne/reviewResult.reviewCountAll}" type="percent"/>
									</c:if>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<!--//////////////////// 후기 전체 끝//////////////////// -->
				<div class="reviewBbs">
					<p style="margin-bottom: 0">${reviewResult.reviewCountAll }개 후기가 있습니다</p>
					<!-- 정렬  네비 -->
					<div class="reviewNav">
						<ul class="nav" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								data-toggle="tab" href="#Review0" onclick="Review(0)">최신순</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#Review1" onclick="Review(1)">인기순</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#Review2" onclick="Review(2)">별점순</a></li>
						</ul>
						<hr>
					</div>

					<!-- 정렬 데이터 -->
					<div class="tab-content">
						<%
							for (int i = 0; i < 3; i++) {
						%>
						<div id="Review<%=i%>" class="tab-pane">
							<div id="rev<%=i%>">
							<!-- 데이터 들어오는 부분 -->
							</div>
						</div>
						<%
							}
						%>
					</div>
				</div>
			</div>

			<!--///////////////////////// 후기 끝 /////////////////////-->

		</div>
		<!--/////////////////// tab내용 끝//////////////////// -->
	</div>
	<!-- 메인 탭부분 끝-->
</div>


<!--//////////////////////////////// user모달 //////////////////////////////// -->

<!-- user리스트 보여주는 모달 -->
<div class="modal" id="myModal">
	<div class="modal-dialog">
		<div class="modal-content">

			<!-- Modal body -->
			<div class="modal-body" id="userMain">
			
				<table>
					<col width="60px">
					<col width="200px">
					<col width="205px">
					<c:if test="${challengeMember != null}">
						<c:forEach var="challUser" items="${challengeMember}" varStatus="status">
							<tr>
								<td><img class="userWrap"
									src="https://s3.ap-northeast-2.amazonaws.com/livelybucket/${challUser.memberphotoname }"
									onerror="this.src='image/user_80px.jpg'"></td>
								<td>${challUser.nickname }</td>
								<td align="right" id="followBtn">
									<c:if test="${user.email != null && user.email != challUser.email && challUser.followcheck == 0}">
										<button id="_like-review" class="btn btn-secondary like-review" style="background-color:#ed2553" followingemail='${challUser.email}' onclick="userLike(this)">
									   		<i class="fa fa-heart" aria-hidden="true"></i> Like 
										</button> 
									</c:if>
									<c:if test="${user.email != null && challUser.followcheck == 1}">
										<button id="_like-review" class="btn btn-secondary like-review" style="background-color:#ed2553" followingemail='${challUser.email}' onclick="userLikeDel(this)">
									   		<i class="fa fa-heart" aria-hidden="true"></i> You Liked
										</button> 
									</c:if>
								</td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
			</div>

			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn" data-dismiss="modal">Close</button>
			</div>

		</div>
	</div>
</div>

<!-- 후기작성 모달 -->
<div class="modal" id="myModal2">
	<div class="modal-dialog modal-xl" style="top: 15%">
		<div class="modal-content">

			<!-- Modal body -->
			<div class="modal-body">
				<button type="button" class="close" data-dismiss="modal">×</button>
				<div class="reviewSummerNote">
					<h3>후기 작성</h3>
					<p class="title_star">후기는 수정할 수 없습니다. 신중하게 작성해 주세요.</p>
					<!-- RATING - Form -->
					<form id="rateFrm" class="rating-form" method="post">
						<input type="hidden" name="email" value="${user.email }">
						<input type="hidden" name="challengeseq" value="${challDto.challengeseq }">
						<fieldset class="form-group">

							<legend class="form-legend">Rating:</legend>

							<div class="form-item">

								<input id="rating-5" name="rating" type="radio" value="5" /> <label
									for="rating-5" data-value="5"> <span
									class="rating-star"> <i class="fa fa-star-o"></i> <i
										class="fa fa-star"></i>
								</span> <span class="ir">5</span>
								</label> <input id="rating-4" name="rating" type="radio" value="4" /> <label
									for="rating-4" data-value="4"> <span
									class="rating-star"> <i class="fa fa-star-o "></i> <i
										class="fa fa-star"></i>
								</span> <span class="ir">4</span>
								</label> <input id="rating-3" name="rating" type="radio" value="3" /> <label
									for="rating-3" data-value="3"> <span
									class="rating-star"> <i class="fa fa-star-o"></i> <i
										class="fa fa-star"></i>
								</span> <span class="ir">3</span>
								</label> <input id="rating-2" name="rating" type="radio" value="2" /> <label
									for="rating-2" data-value="2"> <span
									class="rating-star"> <i class="fa fa-star-o"></i> <i
										class="fa fa-star"></i>
								</span> <span class="ir">2</span>
								</label> <input id="rating-1" name="rating" type="radio" value="1" /> <label
									for="rating-1" data-value="1"> <span
									class="rating-star"> <i class="fa fa-star-o"></i> <i
										class="fa fa-star"></i>
								</span> <span class="ir">1</span>
								</label>
								<div class="form-action">
									<input class="btn-reset" type="reset" value="Reset" />
								</div>
								<div class="form-output">? / 5</div>
							</div>
						</fieldset>
						<textarea class="review_textarea" id="summernote" name="revcontent"></textarea>
					</form>
				</div>
			</div>
			<!-- Modal footer -->
			<div class="modal-footer" style="justify-content: center">
				<button type="button" name="save" onclick="save()" class="btn"
					style="width: 200px">후기 작성</button>
			</div>

		</div>
	</div>
</div>

<!-- start join 모달 -->
<div class="modal" id="myModal3">
	<div class="modal-dialog">
		<div class="modal-content">

			<!-- Modal body -->
			<div class="modal-body" style="height: 680px">
				<button type="button" class="close" data-dismiss="modal">×</button>
				<div class="joinStart">
					<h1>${challDto.challengetitle}</h1>
					<img class="decoWrap"
						src="https://s3.ap-northeast-2.amazonaws.com/livelybucket/${user.memberPhotoName }"
						onerror="this.src='image/user_80px.jpg'">
					<h5>
						<font style="text-decoration: underline;">${user.nickname }</font>
						님
					</h5>
					<h3>챌린지 참가 포인트는</h3>
					<h4 class="highlight">${challDto.pointcount }point</h4>
					<table class="pointTo">
						<col width="30px">
						<col width="150px">
						<col width="80px">
						<tr>
							<td><i class="fas fa-user"></i></td>
							<td>참가 인원</td>
							<td><span>${challDto.challengemember }명</span></td>
						</tr>
						<tr>
							<td><i class="fas fa-coins"></i></td>
							<td>전체 포인트</td>
							<td><c:out
									value="${challDto.pointcount * challDto.challengemember }" />
								point</td>
						</tr>
					</table>
					<table class="pointTable">
						<col width="30px">
						<col width="150px">
						<col width="250px">

						<tr>
							<td colspan="3"><span class="highlight"
								style="font-size: 13pt; font-weight: 600">달성률에 따라 환급이 달라집니다.</span></td>
						</tr>
						<tr>
							<td colspan="2">100% 성공</td>
							<td style="text-align: right; font-weight: 600"><c:out value="${challDto.pointcount * 2 }" /> point</td>
						</tr>
						<tr>
							<td colspan="2">85%이상 성공</td>
							<td style="text-align: right; font-weight: 600">
							<fmt:parseNumber value="${challDto.pointcount * 1.5 }" integerOnly="true"/> point</td>
						</tr>
						<tr>
							<td colspan="2">100% 성공</td>
							<td style="text-align: right">포인트 차감</td>
						</tr>
					</table>
					<p>한번 참여 시 포인트 환불이나 취소가 불가합니다.</p>
				</div>


			</div>

			<!-- Modal footer -->
			<div class="modal-footer" style="justify-content: center">
				<button type="button" class="btn" onclick="startChallengeBtn()">CHALLENGE 도전</button>
			</div>

		</div>
	</div>
</div>

<c:if test="${user.email != null}">

<!-- start join 모달 -->
<div class="modal" id="myModal4" style="top:19%">
	<div class="modal-dialog   modal-lg">
		<div class="modal-content">

			<!-- Modal body -->
			<div class="modal-body ">
			<form id="identFrm">
					<input type="hidden" name="email" value="${user.email }">
					<input type="hidden" name="challengeseq " value="${challDto.challengeseq }">
				<div class="row identifyModal">
				
					<div class='col-sm-6'>
				            <span style="font-weight: 500;font-size: 12pt;padding-left: 71px">인증 사진을 올려주세요</span>			
						<label for="identImg">
		                  <img id="ident_Img" class="img-responsive identImg" src="./image/identifyNone.jpg">
			            </label>
			            <input type="file" name="uploadFile" id="identImg" style="display: none" onerror="this.src='./image/identifyNone.jpg'">
					</div>
		
					<div class='col-sm-6 dataRow'>
						
						<div class='dataFont'>
							<img class="decoWrap60" src="https://s3.ap-northeast-2.amazonaws.com/livelybucket/${user.memberPhotoName }" onerror="this.src='image/user_60px.jpg'">
							<h5><font style="text-decoration: underline;">${user.nickname }</font>님	</h5>
						</div>
						<div style="margin-bottom: 40px">
						    <span class="dataPercent">현재까지  <span class='highlight'>50%</span> 달성</span>
						</div>
						
						<div style="display: flex;align-items: flex-end;">
							<span style="font-size: 12pt;">인증 횟수는</span>
							<div class="round">
								<span>7 <span style="font-size: 13pt">/14</span></span>
							</div>
							<span style="font-size: 12pt;font-weight: 500;">회 입니다.</span>
						</div>
					</div>		
				</div>
				<p style="text-align: center;color:#b1b1b1;margin-bottom: 0">인증은 변경이 불가하니 신중하게 올려주세요</p>
			</form>
			</div>
	
			<!-- Modal footer -->
			<div class="modal-footer" style="justify-content: center">
				<button type="button" class="btn" onclick="insertIdentify()">인 증 하 기</button>
			</div>

		</div>
	</div>
</div>
</c:if>

<!-- 채팅 모달 -->
<div class="modal" id="myModal5" style="top:7%">
	<div class="modal-dialog   modal-lg" style="max-width:600px">
		<div class="modal-content" style="height: 700px">

			<!-- Modal body -->
			<div class="modal-body">
			
				<div class="row chatHeader">
					<div class="col-sm-12 chatHeader">
						<img alt="" src="image/logo.png">
						<div class="float-right">
							<img class="userWrap30" src=""
								onerror="this.src='image/user_80px.jpg'"
								style="height: 30px; margin-top: 9px;">
							<div class="userName">LemonLime 님</div>
						</div>
					</div>
				</div>
				<div class="row chat">
					<div class="d-none d-sm-block col-sm-3 chatUser">
						<%
							for (int i = 0; i < 5; i++) {
						%>
						<div class="userCard">
							<img class="userWrap" src="" onerror="this.src='image/user_80px.jpg'"> <span>유저 이름</span>
						</div>
						<%
							}
						%>
					</div>
					<div class="col-sm-9 chatMain">
						<div class="chatAll">
							<div class="userChatText">
								<img class="userChatImg userWrap" src=""
									onerror="this.src='image/user_80px.jpg'">
								<div class="userTextMain">
									<p>LemonLime</p>
									<div class="userTextMain2">
										<div>채팅한 데이터를 넣어놓는데 만약에 길어지면 어떻게 되는 지 너무 궁금하군요?호호호</div>
										<span><fmt:formatDate value="${now}" pattern="MM-dd HH:mm" /></span>
									</div>
								</div>
							</div>
						</div>
						<div class="input-group chatForm">
							<div class="chatrow">
								<textarea id="chatText" class="form-control"></textarea>
							</div>
							<div class="input-group-append">
								<button class="btn send">
									<i class="far fa-paper-plane fa-2x"></i>
								</button>
							</div>
						</div>
					</div>
				</div>
			
			</div>
		</div>
	</div>
</div>

<!-- end 모달 -->
<div class="modal" id="myModal6" style="top:10%">
	<div class="modal-dialog">
		<div class="modal-content">

			<!-- Modal body -->
			<div class="modal-body ">
				<div style="display: flex;flex-direction: column;align-items: center;">
					<h1 class="selebration" style="margin: 25px;">ACHIVEMENT</h1>
					 <div class="easypiechart" id="easypiechart-dibs" data-percent="${identifyResultUser.percent}" style="position: relative;height: 150px;width: 150px" >
                        <img src="https://s3.ap-northeast-2.amazonaws.com/livelybucket/${user.memberPhotoName }" onerror="this.src='image/user_80px.jpg'" style="position:absolute;border-radius: 50%;height: 122px;width: 122px;overflow: hidden;vertical-align: middle;align-items: center;object-fit: cover;top: 14px;left: 14px">
                    </div>
					
					<h5>
						<font style="text-decoration: underline;">${user.nickname }</font>님
					</h5>
					<h5>
						${identifyResultUser.identify }<span style="font-size: 12pt;color: #7a7a7a;"> / ${identifyResultUser.totalday } 회</span>
					</h5>
					
						<div style="width: 100%;margin-top: 16px;text-align: center;background-color: #f2f2f2;padding-bottom: 12px;">
							<c:choose>
								<c:when test="${identifyResultUser.percents == 100}">
									<span class="highlight" style="font-size: 24pt;font-weight: 700">${challDto.pointcount * 2 } </span><span style="font-size: 12pt;font-weight: 500;"> point 획득</span>
								</c:when>
								<c:when test="${identifyResultUser.percents >= 85 && identifyResultUser.percent < 100}">
									<span class="highlight" style="font-size: 24pt;font-weight: 700">${challDto.pointcount * 1.5 } </span><span style="font-size: 12pt;font-weight: 500;"> point 획득</span>
								</c:when>
								<c:when test="${identifyResultUser.percents < 85}">
									<span class="highlight" style="font-size: 24pt;font-weight: 700"> ${challDto.pointcount}</span><span style="font-size: 12pt;font-weight: 500;"> point 차감</span>
								</c:when>
							</c:choose>
					</div>
					<h2 style="margin:20px;"><span class="pointresult">${identifyResultUser.percents}</span><span style="font-size: 18pt;font-weight: 700;color: #591da9">% 달성</span></h2>
			
				</div>
			</div>
	
			<!-- Modal footer -->
			<div class="modal-footer" style="justify-content: center">
				<button type="button" class="btn" id="stopButton" onclick="pointUpdate('${challDto.pointcount}')" data-dismiss="modal">POINT 받기</button>
			</div>

		</div>
	</div>
</div>


<!-- 꽃가루 뿌리기 -->
<script src="./js/confetti.js"></script>

<!-- 결과 차트 js -->
<script src="js/easypiechart.js"></script>

<!-- summer note 사용시 추가 -->
<script src="./js/summernote/summernote-lite.js"></script>
<script src="./js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="./css/summernote/summernote-lite.css">

<!-- 차트.js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<!-- progress 바 채워지기 -->
<script>
$('.easypiechart').easyPieChart({
	barColor: '#8b63da',  //차트가 그려질 색
    trackColor: '#f2f2f2',  // 차트가 그려지는 트랙의 기본 배경색(chart1 의 회색부분)
    scaleColor: false,
    lineCap: 'square', // 차트 선의 모양 chart1 butt / chart2 round / chart3 square
    lineWidth: 10, // 차트 선의 두께
    size: 150, // 차트크기
    animate: 4000 // 그려지는 시간 
  });


//이미지 미리보기
var sel_file;

$(document).ready(function() {
    $("#identImg").on("change", handleImgFileSelect);
    $('[data-toggle="popover"]').popover();   
}); 


function handleImgFileSelect(e) {
    var files = e.target.files;
    var filesArr = Array.prototype.slice.call(files);

    filesArr.forEach(function(f) {
        if(!f.type.match("image.*")) {
            alert("확장자는 이미지 확장자만 가능합니다.");
            return;
        }

        sel_file = f;

        var reader = new FileReader();
        reader.onload = function(e) {
            $("#ident_Img").attr("src", e.target.result);
        }
        reader.readAsDataURL(f);
    });
}

let timeData =  '${challDto.identifytime }';
let timeD = "";
if(timeData<10){
	$(".timeData").text("0"+timeData+":00 ~ "+"0"+timeData+":05 사이");	
}else{
	$(".timeData").text(timeData+":00 ~ "+timeData+":05 사이");	
}

let category = '${challDto.category}';
if(category==1){
	$("#_category").text("건강");
}else if(category==2){
	$("#_category").text("역량");
}else if(category==3){
	$("#_category").text("정서");
}else if(category==4){
	$("#_category").text("자산");
}else if(category==5){
	$("#_category").text("생활");
}else if(category==6){
	$("#_category").text("취미");
}


//날짜 제어
let now = new Date();
let year = now.getFullYear();
let month = now.getMonth();
let day = now.getDate();

let nowDate = new Date(year, month, day);
let startdate = "${challDto.challengestart}"; //yyyy-MM-dd 00:00:00.0
let enddate = "${challDto.challengeend}";
let startdateSub = startdate.substring(0, 10);
let enddateSub = enddate.substring(0, 10);
let startDate = new Date(startdateSub);
let endDate = new Date(enddateSub);

// let strArr = startdateSub.split('-');
// let startDate = new Date(strArr[0], strArr[1]-1, strArr[2]);
// let strArr2 = enddateSub.split('-');
// let endDate = new Date(strArr2[0], strArr2[1]-1, strArr2[2]);

console.log("시작 날짜"+startDate)
console.log("끝 날짜"+endDate)
//console.log("오늘 날짜"+nowDate)

//전체 기간 날짜로 제어하기 배열로 날짜
let allDay = [];
while(startDate.getTime() <= endDate.getTime()){
		
		let mon = (startDate.getMonth()+1);
		mon = mon < 10 ? '0'+mon : mon;
		var ssday = startDate.getDate();
		ssday = ssday < 10 ? '0'+ssday : ssday;
		var ssday = startDate.getDate();
		ssday = ssday < 10 ? '0'+ssday : ssday;
		let identyFy ='${challDto.identifytime}';
		identyFy = identyFy < 10 ? '0'+identyFy : identyFy;
		//console.log(startDate.getFullYear() + '-' + mon + '-' +  ssday+ " "+ identyFy+":00:00");
 		allDay.push(new Date(startDate.getFullYear() + '-' + mon + '-' +  ssday+ " "+ identyFy+":00:00"));
 		startDate.setDate(startDate.getDate() + 1);
}
//console.log("전체 요일"+allDay)
//요일 class제어 indentifyDate

let indentifyDate = new Array(${challDto.identifyday});
console.log("인증가능요일 주말이 안돼? "+indentifyDate)
$.each(indentifyDate, function(i, val){
	$("#idendate li:nth-child("+val+")").css("font-weight", "500");
	$("#idendate li:nth-child("+val+")").css("color", "black");
});


//allDay에서 요일만 출력해서 날짜와 매칭 indentifyDate
let selectDay = [];
let selectDayFive = [];
	indentifyDate.forEach(function(date){
		allDay.forEach(function(element){
// 			 console.log("전체날짜의 요일 "+element.getDay()); 	
			 if(element.getDay() == (date-1)){
				 selectDay.push(element); 	
			 }
		});

	});

   
//해당 유저만 버튼 보이게
let challenge = '${challengeMember}';
let identifycheck = '${identifycheck}';
console.log("체크되고싶습니다."+identifycheck)
//challenge = challenge.substr(1, challenge.length-2);
$.ajax({
	url:"challengeAll.do",
	type:"post",
	data:{"challengeseq":'${challDto.challengeseq}'},
	success:function(list){

		let userId = '${user.email}';
		$.each(list, function(i, challUser){

			selectDay.forEach(function(date){
				//console.log("date   00:00   "+date)
				let data = date;
				let dataFive = new Date( data.setMinutes(date.getMinutes()+5));
		/* 		console.log("date 00:00   "+date)
				console.log("now   "+now)
				console.log("dataFive   "+dataFive) */
				if(userId != null && challUser.email == userId && now >= date && now <= dataFive){
						if(identifycheck == 0){
							console.log("안들어왕눟매먀ㅜ헉무휴ㅓㄹㅇ미ㅏㅇ모헌모")
							document.getElementById('identifyBtn').innerHTML = "<img data-toggle='modal' data-target='#myModal4' src='image/identify.svg' style='height: 48px;margin-top: -8px;margin-left: 15px' onmouseover=\"this.src='image/identifyhover.svg'\" onmouseout=\"this.src='image/identify.svg'\">";
						}else{
							$('#identifyBtn').hide();
						}
						
				}
			});
		});
		
	}
});


	
//시작중인 챌린지 오늘인지 며칠 뒤인지 보여주기
if("${challDto.limitdate}"<0){
	$("#limitD").text("시작중인 챌린지 | 모집 마감");
}else if("${challDto.limitdate}"==0){
	$("#limitD").text("오늘부터 시작");
}else{
	$("#limitD").text("${challDto.limitdate}"+"일 뒤부터 시작");
}

//periodDate 05.11(화)~05.28(금)
$("#periodDate").text(dateToMonth(startdateSub)+" ~ "+dateToMonth(enddateSub))

//date 05.11(화)형식으로 바꾸기(문자열)
function dateToMonth(date) {
	//console.log("date모양 뭐야"+date)
	let nowDate = new Date(date);
	var month = nowDate.getMonth();
    if (month < 10)  {
        month = '0' + (month+1);
    }

    var date = nowDate.getDate();
    if (date < 10) {
        date = '0' + date;
    }
    
 	var week = new Array('일', '월', '화', '수', '목', '금', '토');
     var today = nowDate.getDay();

     var todayLabel = week[today];
     return month + '.' + date +"("+todayLabel+")";
}


//follow 추가
function userLike(me){

	let likeemail = $(me).attr('followingemail');
	console.log("dsfadsgds"+likeemail)
	$.ajax({
		url:"followInsert.do",
		data:{"followemail":'${user.email}', "followingemail":likeemail},
		type:"post",
		success:function(msg){

			$("#_like-review").html("<i class='fa fa-heart' aria-hidden='true'></i> You Liked");
			$("#_like-review").removeAttr('onclick');
			$("#_like-review").attr("onclick","userLikeDel(this)");
			
		},
		error:function(){
			alert("후기 좋아요 버튼 에러");
		},
		complete:function(){			
			
		}
	});

}

//follow 삭제
function userLikeDel(me){

	let likeemail = $(me).attr('followingemail');
	console.log("dsfadsgds"+likeemail)
	
	$.ajax({
		url:"followDelete.do",
		data:{"followemail":'${user.email}', "followingemail":likeemail},
		type:"post",
		success:function(msg){

			$("#_like-review").html("<i class='fa fa-heart' aria-hidden='true'></i> Like");
			$("#_like-review").removeAttr('onclick');
			$("#_like-review").attr("onclick","userLike(this)");
		},
		error:function(){
			alert("후기 좋아요 버튼 에러");
		},
		complete:function(){			
			
		}
	});

}

//찜하기 버튼 제어 checkChallenge()
function checkChallenge(){
	
	let id = document.getElementById("likeChallenge");
	 $.ajax({
		 type:"post",
		 url:"challengelikeInsert.do",
		 data:{"challengeseq":"${challDto.challengeseq}", "email":"${user.email}"},
		 success:function(msg){
	    		if(msg=="SUCCESS"){
	    			//alert("찜하기 성공 ");
	    		}
	    	},
	   		error:function(){
	   			alert("찜하기 에러");
	   		}, 
	   		complete:function(){
	   			id.innerHTML = "<img onclick=\"checkDelChallenge()\" src='image/checkFill.svg' class='checkImg'>";
	   		}
	    });	 
}	

function checkDelChallenge(){
	
		let id = document.getElementById("likeChallenge");
		 $.ajax({
			 type:"post",
			 url:"challengelikeDelete.do",
			 data:{"challengeseq":"${challDto.challengeseq}", "email":"${user.email}"},
			 success:function(msg){
		    		if(msg=="SUCCESS"){
		    			//alert("찜하기 삭제 성공 ");
		    		}
		    	},
		   		error:function(){
		   			alert("찜하기 에러");
		   		},
		    	complete:function(){
		   			id.innerHTML = "<img onclick='checkChallenge()' class='checkImg' src='image/check.svg' onmouseover=\"this.src='image/checkhover.svg'\" onmouseout=\"this.src='image/check.svg'\">";
		   		}	
		    });	   
	}

//챌린지 참여하기
function startChallengeBtn(){
	
	$.ajax({
		url:"challengeMemberInsert.do",
		data:{"email":"${user.email}", "challengeseq":"${challDto.challengeseq}", "point":"${challDto.pointcount}"},
		type:"post",
		success:function(msg){
			if(msg=="SUCCESS"){
				alert("챌린지에 참여하였습니다. 열심히 활동해 보세요.");	
			}else if(msg=="POINTFAIL"){
				alert("포인트가 부족하여 챌린지에 참여할 수 없습니다.");
			}
			
		}, error:function(){
			alert("챌린지 멤버 넣기 실패");
		}, 
		complete:function(){
			location.href="challengeDetail.do?challengeseq=${challDto.challengeseq}";
		}
		
		
	});
}

function challengeUpdate(seq){
	location.href = "challengeUpdate.do?challengeseq=${challDto.challengeseq}";
}

//후기부분 새로고침

//후기 작성 저장 전송전 필드 체크 이벤트 리스너
function save(){
    //별점 선택 안했으면 메시지 표시
    
    var rate = $('input:radio[name=rating]:checked').val();
    var review = $('.review_textarea').val();
    //alert(review);
   // alert(rate);
    if(typeof rate == "undefined" || rate == null || rate == ""){
       alert("별점을 선택해 주세요.");
        return false;
    }
    //리뷰 5자 미만이면 메시지 표시
    if(review.length < 5){
        alert('리뷰는 5자 이상 작성해 주세요.');
        return false;
    }

    let dataFrm = $("#rateFrm").serialize();
    $.ajax({
    	type:"post",
    	url:"challengeReviewInsert.do",
    	data:dataFrm, //revcontent, rating
    	success:function(msg){
    		if(msg=="SUCCESS"){
    			alert("후기 작성이 완료되었습니다.");
    			
    		}
    	},
   		error:function(){
   			alert("후기 작성 에러");
   		},
   		complete:function(){
   			
   			location.href="challengeDetail.do?challengeseq=${challDto.challengeseq}";
   			$("#resultNav").removeClass("active");
   			$("#reviewNav").addClass("active");
   		}
    });
	
}

Review(0);	
//후기 작성 아작스 데려오기
function Review(number){

	$.ajax({
		url:"challengereviewAll.do",
		data:{"number":number, "challengeseq":"${challDto.challengeseq}", "email":"${user.email}"},
		type:"post",
		success:function(revlist){
				//alert("sdsd");
			// $("#Review"+number).remove();
			let data = "";
			if(revlist.length==0){
				data += "<p class='reviewUser'>아직 등록된 후기가 없습니다. 후기를 작성해 주세요</p>";	
			}

			$.each(revlist, function(i, review){
				//날짜 포맷제어
				//console.log(review.chalcomdate)
				let revd = new Date(review.chalcomdate);
				let year = revd.getFullYear();
				let month = (revd.getMonth()+1);
				month = month>=10?month:"0"+month;
				let day = revd.getDate();
				day = day>=10?day:"0"+day;
				
				let revDate = year+"."+month+"."+day;
				
				let percent = review.chalcomrating / 5 *100;
				let userid = '${user.email}';
				console.log("들어왓냐고 아이디"+userid)
				
				data += "<div id='revData'>"
						+   "<div class='reviewUser'>"
						+    "<div class='reviewUserImg'>"
						+    "<img class='userWrap60' src='https://s3.ap-northeast-2.amazonaws.com/livelybucket/"+review.memberphotoname+"' onerror=\"this.src='image/user_80px.jpg'\">"
     					+    "<p>"+review.nickname+"</p>"
	     				+    "</div>"
	     				+    "<div class='reviewUserText'>"
						+    "<div style='width: 83px;background-color: #f2f2f2;float:left;'>"
						+    "<div style='background-color:#8b63da; width: "+percent+"%'>"
						+    "<img src='image/star.png' style='width: 83px'>"
						+   "</div>"
						+  "</div>"
						+  "<span>"+revDate+"</span>"
						+ 	 "<div style='margin-top:8px'>"+review.chalcomcontent+"</div>"
						+    "</div>";     	
     					if(review.likecheck ==0){
     						data +=    "<div class='reviewUserLike'>"
         					+    "<div id='reviewlikeBtn'>"
							+    "<img src='image/commentlike.svg' style='height:40px;' onmouseover=\"this.src='image/commentlikeHover.svg'\" onmouseout=\"this.src='image/commentlike.svg'\" onclick=\"commentLike('"+review.chalcomseq+"', '"+number+"')\">"
     							+ 	"</div>"
     							+    "<p id=>"+review.challlike+" likes</p>"
     							+    "</div>";
     					}else if(review.likecheck ==1){
     						data +=    "<div class='reviewUserLike'>"
             					+    "<div id='reviewlikeBtn'>"
     							+	"<img src='image/commentlikeFill.svg' style='height:40px;' onclick=\"commentLikeDel('"+review.chalcomseq+"', '"+number+"')\">"
	     						+ 	"</div>"
	 							+    "<p id=>"+review.challlike+" likes</p>"
	 							+    "</div>";
     					}
     			data += "</div><hr></div>";
			});
			$("#Review"+number).html(data);	
		},
		error:function(){
			alert("후기 가져오기 실패");
		}, 
		complete:function(){
			$("#Review"+number).addClass("active");
		}
	});
}

//후기 좋아요 버튼
function commentLike(commentseq, number){
	let userid = '${user.email}';
	
	if(userid==null || userid == ""){
		alert("로그인을 해주세요");
		return false;
	}
	//alert(commentseq);
	$.ajax({
		url:"commentLike.do",
		data:{"email":'${user.email}', "chalcomseq":commentseq},
		type:"post",
		success:function(msg){
			//alert(msg);	
			document.getElementById('reviewlikeBtn').innerHTML = "<img src='image/commentlikeFill.svg' style='height:40px;' onclick=\"commentLikeDel('"+commentseq+"', '"+number+"')\">";
		},
		error:function(){
			alert("후기 좋아요 버튼 에러");
		},
		complete:function(){			
			Review(number);
		}
	});

}

//후기 좋아요 해제
function commentLikeDel(commentseq, number){
	//alert(commentseq)
	$.ajax({
		url:"commentLikeDel.do",
		data:{"email":'${user.email}', "chalcomseq":commentseq},
		type:"post",
		success:function(msg){
			//alert(msg);
			document.getElementById('reviewlikeBtn').innerHTML = "<img src='image/commentlike.svg' style='height:40px;' onmouseover=\"this.src='image/commentlikeHover.svg'\" onmouseout=\"this.src='image/commentlike.svg'\" onclick=\"commentLike('"+commentseq+"', '"+number+"')\">";
		},
		error:function(){
			alert("후기 좋아요 삭제 실패");
		},
		complete:function(){
			Review(number);
		}
	});
}

//인증 데이터 insert
function insertIdentify(){
	
	if ($('input[name="uploadFile"]').get(0).files[0] == undefined) {
 		alert("인증 이미지를 올려주세요");
 		return false;
	}
	
	let identParam = new FormData($("#identFrm")[0]);
		identParam.append("uploadFile",  $('input[name="uploadFile"]').get(0).files[0]);
	
	$.ajax({
		url:"insertIdentify.do",
		type:"post",
		data:identParam,
		enctype:"multipart/form-data",	//파일업로드 설정데이터, 인코딩
		processData:false,
		contentType:false,
		cache:false,	//파일 새고고침 시 저장할 것이냐(아니오)
		success:function(msg){
			alert('인증 사진을 등록했습니다.');
			$("#identifyBtn").hide();
		},
		error:function(){
			
		}, 
		complete:function(){
			document.location.reload();
		}
		
	});
}

//포인트 올리기
function pointUpdate(point){
	console.log(point)
	let percent = "${identifyResultUser.percents}";
// 	if(percent < 85){		
// 			alert("포인트가 차감되었습니다.");
// 	}else{
	
		$.ajax({
			url:"pointUpdate.do",
			type:"post",
			data:{"point":point, "email":'${identifyResultUser.email}', "challengeseq":"${challDto.challengeseq}", "userpercent":'${identifyResultUser.percents}'},
			success:function(msg){
				if(msg=="SUCCESS"){
					alert("포인트가 변경되었습니다");
				}
			},
			error:function(){
				alert("포인트 업데이트 오류");
			}, 
			complete:function(){
				document.location.reload();
			}
			
		});
// 	}
}

</script>

<script type="text/javascript">
//결과 차트 모션
$(function() {
    $('#easypiechart-total').easyPieChart({
        scaleColor: false,
        barColor: '#8b63da'
     });
});

$(function() {
    $('#easypiechart-user').easyPieChart({
        scaleColor: false,
        barColor: '#8b63da'
    });
});


//대화 부분
//textarea 스크롤 없앰
 $(document).ready(function() {
      $('.chatrow').on( 'keyup', 'textarea', function (e){
        $(this).css('height', 'auto' );
        $(this).height( this.scrollHeight );
      });
      $('.wrap').find( 'textarea' ).keyup();
 	
      
    //써머노트
      $('#summernote').summernote({
           height: 200,
           /* width:, */
           minHeight: 100,             // 최소 높이
           maxHeight: null,             // 최대 높이
           focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
           lang: "ko-KR",               // 한글 설정
           placeholder: "댓글을 기입하세요",   //placeholder      
           //툴바 변경
            toolbar: [
                // [groupName, [list of button]]
                ['fontname',['fontname']],
                ['fontsize',['fontsize']],
                ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
                ['color', ['forecolor','color']],
                ['para', ['ul', 'ol', 'paragraph']]
              ],
            fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
            fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'] 
      });
		
 });
    
    
//파이차트?

 const data = {
  
   datasets: [{
     label: 'totalData',
     data: [${challResultAllOne.certicount-0}, ${challResultAllOne.chaltotalday-challResultAllOne.certicount}],
     backgroundColor: [
     	'rgb(139, 99, 218)',
    	 'rgb(251, 194, 235)'
     ],
     hoverOffset: 1
   }]
 };
 		
 		
 		
  const config = {
   type: 'doughnut',
   data,
   options: {}
 };		
 		
   var myChart = new Chart(
     document.getElementById('totalChart'),
     config
   );
 /////////////////////////////////////////////////////

   const data1 = {
 		  datasets: [
       {
         label: 'totalData',
         data: [${challResultAllOne.certicount-0}, ${challResultAllOne.chaltotalday-challResultAllOne.certicount}],
         backgroundColor: [
         	  'rgb(207, 203, 210)',
         	  'rgb(230,227,232)'
         ],
       },
       {
         label: 'Dataset 2',
         data: [${identifyResultUser.identify-0}, ${identifyResultUser.totalday-identifyResultUser.identify}],
         backgroundColor: [
             'rgb(139, 99, 218)',
         	 'rgb(226,199,245)'

         ],
       }
     ]
   };
 				
   const config1 = {
 		  type: 'doughnut',
 		  data: data1,
 		  options: {

 		  },
 		};

   var myChart1 = new Chart(
 		    document.getElementById('totalChart1'),
 		    config1
 		  );
     
</script>




