<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <link href="./css/challenge.css" rel="stylesheet">   
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
 <!-- core tag -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
 
 
 
 <div class="" style="margin-top:70px;"> 
	<div class="hotMain">
		<video muted autoplay loop>
        	<source src="video/write.mp4" type="video/mp4">
        	<strong>Your browser does not support the video tag.</strong>
        </video>
<!-- 		<div class="hotMainCover"></div> -->
		<div class="hotMainSen">	
			<h2>최근 인기있는 챌린지에 동참하세요</h2>
			<p class="d-none d-sm-block">새로운 챌린지를 만들어보세요. LIVELY는 여러분의 챌린지를 기다립니다.</p>
			<!-- 챌린지 만들기 버튼 세션 없으면 로그인 / 있으면 만들기-->
			<div class="chall-buttons">
			 	<button type="button" class="chall-btn-hover color-3"  onclick="challengeMake()" >START</button> 	
			 </div>
		</div>
	</div>
</div>    
 
   
   <div class="container">

   	 <!-- Nav pills -->
   	 <div class="hotNav">
		  <ul class="nav nav-pills" role="tablist">
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
		  
	
		    <div id="category0" class="container tab-pane active">
			   <!-- 검색창 -->	
			   <div class="row">
					<div class="col-sm-6 md-form md-outline d-flex Search">
						<input type="text" class="form-control input-Search" id="_search" placeholder="인기있는 챌린지를 검색하세요" name="search">
				    	<button type="button" id="searchBtn" class="btn btn-Search" onclick="searchBtn()">SEARCH</button>
				    </div>
	  			</div>
		    	
		    
		    	<!-- 카드 -->
		     	<div class="row" style="margin: 15px auto 30px auto; width: 94%">
		     		<%for(int i=0;i<3;i++){
		     			for(int j=0;j<3;j++){
		     			%>
		     			
			     		<div class="col-xs-12 col-sm-4 p-2">
			     			<div class="challCard">
			     			<div class="challCardImg">
			     				 <a class="challCardImg" href="challengeDetail.do" >
			     				 	<img  src="https://blog.hmgjournal.com/images/contents/article/20161004-Reissue-hiking-course-02.jpg">
			     				 </a>
 							</div>
							    <div class="challCardContent">
							    	<div style="display:flex;justify-content: space-between;">
								     	<p class="challuser"><i class="fas fa-trophy"></i> 공식 챌린지<p>
								     	<span class="usercount"><i class="fas fa-user"></i> 35명</span>
								     </div>
							      	<h5 class="card-title">챌린지가몇자리까지쓰면다음으</h5>
								    <span class="when">평일 매일</span><span class="when">2주동안</span>
								    <p class="card-text">오늘부터 시작</p>
							    </div>
							   </div>

			     		</div>
		     		
		     			<%}
		     		}%>
		     	</div>
		     	<!-- 페이지네이션 -->
		     
				  <ul class="pagination" style="justify-content: center">
<!-- 				    <li class="page-item disabled"> -->
<!-- 				      <a class="page-link" href="#" tabindex="-1">Previous</a> -->
<!-- 				    </li> -->
<!-- 				    <li class="page-item"><a class="page-link" href="#">1</a></li> -->
<!-- 				    <li class="page-item active"> -->
<!-- 				      <a class="page-link" href="#">2 <span class="sr-only">(current)</span></a> -->
<!-- 				    </li> -->
<!-- 				    <li class="page-item"><a class="page-link" href="#">3</a></li> -->
<!-- 				    <li class="page-item"> -->
<!-- 				      <a class="page-link" href="#">Next</a> -->
<!-- 				    </li> -->
				  </ul>
				   	
		    </div>
		      
		      <div id="category1" class="container tab-pane fade"><br>
			      <h3>Menu 1</h3>
			      <p>각 메뉴의 데이터를 보여준다</p>
			    </div>
			    
			    <div id="category2" class="container tab-pane fade"><br>
			      <h3>Menu 2</h3>
			      <p>각 메뉴의 데이터를 보여준다</p>
			    </div>
			    
			    <div id="category3" class="container tab-pane fade"><br>
			      <h3>Menu 3</h3>
			      <p>각 메뉴의 데이터를 보여준다</p>
			    </div>
			  		   
		  </div>
		
 
   </div>


<script>
//시작 시 호출
getChallengeListCount(0);		//카테고리 번호
getChallengeList(0, 0);	//페이지 번호, 카테고리번호


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
function categoryBtn(categotyNumber){
	getBbsListData(0, categotyNumber);	//페이지 번호, 카테고리번호
	getBbsListCount(categotyNumber);	
	
	//카테고리선택 후 검색
	$('#searchBtn').click(function(){
		getBbsListData(pagingNumber, categotyNumber);	//페이지 번호, 카테고리번호
		getBbsListCount(categotyNumber);	
	});
	
}

//전체 리스트 불러오기
function getChallengeList(pageNumber, categoryNumber){
	$.ajax({
		url:"./hotChallengeData.do",
		type:"get",
		data:{'nowpageNumber':pageNumber, 'search':$("#_search").val(), 'category':categoryNumber},
		success:function(list){
			alert("전체 리스트 불러오기"+list.length);
		},
		error:function(){
			alert("리스트 불러오는 error");
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
			alert("전체 글의 수 : "+count);
			loadPaging(count);
		},
		error:function(){
			alert("전체 글 수 에러error");
		}
	});
}
//페이징 처리하기
function loadPaging(totalCount){
	
	let pageSize = 9;
	let nowPage= 1;
	
	let _totalPages = totalCount / pageSize;
	 if(totalCount % pageSize>0){
		 _totalPages++;
	 }

	//페이지 갱신 : 갱신해야 검색 페이징 가능
	 $("#pagination").twbsPagination('destroy');
	
	 $("#pagination").twbsPagination({
		//startPage: 1,
	 	totalPages:  _totalPages,
	 	visiblePages: 5,
	 	first:'<span sria-hidden="true">«</span>',
	 	prev:"Previous",
	 	next:"Next",
	 	last:'<span sria-hidden="true">»</span>',
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
	 		nowPage = pageNumber;
	 		// alert("nowPage : "+page);
	 		getChallengeList(pageNumber-1);
	 	 }
	 });

}


</script> 
<!-- 페이지네이션 -->
<script src="./js/jquery.twbsPagination.js"></script>
