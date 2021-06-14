﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>      

<link rel="stylesheet" href="./css/memberInfo.css" />


<!-- cookie -->
<!-- <script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script> -->

<div class="container">
	<form name="memberInfo" id="memberInfo" method="POST" enctype="multipart/form-data" onsubmit="return checkValue()">
        <input type="hidden" id="email" name="email" value="${email}"/>
        <input type="hidden" id="naverLogin" name="naverLogin" value="${naverLogin}"/>
        <input type="hidden" id="kakaoLogin" name="kakaoLogin" value="${kakaoLogin}"/>
        <input type="hidden" id="googleLogin" name="googleLogin" value="${googleLogin}"/>
        <input type="hidden" id="flag" name="flag"  value="${flag}">
        
        <div id="addInfo" class="infoLogo">
            <div class="logo">
            
                <img src="image/logo.png" width="160px"/>
                 <h1>추가 정보 입력</h1>
            </div>
           		
			<div class="profile">
				<h2>PHOTO</h2>
				<!-- 이미지 업로드 부분 -->
				<p style="border: none;">
				<input type="file" id="uploadFile" name="uploadFile" onchange="previewImage(this,'previewId')" style="display: none;"> 
				<button type="button" class="btnImg"><label for="uploadFile">이미지 update</label></button>
				</p>
				
				<!-- 이미지 미리보기 -->
				<div id="previewId" class="memberImg"></div>
				
				<!-- 닉네임 -->
				<h2>NICKNAME</h2>
				<p>
				<button type="button" onclick="nickCheck()" class="btnCheck">닉네임 중복 확인</button>
				<input type="text"  class="form-control form-control-sm" id="nickname" name="nickname" placeholder="닉네임을 입력하세요">
				<input type="hidden" name="nicknameCheck" id="nicknameCheck" value="">
				</p>
			</div>
			
			
        </div>
        <button type="button" class="joinBtn" id="joinBtn" onclick="register()"><h3>join</h3></button>
	</form>
</div>

<script type="text/javascript">

function nickCheck(){
	var nickname = $("#nickname").val();
	var regExp =  /^[가-힣|a-z|A-Z|0-9|]+$/;

	if(nickname == null || nickname == ""){
		alert("닉네임을 입력 해주세요");
		return false;
	}
	if(!regExp.test(nickname)){
		alert("닉네임은 한글, 영어, 숫자만 4 ~10자리로 입력 가능합니다.");
		return false;
	}
	$.ajax({
		type : 'POST',
		url : 'nickCheck.do',
		data:{ nickname:$("#nickname").val().trim()},
		success : function(data){
			alert('success')
			if(data == 'YES'){
				alert("사용가능한 닉네임 입니다.");
				$("#nickname").val(nickname);
				$("#nicknameCheck").val(nickname);
			}else{
				alert("이미 존재하는 닉네임 입니다.");
				$("#nickname").val("");
			}
		},
		error: function(xhr, status, error){
			alert('error');
		}
	});
}
 
function register() {
    console.log("okok")
    
    if($('#memberPhoto').val() == "") {
        alert("프로필 이미지는 필수!");
        return false;
    }
    
    if($('#nicknameCheck').val() == null || $('#nicknameCheck').val() == "") {
        alert("닉네임 중복 체크를 해주세요.");
        return false;
    }
    
    var uploadFile = $('input[name="uploadFile"]').get(0).files[0];
    var email = $("#email").val()
    var nickname = $("#nickname").val()
    var naverLogin = $("#naverLogin").val()
    var kakaoLogin = $("#kakaoLogin").val()
    var googleLogin = $("#googleLogin").val()
    var memberPhotoName = $("#memberPhotoName").val()
    console.log(googleLogin)
    
    var flag = $("#flag").val()
    var formData = new FormData();
    formData.append('email', email);
    formData.append('nickname', nickname);
    formData.append('uploadFile', uploadFile);
    formData.append('memberPhotoName', memberPhotoName);
    formData.append('naverLogin', naverLogin);
    formData.append('kakaoLogin', kakaoLogin);
    formData.append('googleLogin', googleLogin);
    formData.append('flag', flag);
    /* 
    $.ajax({
		type : 'POST',
		url : 'memberNaverRegisterPro.do',
		processData:false,
		contentType: false,
		data : formData,
		success : function(data){
			alert("success");
			if(data.JavaData == "YES"){
				alert("가입되었습니다.");
				location.href = 'memberCon.do';
			}else{
				alert("가입실패입니다.");
			}
		},
		error: function(xhr, status, error){
			alert("error");
		}
	});
     */
    $.ajax({
		type : 'POST',
		url : 'memberInfoPro.do',
		processData:false,
		contentType: false,
		data : formData,
//		dataType : 'json',
		success : function(data){
			console.log(data);
			if(data == "YES"){
				alert("가입되었습니다.");
				location.href = 'memberLogin.do'
			}else{
				alert("가입에 실패했습니다.");
			}
		},
		error: function(xhr, status, error){
			alert("가입에 실패했습니다."+error);
		}
	});
     
};
</script>

<script type="text/javascript">
function previewImage(targetObj, previewId) {
    var preview = document.getElementById(previewId); //div id   
    var ua = window.navigator.userAgent;

    if (ua.indexOf("MSIE") > -1) {//ie일때

        targetObj.select();

        try {
            var src = document.selection.createRange().text; //get file full path 
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
            if (!file.type.match(imageType)){
            	alert("확장자는 이미지만 가능합니다.")
            	continue;
            }
                

            var prevImg = document.getElementById("prev_" + previewId); //이전에 미리보기가 있다면 삭제
            if (prevImg) {
                preview.removeChild(prevImg);
            }

            var img = document.createElement("img"); /*크롬은 div에 이미지가 뿌려지지 않는다. 그래서 자식Element를 만든다.*/
            img.id = "prev_" + previewId;
            img.classList.add("obj");
            img.file = file;
            img.style.width = '168px'; //기본설정된 div의 안에 뿌려지는 효과를 주기 위해서 div크기와 같은 크기를 지정해준다.
            img.style.height = '170px';
            
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