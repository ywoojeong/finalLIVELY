<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <link href="./css/challenge.css" rel="stylesheet">   
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
 <!-- core tag -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
 
 <div id="titleC" class="carousel slide" data-ride="carousel" style="height: 27px;background-color: black;margin-top: 50px">
	  <div class="carousel-inner">
	    <div class="carousel-item active">
	      <div style="text-align: center;font-size: 10pt;padding-top: 4px;letter-spacing: 1px;color: white">
	      	신규 회원가입 시 바로 사용이 가능한 <span style="font-weight: 800;color:red"> 2000point</span>를 증정합니다. 
	      </div>
	    </div>
	    <div class="carousel-item">
	      <div style="text-align: center;font-size: 10pt;padding-top: 4px;letter-spacing: 1px;color: white">
	      	챌린지 성공 시 포인트가 <span style="font-weight: 700;color:#cb98ed"> 2배!</span> 가지고있는 포인트로 LIVELY에 참여해보세요.
	      </div>
	    </div>
	  </div>
	</div>
 
 <div class="headerTitle" >
 	<div style="text-align: center;padding: 77px">
 		<h5>LIVELY</h5>
 		<p>Creating Habits</p>
 	</div>
 </div>
 
 <div style="display: flex;"> 
	<div class="hotMain d-none d-sm-block">
		<video muted autoplay loop>
        	<source src="video/garden.mp4" type="video/mp4" align="middle">
        	<strong>Your browser does not support the video tag.</strong>
        </video>        
	</div>
	 <div class="hotMainSen">	
			<h2>최근 생성된 챌린지를 확인해 보세요</h2>
			<p class="d-none d-sm-block">새로운 챌린지를 만들어보세요. LIVELY는 여러분의 챌린지를 기다립니다.</p>
			<!-- 챌린지 만들기 버튼 세션 없으면 로그인 / 있으면 만들기-->
			<div class="chall-buttons">
			 	<button type="button" class="chall-btn-hover color-3"  onclick="challengeMake()" >START</button> 	
			 </div>
		</div>
</div> 

<div style="height: 230px;background-color: #f2f2f2">
 	<div class="row">
 		<div class="col-sm-6" style="padding: 50px 0 0 75px">
 				<h5 style="font-size: 20pt;font-weight: 700">Lively has been newly opened in 2021.</h5> 
 				<br><br><p style="font-size: 9pt;color: rgba(0,0,0,0.4);margin-top: 5px">ⓒ2021.06.23</p>				
 		</div>
 		<div class="col-sm-6" style="padding: 50px">
 		     	<h5 style="font-size: 20pt;font-weight: 700;margin-bottom: 15px;">Lively wants to keep an appointment with me.</h5>
 				<p style="font-size: 12pt;color: rgba(0,0,0,0.6);margin-bottom: 0">
 				Lively concluded that the most necessary thing to achieve the goal is an environment that
 				<p style="font-size: 12pt;color: rgba(0,0,0,0.6);margin-bottom: 0"> must be accomplished rather than will.</p>
 				<p style="font-size: 12pt;color: rgba(0,0,0,0.6)">Lively made a platform called Challengers that achieves my goal by betting on myself.
 				</p>
 		</div>
 	
 	</div>
 		
 </div>
 


   
 
<!-- box-shadow: 0px 7px 19px 8px rgb(0 0 0 / 10%); -->
   <div class="container" style="background: white;padding: 0">
   	
		 	<div class="headerC" style="text-align: center;padding: 64px 0 54px 0;">
		 		<h5>NEW CHALLENGE</h5>
		 		<p>Select your own challenge</p>
		 	</div> 	

   	 <!-- Nav pills -->
   	 <div class="hotNav">
		  <ul class="nav nav-pills" role="tablist" style="margin-top: 0;padding-top: 6px;margin-left: 0;">
		    <li class="nav-item">
		      <a class="nav-link active" data-toggle="pill" href="#category0" onclick="categoryBtn(0)")>전  체</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" data-toggle="pill" href="#category1" onclick="categoryBtn(1)">건  강</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" data-toggle="pill" href="#category2" onclick="categoryBtn(2)">역  량</a>
		    </li>
		     <li class="nav-item">
		      <a class="nav-link" data-toggle="pill" href="#category3" onclick="categoryBtn(3)">정  서</a>
		    </li>
		     <li class="nav-item">
		      <a class="nav-link" data-toggle="pill" href="#category4" onclick="categoryBtn(4)">자  산</a>
		    </li>
		     <li class="nav-item">
		      <a class="nav-link" data-toggle="pill" href="#category5" onclick="categoryBtn(5)">생 활</a>
		    </li>	
		    <li class="nav-item">
		      <a class="nav-link" data-toggle="pill" href="#category6" onclick="categoryBtn(6)">취 미</a>
		    </li>		 
		  </ul>
		</div>

		  <!-- Tab panes -->
		  <div class="tab-content">
		  <div style="height: 300px;background-color: #f2f2f2;height: 83px;margin-top: 30px;padding: 23px 0 23px 0px;">
		  	 <div class="row">
					<div class="col-sm-6 md-form md-outline d-flex Search">
						<input type="text" class="form-control input-Search" id="_search" placeholder="인기있는 챌린지를 검색하세요" name="search" onkeyup="JavaScript:Enter_Check(this);">
				    	<button type="button" id="searchBtn" class="btn btn-Search" onclick="searchBtn()">SEARCH</button>
				    </div>
	  			</div>
		   </div>
		    	<%for(int i=0;i<7;i++) {%>
		    	  <div id="category<%=i %>" class="container tab-pane" style="padding: 0"><!-- active문제!!!!!!!!!!!!!!!!!!!! -->

				    	<!-- 카드 -->
				     	<div class="row" id="dataMain<%=i %>"  style="margin: 15px auto 30px auto;">
										<!-- 데이터 들어오는 부분 -->
				     	</div>
				    </div>
				   <%} %>

		    		<!-- 페이지네이션 -->
   				
				<nav aria-label="Page navigation" style="text-align: center;padding: 10px auto;height: 112px"> 
					<ul class="pagination" id="_pagination" style="justify-content: center">
					</ul>
				</nav>

			</div>	   	 
   </div>

<!-- 페이지네이션 -->
<script src="./js/jquery.twbsPagination.js"></script>
<script type="text/javascript">
//시작 시 호출
getChallengeListCount(0);		//카테고리 번호
getChallengeList(0, 0);	//페이지 번호, 카테고리번호

//카테고리선택 후 검색
function Enter_Check(data){
	if(event.keyCode == 13){
		//alert('야 들어와라..존말할때'+data)

    		getChallengeListCount(0);		//카테고리 번호
    		getChallengeList(0, 0);	
    		$("#_search").val("");

   }
}
      
$('#searchBtn').click(function(){
	getChallengeListCount(0);		//카테고리 번호
	getChallengeList(0, 0);	
	$("#_search").val("");

});


//챌린지 디테일 페이지로 이동
function challengeDetailBtn(){
	/* location.href="challengeDetail.do?challengeseq="+seq; */
	location.href="challengeDetail.do";
}

//챌린지 만들기 페이지로 이동
function challengeMake(){
	var email ="";
	email = '${memberInfo.email }';
	if(email!=null && email != ""){
		location.href="challengeMake.do";	
	}else{
		alert("로그인 해주세요.");
		return false;
	}
	
}

//탭눌렀을 때 데이터 가져오기
function categoryBtn(categoryNumber){
	//console.log(categoryNumber)
	
	getChallengeListCount(categoryNumber);		//카테고리 번호
	getChallengeList(0, categoryNumber);	
	
	//카테고리선택 후 검색
	$('#searchBtn').click(function(){
		getChallengeListCount(PageNumber, categoryNumber);		//카테고리 번호
		getChallengeList(0, categoryNumber);
		/* $("#_search").val(""); */
	});
	
}

//전체 리스트 불러오기
function getChallengeList(pageNumber, categoryNumber){
	console.log("페이지 불러오기 왜안됨?"+pageNumber+"  "+categoryNumber)
	$.ajax({
		url:"./newChallengeData.do",
		type:"get",
		data:{'nowpageNumber':pageNumber, 'search':$("#_search").val(), 'category':categoryNumber},
		success:function(list){
			//alert("전체 리스트 불러오기"+list.length);
			$(".dataId").remove();
			
			if(list.length==0){
				console.log("왜안들어와")
				let data = "<div class='noneData'>"
					+   "<h3>챌린지가 없습니다. 챌린지를 생성해 주세요.</h3>"
					+	"</div>";
				$("#dataMain"+categoryNumber).html(data);
			}
			
			$.each(list, function(i, challenge){
				
				let dateTotal="";
				if(challenge.identifyfrequency==9){
					dateTotal = "매일";
				}else if(challenge.identifyfrequency==8){
					dateTotal = "평일 매일";
				}else if(challenge.identifyfrequency==7){
					dateTotal = "주말";
				}else{
					for(i=6;i>0;i--){
						if(i==challenge.identifyfrequency){
							dateTotal="주 "+i+"회";
						}	
					}
				}
				//console.log(dateTotal);
				//날짜 제어
				let now = new Date();
				let year = now.getFullYear();
				let month = now.getMonth();
				let day = now.getDate();
				
				let nowDate = new Date(year, month, day);
				let startDate = challenge.challengestart;
			//	console.log("시작 날짜"+startDate)
			//	console.log("오늘 날짜"+nowDate)
 				let millisec = startDate - nowDate.getTime();
				let limitDate = millisec / (1000*60*60*24);
			//	console.log("limitDate 날짜 차이"+limitDate);
				
				let challengeMakeUser = challenge.headernum==3?"<img src='image/userMake.svg' style='height:20px;'>&nbsp"+challenge.nickname:"<img src='image/managerMake.svg' style='height:20px;'>&nbsp공식챌린지";
				
				
				let data =  "<div class='col-xs-12 col-sm-4 p-2 dataId'>"
							+"<div class='challCard'>"
			     			+"<div class='challCardImg'>"
 			     				+"<a class='challCardImg' href='challengeDetail.do?challengeseq="+challenge.challengeseq+"'>";
		     				if(challenge.challengesavephoto=="0"){
	     				 		data +="<img  src='./image/challenge2.jpg'>";
		     				}else{
		     					data +="<img src='https://s3.ap-northeast-2.amazonaws.com/livelybucket/"+challenge.challengesavephoto+"'>";
		     				}
			     	data+=   "</a>"
								+"</div>"
								+"<div class='challCardContent'>"
								+"<div style='display:flex;justify-content: space-between;'>"
								+"<p class='challuser'>"+challengeMakeUser+"</p>"
								+"<span class='usercount'><i class='fas fa-user'></i>&nbsp;"+challenge.challengemember+"명</span>"
								+"</div>"
								+"<a class='cardTitle' href='challengeDetail.do?challengeseq="+challenge.challengeseq+"'><h5 class='card-title'>"+challenge.challengetitle+"</h5></a>"
								+"<span class='when'>"+dateTotal+"</span><span class='when'>"+challenge.challengeperiod+"주동안</span>";
						if(limitDate<0){
							data += "<p class='card-start'>시작중인 챌린지</p>";								
						}else if(limitDate==0){
							 data += "<p class='card-text'>오늘부터 시작</p>";				
						}else{
							data += "<p class='card-text'>"+limitDate+"일 뒤부터 시작</p>";			
						}
						data +=" </div>"
								 +"  </div> </div>";
						$("#dataMain"+categoryNumber).append(data);
			});			
		},
		error:function(){
			alert("리스트 불러오는 error");
		}, 
		complete:function(){
			$("#category"+categoryNumber).addClass("active");
		}
	});		
		
}
//글의 총 수 가져오기
function getChallengeListCount(categoryNumber){
	
	$.ajax({
		url:"./challengeDataCount.do",
		type:"get",
		data:{'search':$("#_search").val(), 'category':categoryNumber},
		success:function(count){//return이 글의 전체 수임
			//alert("전체 글의 수 : "+count);
			loadPaging(count, categoryNumber);
		},
		error:function(){
			alert("전체 글 수 에러error");
		}
	});
}


//페이징 처리하기
function loadPaging(totalCount, categoryNumber){
	

	console.log("페이징 전체 글 수 : "+totalCount + "카테고리 번호"+categoryNumber)
	let category = categoryNumber;
	let pageSize = 9;
	let nowPage= 1;
	let _totalPages = totalCount / pageSize;
	console.log("토탈 페이지: "+_totalPages)

	 if(totalCount % pageSize>0){
		 _totalPages++;
			console.log("토탈 페이지: "+_totalPages)
	 }
	 
	//페이지 갱신 : 갱신해야 검색 페이징 가능
	var pageData = $('#_pagination').data();
	if( typeof(pageData.twbsPagination) != 'undefined' ){				
		if( pageData.twbsPagination.options.totalPages != _totalPages ){
			$('#_pagination').twbsPagination('destroy');
		}
	}
	
 	 //$(".pagination").twbsPagination('enable');
	  console.log("페이징 버튼 누르면 "+_totalPages+" 페이지수"+nowPage+"카테고리 번호"+categoryNumber)
	 $("#_pagination").twbsPagination({
		startPage: nowPage,
	 	totalPages:  Math.floor(_totalPages),
	 	visiblePages: 5,
	 	initiateStartPageClick: false,
 	 	first:'Previous',
 	 	prev:"<<",
 	 	next:">>",
 	 	last:'END',
// 	 	initiateStartPageClick: true,
 	 	nextClass : "page-item next",	// 이전 페이지 CSS class
	    prevClass : "page-item prev",	// 다음 페이지 CSS class
 	    lastClass : "page-item last",	// 마지막 페이지 CSS calss
 	    firstClass : "page-item first",	// 첫 페이지 CSS class
 	    pageClass : "page-item",	// 페이지 버튼의 CSS class
 	    activeClass : "active",	// 클릭된 페이지 버튼의 CSS class
 	    disabledClass : "disabled",	// 클릭 안된 페이지 버튼의 CSS class
 	    anchorClass : "page-link",	//버튼 안의 앵커에 대한 CSS class
	    
	 	initiateStartPageClick:false,	//처음 실행 시 아래가 실행 안된다.(onPageClick가 자동실행되지 않도록 해준다.)
	 	 onPageClick:function(event, pageNumber){	//페이지 넘버 클릭 시 들어오는 부분
	
	 		console.log("pageNumber 페이징 버튼 누르면 : "+pageNumber)
	 		nowPage = pageNumber;	
	 		getChallengeList(pageNumber-1, category);
	 		console.log("pageNumber 페이징 버튼 누르면 : "+pageNumber + "카테고리 뭐여?" +category)
	 	 }
	 });

}
</script> 

