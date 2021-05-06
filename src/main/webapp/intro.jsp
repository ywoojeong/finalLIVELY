<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 <meta name="viewport" content="width=device-width, initial-scale=1">

 <!-- Bootstrap CSS -->
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">

<!-- intro Css -->
<link href="./css/intro.css" rel="stylesheet">
 <!-- Option 1: Bootstrap Bundle with Popper -->
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8" crossorigin="anonymous"></script>

 <!-- Option 2: Separate Popper and Bootstrap JS -->
 <!--
 <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.min.js" integrity="sha384-lpyLfhYuitXl2zRZ5Bn2fqnhNAKOAaM/0Kr9laMspuaMiZfGmfwRNFh8HlMy49eQ" crossorigin="anonymous"></script>
 -->


</head>
<body>

<nav class="navbar navbar-expand-md fixed-top navbar-dark bg-dark"> <!-- p -->
  <div class="container-fluid">
    <a class="navbar-brand" href="#">LIVELY</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse">
      <ul class="navbar-nav me-auto mb-2 mb-md-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#intro">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#info">INFO</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#content">CONTENT</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">INFO</a>
        </li>
       
      </ul>
      <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
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
			  <div class="cube">
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
			<h1 class="he1">WHAT'S YOUR TYPE?</h1>
			<h2 class="he2">LIVELY WILL LET YOU KNOW</h2>
		</header>
		<div class="row">
			<div class="col-sm-6 infoMain">
				다이브1
			</div>
			<div class="col-sm-6">
				다이브2
			</div>
				
		</div>
		
		<div class="row">
			<div class="col-sm-6 ">
				다이브1
			</div>
			<div class="col-sm-6 infoSub">
				다이브2
			</div>
				
		</div>
		
	</section>
	
<!-- CONTENT -->
	<section id="content" class="section">
		<header>
			<h1>LIVELY</h1>
		</header>
		<div class="row">
		<%for(int i=0; i<4;i++){ %>
			<div class="col-sm-4 conSen">
			 다이브1
			</div>
			<div class="col-sm-4">
			 다이브1
			</div>
		<%} %>	
			<div class="col-sm-4 conSen">
			 다이브1
			</div>
		</div>
	
	</section>	
	
</main>


</body>
</html>