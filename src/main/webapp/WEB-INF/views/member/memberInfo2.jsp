﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>      

<link rel="stylesheet" href="css/memberInfo.css" />

<!-- cookie -->
<!-- <script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script> -->

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
                        <img id="photo" />
                    </div>
                </div>
                
                <!-- 이미지 업로드 부분 -->
                <p style="border: none;">
                	
                    <input type="file" id="memberPhoto" style="display: none;"> 
                    <button type="button" class="btn"><label for="memberPhoto">이미지 update</label></button>
                    
                </p>
                
                <!-- 닉네임 -->
                <h2>NICKNAME</h2>
                <p>
                    <button type="button" onclick="nickCheck()" class="btn">닉네임 중복 확인</button>
                    <input type="text"  class="form-control form-control-sm" id="nicknameCheck" name="nicknameCheck" placeholder="닉네임을 입력하세요">
                    <input type="hidden" id="nickname" name="nickname">
                </p>
            </div>
        </div>
    </form>
</div>

<script type="text/javascript">

var sel_file;

$(document).ready(function() {
    $("#memberPhoto").on("change", handleImgFileSelect);
}); 
function handleImgFileSelect(e) {
    var files = e.target.files;
    var filesArr = Array.prototype.slice.call(files);
    filesArr.forEach(function(f) {
        if(!f.type.match("image.*")) {
            alert("확장자는 이미지 확장자만 가능합니다.");
            return;
        }
        sel_file = f;
        var reader = new FileReader();
        reader.onload = function(e) {
            $("#photo").attr("src", e.target.result);
        }
        reader.readAsDataURL(f);
    });
}
</script>