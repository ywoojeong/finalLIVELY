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

<script>
$(document).ready(function(){
// 	$(".chall-buttons").hide();
//$(".reviewSummerNote").hide();
//	$("#pro1").css("width", "80%");
});
</script>

 
<div class="backDiv" style="background-image: url('image/challengeBack.png')">
	<div class="container challHeader">
		<h1>하루에 1L씩 물먹기</h1>
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
						<h5>8위</h5>
						<i class="fas fa-trophy fa-4x"></i>
					</div>
					<span class="d-none d-sm-block">
						<%for(int i=0;i<5;i++){ %>
							<img src="image/identify.png" style="background-color: #8b63da">	
						<%} %>
						<%for(int i=0;i<14-5;i++){ %>
							<img src="image/identify.png" style="background-color: #e9e9eaff">	
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
						<h5 style="font-size: 13pt">1위</h5>
						<i class="fas fa-trophy fa-4x" style="filter: drop-shadow(3px 3px 2px rgba(0,0,0,0.2));"></i>
						<h5 style="margin-top: 10px;">LemonLime</h5>
					</div>
					<div class="col-sm-4 gradeTop" style="color: #c7c7c7;border-right:1px solid #edf0f2">
						<h5 style="font-size: 13pt">2위</h5>
						<i class="fas fa-trophy fa-4x" style="filter: drop-shadow(3px 3px 2px rgba(0,0,0,0.2));"></i>
						<h5 style="margin-top: 10px;">LemonLime</h5>
					</div>
					<div class="col-sm-4 gradeTop" style="color: #82590d;">
						<h5 style="font-size: 13pt">3위</h5>
						<i class="fas fa-trophy fa-4x" style="filter: drop-shadow(3px 3px 2px rgba(0,0,0,0.2));"></i>
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
        	 <button type="button" class="close" data-dismiss="modal">×</button>
			<table>
				<col width="60px"><col width="200px">
				<tr>
					<td>
							<img class="userWrap" src="" onerror="this.src='image/user_80px.jpg'">
					</td>
					<td>
						user이름
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
    <div class="modal-dialog modal-xl">
      <div class="modal-content">
      
        <!-- Modal body -->
        <div class="modal-body">
          <button type="button" class="close" data-dismiss="modal">×</button>
          
          <div class="reviewSummerNote">
		        <h3>후기 작성</h3>
		        <form name="reviewform" class="reviewform" method="post" action="/save">
		        	<input type="hidden" name="rate" id="rate" value="0"/>
		            <p class="title_star">후기는 수정할 수 없습니다. 신중하게 작성해 주세요.</p>   		 
                    <div class="review_rating rating_point">   
	                    <div class="rating">
	                        <div class="ratefill"></div>
	                        <!-- [D] 해당 별점이 선택될 때 그 점수 이하의 input엘리먼트에 checked 클래스 추가 -->
	                        <input type="checkbox" name="rating" id="rating1" value="1" class="rate_radio" title="1점">
	                        <label for="rating1" style="background-image: url('./img/starrate.png')"></label>
	                        <input type="checkbox" name="rating" id="rating2" value="2" class="rate_radio" title="2점">
	                        <label for="rating2" style="background-image: url('./img/starrate.png')"></label>
	                        <input type="checkbox" name="rating" id="rating3" value="3" class="rate_radio" title="3점" >
	                        <label for="rating3" style="background-image: url('./img/starrate.png')"></label>
	                        <input type="checkbox" name="rating" id="rating4" value="4" class="rate_radio" title="4점">
	                        <label for="rating4" style="background-image: url('./img/starrate.png')"></label>
	                        <input type="checkbox" name="rating" id="rating5" value="5" class="rate_radio" title="5점">
	                        <label for="rating5" style="background-image: url('./img/starrate.png')"></label>
	                    </div>   
	                    <div class="warning_msg">별점을 선택해 주세요.</div>
	                 </div> 
    					
    				 <input type="button"  name="save" id="save" class="btn" value="Review">
    				 <div class="warning_msg2">5자 이상의 리뷰 내용을 작성해 주세요.</div>
                     <div class="review_contents" style="background-color: white">
                        <textarea class="review_textarea"  id="summernote" name="revcontent"></textarea>
                     </div> 
		        </form>
   			</div>

        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn">후기 작성</button>
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

<!-- 별점 js -->
<script src="./js/starRate/starRate.js"></script>
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
           height: 150,
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

