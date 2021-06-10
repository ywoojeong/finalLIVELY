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
	                <div class="member_link" style="width: ">
	                    <div class="cut_item">
	                        <div class="cut_text">찜한챌린지</div>
	                        <img style="width: 45px;" src='image/checkBlack.svg'/>
	                        <!-- <div class="cut_icon"><img src='image/checkBlack.svg'/></div> -->
	                        <div class="cut_count">${memberWishCount}</div>
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
                  <a class="nav-link" data-toggle="pill" href="#menu1" id="memMonth" onclick="dailyChallBtn(0)">월간리포트</a>
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
                                                      <span class="percent"><c:out value="${memberNowCount}"></c:out>건</span>
                                                  </div>
                                              </div>
                                              <div class="col-sm-4">
                                                  <h5>완료</h5>
                                                  <div class="easypiechart" id="easypiechart-finish" data-percent="${100 - nowPercent}" >
                                                      <span class="percent"><c:out value="${memEndCount}"></c:out>건</span>
                                                  </div>
                                              </div>
                                          </div>
                                      </div>
                                      
                                      <!-- 차트부분 -->
                                      <div class="myChartCls">
                                <canvas id="myChart"></canvas>
                              </div>
                                      
                                  
<!-- ////////////////////////////////////////////////// 전체 현황 ///////////////////////////////////////////////// -->
                               <!-- 탭안에 탭 -->
                               <ul class="nav nav-pills" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="pill" href="#chall_0" onclick="challengeBtn(0)">진행 전</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="pill" href="#chall_1" onclick="challengeBtn(1)">진행 중</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="pill" href="#chall_2" onclick="challengeBtn(2)">진행완료</a>
                                </li>
                            </ul>
                            
                               <div class="tabtabs">
                            <div class="tab-content">
                               <!-- 챌린지 현황 리스트 -->
                              <%for(int i=0;i<3;i++){ 
                              if(i==0){ %>
                                 <div id="chall_<%=i %>" class="container tab-pane active"><br>
                              <%}else{%>
                                   <div id="chall_<%=i %>" class="container tab-pane"><br>
                               <%} %>
                                       <!-- 시작 전 챌린지 리스트 -->
                                     <div class="row">
                                        <div class="col-sm-12 Chall_<%=i%>">
                                        
                                           
                                        </div>
                                     </div>
                                   </div>
                                  <%} %>
                                <div id="chall_" class="container tab-pane fade" ><br>
                                    <!-- 참가 중 챌린지 리스트 -->
                                  <div class="row" >
                                     <div class="col-sm-12" id="Chall_0" >
                                     
                                     <!-- null일때 넣어줄 이미지 알아보기 -->
                                     
                                           <div class="card" >
                                              <div class="card-body">
                                                <p class="card-text"><span class="category1">${challenge.CATEGORY}</span><span class="category2">${challenge.CHALLENGEPERIOD} </span><span class="category3">${challenge.IDENTIFYFREQUENCY} </span></p>
                                                <h4 class="card-title">${challenge.CHALLENGETITLE}</h4>
                                                <a href="challengeDetail.do?challengeseq=${challenge.CHALLENGESEQ }" class="btn btn-Card" style="margin-left: 470px; margin-top: -45px;">해당챌린지 가기</a>
                                              </div>
                                          </div>
                               
                                     
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
<!-- ////////////////////////////////////////////////// 오늘 진행중인 챌린지 ///////////////////////////////////////////////// -->
                    <div class="row">
                       <div class="col-sm-12">
                           <div class="member_daily">
                              <span class="d-daily">오늘 진행중인 챌린지</span>
                              <!-- 캘린더 아래 데일리 부분 -->
                                 <%for(int i=0; i<2; i++) {
                                    for(int j=0; j<2; j++){%>
                              	<div class="row" id="dailyCard<%=i%>">
                                       <div class="col-xs-12 col-sm-4">
                                          <!-- <div class="card" style="width: 250px; height: 400px;">
                                              <div class="daily_card">
	                                           <img class="card-img-top" src="https://www.w3schools.com/bootstrap4/img_avatar1.png" alt="Card image" style="width:100%">
	                                           <div class="card-body">
	                                             <p class="card-title">챌린지 이름</p>
	                                             <p class="card-text"><span class="category4">카테고리 </span><span class="category5">언제부터 </span><span class="category6">언제까지 </span></p>
	                                             <a href="#" class="btn btn-Card" style="margin-left: 115px;margin-top: 8   px; padding: 3px 7px;">CHALLENGE</a>
	                                           </div>
                                       			</div>
                                          </div> -->
                                 	</div>
                        		</div>
                                    <%} 
                                 }%>
                           </div>
                        </div>
                    </div>
                </div>
<!-- ////////////////////////////////////////////////// 여기서부터 제안하기 ///////////////////////////////////////////////// -->
               <!-- 제안하기 -->
               <div id="menu2" class="container tab-pane fade"><br>
                  <div class="row">
                       <div class="col-sm-12">
                           <div class="member_suggest">
                              <!-- 제안하기 버튼 (포인트버튼) -->
								<div class="pointButton">
									<a class="modalBtn" data-toggle="modal" data-target="#myModal2">
										<button type="button" class="point-btn-hover color-Yellow" id="writeSuggest" >제안하기</button><br><br>
									</a>
								</div>
								
                        <!-- 메인 검색버튼 (타원)-->
                        <div class="searchArea">
                        <div class="md-form md-outline d-flex Search" align="right">
                           	<select class="form-control form-control-sm" name="category" id="category">
		 						<option value="0">선택하세요</option>
		 						<option value="1">건강</option>
		 						<option value="2">역량</option>
		 						<option value="3">정서</option>
		 						<option value="4">자산</option>
		 						<option value="5">생활</option>
		 						<option value="6">취미</option>
	 						</select>
                           <input type="text" class="form-control input-Search" id="search" placeholder="검색하세요" name="search">
                           <button type="button" class="btn btn-Search" id="searchBtn">SEARCH</button>
                        </div>
                        </div>
                        <!-- 제안하기 list 받는곳--> 
                        <div class="suggestBox"></div>
                        
                        <!-- 페이징 처리 되는 곳 -->
						<div class="sugPage">
							<ul class="sugPageUl" id="sugPageUl" style="display: flex; list-style: none; letter-spacing: 17px; margin-top: 35px;"></ul>
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
        
        <div class="suggestSummerNote">
        <h3>제안 작성</h3>
            <p class="title_star">해당 카테고리와 관련된 제안을 작성해주세요</p>          
           <form id="suggestForm" class="suggestForm" method="post">
           		<input type="hidden" name="email" value="${memberInfoData.EMAIL}">
           		<div class="titleC" style="display: flex;">
					<div>
	 					<select class="form-control form-control-sm" name="scategory" id="_category" style="height: 38px;margin-left: 10px;margin-bottom: 5px;">
	 						<option value="0">선택하세요</option>
	 						<option value="1">건강</option>
	 						<option value="2">역량</option>
	 						<option value="3">정서</option>
	 						<option value="4">자산</option>
	 						<option value="5">생활</option>
	 						<option value="6">취미</option>
	 					</select>
					</div>
					<div class="suggest_title" style="background-color: white">
						<input type="text" class="form-control" id="title" name="suggesttitle" placeholder="제목" style="width: 480px">
					</div>
				</div>
				<div class="suggest_contents" style="background-color: white">
					<textarea class="suggest_textarea"  id="summernote" name="suggestcontent"></textarea>
				</div> 
           </form>
       </div>
      </div>
      
      <!-- Modal footer -->
      <div class="modal-footer" style="justify-content: center">
        <button type="button" name="saveSuggest" id="saveSuggest" onclick="saveSuggest()" class="btn btn-Card" style="width: 200px">작성 완료</button>
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

<!-- 댓글쓰기 모달 -->
<div class="modal" id="myModal4" >
  <div class="modal-dialog modal-lg" style="top:30%">
    <div class="modal-content">
    
      <!-- Modal body -->
      <div class="modal-body">
        <button type="button" class="close" data-dismiss="modal">×</button>
        <div class="commSummerNote">
	      <h3>제안 작성</h3>
	      <p class="title_star">챌린지에 대한 여러분의 의견을 작성해주세요.</p>          
           <form id="commForm" class="commForm" method="post">
           		<input type="hidden" name="email" value="${memberInfoData.EMAIL}">
           		<input type="hidden" name="suggestbbsseq" id="suggestSeq" >
				<div class="comm_contents" style="background-color: white">
					<textarea class="comm_textarea"  id="commentnote" name="sugcomcontent"></textarea>
				</div> 
           </form>
       	</div>
      </div>
      
      <!-- Modal footer -->
      <div class="modal-footer" style="justify-content: center">
        <button type="button" name="saveComment" id="saveComment" onclick="saveComment()" class="btn btn-Card" style="width: 200px">작성 완료</button>
      </div>
      
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

<!-- 차트부분 js -->
<script type="text/javascript">
$(document).ready(function() {
   var getChart = JSON.parse('${memCategoryCount}');
   console.log(getChart)
   var Total = 0;
   var categoryArray = [0,0,0,0,0,0];
   for(var i=0;i<getChart.length;i++){
      Total = Total + getChart[i].TOTAL
   }
   for(var i=0;i<getChart.length;i++){
      var category = getChart[i].CATEGORY
      var count = getChart[i].TOTAL
      categoryArray[category-1] = (count * 100)/Total
   }
   console.log(Total)
   
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
             data: categoryArray,
             backgroundColor: [
                 'rgb(255, 99, 132)',
                 'rgb(54, 162, 235)',
                 'purple',
                 'green',
                 'yellow',
                 'orange'
               ],
               hoverOffset: 4
           }]
         };
   var myChart = new Chart(ctx, {
           type: 'pie',
           data: data,
           
   });
})

</script>

<!-- 캘린더 부분 js -->
<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function () {
   
   var memNowCntList = JSON.parse('${memNowCntList}')
   var planDate = []
   var colors = ['#ff6666','#00b359','#2929a3','#ff9900']
   for(var i=0;i<memNowCntList.length;i++){
      var j = i
      if(j>3){
         j = j-3
      }
      var data = {title:memNowCntList[i].CHALLENGETITLE,start:memNowCntList[i].CHALLENGESTART,end:memNowCntList[i].CHALLENGEEND,color:colors[j]}
      planDate.push(data)
   }
   console.log(planDate)
   
   let calendarEl = document.getElementById('calendar');
   
   let calendar = new FullCalendar.Calendar(calendarEl, {
      
      headerToolbar: {
         left: "prev,next today",   // 화살표, today
         center: "title",
         right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'   //month, week.. 등 옵션
      },
      initialDate: new Date(),      //'2021-05-01', 처음 실행 시 기본이 되는 날짜
      locale: 'ko',                // 한글설정
      navLinks: true,
      businessHours: true,
      events:planDate
   });
   
   calendar.render();   // rendering
   
   // event
   calendar.on("dateClick", function (info) {
   //   alert(info);
   //   alert(JSON.stringfy(info));
      alert(info.dateStr);
   });
   
   calendar.on("eventClick", function (info) {   // event 클릭 시 정보
   //   alert("eventClick");
      alert(info.event.title);            // event 클릭 시 title 정보 확인 가능
   });
   
   calendar.addEvent({'title':'추가추가', 'start':'2021-04-29 11:00:00', 'constraint':'내용 없음'});      //이벤트 추가
   
   // 캘린더 클릭 수정
   $('.nav-pills li a').on('shown.bs.tab', function () {
       console.log("ok2")
       
       calendar.render();
       
   });
   
});
</script>

<!-- 써머노트 2개 js -->
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
         placeholder: "제안을 작성해주세요",   //placeholder      
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
// 코멘트 노트
$(document).ready(function() {
    $('.chatrow').on( 'keyup', 'textarea', function (e){
      $(this).css('height', 'auto' );
      $(this).height( this.scrollHeight );
    });
    $('.wrap').find( 'textarea' ).keyup();
   
    
     //써머노트
    $('#commentnote').summernote({
         height: 150,
         /* width:, */
         minHeight: 100,             // 최소 높이
         maxHeight: null,             // 최대 높이
         focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
         lang: "ko-KR",               // 한글 설정
         placeholder: "다양한 인증 방법을 댓글로 작성해주세요",   //placeholder      
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

<!-- 여기서부터 카테고리 등 값 변환 -->
 
<script type="text/javascript">
$(function(){
   challengeBtn('0');
})
function challengeBtn(name){
   console.log("name 값이 뭐니 : " + name)
   $.ajax({
      url:"./memChallList.do",
      type:"get",
      data: {"name":name},
      success:function(list){
// 역할이 없음        
//         $("#dataId").remove();
         console.log("리스트 값이 뭐니 : " + list)
         var data=""
         $.each(list, function(i, challenge){
            console.log(i)
            console.log(challenge)
            
            var categoryName = setCategory(challenge.CATEGORY);
            
            let dateTotal="";
            if(challenge.IDENTIFYFREQUENCY==9){
               dateTotal = "매일";
            }else if(challenge.IDENTIFYFREQUENCY==8){
               dateTotal = "평일 매일";
            }else if(challenge.IDENTIFYFREQUENCY==7){
               dateTotal = "주말";
            }else{
               for(var i=6;i>0;i--){
                  if(i==challenge.IDENTIFYFREQUENCY){
                     dateTotal="주 "+i+"회";
                  }   
               }
            }
         
            data +=   "<div class='card dataId' >"
                  +   "<div class='card-body'>"
                  +   "<p class='card-text'><span class='category1'>" + categoryName +" </span><span class='category2'>" + dateTotal + "</span><span class='category3'>"+challenge.CHALLENGEPERIOD+"주 동안 </span></p>"
                  +   "<h4 class='card-title'>"+challenge.CHALLENGETITLE+"</h4>"
                  +   "<a href='challengeDetail.do?challengeseq=" + challenge.CHALLENGESEQ + "' class='btn btn-Card' style='margin-left: 470px; margin-top: -45px;'>해당챌린지 가기</a>"
                  +   "</div>   </div>";
            console.log(data)
            
         });
         if(list.length < 1){
        	data += "<div class='card dataId'>"
        		+	"<div class='card-body'>"
        		+	"<h4>챌린지에 도전하세요!</h4>"
        		+	"</div> </div>";
         }
         $("#chall_"+name).html(data);
      },
      error:function(){
         alert("리스트 불러오는 error");
      }
   });      
}
</script>

<script type="text/javascript">
function dailyChallBtn(number){
	console.log("number 값이 뭐니 : " + number)
	
	$.ajax({
		url:"./memDailyChallList.do",
	    type:"get",
	    data: {"number":number},
	    success:function(list){
	    	
	    	console.log("list 값이 뭐니? : " + list)
	    	
	    	var data = ""
	   		$.each(list, function(i, dailyChall){
	               console.log(i)
	               console.log(dailyChall)
	               
	               var categoryName = setCategory(dailyChall.CATEGORY);
	               
	               let dateTotal="";
	               if(dailyChall.IDENTIFYFREQUENCY==9){
	                  dateTotal = "매일";
	               }else if(dailyChall.IDENTIFYFREQUENCY==8){
	                  dateTotal = "평일 매일";
	               }else if(dailyChall.IDENTIFYFREQUENCY==7){
	                  dateTotal = "주말";
	               }else{
	                  for(i=6;i>0;i--){
	                     if(i==dailyChall.IDENTIFYFREQUENCY){
	                        dateTotal="주 "+i+"회";
	                     }   
	                  }
	               }
	            	
	               data += 	"<div class='card' style='width: 250px; height: 400px;'>"
	            	   	+	"<div class='daily_card'>"
	               		+ 	"<img class='card-img-top' src='https://www.w3schools.com/bootstrap4/img_avatar1.png' alt='Card image' style='width:100%'>"
	               		+ 	"<div class='card-body'>"
	               		+ 	"<p class='card-title'>" + dailyChall.CHALLENGETITLE + "</p>"
	               		+ 	"<p class='card-text'><span class='category4'>" + categoryName + "</span><span class='category5'>" + dateTotal + "</span><span class='category6'>" + dailyChall.CHALLENGEPERIOD + "주 동안 </span></p>"
	               		+ 	"<a href='challengeDetail.do?challengeseq="+dailyChall.CHALLENGESEQ+"' class='btn btn-Card' style='margin-left:115px;margin-top:8px; padding:3px 7px;'>CHALLENGE</a>"
	               		+ 	"</div>   </div>   </div>";
	               		
	               	console.log("data가 뭐니" + data)
	            });
	            if(list.length < 1){
	           	data += "<div class='daily_card'>"
	           		+	"<div class='card-body'>"
	           		+	"<h4>챌린지에 도전하세요!</h4>"
	           		+	"</div> </div>";
	            }
	            $("#dailyCard"+number).html(data);
	         },
	         error:function(){
	            alert("리스트 불러오는 error");
	    	}
	});
}

// 제안하기 작성하는 곳
function saveSuggest() {
//	var suggestTitle = $('.suggest_title').val();

	var suggestText = $('.suggest_textarea').val();

	/* 
	if(suggestTitle.length < 5){
		alert('5자 이상 작성해주세요');
		$("#suggestTitle").focus()
		return false;
	}
	 */
	if(suggestText.length < 10){
		alert('10자 이상 작성해주세요');
		$("#suggestText").focus()
		return false;
	}
	 
	 let dataFrm = $("#suggestForm").serialize();
		console.log("dataFrm :" + dataFrm)
	$.ajax({
		type:'POST',
		url:"writeSuggest.do",
		data:dataFrm,
		success:function(msg){
			if(msg=="success"){
				alert("작성 완료되었습니다");
				location.href="myMainPage2.do"
			}
		},
		error:function(xhr, status, error){
			alert("작성 실패"+error);
		}
	});
}

// 제안하기 글 목록, 페이징에 필요한 글의 총 수
likeSuggest(1);
getSuggestListCnt(1);

// 검색했을 시

$(function(){
	$('#searchBtn').click(function(){
		likeSuggest(1);
//		suggestBbsCnt();
		$('#search').val("");
	});
});
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////* 제안하기 가져오기 */
function likeSuggest(now){
	$.ajax({
		url:"./suggestMyLike.do",
	    type:"POST",
	    data: {page:now, 'search':$("#search").val(), 'category':$("#category").val()},
	    success:function(list){
	    	console.log("list______________________")
	    	console.log(list)
	    	var total = list[0].TOTALCNT
	    	var data = "";
	    	for(var i=0; i<list.length; i++){
	    	// for문 돌때 문제?
	    	
	    	console.log("now______________________")
	    	console.log(now)
	    	var categoryName = setCategory(list[i].SUGGESTBBSCATEGORY);
	    	console.log("category ==>"+categoryName)
	    	var like = ""
	    	if(list[i].LIKECHECK == "1"){
	    		like = "<i class='fas fa-thumbs-up fa-2x unlike"+list[i].SUGGESTBBSSEQ+"' onclick='unLike("+list[i].SUGGESTBBSSEQ+")'></i>"
	    	}else{
	    		like = "<i class='far fa-thumbs-up fa-2x youlike"+list[i].SUGGESTBBSSEQ+"' onclick='youLike("+list[i].SUGGESTBBSSEQ+")'></i>"
	    	}	
	    		
	    	data += "<div class='suggestCard'>"
	    		+	"<div class='suggest-card-body' >"
	    		+	"<div class='suggest-text'onclick='commentListSel("+list[i].SUGGESTBBSSEQ+")' data-toggle='collapse' href='#collapseExample"+i+"' role='button' aria-expanded='false' aria-controls='collapseExample'>"
	    		+	"<p class='suggest-category'>"+categoryName+"</p>"
	    		+	"<p class='suggest-title'>"+list[i].SUGGESTBBSTITLE+"</p>"
	    		+	"<p class='suggest-comment'><i class='far fa-comment'></i>댓글</p>"
	    		+	"</div>"
	    		+	"<div class='suggest-like'>"
	    		+like
	    		+	"<p class='like"+list[i].SUGGESTBBSSEQ+"'>"+list[i].LIKECNT+"</p>"
	    		+	"</div> </div> </div>"
		    	+	"<div class='collapse' id='collapseExample"+i+"' style='width: 100%'>"
	        	+	"<div class='applyBox'>"
	            +	"<div class='applyBbs' style='height: 50px;'>"
	            /* +			"<p style='margin-top: 0;'>"+list[i].SUGGESTBBSCONTENT+"</p>"	 */
	            +	list[i].SUGGESTBBSCONTENT	
	            +	"</div>"
				+			"<div class='cWrite'><a class='modalBtn' data-toggle='modal' data-target='#myModal4'>"
        		+					"<button type='button' class='btn' id='writeComment' onclick='setCommentSeq("+list[i].SUGGESTBBSSEQ+")' >댓글쓰기</button></a></div>"
	            +	"<hr class='hhr' width='100%'>"
	            +	"<div class='applyCom"+list[i].SUGGESTBBSSEQ+"'>"
	            +	"</div></div></div>";
        		// 댓글 쓸때 seq를 modal로 보내줌
        		$('#suggestSeq').val(list[i].SUGGESTBBSSEQ);
//        		console.log("tdcgfvygyvyv"+	$('#suggestSeq').val(list[i].SUGGESTBBSSEQ))
        		
	    	}
	    	sugListPaging(total,now)
	    	$(".suggestBox").html(data);

	    },
        error:function(){
           alert("리스트 불러오는 error");
	   	}
	});
}
// 좋아요 insert 
function youLike(seq){
	var cnt = $(".like"+seq).text()
	console.log(cnt)
	console.log(typeof(cnt))
	$(".like"+seq).text(parseInt(cnt) +1)
	$(".youlike"+seq).replaceWith("<i class='fas fa-thumbs-up fa-2x unlike"+ seq +"' onclick='unLike("+seq+")'></i>")
	
	$.ajax({
		url:"./suggestMyLikeInsert.do",
	    type:"get",
	    data: {"email":'${memberInfoData.EMAIL}' ,"suggestbbsseq":seq},
	    success:function(data){
	    	alert("cntLike 불러오는 success");
	    },
	    error:function(){
			alert("cntLike 불러오는 error");
		}
	});
}

// 좋아요 delete
function unLike(seq){
	
	var cnt = $(".like"+seq).text()
	console.log("cnt")
	console.log(cnt)
	$(".like"+seq).text(cnt -1)
	$(".unlike"+seq).replaceWith("<i class='far fa-thumbs-up fa-2x youlike"+seq+"' onclick='youLike("+seq+")'></i>")
	
	$.ajax({
		url:"./suggestMyLikeDel.do",
	    type:"get",
	    data:{"email":'${memberInfoData.EMAIL}' ,"suggestbbsseq":seq},
	    success:function(data){
	    	
	    	alert("unLike 불러오는 success");
//	    	alert(JSON.stringify(data));
		
	    },
	    error:function(){
			alert("unLike 불러오는 error");
		}
	});
}


// 카테고리 변환 
function setCategory(category){
	console.log("category ===>"+category)
	var categoryName = ""
	if(category ==1){
		categoryName = "건강";
     }else if(category ==2){
    	 categoryName = "역량";
     }else if(category ==3){
    	 categoryName = "정서";
     }else if(category ==4){
    	 categoryName = "자산";
     }else if(category ==5){
    	 categoryName = "생활";
     }else if(category ==6){
    	 categoryName = "취미";
     }
	return categoryName;
}

//제안하기 쪽 댓글 작성
function setCommentSeq(seq){
	console.log("setCommentSeq33333333333333  "+seq)
	
   $("#suggestSeq").val(seq)
   
}

// 제안하기 쪽 댓글 작성
function saveComment() {
	console.log("saveComment---------------->")
	var commentText = $('.comm_textarea').val();

	if(commentText.length < 10){
		alert('10자 이상 작성해주세요');
		$("#commentText").focus()
		return false;
	}
	 
	 let dataFrm = $("#commForm").serialize();
		console.log("dataFrm :" + dataFrm)
	$.ajax({
		type:'POST',
		url:"writeComment.do",
		data:dataFrm,
		success:function(msg){
			if(msg=="success"){
				alert("작성 완료되었습니다");
				location.href="myMainPage2.do"
			}
		},
		error:function(xhr, status, error){
			alert("작성 실패"+error);
		}
	});
}

//댓글 리스트 가져오기
function commentListSel(seq){
	console.log("commentListSel seq")
	console.log(seq)
	console.log(typeof(seq))
	$.ajax({
		url:"./commentList.do",
		type:"get",
	    data: {"suggestbbsseq":seq},
	    success:function(list){
	    	console.log("commentListSel->>>>>>>>>>>>")
	    	console.log(list)
	    	var data = "";
	    	for(var i=0; i<list.length; i++){
	    	data += 	"<table class='commentTable'>"
	            +			"<colgroup>"
	            +				"<col width='500px'>"
	            +				"<col width='100px'>"
	            +			"</colgroup><tr>"
				+	            "<td class='commentContent'>"+list[i].SUGCOMCONTENT+"</td>"
				+	            "<td class='commentTime'>"+list[i].SUGCOMDATE+"</td>"
				+	        "</tr>"
        		+			"</table>"
	    	}
        		
        		$(".applyCom"+seq).html(data);

	    },
        error:function(){
           alert("commentList 불러오는 error");
	   	}
	});
}

// 제안하기 총 수 가져오기
function getSuggestListCnt(now){
	$.ajax({
		url:"./suggestListPage.do",
		type:"get",
		data:{'search':$("#search").val(), 'category':$("#category").val()},
		success:function(total){//return이 글의 전체 수임
		//	alert("전체 글의 수 : "+total);
		//	alert("현재 글의 수 : "+now);
			sugListPaging(total,now);
		},
		error:function(){
			alert("전체 글 수 에러error");
		}
	});
}

// 페이지 처리
function sugListPaging(total,now){
	console.log("sugListPaging total",total)
	console.log("sugListPaging now",now)
	var pagecnt = Math.ceil(total/5.0)
	var startCnt = Math.floor((now-1)/5) * 5 + 1
	//전체 페이지
	var pageBlock = Math.ceil(pagecnt/5)
	var nowBlock = Math.ceil(now/5)
	console.log("pagecnt",pagecnt)
	console.log("startCnt",startCnt)
	console.log(total,pagecnt)
	console.log("pageBlock",pageBlock)
	console.log("nowBlock",nowBlock)
	var nowTotal = nowBlock*5
	if(nowTotal > pagecnt){
		nowTotal = pagecnt
	}
	var html = ""
	if(pageBlock > 1 && nowBlock > 1){
		html += "<li  onclick='likeSuggest("+(nowBlock*5-9)+")'> &laquo;</li>"
	}
	for(var i=startCnt;i<=nowTotal;i++){
		if(now == i){
			html += "<li class='nowpage' style='color:red' onclick='likeSuggest("+i+")'>"+i+"</li>"
		}else{
			html += "<li onclick='likeSuggest("+i+")'>"+i+"</li>"
		}
		
	}
	
	if(pageBlock > 1 && nowBlock < pageBlock){
		html += "<li onclick='likeSuggest("+(nowBlock*5+1)+")'>&raquo;</li>"
	}
	console.log(html)
	$(".sugPageUl").html(html);
//	document.getElementById('sugPageUl').innerHTML = html
}

</script>