<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">


<!-- 제이쿼리   
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
Bootstrap CSS
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">

intro Css
<link href="/css/intro.css" rel="stylesheet">
 Option 1: Bootstrap Bundle with Popper
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8" crossorigin="anonymous"></script>

아이콘
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
 -->
<title>header</title>
</head>
<body>
<!--  header
<a href="/member/testmember">testmember</a>
<a href="/member/memberLogin">login</a>
<a href="/member/regi">join us</a>
 -->
<nav class="navbar navbar-expand-md fixed-top navbar-light bg-light">
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
        <button type="button" class="loginbtn" id="loginbtn" onClick="location.href='memberLogin.do'">LIVELY LOGIN</button>
      </form>
    </div>
  </div>
</nav> 
<!-- 
<script type="text/javascript">
$(document).ready(function(){

	$("#loginbtn").click(function(){
		location.href="memberLogin.do";
	});
});
</script>
 -->

</body>
</html>
