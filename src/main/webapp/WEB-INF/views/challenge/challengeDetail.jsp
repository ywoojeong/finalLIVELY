<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <link rel="stylesheet" href="./css/challengeDetail.css" />
 
 
<div class="backDiv" style="background-image: url('image/challengeBack.png')">
	<div class="container challHeader">
		<h1>하루에 1L씩 물먹기</h1>
		<p>내일부터 시작 | 모집 마감</p>
		<label>평일 매일</label><label>3주 동안</label><span class="period">05.11(화) ~ 05.28(금)</span><br>
		<span class="explain">평일 매일 3주동안, 하루에 1번 18시에 인증해야 합니다.</span>
	</div>
</div>

<div class="container">
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
			<h1 class="resultHeader">얼마나 달성되었나요?</h1>
			<div class="row resultChart">
				<div class="col-sm-6 ">
					<div class="card-panel text-center">
						<div class="easypiechart" id="easypiechart-total" data-percent="82" >
							<span class="percent">82%</span>
						</div>
						<h3>전체</h3>
					</div> 					
				</div>
				<div class="col-sm-6">
					<div class="card-panel text-center">
						<div class="easypiechart" id="easypiechart-user" data-percent="82" >
							<span class="percent">82%</span>
						</div>
						<h3>LemonLime 님</h3>
					</div> 	
				</div>
			</div> 
			<div class="identify text-center">
					<img class="userWrap80" src="" onerror="this.src='image/user_80px.jpg'">
					<span>LemonLime님의 인증 횟수입니다</span><br>
					<div class="inCount">
						<%for(int i=0;i<5;i++){ %>
							<img  src="image/identify.png" style="background-color: #8b63da">	
						<%} %>
						<%for(int i=0;i<14-5;i++){ %>
							<img  src="image/identify.png" style="background-color: #e9e9eaff">	
						<%} %>
						<span style="font-size: 13pt;color:#7a777d;">5/14회</span>
					</div>
			</div>
 
	    </div>
	    
	     <!-- 후기 -->
        <div id="category1" class="container tab-pane fade"><br>
      		
 	    </div>
	    
	    
	     <!-- 대화 -->
	     <div id="category2" class="container tab-pane fade"><br>
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
	     		<div class="d-none d-sm-block col-sm-4 chatUser">
	     			<%for(int i=0;i<5;i++){ %>
 	     				<div class="userCard"> 
	     					<img class="userWrap" src="" onerror="this.src='image/user_80px.jpg'">
	     					<span>유저 이름</span>
	     					
	     				</div>
	     			<%} %>
	     		</div>
	     		<div class="col-sm-8 chatMain">
	     			<div class="chatAll">
	     			
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
	  </div>
	</div>
</div>


<!--//////////////////////////////// user모달 //////////////////////////////// -->

 <!-- The Modal -->
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

<!-- 결과 차트 js -->
<script src="js/easypiechart.js"></script>


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


//textarea 스크롤 없앰
 $(document).ready(function() {
      $('.chatrow').on( 'keyup', 'textarea', function (e){
        $(this).css('height', 'auto' );
        $(this).height( this.scrollHeight );
      });
      $('.wrap').find( 'textarea' ).keyup();
    });
</script>






