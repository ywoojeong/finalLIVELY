<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>      
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" type="text/css" />  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="css/memberInfo.css" />
<script src="js/memberInfo.js"></script>

<!-- cookie -->
<script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script>

</head>
<body>
<div class="container">
	<div id="logo"><h1 class="logo"><img src="image/logo.png" width="120" height="42"></h1>
		<div class="CTA"><h1>가입하기</h1></div>
	</div>
<!-- 	<div class="leftbox">
		<nav>
			<a id="profile" class="active"><i class="fa fa-user"></i></a>
			<a id="payment"><i class="fa fa-credit-card"></i></a>
			<a id="subscription"><i class="fa fa-tv"></i></a>
			<a id="privacy"><i class="fa fa-tasks"></i></a>
			<a id="settings"><i class="fa fa-cog"></i></a>
		</nav>
	</div> -->
	<div class="rightbox">
		<div class="profile">
			<h1>추가 정보 입력</h1>
			<h2>Full Name</h2>
			<p>Julie Park <button class="btn">update</button></p>
			<h2>PHOTO</h2>
			<p>July 21</p>
			<h2>Gender</h2>
			<p>Female</p>
			<h2>Email</h2>
			<p>example@example.com <button class="btn">update</button></p>
			<h2>NICKNAME</h2>
			<p>
				<button class="btn">update</button>
				<input type="text" autofocus="autofocus" id="nicknameCheck" name="nicknameCheck" placeholder="닉네임">
				<!-- <input type="text"  class="form-control form-control-sm" id="nicknameCheck" name="nicknameCheck" placeholder="뭐든들어가라"> -->
				<input type="hidden" id="nickname" name="nickname">
			</p>
		</div>
	</div>
</div>
</body>
</html>