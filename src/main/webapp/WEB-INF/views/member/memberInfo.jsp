﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>      

<link rel="stylesheet" href="css/memberInfo.css" />
<script src="js/memberInfo.js"></script>

<!-- cookie -->
<script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script>

<div class="container">
    <form action="regiInfo" method="POST" name="memberInfo" enctype="multipart/form-data">
        <div id="addInfo">
	        <div class="logo">
	        	<img src="image/logo.png" width="120" height="42"/>
	        </div>
            <div class="joinBtn" align="center"><h1>join</h1></div>
        </div>
        
        <div class="rightbox">
            <div class="profile">
                <h1>추가 정보 입력</h1>
                <h2>PHOTO</h2>
                <!-- 이미지 미리보기 -->
                <div class="memberImg">
                    <div class="img_wrap">
                        <img id="img" />
                    </div>
                </div>
                <!-- 이미지 업로드 부분 -->
                <p style="border: none;">
                	
                    <input type="file" id="memberPhoto" style="display: none;"> 
                    <!-- input 버튼 따로 값 주는거 알아보기 -->
                    <button type="button" class="btn" id="btn_submit" onclick="javascript:fn_submit()"><label for="memberPhoto">이미지 update</label></button>
                    
                </p>
                <!-- 닉네임 -->
                <h2>NICKNAME</h2>
                <p>
                    <button class="btn">닉네임 중복 확인</button>
                    <input type="text"  class="form-control form-control-sm" id="nicknameCheck" name="nicknameCheck" placeholder="닉네임을 입력하세요">
                    <!-- <input type="text"  class="form-control form-control-sm" id="nicknameCheck" name="nicknameCheck" placeholder="닉네임을 입력하세요" style="border: none; width: 150px;"> -->
                    <input type="hidden" id="nickname" name="nickname">
                </p>
            </div>
        </div>
    </form>
</div>