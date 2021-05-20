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

<script>
//_endDateTd 선택요일 td숨기기
$(document).ready(function(){
	$("#_endDateTd").hide();	
});
	

</script>
<!-- 해당 페이지의 css -->
<link rel="stylesheet" href="./css/challengeMake.css" />
	
 <div class="container">
	 <header class="challengeHeader">
	 		<img class="userWrap" src="https://th.bing.com/th/id/OIP.wTFsSYLWKoHwmv9OOZIp9wHaHa?pid=ImgDet&w=500&h=500&rs=1">
	 	<h4>LimonLimeL 님,</h4>
	 	<p>관심있는 주제로 챌린지를 생성해 보세요.</p>
	 </header>

	 <div class="">
	 	<form action="" id="challengefrm">
	 	<div class="row challengeMain">
	 		<div class="col-sm-4 pt-5 pl-5">
	 		
	              <label for="newImg">
		               
		                  <img id="challImg" class="img-responsive challImg" src="./image/noneImage.svg">
		               
		            </label>
		            <input type="file" name="challengephoto" id="newImg" style="display: none">
	            <p style="color:#777777;font-size: 9pt">새로 생성하는 챌린지의 이미지를 등록해주세요.</p>		
	 			
	 		</div>
	 		<div class="col-sm-8 challData p-5">
	 			<table class="table-borderless table-responsive challTable">
	 				<col width="200px"><col width="400px">	 				
	 				<tr>
	 					<td>
		 					<label for="category">주제</label>
		 					<select class="form-control form-control-sm" name="category" id="_category" onchange="categoryChange(this)">
		 						<option>선택하세요</option>
		 						<option value="1">건강</option>
		 						<option value="2">역량</option>
		 						<option value="3">정서</option>
		 						<option value="4">자산</option>
		 						<option value="5">생활</option>
		 						<option value="6">취미</option>
		 					</select>
	 					</td>
	 				</tr>
	 				<tr>
	 					<td>
	 						<label for="startDate">챌린지 시작일</label>
	 						<select class="form-control form-control-sm challSelect" name="challengestart" id="_challengestart">
	 						<%for(int i=day;i<day+5;i++){ %>
		 						<option value="<%=year+"-"+month+"-"+day%>"><%=month %>월 <%=i %>일</option>
		 					<%} %>
		 					</select>
	 					</td>
	 					<td class="challSelect2">
	 						<label for="endDate">챌린지 기간</label>
	 						<select class="form-control form-control-sm challSelect2" name="challengeperiod" id="_challengeperiod">
	 						<%for(int i=1;i<5;i++){ %>
		 						<option><%=i%>주</option>
		 					<%} %>
		 					</select>
	 					</td>
	 				</tr>
	 				<tr>
	 					<td>
	 						<label for=frequency">인증 빈도</label>
	 						<select class="form-control form-control-sm challSelect" id="_challengefrequency" name="challengefrequency">
	 							<option value="9">월-일 매일 인증하기</option>
	 							<option value="8">월-금 매일 인증하기</option>
	 							<option value="7">토-일 매일 인증하기</option>
	 						<%for(int i=6;i>0;i--){ %>
		 						<option  value="<%=i%>">주 <%=i%>일 인증하기</option>
		 					<%} %>
		 					</select>
	 					</td>
	 					<td class="challSelect2" id="_endDateTd">
	 						<label for="endDate">선택 요일</label><br>
	 						<div class="challSelect2">
	 							<%String dateWeek[] = new String[]{"일", "월", "화", "수", "목", "금", "토"}; 
	 						 	for(int i=0; i<dateWeek.length;i++){ %>
 	 							    <input type="checkbox" name="frequencyDay" value="<%=i+1%>"><span style="color: #777777;margin-left: 3px;margin-right: 6px"><%=dateWeek[i] %></span> 
	 							<%}%>					 			
							 </div> 		
	 					</td>
	 				</tr>
	 				
	 				<tr>
	 					<td>
	 						<label for="identifyTime">인증시간</label>
	 						<select class="form-control form-control-sm" name="identifytime" id="_identifytime">
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
//이미지 미리보기
var sel_file;

$(document).ready(function() {
    $("#newImg").on("change", handleImgFileSelect);
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
            $("#challImg").attr("src", e.target.result);
        }
        reader.readAsDataURL(f);
    });
}


//카테고리 비 선택 시 제어
function categoryChange(sel){
	var category = $("select[name=category]").val();
	if (category==null){
		alert("카테고리를 선택해 주세요");
		return false;
	}
}


	
function challengeMake(){
	
	var params = $("#challengeFrm").serialize();
		
	$.ajax({
		url:"challengeInsert.do",
		type:"post", 
		data:params,
		success:function(msg){
			alert(msg);
		},
		error:function(){
			alert("error");
		}
		
	});
}	
</script>