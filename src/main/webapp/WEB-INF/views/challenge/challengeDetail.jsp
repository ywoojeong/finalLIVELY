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

<link
	href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css"
	rel="stylesheet">
<script>
$(document).ready(function(){
	  $('[data-toggle="popover"]').popover();   
//$(".chall-buttons").hide();

//	$("#pro1").css("width", "80%");
});
console.log("받아온 데이터야라리ㅏ너롬리"+"${challDto.challengestart}"+"어매ㅑㅙㄹ"+"${challDto.limitdate}"+"dsds"+"${challMem.email}"+"dsfdsafd팔로잉멤버"+"${followingMember }"+"dsFdfdsgfsg"+"${reviewResult}");
</script>

<div class="backDiv"
	style="background-image: url(' https://s3.ap-northeast-2.amazonaws.com/livelybucket/${challDto.challengesavephoto }')">
	<div class="container challHeader">
		<div>
			<h1>${challDto.challengetitle}
				<c:if
					test="${user.email != null && challDto.limitdate>=0 && challMem.email == null}">
					<button type="button" class="btn challStartBtn" data-toggle="modal"
						data-target="#myModal3">START JOIN</button>
				</c:if>
			</h1>

			<a href="#" data-toggle="popover" data-trigger="hover"
				data-content="챌린지를 찜하세요" style="margin-right: 30px;"> <c:choose>
					<c:when test="${user.email != null && challWish.email eq null}">
						<div id="likeChallenge">
							<img onclick="checkChallenge()" class="checkImg"
								src="image/check.svg"
								onmouseover="this.src='image/checkhover.svg'"
								onmouseout="this.src='image/check.svg'">
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
		</div>

		<p id="limitD"></p>
		<label>${challDto.identifydayS }</label><label>${challDto.challengeperiod }주동안</label><span class="period" id="periodDate"></span><br>
		 <span	class="explain">${challDto.identifydayS }${challDto.challengeperiod }주동안, 하루에 1번 ${challDto.identifytime}시에 인증해야 합니다.</span>
	</div>
</div>

<div class="container" style="margin-bottom: 50px">
	<table class="attend">
		<col width="30px">
		<col width="100px">
		<col width="500px">
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
					<c:when
						test="${challengeMember != null && fn:length(challengeMember) <= 5}">
						<c:forEach var="challUser" items="${challengeMember}"
							varStatus="status">
							<img class="userWrap"
								src="https://s3.ap-northeast-2.amazonaws.com/livelybucket/${challUser.memberphotoname }"
								onerror="this.src='image/user_80px.jpg'">
						</c:forEach>
					</c:when>
					<c:when
						test="${challengeMember != null && fn:length(challengeMember) >= 5 }">
						<c:forEach var="challUser" items="${challengeMember}" begin="0"
							end="5">
							<img class="userWrap"
								src="https://s3.ap-northeast-2.amazonaws.com/livelybucket/${challUser.memberphotoname }"
								onerror="this.src='image/user_80px.jpg'">
						</c:forEach>
					</c:when>
				</c:choose> <a class="modalBtn" data-toggle="modal" data-target="#myModal">
					<i style="color: #cfcbd2" class="fas fa-angle-right"></i>
			</a></td>
		</tr>


	</table>

	<label class="challengetext">챌린지 소개</label>
	<div class="challengetextMain">${challDto.challengetext }</div>
	<!-- 참가 설명 -->
	<div class="row pointExplain">
		<div class="col-sm-6">
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
		<div class="col-sm-6">
			<label>챌린지 인증 시간</label>
			<p>
				<span class="highlight">${challDto.identifytime }:00 ~
					${challDto.identifytime}:05사이</span>에 이미지를 올려주세요
			</p>
		</div>
	</div>
	<!-- 챌린지 인증방법 -->
	<div class="certify">
		<label class="challengetext">챌린지 인증방법</label>
		<div class="row" style="padding-left: 23px">
			<div class="col-sm-8" style="display: flex;">
				<c:if test="${challDto.challengesavephoto != '0' }">
					<img
						src="https://s3.ap-northeast-2.amazonaws.com/livelybucket/${challDto.challengesavephoto }"
						style="width: 300px">
				</c:if>
				<div style="margin-left: 20px; width: 400px">
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
			<div class="col-sm-4">인증샷 넣을까?</div>
		</div>
	</div>
	<!-- 주의사항 -->
	<div class="precautions">
		<label class="challengetext">챌린지 주의사항</label>
		<table>
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
	<hr class="one">

	<!--//////////////////////////////// 탭 부분  /////////////////////////////// -->
	<!-- 메인 탭부분 -->
	<div class="main">
		<!-- Nav pills -->
		<ul class="nav nav-pills" role="tablist">
			<li class="nav-item"><a class="nav-link active"
				data-toggle="pill" href="#home">현재 결과</a></li>
			<li class="nav-item"><a class="nav-link" id="reviewNav"
				data-toggle="pill" href="#category1">후 기</a></li>
			<li class="nav-item"><a class="nav-link" data-toggle="pill"
				href="#category2">대 화</a></li>
		</ul>

		<!-- Tab panes -->
		<div class="tab-content">
			<!-- 현재 결과 -->
			<div id="home" class="container tab-pane active">

				<!-- 달성되었나요? -->
				<h1 class="resultHeader">얼마나 달성되었나요?</h1>
				<div class="row resultChart">
					<div class="col-sm-6" style="border-right: 1px solid #edf0f2">
						<div class="card-panel text-center">
							<div class="easypiechart" id="easypiechart-total"
								data-percent="82">
								<span class="percent">82%</span>
							</div>
							<h4>전체</h4>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="card-panel text-center">
							<div class="easypiechart" id="easypiechart-user"
								data-percent="82">
								<span class="percent">82%</span>
							</div>
							<h4>LemonLime 님</h4>
						</div>
					</div>
				</div>

				<!-- 인증 횟수는? -->
				<!-- 			<hr style="border-top: 2px solid rgba(203, 152, 237,0.2)"> -->
				<div class="identify text-center">
					<img class="userWrap60" src=""
						onerror="this.src='image/user_80px.jpg'"> <span>LemonLime님의
						인증 횟수는?</span><br>
					<div class="inCount">
						<div style="display: flex; flex-direction: column;">
							<h5 style="margin-bottom: 0; font-size: 13pt; color: #8b63da">8위</h5>
							<img src="image/mytrophy1.svg"
								style="height: 85px; filter: drop-shadow(3px 3px 2px rgba(0, 0, 0, 0.2));">
						</div>
						<span class="d-none d-sm-block"> <%
 	for (int i = 0; i < 5; i++) {
 %> <img
							src="image/identify1.png" style="background-color: #8b63da">
							<%
								}
							%> <%
 	for (int i = 0; i < 14 - 5; i++) {
 %> <img src="image/identify1.png"
							style="background-color: white"> <%
 	}
 %> <span
							style="font-size: 11pt; color: #7a777d; margin-left: 10px;">5/14회</span>
						</span>
					</div>
				</div>
				<!-- 			<hr style="border-top: 2px solid rgba(203, 152, 237,0.2)"> -->
				<!-- 순위 보여주기 -->
				<div class="grade">
					<h3>TOP3 순위</h3>
					<div class="row text-center"
						style="width: 80%; margin: 30px auto 20px auto";>
						<div class="col-sm-4 gradeTop"
							style="color: #e6ba1e; border-right: 1px solid #edf0f2">
							<h5 style="font-size: 13pt; margin-bottom: 0">1위</h5>
							<img src="image/gold1.svg"
								style="height: 85px; filter: drop-shadow(3px 3px 2px rgba(0, 0, 0, 0.2));">
							<h5 style="margin-top: 10px;">LemonLime</h5>
						</div>
						<div class="col-sm-4 gradeTop"
							style="color: #c7c7c7; border-right: 1px solid #edf0f2">
							<h5 style="font-size: 13pt; margin-bottom: 0">2위</h5>
							<img src="image/silver1.svg"
								style="height: 85px; filter: drop-shadow(3px 3px 2px rgba(0, 0, 0, 0.2));">
							<h5 style="margin-top: 10px;">LemonLime</h5>
						</div>
						<div class="col-sm-4 gradeTop" style="color: #82590d;">
							<h5 style="font-size: 13pt; margin-bottom: 0">3위</h5>
							<img src="image/coper1.svg"
								style="height: 85px; filter: drop-shadow(3px 3px 2px rgba(0, 0, 0, 0.2));">
							<h5 style="margin-top: 10px;">LemonLime</h5>
						</div>
					</div>

					<div
						style="height: 20px; width: 80%; background-color: #e9e9eaff; box-shadow: 0 2px 7px 0 rgba(0, 0, 0, 0.2) inset; margin: 0 auto 50px auto;"></div>

					<h3 style="margin: 50px 0 0 140px; font-size: 16pt;">TOP5</h3>
					<%
						for (int i = 0; i < 5; i++) {
					%>
					<div class="grade5">
						<div class="topNumber"><%=i + 1%></div>
						<div class="proId">
							<p>LemonLime</p>
							<div style="display: flex">
								<div class="meter red">
									<span style="width: 80%"></span>
								</div>
								<span style="margin-left: 15px; font-size: 11pt; color: #bdbdbd">5/14
									회</span>
							</div>
						</div>
					</div>
					<%
						}
					%>
				</div>

			</div>

			<!--///////////////////////// 현재 결과 끝 /////////////////////-->

			<!-- 후기 -->
			<div id="category1" class="container tab-pane fade">
				<br>
				<!-- 챌린지 참가한 사람들만 보이게 제어(한번 작성하면 버튼 hide) -->

				<div class="chall-buttons">
					<a class="modalBtn" data-toggle="modal" data-target="#myModal2">
						<button type="button" class="chall-btn-hover color-3"
							id="reviewMakeBtn">후기 작성</button>
					</a>
				</div>

				<!-- ///////////////후기 작성 끝////////////////// -->
				<div class="row review">
					<div class="col-sm-6 text-center"
						style="border-right: 1px solid #edf0f2">
						<c:if test="${reviewResult.reviewAvg !=null}">
						<h1 style="margin-top: 12px">${reviewResult.reviewAvg }</h1>
							<c:forEach begin="0" end="4" var="i" step="1" varStatus="status">
								<c:if test="${reviewResult.reviewAvg>status.index && reviewResult.reviewAvg<=status.index+1 }">
									<img src="image/star${status.index+1 }.png" style="height: 30px;">
								</c:if>
							</c:forEach>
						<img src="image/star1.png" style="height: 30px;">
						<p style="color: #878787">${reviewResult.reviewCountAll } 건</p>
						</c:if>
						<c:if test="${reviewResult.reviewAvg ==null}">
							<h1 style="margin-top: 12px">0.0</h1>
							<img src="image/star1.png" style="height: 30px;">
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

			<!-- 대화 -->
			<div id="category2" class="container tab-pane fade">
				<br>
				<br>
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
							<img class="userWrap" src=""
								onerror="this.src='image/user_80px.jpg'"> <span>유저
								이름</span>

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
										<span><fmt:formatDate value="${now}"
												pattern="MM-dd HH:mm" /></span>
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
			<!--///////////////////////// 대화 끝 /////////////////////-->
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
			<div class="modal-body">
				<!--         	 <button type="button" class="close" data-dismiss="modal">×</button> -->
				<table>
					<col width="60px">
					<col width="200px">
					<col width="205px">
					<c:if test="${challengeMember != null}">
						<c:forEach var="challUser" items="${challengeMember}"
							varStatus="status">
							<tr>
								<td><img class="userWrap"
									src="https://s3.ap-northeast-2.amazonaws.com/livelybucket/${challUser.memberphotoname }"
									onerror="this.src='image/user_80px.jpg'"></td>
								<td>${challUser.nickname }</td>
								<td align="right">
									<%-- 								<c:if test="${user.email != null && challUser.email != user.email}"> --%>
									<!-- 									<button id="_like-review" class="btn btn-secondary like-review" style="background-color:#ed2553" onclick="userLike()"> -->
									<!-- 								   		<i class="fa fa-heart" aria-hidden="true"></i> Like -->
									<!-- 								 	</button> --> <%-- 								</c:if> --%> <%-- 								<c:if test=""> --%>

									<%-- 								</c:if> --%> <%-- 								<c:choose> --%> <%-- 									<c:when test="${user.email != null && challUser.email != user.email}"> --%>

									<%-- 							 		</c:when> --%> <%--  								 		<c:forEach var="followUser" items="${followingMember}" varStatus="status"> --%>
									<%-- 									 		<c:when test="${user.email != null && user.email eq followUser.followemail}"> --%>
									<%-- 									 			<button id="_like-review" class="btn btn-secondary like-review" style="background-color:#ed2553" onclick="userLikeDel('${challUser.email}')"> --%>
									<!-- 									   			 	<i class="fa fa-heart" aria-hidden="true"></i> You Liked -->
									<!-- 									 			</button> --> <%-- 									 		</c:when> --%>
									<%-- 								 		 </c:forEach> --%> <%-- 								 	</c:choose> --%>



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
			<div class="modal-body" style="height: 650px">
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
								style="font-size: 13pt; font-weight: 600">달성률에 따라 환급이
									달라집니다.</span></td>
						</tr>
						<tr>
							<td colspan="2">100% 성공</td>
							<td style="text-align: right; font-weight: 600"><c:out
									value="${challDto.pointcount * 2 }" /> point</td>
						</tr>
						<tr>
							<td colspan="2">85%이상 성공</td>
							<td style="text-align: right; font-weight: 600"><c:out
									value="${challDto.pointcount * 1.5 }" /> point</td>
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
				<button type="button" class="btn" onclick="startChallengeBtn()">CHALLENGE
					도전</button>
			</div>

		</div>
	</div>
</div>




<!-- 결과 차트 js -->
<script src="js/easypiechart.js"></script>

<!-- summer note 사용시 추가 -->
<script src="./js/summernote/summernote-lite.js"></script>
<script src="./js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="./css/summernote/summernote-lite.css">


<!-- progress 바 채워지기 -->
<script>
//차트 모션 (progress)
$(".meter > span").each(function () {
  $(this)
    .data("origWidth", $(this).width())
    .width(0)
    .animate(
      {
        width: $(this).data("origWidth")
      },
      1200
    );
});


//요일 class제어 indentifyDate

let indentifyDate =new Array(${challDto.identifyday});

$.each(indentifyDate, function(i, val){
	$("#idendate li:nth-child("+val+")").css("font-weight", "500");
	$("#idendate li:nth-child("+val+")").css("color", "black");
	console.log(val);
});


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
let strArr = startdateSub.split('-');
let startDate = new Date(strArr[0], strArr[1]-1, strArr[2]);
let strArr2 = enddateSub.split('-');
let endDate = new Date(strArr2[0], strArr2[1]-1, strArr2[2]);

let syear = strArr[0];
let smonth = strArr[1];
let sday = strArr[2];
let eyear = strArr2[0];
let emonth = strArr2[1];
let eday = strArr2[2];

console.log("시작 날짜"+startDate)
console.log("끝 날짜"+endDate)
//console.log("오늘 날짜"+nowDate)

//시작중인 챌린지 오늘인지 며칠 뒤인지 보여주기
if("${challDto.limitdate}"<0){
	$("#limitD").text("시작중인 챌린지 | 모집 마감");
}else if("${challDto.limitdate}"==0){
	$("#limitD").text("오늘부터 시작");
}else{
	$("#limitD").text("${challDto.limitdate}"+"일 뒤부터 시작");
}

//날짜 출력하기



출처: https://trendfollow.tistory.com/26 [낙낙™ 트렌드]

//date 05.11(화)형식으로 바꾸기(문자열)
function dateToMonth(Dyear, Dmonth, Dday) {
	
	let nowDate = new Date(Dyear, Dmonth-1, Dday);
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

//periodDate 05.11(화)~05.28(금)
$("#periodDate").text(dateToMonth(syear, smonth, sday)+" ~ "+dateToMonth(eyear, emonth, eday))



/* 	var eventE=0;
//like버튼 누르면 제어
$('.like-review').click(function(){
	if(eventE==0){
	   $(this).html('<i class="fa fa-heart"></i> You liked');
	   $(this).children('.fa-heart').addClass('animate-like');
	   //테이블 FOLLOW : FOLLOW
	    eventE++; 	    
	  
	}else{
		$(this).html('<i class="fa fa-heart"></i>like');
		$(this).children('.fa-heart').addClass('animate-like');
		eventE--;   
	}
});
 */
//  console.log("들어오냐고")
//  $(document).ready(function(){
// 	console.log("들어오냐고")
// 	 $.ajax({
// 		 type:"post",
// 		 url:"followData.do",
// 		 data:{"email":"${user.email}"},
// 		 success:function(likeMemberList){
// 			console.log("success 좋아요 인간아" + likeMemberList.length)
			
// 			 let data = "";
// 			 $.each(likeMemberList, function(i, likeUser){
// 				 console.log(likeUser.followemail)
// 			 		if(${user.email} !=null && likeUser.followingemail == null){
// 			 			data = "<button class='btn btn-secondary like-review' style='background-color:#ed2553' onclick=\"userLike('${challUser.email}')\">"
// 			 				+	"<i id='likeI' class='fa fa-heart' aria-hidden='true'>Like</i>"
// 			 				+ "</button>";

// 			 		}else if(${user.email} !=null && ${user.email} == followUser.followemail){
// 			 			$("#likeI").text("");
// 			 			data = "<button class='btn btn-secondary like-review' style='background-color:#ed2553' onclick=\"userLikeDel('${challUser.email}')\">"
// 			 				+	"<i id='likeI' class='fa fa-heart' aria-hidden='true'>You Liked</i>"
// 			 				+ "</button>";
// 			 		}
				 	
				 	

// 			 }
			 
// 		 }, 
// 		 error:function(){
// 			 alert("데이터 가져오기 실패");
// 		 }
		 
// 	 });
//  });
 
 
//  //좋아요 버튼 제어
// function userLike(followinguser){
// 	 let ddd = ${challUser.email }
// 	 console.log("FDfdsgdg"+ddd)
// 	 let id = document.getElementById('_like-review');
	 
// 	 $.ajax({
// 		 type:"post",
// 		 url:"followInsert.do",
// 		 data:{"followemail":"${user.email}", "followingemail":followinguser},
// 		 success:function(msg){
// 	    		if(msg=="SUCCESS"){
// 	    			alert("좋아요 성공 ");
// 	    		}
// 	    	},
// 	   		error:function(){
// 	   			alert("좋아요 에러");
// 	   		}, 
// 	   		complete:function(){
// 	   			id.innerHTML = "<i class='fa fa-heart' aria-hidden='true'></i> You Liked";
// 		   		$('#_like-review').children('.fa-heart').addClass('animate-like');
// 		   		console.log( $('#_like-review').prop("onclick"))
// // 	   		    $('#_like-review').prop("onclick", null);
// 	   		    $("#_like-review").attr("onclick","userLikeDel('ywoo0309@gamil.com')");
// 	   		 console.log( $('#_like-review').attr("onclick"))
// 	   		}
// 	    });	 
//  }
 
//  function userLikeDel(followinguser){

// 	 let id = document.getElementById('_like-review');

// 	 $.ajax({
// 		 type:"post",
// 		 url:"followDelete.do",
// 		 data:{"followemail":"${user.email}", "followingemail":followinguser},
// 		 success:function(msg){
// 			 console.log(msg)
// 	    		if(msg=="SUCCESS"){
// 	    			alert("좋아요 삭제 성공 ");
// 	    		}
// 	    	},
// 	   		error:function(){
// 	   			alert("좋아요 삭제 에러");
// 	   		}, 
// 	   		complete:function(){
// 	   			id.innerHTML = "<i class='fa fa-heart' aria-hidden='true'></i>Like";
// 		   		$('#_like-review').children('.fa-heart').addClass('animate-like');
// 		   		 $('#_like-review').prop("onclick", null);
// 	   		   $("#_like-review").prop("onclick", "userLike()");


// 	   		}
// 	    });	 
//  }
 
 

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
   		}
    });
	
}

Review(0);	
//후기 작성 아작스 데려오기
function Review(number){
	
	
	$.ajax({
		url:"challengereviewAll.do",
		data:{"number":number, "challengeseq":"${challDto.challengeseq}"},
		type:"post",
		success:function(revlist){
				//alert("sdsd");
			// $("#Review"+number).remove();
			let data = "";
			if(revlist.length==0){
				data += "<p class='reviewUser'>아직 등록된 후기가 없습니다. 후기를 작성해 주세요</p>"	
			}

			$.each(revlist, function(i, review){
				//날짜 포맷제어
				console.log(review.chalcomdate)
				let revd = new Date(review.chalcomdate);
				let year = revd.getFullYear();
				let month = (revd.getMonth()+1);
				month = month>=10?month:"0"+month;
				let day = revd.getDate();
				day = day>=10?day:"0"+day;
				
				let revDate = year+"."+month+"."+day;
				
				data += "<div id='revData'>"
						+   "<div class='reviewUser'>"
						+    "<div class='reviewUserImg'>"
						+    "<img class='userWrap60' src='https://s3.ap-northeast-2.amazonaws.com/livelybucket/"+review.memberphotoname+"' onerror=\"this.src='image/user_80px.jpg'\">"
     					+    "<p>"+review.nickname+"</p>"
	     				+    "</div>"
	     				+    "<div class='reviewUserText'>"
						+    "<img src='image/star1.png' style='height: 17px;'><span>"+revDate+"</span>"
						+ 	 "<div>"+review.chalcomcontent+"</div>"
						+    "</div>"
     					+    "<div class='reviewUserLike'>"
     					+    "<i class='far fa-thumbs-up fa-2x' onclick=\"commentLike(this)\"></i>"
						+    "<p id=>"+review.challlike+" likes</p>"
						+    "</div></div><hr></div>";
 					//<!-- <i class="fas fa-thumbs-up fa-2x"></i> -->	
 					//console.log("fdsfsdfdsff"+data)
				
			});
			//console.log("완성"+data)
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
function commentLike(commentseq){
	alert(commentseq);
	//alert(commentseq)
	$.ajax({
		url:"commentLike.do",
		data:{"email":'${user.email}', "chalcomseq":commentseq},
		type:"post",
		success:function(msg){
			//alert(msg);
			//.reviewUserLike
			$(".reviewUserLike").html = "<i class='far fa-thumbs-up fa-2x' onclick='commentLikeDel("+commentseq+")'></i>"
										+    "<p>"+review.challlike+" likes</p>";	
			$(this).children('i').removeClass('far fa-thumbs-up fa-2x');
			$(this).children('i').addClass("fas fa-thumbs-up fa-2x");
		},
		error:function(){
			alert("후기 좋아요 버튼 에러");
		},
		complete:function(){
		
		}
	});
}

//후기 좋아요 해제
function commentLikeDel(commentseq){
	alert(commentseq)
	$.ajax({
		url:"commentLikeDel.do",
		data:{"email":'${user.email}', "chalcomseq":commentseq},
		type:"post",
		success:function(msg){
			//alert(msg);
			$("#commlike").html("<i class='far fa-thumbs-up fa-2x' onclick='commentLike(this)'></i>");
		},
		error:function(){
			alert("후기 좋아요 삭제 실패");
		},
		complete:function(){
			
		}
	});
}
//후기 작성 버튼 제어
/*var userid = $("#_userid").val();

if(userid == null){

   $("#reviewMakeBtn").css("display","none");
}else{


   $("#reviewMakeBtn").show();

   $(".reviewSummerNote").hide();

   
   $(document).ready(function() {
      $("#reviewMakeBtn").click(function() {
         var Ans = 0;
         if(Ans==0){
	         $(".reviewSummerNote").show();
	         n=1;
         }else{
            $(".reviewSummerNote").hide();
         }
         
      })
   });
   
}*/
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
    
  
</script>

