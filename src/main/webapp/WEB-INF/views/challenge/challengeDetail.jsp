<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <link rel="stylesheet" href="./css/challengeDetail.css" />
 <link rel="stylesheet" href="./css/starRate/starRate.css" />
  <!-- core tag -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!-- format 사용시 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <!-- jsp태그 -->
<jsp:useBean id="now" class="java.util.Date" />

<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
<script>
$(document).ready(function(){
	  $('[data-toggle="popover"]').popover();   
//$(".chall-buttons").hide();

//	$("#pro1").css("width", "80%");
});
</script>

 
<div class="backDiv" style="background-image: url('image/challengeBack.png')">
	<div class="container challHeader">
		<div>
			<h1>하루에 1L씩 물먹기</h1>
			<a href="#" data-toggle="popover" data-trigger="hover" data-content="챌린지를 찜하세요" style="margin-right: 30px;">
				<div onclick="checkChallenge(this)">
				 	<img class="checkImg" src="image/check.svg" onmouseover="this.src='image/checkhover.svg'" onmouseout="this.src='image/check.svg'">
				</div>
			</a>
		
		</div>
		<p>내일부터 시작 | 모집 마감</p>
		<label>평일 매일</label><label>3주 동안</label><span class="period">05.11(화) ~ 05.28(금)</span><br>
		<span class="explain">평일 매일 3주동안, 하루에 1번 18시에 인증해야 합니다.</span>
	</div>
</div>

<div class="container"  style="margin-bottom:50px">
	<table class="attend">
		<col width="30px"><col width="100px"><col width="500px">
		<tr>
			<td><i class="fas fa-coins"></i></td>
			<td>참가 포인트</td>
			<td>100 point</td>
		</tr>
		<tr>
			<td><i class="fas fa-user"></i></td>
			<td>참가 인원</td>
			<td><span style="padding-right: 50px;">54명</span> 
				<% for(int i=0;i<5;i++){ %>
					<img class="userWrap" src="" onerror="this.src='image/user_80px.jpg'">
				<%} %>
				<a class="modalBtn" data-toggle="modal" data-target="#myModal">
					<i style="color:#cfcbd2" class="fas fa-angle-right"></i>
				</a>
				
			</td>
		</tr>
	
		
	</table>

	<label class="challengetext">챌린지 소개</label>
	<div class="challengetextMain">
		어떤 챌린지 인지 소개해보세용
	</div>
	<!-- 참가 설명 -->
	<div class="row pointExplain">
		<div class="col-sm-6">
			<table>
				<col width="200px"><col width="300px">
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
			<label>챌린지 인증 방법</label>
			<p><span class="highlight">9:00 ~ 9:05사이</span>에 버튼을 눌러주세요</p>
		</div>
	</div>
	<!-- 주의사항 -->		
	<div class="precautions">
		<label class="challengetext">챌린지 주의사항</label>
		<table>
			<col width="200px"><col width="300px">
			<tr>
				<td style="font-weight: 500;">인증 가능 요일</td>
				<td>월 화 수 목 금 토 일</td>
			</tr>
			<tr>
				<td style="font-weight: 500;">인증 빈도</td>
				<td>평일 매일</td>
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
	    <li class="nav-item">
	      <a class="nav-link active" data-toggle="pill" href="#home">현재 결과</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" data-toggle="pill" href="#category1">후   기</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" data-toggle="pill" href="#category2">대  화</a>
	    </li>
	  </ul>

	  <!-- Tab panes -->
	  <div class="tab-content">
	  <!-- 현재 결과 -->
		<div id="home" class="container tab-pane active">
			
			<!-- 달성되었나요? -->
			<h1 class="resultHeader">얼마나 달성되었나요?</h1>
			<div class="row resultChart">
				<div class="col-sm-6" style="border-right: 1px solid #edf0f2">
					<div class="card-panel text-center" >
						<div class="easypiechart" id="easypiechart-total" data-percent="82" >
							<span class="percent">82%</span>
						</div>
						<h4>전체</h4>
					</div> 					
				</div>
				<div class="col-sm-6" >
					<div class="card-panel text-center">
						<div class="easypiechart" id="easypiechart-user" data-percent="82" >
							<span class="percent">82%</span>
						</div>
						<h4>LemonLime 님</h4>
					</div> 	
				</div>
			</div> 
			
			<!-- 인증 횟수는? -->
<!-- 			<hr style="border-top: 2px solid rgba(203, 152, 237,0.2)"> -->
			<div class="identify text-center">
				<img class="userWrap60" src="" onerror="this.src='image/user_80px.jpg'">
				<span>LemonLime님의 인증 횟수는?</span><br>
				<div class="inCount">
					<div style="display: flex;flex-direction:column;">
						<h5 style="margin-bottom: 0;font-size: 13pt;color:#8b63da">8위</h5>
						<img src="image/mytrophy1.svg" style="height:85px;filter: drop-shadow(3px 3px 2px rgba(0,0,0,0.2));">
					</div>
					<span class="d-none d-sm-block">
						<%for(int i=0;i<5;i++){ %>
							<img src="image/identify1.png" style="background-color: #8b63da">	
						<%} %>
						<%for(int i=0;i<14-5;i++){ %>
							<img src="image/identify1.png" style="background-color:white">	
						<%} %>
						<span style="font-size: 11pt;color:#7a777d;margin-left: 10px;">5/14회</span>
					</span>
				</div>
			</div>
<!-- 			<hr style="border-top: 2px solid rgba(203, 152, 237,0.2)"> -->
			<!-- 순위 보여주기 -->
			<div class="grade">
				<h3>TOP3 순위</h3>
				<div class="row text-center" style="width: 80%;margin:30px auto 20px auto";>
					<div class="col-sm-4 gradeTop" style="color:#e6ba1e;border-right:1px solid #edf0f2">
						<h5 style="font-size: 13pt;margin-bottom:0">1위</h5>
						<img src="image/gold1.svg" style="height:85px;filter: drop-shadow(3px 3px 2px rgba(0,0,0,0.2));">
						<h5 style="margin-top: 10px;">LemonLime</h5>
					</div>
					<div class="col-sm-4 gradeTop" style="color: #c7c7c7;border-right:1px solid #edf0f2">
						<h5 style="font-size: 13pt;margin-bottom:0">2위</h5>
						<img src="image/silver1.svg" style="height:85px;filter: drop-shadow(3px 3px 2px rgba(0,0,0,0.2));">
						<h5 style="margin-top: 10px;">LemonLime</h5>
					</div>
					<div class="col-sm-4 gradeTop" style="color: #82590d;">
						<h5 style="font-size: 13pt;margin-bottom:0">3위</h5>
						<img src="image/coper1.svg" style="height:85px;filter: drop-shadow(3px 3px 2px rgba(0,0,0,0.2));">
						<h5 style="margin-top: 10px;">LemonLime</h5>
					</div>			
				</div>
			
				<div style="height: 20px;width: 80%;background-color: #e9e9eaff; box-shadow: 0 2px 7px 0 rgba(0, 0, 0, 0.2) inset;margin: 0 auto 50px auto;"></div>
				
				<h3 style=" margin: 50px 0 0 140px;font-size: 16pt;">TOP5 </h3>
				<%for(int i=0;i<5;i++){ %>
				<div class="grade5">
					<div class="topNumber"><%=i+1 %></div>
					<div class="proId">
						<p>LemonLime</p>	
						<div style="display: flex">					
							<div class="meter red">
								<span style="width: 80%"></span>
							</div>
			                <span style="margin-left: 15px;font-size: 11pt;color:#bdbdbd">5/14 회</span>
		                </div>
					</div>		
				</div>
				<%} %>
			</div>
			
	    </div>
	
	     <!--///////////////////////// 현재 결과 끝 /////////////////////-->
	    
	     <!-- 후기 -->
        <div id="category1" class="container tab-pane fade"><br>
        	<!-- 챌린지 참가한 사람들만 보이게 제어(한번 작성하면 버튼 hide) -->
   	
				<div class="chall-buttons">
					<a class="modalBtn" data-toggle="modal" data-target="#myModal2">
			 			<button type="button" class="chall-btn-hover color-3"  id="reviewMakeBtn" >후기 작성</button>
			 		</a> 	
				</div>

			 <!-- ///////////////후기 작성 끝////////////////// -->
      		<div class="row review">
				<div class="col-sm-6 text-center" style="border-right: 1px solid #edf0f2">
      				<h1 style="margin-top: 12px">4.6</h1>
      				<img src="image/star1.png" style="height: 30px;">
      				<p style="color:#878787">35 건</p>			
				</div>
				<div class="col-sm-6 text-center progressMain">
					<table>
						<col width="40px"><col width="210px"><col width="30px">
						<tr>
							<td class="proTd1">5점</td>
							<td>
								<div class="progress">
					                <div class="progress-bar six-sec-ease-in-out" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 65%;">
					               		<span>65%</span>
					                </div>
					            </div>
							</td>
							<td class="proTd">85%</td>
						</tr>
						<tr>
							<td class="proTd1">4점</td>
							<td>
								<div class="progress">
					                <div class="progress-bar six-sec-ease-in-out" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 65%;">
					               		<span>65%</span>
					                </div>
					            </div>
							</td>
							<td class="proTd">85%</td>
						</tr>
						<tr>
							<td class="proTd1">3점</td>
							<td>
								<div class="progress">
					                <div class="progress-bar six-sec-ease-in-out" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 65%;">
					               		<span>65%</span>
					                </div>
					            </div>
							</td>
							<td class="proTd">85%</td>
						</tr>
						<tr>
							<td class="proTd1">2점</td>
							<td>
								<div class="progress">
					                <div class="progress-bar six-sec-ease-in-out" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 65%;">
					               		<span>65%</span>
					                </div>
					            </div>
							</td>
							<td class="proTd">85%</td>
						</tr>
						<tr>
							<td class="proTd1">1점</td>
							<td>
								<div class="progress">
					                <div class="progress-bar six-sec-ease-in-out" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 65%;">
					               		<span>65%</span>
					                </div>
					            </div>
							</td>
							<td class="proTd">85%</td>
						</tr>	
					</table>
				</div>	
			</div>
			<!--//////////////////// 후기 전체 끝//////////////////// -->
			<div class="reviewBbs">
				<p style="margin-bottom: 0">253개 후기가 있습니다</p>
				<!-- 정렬  네비 -->
				<div class="reviewNav">
				 <ul class="nav" role="tablist">
				    <li class="nav-item">
				      <a class="nav-link active" data-toggle="tab" href="#newReivew">최신순</a>
				    </li>
				    <li class="nav-item">
				      <a class="nav-link" data-toggle="tab" href="#hotReview">인기순</a>
				    </li>
				    <li class="nav-item">
				      <a class="nav-link" data-toggle="tab" href="#ratingReview">별점순</a>
				    </li>
				  </ul>
				  <hr>
				</div>
				
				<!-- 정렬 데이터 -->
				 <div class="tab-content">
				   <div id="newReivew" class="tab-pane active">
				    
				     	<c:forEach var="i" begin="0" end="8" step="1">
					     	<div class="reviewUser">
					     		<div class="reviewUserImg">
				     				<img class="userWrap60" src="image/user_80px.jpg" onerror="this.src='image/user_80px.jpg'">
				     				<p>LemonLime</p>
					     		</div>
					     		<div class="reviewUserText">
				     				<img src="image/star1.png" style="height: 17px;"><span>2021.05.17</span>
				     				<div>
				     					이러쿵 저러쿵 후기가 이따구야 알겠냐?!
				     				</div>
					     		</div>
					     		<div class="reviewUserLike">
			     					<i class="far fa-thumbs-up fa-2x"></i>
			     					<!-- <i class="fas fa-thumbs-up fa-2x"></i> -->
			     					<p>35 likes</p>
				     			</div>
				     		 </div>
				     		<hr>
				     	</c:forEach>
					    
 				  	</div> 
		
				    <div id="hotReview" class="tab-pane fade"><br>
				      <h3>Menu 1</h3>
				      <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
				    </div>
				    <div id="ratingReview" class="tab-pane fade"><br>
				      <h3>Menu 2</h3>
				      <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
				    </div>
				  </div>
				</div>
			</div>

	     <!--///////////////////////// 후기 끝 /////////////////////-->
	    
	     <!-- 대화 -->
	     <div id="category2" class="container tab-pane fade"><br><br>
	     	<div class="row chatHeader">
	     		<div class="col-sm-12 chatHeader">
	     			<img alt="" src="image/logo.png">
	     			<div class="float-right">
	     				<img class="userWrap30" src="" onerror="this.src='image/user_80px.jpg'" style="height: 30px;margin-top: 9px;">
	     				<div class="userName">
	     					LemonLime 님
	     				</div>
	     			</div>
	     		</div>
	     	</div>
	     	<div class="row chat">
	     		<div class="d-none d-sm-block col-sm-3 chatUser">
	     			<%for(int i=0;i<5;i++){ %>
 	     				<div class="userCard"> 
	     					<img class="userWrap" src="" onerror="this.src='image/user_80px.jpg'">
	     					<span>유저 이름</span>
	     					
	     				</div>
	     			<%} %>
	     		</div>
	     		<div class="col-sm-9 chatMain">
	     			<div class="chatAll">
	     				<div class="userChatText">
	     					<img class="userChatImg userWrap" src="" onerror="this.src='image/user_80px.jpg'">
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
					    	 <button class="btn send"><i class="far fa-paper-plane fa-2x"></i></button>
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
				<col width="60px"><col width="200px"><col width="205px">
				<tr>
					<td>
							<img class="userWrap" src="" onerror="this.src='image/user_80px.jpg'">
					</td>
					<td>
						user이름
					</td>
					<td align="right">
						<button class="btn btn-secondary like-review" style="background-color:#ed2553">
						    <i class="fa fa-heart" aria-hidden="true"></i> Like
						  </button>
					</td>
				</tr>
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
  <div class="modal" id="myModal2" >
    <div class="modal-dialog modal-xl" style="top:15%">
      <div class="modal-content">
      
        <!-- Modal body -->
        <div class="modal-body">
          <button type="button" class="close" data-dismiss="modal">×</button>
          
          <div class="reviewSummerNote">
		        <h3>후기 작성</h3>
		       
		           <p class="title_star">후기는 수정할 수 없습니다. 신중하게 작성해 주세요.</p>
					
					
					<!-- RATING - Form -->
					<form id="rateFrm" class="rating-form" action="#" method="post" name="rating-movie">
					  <fieldset class="form-group">
					    
					    <legend class="form-legend">Rating:</legend>
					    
					    <div class="form-item">
					      
					      <input id="rating-5" name="rating" type="radio" value="5" />
					      <label for="rating-5" data-value="5" >
					        <span class="rating-star">
					           <i class="fa fa-star-o"></i>
         					   <i class="fa fa-star"></i>	       
					        </span>
					        <span class="ir">5</span>
					      </label>
					      <input id="rating-4" name="rating" type="radio" value="4" />
					      <label for="rating-4" data-value="4" >
					        <span class="rating-star">
					           <i class="fa fa-star-o "></i>
         					   <i class="fa fa-star"></i>
					        </span>
					        <span class="ir">4</span>
					      </label>
					      <input id="rating-3" name="rating" type="radio" value="3" />
					      <label for="rating-3" data-value="3">
					        <span class="rating-star">
					         <i class="fa fa-star-o"></i>
         					   <i class="fa fa-star"></i>
					        </span>
					        <span class="ir">3</span>
					      </label>
					      <input id="rating-2" name="rating" type="radio" value="2" />
					      <label for="rating-2" data-value="2">
					        <span class="rating-star">
					         <i class="fa fa-star-o"></i>
         					   <i class="fa fa-star"></i>
					        </span>
					        <span class="ir">2</span>
					      </label>
					      <input id="rating-1" name="rating" type="radio" value="1" />
					      <label for="rating-1" data-value="1">
					        <span class="rating-star">
					          <i class="fa fa-star-o"></i>
         					   <i class="fa fa-star"></i>
					        </span>
					        <span class="ir">1</span>
					      </label>
					      
					      <div class="form-action">
					        <input class="btn-reset" type="reset" value="Reset" />   
					      </div>
					
					      <div class="form-output">
					        ? / 5
					      </div>
					      
					    </div>
					    
					  </fieldset>
					  
				
                     <textarea class="review_textarea"  id="summernote" name="revcontent"></textarea>

		        </form>
					  
				
					
					
					
							              		 

   			</div>

        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer" style="justify-content: center">
          <button type="button" name="save" onclick="save()" class="btn" style="width: 200px">후기 작성</button>
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

	var eventE=0;
//like버튼 누르면 제어
$('.like-review').click(function(){
	if(eventE==0){
	   $(this).html('<i class="fa fa-heart"></i> You liked');
	   $(this).children('.fa-heart').addClass('animate-like');
	    eventE++; 	    
	}else{
		$(this).html('<i class="fa fa-heart"></i>like');
		$(this).children('.fa-heart').addClass('animate-like');
		eventE--;   
	}
});

var checkChall = 0;
//찜하기 버튼 제어 checkChallenge()
// <img class="checkImg" src="image/check.svg" style="height: 55px;opacity: 70%;">
function checkChallenge(id){
	//alert(id);
	if(checkChall==0){
		id.innerHTML = "<img src='image/checkFill.svg' class='checkImg'>";
// 		$(this).attr("src", "image/checkFill.svg");
		checkChall++;
	}else{
		id.innerHTML = "<img src='image/check.svg' class='checkImg' onmouseover=\"this.src='image/checkhover.svg'\" onmouseout=\"this.src='image/check.svg'\">";
		checkChall--;
	}
}


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
    //폼 서밋
	//실제로는 서버에 폼을 전송하고 완료 메시지가 표시되지만 저장된 것으로 간주하고 폼을 초기화 함.
    
    document.getElementById("rateFrm").submit();
    
	alert("저장완료!");
	rating.setRate(0);
	document.querySelector('.review_textarea').value = '';
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

