<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<link rel="stylesheet" href="./css/element.css" />
<link rel="stylesheet" href="./css/myMainPage2.css" />
<link href="./fcalLib/main.css" rel="stylesheet">

<div class="container">
    <div class="row">
        <div class="col-sm-3">
            <div class="member_box">
                <img class="userWrap"/>
                <h4>Admin</h4>
                <p style="font-size: 15px;">0 Point</p>
                
                <!-- 회원정보수정 모달 -->
                <button type="button" class="memModify">회원정보 수정</button>
                
                <div class="member_link">
                    <div class="cut_item">
                        <div class="cut_text">찜한챌린지</div>
                        <div class="cut_icon"><a><i class="far fa-heart fa-3x"></i></a></div>
                        <div class="cut_count">0</div>
                    </div>
                    <div class="cut_item">
                        <div class="cut_text">성공챌린지</div>
                        <div class="cut_icon"><a><i class="fas fa-fire-alt fa-3x"></i></a></div>
                        <div class="cut_count">0</div>
                    </div>
                    <div class="cut_item">
                        <div class="cut_text">My팔로워</div>
                        <div class="cut_icon"><a><i class="far fa-handshake fa-3x"></i></a></div>
                        <div class="cut_count">0</div>
                    </div>
                </div>
            </div>
        </div>
        
        
        
        <div class="col-sm-9">
            <!-- 탭부분 -->
            <!-- Nav pills -->
		    <ul class="nav nav-pills" role="tablist">
		        <li class="nav-item">
		            <a class="nav-link active" data-toggle="pill" href="#whole">전체현황</a>
		        </li>
		        <li class="nav-item">
		            <a class="nav-link" data-toggle="pill" href="#menu1" id="memMonth">월간리포트</a>
		        </li>
		        <li class="nav-item">
		            <a class="nav-link" data-toggle="pill" href="#menu2">제안하기</a>
		        </li>
		    </ul>
			
			<!-- Tab panes -->
    		<div class="tab-content">
    			<!-- 전체현황 -->
		        <div id="whole" class="container tab-pane active">
		            <div class="member_rightBox">
		                <div class="row">
		                    <div class="col-sm-12">
		                        <div class="member_count">
		                        	<!-- count 부분 -->
		                            
		                                <div class="card-panel text-center">
		                                    <div class="row">
		                                        <div class="col-sm-4">
		                                            <h5>찜하기</h5>
		                                            <div class="easypiechart" id="easypiechart-dibs" data-percent="82" >
		                                                <span class="percent">82%</span>
		                                            </div>
		                                        </div>
		                                        <div class="col-sm-4">
		                                            <h5>참가중</h5>
		                                            <div class="easypiechart" id="easypiechart-part" data-percent="82" >
		                                                <span class="percent">82%</span>
		                                            </div>
		                                        </div>
		                                        <div class="col-sm-4">
		                                            <h5>완료</h5>
		                                            <div class="easypiechart" id="easypiechart-finish" data-percent="82" >
		                                                <span class="percent">82%</span>
		                                            </div>
		                                        </div>
		                                    </div>
		                                </div>
		                                
		                                <!-- 차트부분 -->
		                                <div class="myChartCls">
										  <canvas id="myChart"></canvas>
										</div>
		                                
		                            
		                            
					                <!-- 탭안에 탭 -->
					                <ul class="nav nav-pills" role="tablist">
								        <li class="nav-item">
								            <a class="nav-link active" data-toggle="pill" href="#chall_befor">진행전</a>
								        </li>
								        <li class="nav-item">
								            <a class="nav-link" data-toggle="pill" href="#chall_ing">진행중</a>
								        </li>
								        <li class="nav-item">
								            <a class="nav-link" data-toggle="pill" href="#chall_after">진행완료</a>
								        </li>
								    </ul>
								    
								    <div class="tab-content">
								    	<!-- 전체현황 -->
								        <div id="chall_befor" class="container tab-pane active"><br>
								            <!-- 시작 전 챌린지 리스트 -->
								    		<div class="row">
								    			<div class="col-sm-12">
							    					<div class="card" >
													    <div class="card-body">
													      <p class="card-text"><span class="category1">카테고리 </span><span class="category2">언제부터 </span><span class="category3">언제까지 </span></p>
													      <h4 class="card-title">챌린지 이름</h4>
													      <a href="#" class="btn btn-Card" style="margin-left: 470px; margin-top: -45px;">해당챌린지 가기</a>
													    </div>
													</div>
								    			</div>
								    		</div>
								        </div>
								
								        <div id="chall_ing" class="container tab-pane fade"><br>
								            <!-- 참가 중 챌린지 리스트 -->
								    		<div class="row">
								    			<div class="col-sm-12">
							    					<div class="card" >
													    <div class="card-body">
													      <p class="card-text"><span class="category1">카테고리 </span><span class="category2">언제부터 </span><span class="category3">언제까지 </span></p>
													      <h4 class="card-title">챌린지 이름</h4>
													      <a href="#" class="btn btn-Card" style="margin-left: 470px; margin-top: -45px;">해당챌린지 가기</a>
													    </div>
													</div>
								    			</div>
								    		</div>
								        </div>
								
								        <div id="chall_after" class="container tab-pane fade"><br>
								            <!-- 종료 된 챌린지 리스트 -->
								    		<div class="row">
								    			<div class="col-sm-12">
							    					<div class="card" >
													    <div class="card-body">
													      <p class="card-text"><span class="category1">카테고리 </span><span class="category2">언제부터 </span><span class="category3">언제까지 </span></p>
													      <h4 class="card-title">챌린지 이름</h4>
													      <a href="#" class="btn btn-Card" style="margin-left: 470px; margin-top: -45px;">해당챌린지 가기</a>
													    </div>
													</div>
													</div>
								    			</div>
								    		</div>
								        </div>
								    </div>
								    <!-- 탭안의 탭 끝부분 -->
								    
	                        </div>
	                    </div>
				    </div>
		        </div>
		        
	            	
            	<!-- 월간현황 -->
                <div id="menu1" class="container tab-pane fade">
                	<div class="row">
                    	<div class="col-sm-12">
	                        <div class="member_month" id="memCalendar">
	                        	<!-- 캘린더 부분 -->
	                            <div id="calendar"></div>
	                        </div>
                        </div>
                    </div>
                    <div class="row">
                    	<div class="col-sm-12">
	                        <div class="member_daily">
	                        	<p>오늘 진행중인 챌린지</p>
	                        	<!-- 캘린더 아래 데일리 부분 -->
	                            <div class="daily_card">
		                            <div class="card" style="width: 250px; height: 400px;">
									    <img class="card-img-top" src="https://www.w3schools.com/bootstrap4/img_avatar1.png" alt="Card image" style="width:100%">
									    <div class="card-body">
									      <p class="card-title">챌린지 이름</p>
									      <p class="card-text"><span class="category4">카테고리 </span><span class="category5">언제부터 </span><span class="category6">언제까지 </span></p>
									      <a href="#" class="btn btn-Card" style="margin-left: 115px;margin-top: 8	px; padding: 3px 7px;">CHALLENGE</a>
									    </div>
									</div>
	                            </div>
	                        </div>
                        </div>
                    </div>
                </div>
            	
            	<!-- 제안하기 -->
            	<div id="menu2" class="container tab-pane fade"><br>
		            <div class="row">
                    	<div class="col-sm-12">
	                        <div class="member_suggest">
	                        	<!-- 제안하기 버튼 (포인트버튼) -->
	                        	<div class="pointButton">
	                        		<a class="modalBtn" data-toggle="modal" data-target="#myModal2">
										<button type="button" class="point-btn-hover color-Yellow" id="suggestMake" >제안하기</button><br><br>
									</a>
								</div>
								<!-- 메인 검색버튼 (타원)-->
								<div class="md-form md-outline d-flex Search" align="right">
									<input type="text" class="form-control input-Search" id="search" placeholder="검색하세요" name="search">
									<button type="button" class="btn btn-Search" >SEARCH</button>
								</div>
								<!-- 제안하기 --> 
								<div class="suggestCard" >
									<div class="suggest-card-body">
										<div class="suggest-text">
											<p class="suggest-category">카테고리</p>
											<p class="suggest-title">챌린지 이름</p>
										</div>
										<div class="suggest-like">
											<i class="far fa-thumbs-up fa-2x"></i>
											<p>123</p>
										</div>
									</div>
								</div>
	                        </div>
                        </div>
                    </div>
		        </div>
		        <!-- 제안하기 끝 -->
    		</div>
        </div>
    </div>
</div>

<!-- 제안하기 모달 -->
<div class="modal" id="myModal2" >
  <div class="modal-dialog modal-lg" style="top:30%">
    <div class="modal-content">
    
      <!-- Modal body -->
      <div class="modal-body">
        <button type="button" class="close" data-dismiss="modal">×</button>
        
        <div class="reviewSummerNote">
        <h3>제안 작성</h3>
        <form name="reviewform" class="reviewform" method="post" action="/save">
           <p class="title_star">챌린지에 대한 여러분의 의견을 작성해주세요.</p>   		 
                 <div class="review_contents" style="background-color: white">
                   <textarea class="review_textarea"  id="summernote" name="revcontent"></textarea>
                 </div> 
        </form>
 			</div>

      </div>
      
      <!-- Modal footer -->
      <div class="modal-footer" style="justify-content: center">
        <button type="button" name="save" id="save" class="btn btn-Card" style="width: 200px">작성 완료</button>
      </div>
      
    </div>
  </div>
</div>

<!-- 원형 차트 js -->
<script src="./js/easypiechart.js"></script>

<!-- 레이더차트 js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="./js/myMainPage2.js"></script>

<!-- 풀캘린더 js -->
<script src="./fcalLib/main.js"></script>

<!-- summer note 사용시 추가 --> 
<script src="./js/summernote/summernote-lite.js"></script>
<script src="./js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="./css/summernote/summernote-lite.css">


<script type="text/javascript">
var ctx = document.getElementById('myChart');

const data = {
        labels: [
          '건강',
          '정서',
          '자산',
          '생활',
          '취미',
          '역량'
        ],
        datasets: [{
          label: 'My Challenge Dataset',
          data: [35, 22, 90, 81, 56, 55],
          fill: true,
          backgroundColor: 'rgba(255, 99, 132, 0.2)',
          borderColor: 'rgb(255, 99, 132)',
          pointBackgroundColor: 'rgb(255, 99, 132)',
          pointBorderColor: '#fff',
          pointHoverBackgroundColor: '#fff',
          pointHoverBorderColor: 'rgb(255, 99, 132)'
        }]
      };


var myChart = new Chart(ctx, {
        type: 'radar',
        data: data,
        options: {
          elements: {
            line: {
              borderWidth: 3
            }
          }
        }
});


</script>

<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function () {
	
	let calendarEl = document.getElementById('calendar');
	
	let calendar = new FullCalendar.Calendar(calendarEl, {
		
		headerToolbar: {
			left: "prev,next today",	// 화살표, today
			center: "title",
			right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'	//month, week.. 등 옵션
		},
		initialDate: new Date(),		//'2021-05-01', 처음 실행 시 기본이 되는 날짜
		locale: 'ko', 					// 한글설정
		navLinks: true,
		businessHours: true,
		events:[{						//json으로 들어감
					title: '비지니스 점심 약속',
					start: '2021-04-23',
					constraint: '이자바님'
				},
				{
					title: '비지니스',
					start: '2021-04-22T16:30:00',
				//	start: new Date(),								// 사용 가능
				//	start: new Date(2021, 4, 16, 12, 16, 20, 1),	// 사용 불가
					constraint: '김자바님'
				},
				{
					title: '점심 약속',
					start: '2021-04-23 12:00:00',
					constraint: '박자바님',
					color:'#ff0000'
				},
				{
					title: "운동",
					start: "2021-04-19",
					end: "2021-04-23"
				},
				{
					title: "데이트",
					start: '2021-04-24T15:00:00',
					constraint: "영화 관람",
					display: "background-color",
					color: "#00ff00"
				}
		]
	});
	
	calendar.render();	// rendering
	
	// event
	calendar.on("dateClick", function (info) {
	//	alert(info);
	//	alert(JSON.stringfy(info));
		alert(info.dateStr);
	});
	
	calendar.on("eventClick", function (info) {	// event 클릭 시 정보
	//	alert("eventClick");
		alert(info.event.title);				// event 클릭 시 title 정보 확인 가능
	});
	
	calendar.addEvent({'title':'추가추가', 'start':'2021-04-29 11:00:00', 'constraint':'내용 없음'});		//이벤트 추가
	
});
</script>

<script type="text/javascript">
/* $(document).ready(function(){
	$('#menu1').on('click', function(){
		$('#menu1').load(window.location.href + '#menu1');
		
	});
}); */
/* $('#memMonth').on('click', function(){
	$('#calendar').load(location.href + '#calendar');
	
}); */

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