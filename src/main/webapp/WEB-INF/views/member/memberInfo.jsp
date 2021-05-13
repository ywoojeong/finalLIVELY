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
                <div id="previewId" class="memberImg"></div>
                
                <!-- 이미지 업로드 부분 -->
                <p style="border: none;">
                	
                    <input type="file" id="memberPhoto" onchange="previewImage(this,'previewId')" style="display: none;"> 
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
function previewImage(targetObj, previewId) {
    var preview = document.getElementById(previewId); //div id   
    var ua = window.navigator.userAgent;

    if (ua.indexOf("MSIE") > -1) {//ie일때

        targetObj.select();

        try {
            var src = document.selection.createRange().text; // get file full path 
            var ie_preview_error = document
                    .getElementById("ie_preview_error_" + previewId);

            if (ie_preview_error) {
                preview.removeChild(ie_preview_error); //error가 있으면 delete
            }

            var img = document.getElementById(previewId); //이미지가 뿌려질 곳 

            img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"
                    + src + "', sizingMethod='scale')"; /*이미지 로딩, sizingMethod는 div에 맞춰서 사이즈를 자동조절 하는 역할*/
        } catch (e) {
            if (!document.getElementById("ie_preview_error_" + previewId)) {
                var info = document.createElement("<p>");
                info.id = "ie_preview_error_" + previewId;
                info.innerHTML = "a";
                preview.insertBefore(info, null);
            }
        }
    } else { //ie가 아닐때
        var files = targetObj.files;
        for ( var i = 0; i < files.length; i++) {

            var file = files[i];

            var imageType = /image.*/; //이미지 파일일경우만.. 뿌려준다.
            if (!file.type.match(imageType))
                continue;

            var prevImg = document.getElementById("prev_" + previewId); //이전에 미리보기가 있다면 삭제
            if (prevImg) {
                preview.removeChild(prevImg);
            }

            var img = document.createElement("img"); /*크롬은 div에 이미지가 뿌려지지 않는다. 그래서 자식Element를 만든다.*/
            img.id = "prev_" + previewId;
            img.classList.add("obj");
            img.file = file;
            img.style.width = '250px'; //기본설정된 div의 안에 뿌려지는 효과를 주기 위해서 div크기와 같은 크기를 지정해준다.
            img.style.height = '120px';
            
            preview.appendChild(img);

            if (window.FileReader) { // FireFox, Chrome, Opera 확인.
                var reader = new FileReader();
                reader.onloadend = (function(aImg) {
                    return function(e) {
                        aImg.src = e.target.result;
                    };
                })(img);
                reader.readAsDataURL(file);
            } else { // safari is not supported FileReader
                //alert('not supported FileReader');
                if (!document.getElementById("sfr_preview_error_"
                        + previewId)) {
                    var info = document.createElement("p");
                    info.id = "sfr_preview_error_" + previewId;
                    info.innerHTML = "not supported FileReader";
                    preview.insertBefore(info, null);
                }
            }
        }
    }
}
</script>