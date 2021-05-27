<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 제이쿼리 -->
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

 <!-- 부트스트랩 -->
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  
 
    
 <link href="./css/element.css" rel="stylesheet">
 
 <!-- 챌린지 만들기 버튼 -->
<div class="pointButton">
 	<button type="button" class="point-btn-hover color-Purple"  onclick="challengeMake()" >START</button>
 </div>
 
 <!-- /////////////////////////////////////////////////////////////// -->
 
 
 
 <!-- 메인 검색버튼 (타원)-->
 <div class="md-form md-outline d-flex SearchMain" align="right">
	<input type="text" class="form-control input-SearchMain" id="search" placeholder="검색하세요" name="search">
  	<button type="button" class="btn btn-SearchMain" >SEARCH</button>
  </div>
<!-- /////////////////////////////////////////////////////////////// -->
 
 <!-- 일반 검색 버튼(네모) -->
 <div class="md-form md-outline d-flex Search" align="right">
	<input type="text" class="form-control input-Search" id="search" placeholder="검색하세요" name="search">
  	<button type="button" class="btn btn-Search" >SEARCH</button>
  </div>
 
 
 <!-- /////////////////////////////////////////////////////////////// -->
 
 <!-- nav tab바 -->
 <div class="container">
	 <!-- Nav pills -->
		  <ul class="nav nav-pills" role="tablist">
		    <li class="nav-item">
		      <a class="nav-link active" data-toggle="pill" href="#home">전  체</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" data-toggle="pill" href="#menu1">MENU1</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" data-toggle="pill" href="#menu2">MENU2</a>
		    </li>
		     <li class="nav-item">
		      <a class="nav-link" data-toggle="pill" href="#menu3">MENU3</a>
		    </li>		 
		  </ul>
	
	   <!-- Tab panes -->
		  <div class="tab-content">
		    <div id="home" class="container tab-pane active">	 
		    	<br>
		    	<h3>home</h3>
		     	<p>각 메뉴의 데이터를 보여준다</p>
		    </div>
		      
	     	<div id="menu1" class="container tab-pane fade"><br>
		      <h3>Menu 1</h3>
		      <p>각 메뉴의 데이터를 보여준다</p>
		    </div>
		    
		    <div id="menu2" class="container tab-pane fade"><br>
		      <h3>Menu 2</h3>
		      <p>각 메뉴의 데이터를 보여준다</p>
		    </div>
		    
		    <div id="menu3" class="container tab-pane fade"><br>
		      <h3>Menu 3</h3>
		      <p>각 메뉴의 데이터를 보여준다</p>
		    </div>
			  		   
		  </div> 
   </div>     


<!-- 카드 일반형 -->
<div class="card" style="width:400px">
    <img class="card-img-top" src="https://www.w3schools.com/bootstrap4/img_avatar1.png" alt="Card image" style="width:100%">
    <div class="card-body">
      <h4 class="card-title">John Doe</h4>
      <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
      <a href="#" class="btn btn-Card">See Profile</a>
    </div>
</div>
 
  <!-- /////////////////////////////////////////////////////////////// -->

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
				   	
 
 