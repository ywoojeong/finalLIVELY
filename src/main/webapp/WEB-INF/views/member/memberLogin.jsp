﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>      


 <!-- member 로그인 css -->
 <link rel="stylesheet" href="css/memberLogin.css" />

<div class="container">
<div class="row">
<div class="col-sm-12">
<div class="logForm">
<div class="log" id="log">
	<div class="logs">
	 <form name="loginForm" id="loginForm" method="POST">
	     <table>
	         <thead>
	             <tr>
	                 <th style="padding-bottom: 50px">
	                     <img src="image/logo.png" width="180" height="65">
	                 </th>
	             </tr>
	         </thead>
	         <tbody>
	             <tr>
	                 <td><a href="javascript:kakaoLogin()"><img src="image/btn_kakao.png"/></a></td>
	             </tr>
	             <tr>
	                 <td><a href="${naverUrl}"><img src="image/naverLogin.svg"/></a></td>
	             </tr>
	             <tr>
	                 <td><a href="#" class="g-signin2" data-width="300" data-height="43"  onClick="onSignIn()" style="text-decoration: none"><img src="image/googlelogin.svg"/></a></td>
	             </tr>
	         </tbody>
	     </table>
	 </form>
</div>
</div>
</div>
</div>
</div>
</div>
 
<form name="kakaoForm" id="kakaoForm" method = "post" action="addInfo.do">
	<input type="hidden" name="email" id="kakaoEmail" />
	<input type="hidden" name="id" id="kakaoId" />
	<input type="hidden" name="flag" id="flag" value="kakao" />
</form>

<form name="googleForm" id="googleForm" method = "post" action="addInfo.do">
	<input type="hidden" name="email" id="googleEmail" />
	<input type="hidden" name="id" id="googleId" />
	<input type="hidden" name="memberPhoto" id="memberPhoto" />
	<input type="hidden" name="flag" id="flag" value="google" />
</form>

<script type="text/javascript">
//카카오 로그인 팝업
function kakaoLogin() {
	Kakao.Auth.login({
		success: function (response) {
		Kakao.API.request({
			url: '/v2/user/me',
			success: function (response) {
				memberKakaoLoginPro(response)
			//	alert(JSON.stringify(response))
			},
			fail: function (error) {
				console.log(error)
			},
		})
	},
		fail: function (error) {
			console.log(error)
		},
	});
};


</script>