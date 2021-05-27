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
		<div class="hotMainCover"></div>
		<div class="hotMainSen">	
			<h2>최근 인기있는 챌린지에 동참하세요</h2>
			<p>새로운 챌린지를 만들어보세요. LIVELY는 여러분의 챌린지를 기다립니다.</p>
			<!-- 챌린지 만들기 버튼 세션 없으면 로그인 / 있으면 만들기-->
			<div class="chall-buttons">
			 	<button type="button" class="chall-btn-hover color-3"  onclick="challengeMake()" >START</button> 	
			 </div>
		</div>
	</div>
</div>    
 
   
   <div class="container">

   	 <!-- Nav pills -->
		  <ul class="nav nav-pills" role="tablist">
		    <li class="nav-item">
		      <a class="nav-link active" data-toggle="pill" href="#home">전  체</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" data-toggle="pill" href="#category2">건  강</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" data-toggle="pill" href="#category3">역  량</a>
		    </li>
		     <li class="nav-item">
		      <a class="nav-link" data-toggle="pill" href="#category4">정  서</a>
		    </li>
		     <li class="nav-item">
		      <a class="nav-link" data-toggle="pill" href="#category5">자  산</a>
		    </li>
		     <li class="nav-item">
		      <a class="nav-link" data-toggle="pill" href="#category6">생 활</a>
		    </li>	
		    <li class="nav-item">
		      <a class="nav-link" data-toggle="pill" href="#category6">취 미</a>
		    </li>		 
		  </ul>
		
			
	
		
		
		  <!-- Tab panes -->
		  <div class="tab-content">
		  
	
		    <div id="home" class="container tab-pane active">
			   <!-- 검색창 -->	
			   <div class="row">
					<div class="col-sm-6 md-form md-outline d-flex Search">
						<input type="text" class="form-control input-Search" id="search" placeholder="인기있는 챌린지를 검색하세요" name="search">
				    	<button type="button" class="btn btn-Search" >SEARCH</button>
				    </div>
	  			</div>
		    	
		    
		    	<!-- 카드 -->
		     	<div class="row">
		     		<%for(int i=0;i<3;i++){
		     			for(int j=0;j<3;j++){
		     			%>
		     			
			     		<div class="col-xs-12 col-sm-4 p-2">
			     			<div class="card challCard">
		     				 	<img class="card-img-top zoom" src="https://www.w3schools.com/bootstrap4/img_avatar1.png" alt="Card image cap">
 							  <div class="card-img-overlay"> 
							    <h5 class="card-title">챌린지 제목</h5>
							    <p class="challuser"><i class="fas fa-trophy"></i> 공식 챌린지</p>
							    <div class="usercount"><i class="fas fa-user"></i> 35명</div>
							    <span class="when">평일 매일</span><span class="when">2주동안</span>
							    <p class="card-text">오늘부터 시작</p>
							    <button type="button" class="btn" onclick="challengeDetailBtn()">Go challenge</button>
							  </div>
							</div>
			     		</div>
		     		
		     			<%}
		     		}%>
		     	</div>
		     	<!-- 페이지네이션 -->
		     
				  <ul class="pagination" style="justify-content: center">
				    <li class="page-item disabled">
				      <a class="page-link" href="#" tabindex="-1">Previous</a>
				    </li>
				    <li class="page-item"><a class="page-link" href="#">1</a></li>
				    <li class="page-item active">
				      <a class="page-link" href="#">2 <span class="sr-only">(current)</span></a>
				    </li>
				    <li class="page-item"><a class="page-link" href="#">3</a></li>
				    <li class="page-item">
				      <a class="page-link" href="#">Next</a>
				    </li>
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
function challengeDetailBtn(){
	/* location.href="challengeDetail.do?challengeseq="+seq; */
	location.href="challengeDetail.do";
}
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

/* $(".nav-pills").find('a').click(function(){
	window.location.hash = $(this).attr('href').
});
 */
</script> 

