<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 <meta name="viewport" content="width=device-width, initial-scale=1">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

 <!-- Bootstrap CSS -->
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">

<!-- intro Css -->
<link href="./css/intro.css" rel="stylesheet">
 <!-- Option 1: Bootstrap Bundle with Popper -->
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8" crossorigin="anonymous"></script>

 <!-- Option 2: Separate Popper and Bootstrap JS -->
 
 <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.min.js" integrity="sha384-lpyLfhYuitXl2zRZ5Bn2fqnhNAKOAaM/0Kr9laMspuaMiZfGmfwRNFh8HlMy49eQ" crossorigin="anonymous"></script>
 


<!-- 아이콘 -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
</head>
<body>

<nav class="navbar navbar-expand-md fixed-top navbar-dark bg-dark"> <!-- p -->
  <div class="container-fluid">
    <a class="navbar-brand" href="#">
    	<img src="./image/logo.png" style="height: 45px">
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse">
      <ul class="navbar-nav me-auto mb-2 mb-md-0 ">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#intro">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link " href="#info">INFO</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#content">CONTENT</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#link">LINK</a>
        </li>
       
      </ul>
      <form class="d-flex">
        <button class="loginbtnW" id="loginbtn">LIVELY LOGIN</button>
      </form>
    </div>
  </div>
</nav>

<main style="background-color: #000"> 
 <!-- intro -->
	<section id="intro" class="section">
	  <div class="introDiv" style="background-image: url('./image/concert-768722_1920.jpg')">
		  <main class="introSen">
		    <h1 >LIVELY AAAAA</h1>
		    <p >당신의 MBTI는 무엇일까요?</p>
		    <p>LIVELY와 함께 시작해보세요. 당신의...어쩌구..저쩌구...</p>
		 	
		 	<div class="scene">
			  <div class="cube" id="loginbtn">
			    <span class="side top">MBTI</span>
			    <span class="side front">ENJOY US</span>
			  </div>
			</div>	    
		  </main>
		</div>
	</section>
	
<!-- info -->
	<section id="info" class="section">
		<header class="infoHead">
			<h1>WHAT'S YOUR TYPE?</h1>
			<h2>LIVELY WILL LET YOU KNOW</h2>
		</header>
		<div class="row">
			<div class="col-sm-6 infoImg">
				<span style="color:white">이미지 삽입</span>
			</div>
			<div class="col-sm-6 infoSen">
				<div>
					<h4>문구를 추가하세요</h4>		
					<p>문장을 추가하세요</p>
				</div>
			</div>
				
		</div>
		
		<div class="row">
			<div class="col-sm-6 infoSub">
				<div>
					<h4>문구를 추가하세요</h4>		
					<p>문장을 추가하세요</p>
				</div>
			</div>
			<div class="col-sm-6 infoImg">
				<span style="color:white">이미지 삽입</span>
			</div>
				
		</div>
		
	</section>
	
<!-- CONTENT -->
	<section id="content" class="section">
		<header class="conHeader">
			<h1>EXPERIENCE SOMTHING NEW WITH LIVELY</h1>
			<div class="warning" style="background-image:url('image/livwarning.png') ">
 			</div>
 			<div class="row contentMain">
 				<div class="col-sm-4">
 					<div class="hexagon" style="background-image: url('./image/hexagon.png')">
 						<i class="fas fa-clipboard fa-4x hexagonImg1"></i>
 					</div>
 					<h4>SURVEY MBTI</h4>
 					<p>mbti에 관한 내용을 입력하세요</p>
 				</div>
 				<div class="col-sm-4">
 					<div class="hexagon" style="background-image: url('./image/hexagon.png')">
 						<i class="fas fa-user-check fa-4x hexagonImg2"></i>
 					</div>	
 					<h4>MAKING A RELATIONSHIP</h4>
 					<p>MATCHING에 관한 내용을 입력하세요</p>
 				</div>
 				
 				<div class="col-sm-4">
 					<div class="hexagon" style="background-image: url('./image/hexagon.png')">
 						<i class="fas fa-users fa-4x hexagonImg2"></i>
 					</div>
 					<h4>CLUB ACTIVITIES</h4>
 					<p>CLUB에 관한 내용을 입력하세요</p>
 				</div>
 			</div>
 			<div class="warning" style="background-image:url('image/livwarning.png') ">
 			</div>		
		</header>
		<div class="row">
		<%for(int i=0; i<4;i++){ %>
			<div class="col-sm-4 conSen">
				<div>
					<h4>문구를 입력하세요</h4>
					<p>문장을 입력하세요</p>
				</div>

			</div>
			<div class="col-sm-4 conSen2">
			 <span style="color:white">이미지 삽입</span>
			</div>
		<%} %>	
			<div class="col-sm-4 conSen">
				<div>
					<h4>문구를 입력하세요</h4>
					<p>문장을 입력하세요</p>
				</div>

			</div>
		</div>
	</section>
	
<!-- link -->	
	<section id="link" class="section">
	 <div class="row linkRow">
	 	<div class="col-sm-6">
	 		<div class="linkI">
	 			 <span style="color:white">이미지 삽입</span>
	 		</div>
	 		<div class="linkS">
	 			<h4>문구를 입력하세요</h4>
		 		<div class="table_center">
			       <a href="#none">
			           MATCHING
			       </a>
				</div>
			</div>	 		
	 	</div>
	 	
	 	<div class="col-sm-6">
	 		<div class="linkI">
	 			 <span style="color:white">이미지 삽입</span>
	 		</div>
	 		<div class="linkC">
	 			<h4>문구를 입력하세요</h4>
		 		<div class="table_center">
			       <a href="#none">
			           CLUB
			       </a>
				</div>
			</div>
	 	</div>
	 </div>
	 
	</section>
	
</main>


<script type="text/javascript">
$(document).ready(function(){

	$("#loginbtn").click(function(){
		location.href="memberLogin.do";
	});
});



</script>


</body>
</html>