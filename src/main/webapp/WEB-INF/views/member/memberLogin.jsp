﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>      

 <!-- member 로그인 css -->
 <link rel="stylesheet" href="css/memberLogin.css" />
<div class="log" id="log">
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
	                 <td><a href="${naverUrl}"><img src="image/naverlogin.svg"/></a></td>
	             </tr>
	             <tr>
	                 <td><a href="#none"><img src="image/btn_google.png"/></a></td>
	             </tr>
	             <tr>
	                 <td><a href="memberInfo.do">이거당</a></td>
	             </tr>
	         </tbody>
	     </table>
	 </form>
 </div>
