<%@page import="com.a.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<link rel="stylesheet" href="./css/element.css" />
<link rel="stylesheet" href="./css/myMainPage2.css" />
<link rel="stylesheet" href="./fcalLib/main.css">

<div class="container">
    <div class="row">
        <div class="col-sm-3">
            <div class="member_box">
                <img class="userWrap" src="https://s3.ap-northeast-2.amazonaws.com/livelybucket/${memberInfoData.MEMBERPHOTONAME}" />
                <h5>${memberInfoData.NICKNAME}</h5>
                <p style="font-size: 15px;"><span>${memberInfoData.POINT}</span> Point</p>
                
                <!-- 회원정보수정 모달 -->
                <a class="modalBtn" data-toggle="modal" data-target="#myModal3">
                	<button type="button" id="memUpdateBtn" class="memModify">회원정보 수정</button>
                </a>
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
		        <li class="nav-items">
		            <a class="nav-link active" data-toggle="pill" href="#whole">전체현황</a>
		        </li>
		        <li class="nav-items">
		            <a class="nav-link" data-toggle="pill" href="#menu1" id="memMonth">월간리포트</a>
		        </li>
		        <li class="nav-items">
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
		                                            <div class="easypiechart" id="easypiechart-part" data-percent="${nowPercent}" >
		                                                <span class="percent"><c:out value="${nowPercent}"></c:out>%</span>
		                                            </div>
		                                        </div>
		                                        <div class="col-sm-4">
		                                            <h5>완료</h5>
		                                            <div class="easypiechart" id="easypiechart-finish" data-percent="${complePercent}" >
		                                                <span class="percent"><c:out value="${complePercent}"></c:out>%</span>
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
								            <a class="nav-link active" data-toggle="pill" href="#chall_befor">진행 전</a>
								        </li>
								        <li class="nav-item">
								            <a class="nav-link" data-toggle="pill" href="#chall_ing">진행 중</a>
								        </li>
								        <li class="nav-item">
								            <a class="nav-link" data-toggle="pill" href="#chall_after">진행완료</a>
								        </li>
								    </ul>
								    
					                <div class="tabtabs">
								    <div class="tab-content">
								    	<!-- 챌린지 현황 리스트 -->
								        <div id="chall_befor" class="container tab-pane active"><br>
								            <!-- 시작 전 챌린지 리스트 -->
								    		<div class="row">
								    			<div class="col-sm-12">
								    			<%for(int i=0; i<3; i++) {%>
							    					<div class="card" >
													    <div class="card-body">
													      <p class="card-text"><span class="category1">카테고리 </span><span class="category2">언제부터 </span><span class="category3">언제까지 </span></p>
													      <h4 class="card-title">챌린지 이름</h4>
													      <a href="#" class="btn btn-Card" style="margin-left: 470px; margin-top: -45px;">해당챌린지 가기</a>
													    </div>
													</div>
												<%} %>
								    			</div>
								    		</div>
								        </div>
								
								        <div id="chall_ing" class="container tab-pane fade"><br>
								            <!-- 참가 중 챌린지 리스트 -->
								    		<div class="row">
								    			<div class="col-sm-12">
								    			<%for(int i=0; i<3; i++) {%>
							    					<div class="card" >
													    <div class="card-body">
													      <p class="card-text"><span class="category1">카테고리 </span><span class="category2">언제부터 </span><span class="category3">언제까지 </span></p>
													      <h4 class="card-title">챌린지 이름</h4>
													      <a href="#" class="btn btn-Card" style="margin-left: 470px; margin-top: -45px;">해당챌린지 가기</a>
													    </div>
													</div>
								    			<%} %>
								    			</div>
								    		</div>
								        </div>
								
								        <div id="chall_after" class="container tab-pane fade"><br>
								            <!-- 종료 된 챌린지 리스트 -->
								    		<div class="row">
								    			<div class="col-sm-12">
								    			<%for(int i=0; i<3; i++) {%>
							    					<div class="card" >
													    <div class="card-body">
													      <p class="card-text"><span class="category1">카테고리 </span><span class="category2">언제부터 </span><span class="category3">언제까지 </span></p>
													      <h4 class="card-title">챌린지 이름</h4>
													      <a href="#" class="btn btn-Card" style="margin-left: 470px; margin-top: -45px;">해당챌린지 가기</a>
													    </div>
													</div>
												<%} %>
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
	                        	<span class="d-daily">오늘 진행중인 챌린지</span>
	                        	<!-- 캘린더 아래 데일리 부분 -->
	                        	<div class="row">
		                        	<%for(int i=0; i<2; i++) {
		                        		for(int j=0; j<2; j++){%>
				                        	<div class="col-xs-12 col-sm-4">
						                        <div class="card" style="width: 250px; height: 400px;">
					                            	<div class="daily_card">
													    <img class="card-img-top" src="https://www.w3schools.com/bootstrap4/img_avatar1.png" alt="Card image" style="width:100%">
													    <div class="card-body">
													      <p class="card-title">챌린지 이름</p>
													      <p class="card-text"><span class="category4">카테고리 </span><span class="category5">언제부터 </span><span class="category6">언제까지 </span></p>
													      <a href="#" class="btn btn-Card" style="margin-left: 115px;margin-top: 8	px; padding: 3px 7px;">CHALLENGE</a>
													    </div>
													</div>
					                            </div>
											</div>
			                        	<%} 
			                        }%>
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
								
								<%for(int i=0;i<3;i++) {%>
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
								<%} %>
								
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

<!-- 회원정보 수정 모달 -->
<div class="modal" id="myModal3" >
  <div class="modal-dialog modal-lg" style="top:10%">
    <div class="modal-content">
    
      <!-- Modal body -->
      <div class="modal-body">
        <button type="button" class="close" data-dismiss="modal">×</button>
        	<h5>회원정보수정</h5>
			<p class="title_star">회원 정보를 수정해주세요</p>
			<form name="memInfoModify" id="memInfoModify" method="POST" enctype="multipart/form-data">
				<!-- 회원정보 수정 폼 -->
				<div class="profileCon">
					<div class="profileBox">
						<div class="profile">
							<p>PHOTO</p>
							<!-- 이미지 미리보기 -->
							
							<div id="previewId" class="memberImg"><img class="showImage" src="https://s3.ap-northeast-2.amazonaws.com/livelybucket/${memberInfoData.MEMBERPHOTONAME}" style="width: 168px;" /></div>
							
							<!-- 이미지 업로드 부분 -->
							<p style="border: none;">
							<button type="button" class="btnImg"><label for=uploadFile>이미지 update</label></button>
							<input type="file" id="uploadFile" name="uploadFile" onchange="previewImage(this,'previewId')" value="" style="display: none;"> 
							</p>							
							
							<!-- 닉네임 -->
							<p>NICKNAME</p>
							<p>
							<input type="text"  class="form-control form-control" id="nickname" name="nickname" value="${memberInfoData.NICKNAME}">
							<input type="hidden" name="nicknameCheck" id="nicknameCheck" value="">
							<button type="button" onclick="nickCheck()" class="btnCheck">닉네임 중복 확인</button>
							</p>
						</div>
						<div class="profileImg">
							<img src="image/memreset.png" />
						</div>
					</div>
				</div>
			</form>
      </div>
      
      <!-- Modal footer -->
      <div class="modal-footer" style="justify-content: center">
        <button type="button" onclick="memModifyCheck()" class="btn btn-Card" style="width: 200px">수정 완료</button>
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
	
	// 캘린더 클릭 수정
	$('.nav-pills li a').on('shown.bs.tab', function () {
	    console.log("ok2")
	    
	    calendar.render();
	    
	});
	
});
</script>

<script type="text/javascript">
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

<!-- //////////////////////////////////////////// 여기서부터 회원정보 수정 구간 //////////////////////////////////////////// -->

<script type="text/javascript">

function nickCheck(){
	var nickname = $("#nickname").val();
	var regExp =  /^[가-힣|a-z|A-Z|0-9|]+$/;

	if(nickname == null || nickname == ""){
		alert("닉네임을 입력 해주세요");
		return false;
	}
	if(!regExp.test(nickname)){
		alert("닉네임은 한글, 영어, 숫자만 4 ~10자리로 입력 가능합니다.");
		return false;
	}
	
	$.ajax({
		type : 'POST',
		url : 'nickCheck.do',
		data:{ nickname:$("#nickname").val().trim()},
		success : function(data){
			alert('success')
			if(data == 'YES'){
				alert("사용가능한 닉네임 입니다.");
				$("#nickname").val(nickname);
				$("#nicknameCheck").val(nickname);
			}else{
				alert("이미 존재하는 닉네임 입니다.");
				$("#nickname").val("");
			}
		},
		error: function(xhr, status, error){
			alert('error');
		}
	});
}
 
function memModifyCheck() {
    console.log("okok")
    
    if($('#memberPhoto').val() == "") {
        alert("프로필 이미지는 필수!");
        return false;
    }
    
    if($('#nicknameCheck').val() == null || $('#nicknameCheck').val() == "") {
        alert("닉네임 중복 체크를 해주세요.");
        return false;
    }
    
    var uploadFile = $('input[name="uploadFile"]').get(0).files[0];
    var nickname = $("#nickname").val()
    
    var formData = new FormData();
    formData.append('email', '${memberInfo.email}');
    formData.append('nickname', nickname);
    formData.append('uploadFile', uploadFile);

    $.ajax({
		type : 'POST',
		url : 'memberModify.do',
		processData:false,
		contentType: false,
		data : formData,
		success : function(data){
			console.log(data);
				alert("회원정보가 수정되었습니다.");
				location.href = 'myMainPage2.do'
		},
		error: function(xhr, status, error){
			alert("수정을 실패했습니다."+error);
		}
	});
     
};
</script>

<script type="text/javascript">
function previewImage(targetObj, previewId) {
    var preview = document.getElementById(previewId); //div id   
    var ua = window.navigator.userAgent;

    if (ua.indexOf("MSIE") > -1) {//ie일때

        targetObj.select();

        try {
            var src = document.selection.createRange().text; //get file full path 
            var ie_preview_error = document
                    .getElementById("ie_preview_error_" + previewId);

            if (ie_preview_error) {
                preview.removeChild(ie_preview_error); //error가 있으면 delete
            }

            var img = document.getElementById(previewId); //이미지가 뿌려질 곳 

            img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"
                    + src + "', sizingMethod='scale')"; /*이미지 로딩, sizingMethod는 div에 맞춰서 사이즈를 자동조절 하는 역할*/
        } catch (e) {
            if (!document.getElementById("ie_preview_error_" + previewId)) {
                var info = document.createElement("<p>");
                info.id = "ie_preview_error_" + previewId;
                info.innerHTML = "a";
                preview.insertBefore(info, null);
            }
        }
    } else { //ie가 아닐때
        var files = targetObj.files;
        for ( var i = 0; i < files.length; i++) {

            var file = files[i];
			
            var imageType = /image.*/; //이미지 파일일경우만.. 뿌려준다.
            if (!file.type.match(imageType)){
            	alert("확장자는 이미지만 가능합니다.")
            	continue;
            }
                

            var prevImg = document.getElementById("prev_" + previewId); //이전에 미리보기가 있다면 삭제
            if (prevImg) {
                preview.removeChild(prevImg);
            }
			
            /*
            var img = document.createElement("img"); 크롬은 div에 이미지가 뿌려지지 않는다. 그래서 자식Element를 만든다.
            img.id = "prev_" + previewId;
            img.classList.add("obj");
            img.file = file;
            img.style.width = '168px'; //기본설정된 div의 안에 뿌려지는 효과를 주기 위해서 div크기와 같은 크기를 지정해준다.
            img.style.height = '168px';
            
            preview.appendChild(img);
			*/
			
            if (window.FileReader) { // FireFox, Chrome, Opera 확인.
                var reader = new FileReader();
                reader.onloadend = (function(aImg) {
                    return function(e) {
//                        aImg.src = e.target.result;
                        $(".showImage").attr("src", e.target.result);
                    };
                })(img);
                reader.readAsDataURL(file);
            } else { // safari is not supported FileReader
                //alert('not supported FileReader');
                if (!document.getElementById("sfr_preview_error_"
                        + previewId)) {
                    var info = document.createElement("p");
                    info.id = "sfr_preview_error_" + previewId;
                    info.innerHTML = "not supported FileReader";
                    preview.insertBefore(info, null);
                }
            }
        }
    }
}

</script>