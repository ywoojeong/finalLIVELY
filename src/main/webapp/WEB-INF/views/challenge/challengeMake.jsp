<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


 <!-- core tag -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!-- format 사용시 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 현재 시간 받아오기 -->
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" />

<%
Calendar cal = Calendar.getInstance();
System.out.print(cal);

int year=cal.get(Calendar.YEAR); //년
int month=cal.get(Calendar.MONTH )+1;//월
int day=cal.get(Calendar.DATE);//일
int hour=cal.get(Calendar.HOUR_OF_DAY);//24시
int min=cal.get(Calendar.MINUTE);//분

%>


<!-- 해당 페이지의 css -->
<link rel="stylesheet" href="./css/challengeMake.css" />
	
 <div class="container">
	 <header class="challengeHeader">
	 		<img class="userWrap" src="https://th.bing.com/th/id/OIP.wTFsSYLWKoHwmv9OOZIp9wHaHa?pid=ImgDet&w=500&h=500&rs=1">
	 	<h4>LimonLimeL 님,</h4>
	 	<p>관심있는 주제로 챌린지를 생성해 보세요.</p>
	 </header>

	 <div class="">
	 	<form action="">
	 	<div class="row challengeMain">
	 		<div class="col-sm-4 pt-5 pl-5">
	 		
			            <label for="challImg"> 
			                  <img id="bookImg" class="img-responsive challImg" src="">
			               		<input type="hidden" name="oldfile" value="image">
			            </label>
			            <input type="file" name="bookimage" id="challImg" style="display: none; width: 100%;">
			            <p style="color:#777777;font-size: 9pt">새로 생성하는 챌린지의 이미지를 등록해주세요.</p>		
	 	
	 			
	 			
	 		</div>
	 		<div class="col-sm-8 challData p-5">
	 			<table class="table-borderless table-responsive challTable">
	 				<col width="200px"><col width="400px">	 				
	 				<tr>
	 					<td>
		 					<label for="category">주제</label>
		 					<select class="form-control form-control-sm">
		 						<option>전체</option>
		 						<option>건강</option>
		 						<option>역량</option>
		 						<option>정서</option>
		 						<option>자산</option>
		 						<option>생활</option>
		 						<option>취미</option>
		 					</select>
	 					</td>
	 				</tr>
	 				<tr>
	 					<td>
	 						<label for=startDate">챌린지 시작일</label>
	 						<select class="form-control form-control-sm challSelect">
	 						<%for(int i=day;i<day+5;i++){ %>
		 						<option><%=month %>월 <%=i %>일</option>
		 					<%} %>
		 					</select>
	 					</td>
	 					<td class="challSelect2">
	 						<label for="endDate">챌린지 기간</label>
	 						<select class="form-control form-control-sm challSelect2">
	 						<%for(int i=1;i<5;i++){ %>
		 						<option><%=i%>주</option>
		 					<%} %>
		 					</select>
	 					</td>
	 				</tr>
	 				<tr>
	 					<td>
	 						<label for="identifyTime">인증시간</label>
	 						<select class="form-control form-control-sm">
	 							<%for(int i=0;i<24;i++){
	 								%>
	 								<option><%=(i<10)?"0"+i:i+""%>시</option>
	 							<%} %>
	 						</select>
	 					</td>
	 					<td class="challSelect2">
	 						<label for="pointCount">참가 포인트</label>
	 						<div class="form-inline">
	 							<input type="text" class="form-control form-control-sm" name="point" style="width: 200px"><span>&nbsp;&nbsp;point</span>
	 						</div>
	 					</td>
	 				</tr>
	 				<tr>
	 					<td colspan="2">
	 						<label for="challengeTitle">챌린지 제목</label>
	 						<input type="text" class="form-control form-control-sm" placeholder="챌린지 제목을 작성해주세요">
	 					</td>
	 				</tr>
	 				<tr >
	 					<td colspan="2" class="content">
	 						<label for="challengeContent">챌린지 소개</label>
	 						<textarea rows="8" class="form-control form-control-sm" placeholder="챌린지를 소개해주세요"></textarea>
	 					</td>
	 				</tr>
	 			</table>	 				
	 		</div>
	 		
	 	</div> 	
	 	</form>
	 </div> 
	 
	 <!-- 챌린지 만들기 버튼 -->
	<div class="chall-buttons">
	 	<button type="button" class="chall-btn-hover color-3"  onclick="challengeMake()" >ENTER</button>
	 </div>
 
 </div>
 
 

<script>
var sel_file;

$(document).ready(function() {
    $("#challImg").on("change", handleImgFileSelect);
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
            $("#bookImg").attr("src", e.target.result);
        }
        reader.readAsDataURL(f);
    });
}

</script>