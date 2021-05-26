<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<link rel="stylesheet" href="./css/element.css" />
<link rel="stylesheet" href="./css/myMainPage2.css" />
<link href="./fcalLib/main.css" rel="stylesheet">

<script src="./js/easypiechart.js"></script>
<script src="./js/myMainPage2.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="./fcalLib/main.js"></script>

<div class="container">
    <div class="row">
        <div class="col-sm-3">
            <div class="member_box">
                <img class="userWrap"/>
                <h3>Admin</h3>
                <h4>0 Point</h4>
                
                <!-- 회원정보수정 모달 -->
                <button type="button">회원정보 수정</button>
                
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
		            <a class="nav-link" data-toggle="pill" href="#menu1">월간리포트</a>
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
		                            <div class="count_box">
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
		                                <div >
										  <canvas id="myChart" style="height:300px;width:300px"></canvas>
										</div>
		                                
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
	                        <div class="member_month">
	                            <div id="calendar"></div>
	                        </div>
                        </div>
                    </div>
                </div>
            	
            	<!-- 제안하기 -->
            	<div id="menu2" class="container tab-pane fade"><br>
		            <div class="row">
                    	<div class="col-sm-12">
	                        <div class="member_suggest">
	                            <h3>Menu 2</h3>
	                        </div>
                        </div>
                    </div>
		        </div>
		        
    		</div>
        </div>
    </div>
</div>





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