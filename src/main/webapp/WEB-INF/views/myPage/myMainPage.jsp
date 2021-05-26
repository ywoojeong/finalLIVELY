<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<link rel="stylesheet" href="./css/myMainPage2.css" />
<link rel="stylesheet" href="./css/element.css" />
<link href="./fcalLib/main.css" rel="stylesheet">
<script src="./fcalLib/main.js"></script>

<style type="text/css">
#calendar{
	max-width: 800px;
	margin: 0 auto;
}


</style>
<!-- nav tab바 -->
<div class="container">

    <div id="calendar"></div>
</div>


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