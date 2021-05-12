<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

 
 <link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Russo+One&display=swap" rel="stylesheet">

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
          <a class="nav-link active" aria-current="page" href="intro.do">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link " href="hotChallenge.do">HOT CHALLENGE</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="newChallenge.do">NEW CHALLENGE</a>
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
