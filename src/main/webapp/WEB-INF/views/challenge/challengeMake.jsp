<%@page import="javafx.scene.input.DataFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.a.util.dataUtil"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


 <!-- core tag -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!-- format 사용시 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 현재 시간 받아오기 -->
<%-- <jsp:useBean id="now" class="java.util.Date" /> --%>
 <c:set var = "now" value = "<%= new java.util.Date()%>" />
<%-- <fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /> --%>
<fmt:formatDate var="dateText" value="${now}" pattern="MM월 dd일"/>
<fmt:formatDate var="dateVal" pattern="yyyyMMdd"  value="${now}"/>

<%-- <c:out value="${i }" val="date1"/> --%>

<%
Calendar cal = Calendar.getInstance();
System.out.println(cal);

int year=cal.get(Calendar.YEAR); //년
int month=cal.get(Calendar.MONTH )+1;//월
int day=cal.get(Calendar.DATE);//일
int hour=cal.get(Calendar.HOUR_OF_DAY);//24시
int min=cal.get(Calendar.MINUTE);//분

//오늘날짜5월 21일
cal.setTime(new Date());
DateFormat dateText = new SimpleDateFormat("MM월 dd일");
//dateText.format(cal.getTime());
System.out.println(dateText.format(cal.getTime()));
DateFormat dateVal = new SimpleDateFormat("yyyyMMdd");
//dateVal.format(cal.getTime());
System.out.println(dateVal.format(cal.getTime()));

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
	 	<h4>${member.nickname}LimonLimeL 님,</h4>
	 	<p>관심있는 주제로 챌린지를 생성해 보세요.</p>
	 </header>

	 <div class="">
	 	<form  id="challengeFrm">
	 		<input type="hidden" name="email" value="">
	 	<div class="row challengeMain">
	 		<div class="col-sm-4 pt-5 pl-5" style="text-align: center">
	 		
	              <label for="newImg">
		               
		                  <img id="challImg" class="img-responsive challImg"  style="opacity: 0.8;" src="./image/noneImage.png">
		               
		            </label>
		            <input type="file" name="challengephoto" id="newImg" style="display: none">	 			
	 		</div>
	 		<div class="col-sm-8 challData p-5"> 
	 			<table class="table-borderless table-responsive challTable">
	 				<col width="200px"><col width="400px">	 				
	 				<tr>
	 					<td>
		 					<label for="category">주제</label>
		 					<select class="form-control form-control-sm" name="category" id="_category">
		 						<option value="0">선택하세요</option>
		 						<option value="1">건강</option>
		 						<option value="2">역량</option>
		 						<option value="3">정서</option>
		 						<option value="4">자산</option>
		 						<option value="5">생활</option>
		 						<option value="6">취미</option>
		 					</select>
	 					</td>
	 					<td id="periodText">
	 						<p class="periodTe">챌린지 기간은 2021-05-01부터 2021-05-03까지 입니다.</p>
	 					</td>
	 				</tr>
	 				<tr>
	 					<td>
	 						<label for="startDate">챌린지 시작일</label>
	 						<select class="form-control form-control-sm challSelect" name="challengestart" id="_challengestart">
	 							<option value="0">선택하세요</option>
	 							<option value="<%=dateVal.format(cal.getTime())%>"><%=dateText.format(cal.getTime())%></option>
	 							<% int w = 0;
	 								while(w<4){ 
	 								cal.add(Calendar.DAY_OF_YEAR, 1);
	 							%>
		 						<option value="<%=dateVal.format(cal.getTime())%>"><%=dateText.format(cal.getTime())%></option>
			 					<% w++;
			 					} %>
		 					</select>
	 					</td>
	 					<td class="challSelect2">
	 						<label for="endDate">챌린지 기간</label>
	 						<select class="form-control form-control-sm challSelect2" name="challengeperiod" id="_challengeperiod" onchange="challperiodChange(this.value)">
	 							<option value="0">선택하세요</option>
	 						<%for(int i=1;i<5;i++){ %>
		 						<option value="<%=i%>"><%=i%>주</option>
		 					<%} %>
		 					</select>
	 					</td>
	 				</tr>
	 				<tr>
	 					<td>
	 						<label for="frequency">인증 빈도</label>
	 						<select class="form-control form-control-sm challSelect" id="_challengefrequency" name="challengefrequency" onchange="challengeFreChange(this.value)">
	 							<option value="0">선택하세요</option>
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
 	 							    <input type="checkbox" name="dateWeek" value="<%=i+1%>"><span style="color: #777777;margin-left: 3px;margin-right: 6px"><%=dateWeek[i] %></span> 
	 							<%}%>					 			
							 </div> 		
	 					</td>
	 				</tr>
	 				
	 				<tr>
	 					<td>
	 						<label for="identifyTime">인증시간</label>
	 						<select class="form-control form-control-sm" name="identifytime" id="_identifytime">
	 								<option value="">선택하세요</option>
	 							<%for(int i=0;i<24;i++){
	 								%>
	 								<option value="<%=i%>"><%=dataUtil.two(i+"")%>시</option>
	 							<%} %>
	 						</select>
	 					</td>
	 					<td class="challSelect2">
	 						<label for="pointCount">참가 포인트</label>
	 						<div class="form-inline">
	 							<input type="text" class="form-control form-control-sm" id="_pointcount" name="pointcount" style="width: 200px"><span>&nbsp;&nbsp;point</span>
	 						</div>
	 					</td>
	 				</tr>
	 				<tr>
	 					<td colspan="2">
	 						<label for="challengeTitle">챌린지 제목</label>
	 						<input type="text" class="form-control form-control-sm" placeholder="챌린지 제목을 작성해주세요" name="challengetitle" id="_challengetitle">
	 					</td>
	 				</tr>
	 				<tr >
	 					<td colspan="2" class="content">
	 						<label for="challengeContent">챌린지 소개</label>
	 						<textarea rows="8" class="form-control form-control-sm" placeholder="챌린지를 소개해주세요" name="challengetext" id="_challengetext"></textarea>
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

//onchange 인증빈도
function challengeFreChange(val){
	if(val>=1 && val<=6){
		$("#_endDateTd").show();
		
		//숫자별 제어하기
	}else{
		$("#_endDateTd").hide();
	}
}

//챌린지 기간 계산 _challengeperiod challperiodChange
function challperiodChange(val){
	//alert(val);	
	if(val == 1){
		//_challengestart 챌린지 시작일 데이터 받아와서 계산
	}
	
}





function challengeMake(){
	
	//챌린지 이미지 비 선택시 제어(대체 이미지 넣기)
	
	//카테고리 비 선택 시 제어
	var category = $("select[name=category]").val();
	//alert(category);
	if (category==0 || category==null){
		alert("주제를 선택해 주세요");
		return false;
	}
	
	//챌린지 시작일 비 선택 시 제어
	var challengestart = $("select[name=challengestart]").val();
	alert(challengestart);
	if (challengestart==0 || challengestart==null){
		alert("챌린지 시작일을 선택해 주세요");
		return false;
	}
	
	//챌린지 기간 비 선택 시 제어(challengeperiod)
	var challengeperiod = $("select[name=challengeperiod]").val();
	//alert(challengeperiod);
	if (challengeperiod==0 || challengeperiod==null){
		alert("챌린지 기간을 선택해 주세요");
		return false;
	}
	
	
	//인증빈도 비 선택 시 제어
	var challengefrequency = $("select[name=challengefrequency]").val();
	//alert(challengefrequency);
	if (challengefrequency==0 || challengefrequency==null){
		alert("인증 빈도를 선택해 주세요");
		return false;
	}
	

	//인증시간 비 선택 시 제어 identifyTime
	var identifytime = $("select[name=identifytime]").val();
	//alert(identifytime);
	if (identifytime=="" || identifytime==null){
		alert("인증 시간을 선택해 주세요");
		return false;
	}
	
	//참가포인트 비 선택 시 제어 _pointcount
	var pointcount = $("#_pointcount").val();
	//alert(pointcount);
	if( pointcount == "" ){
		alert ( "참가 포인트를 입력해주세요");
		$("#_pointcount").focus();
    	return false;
	}
	else{
		var num_check=/^[0-9]*$/;
		if(!num_check.test(pointcount)){
			alert ( "숫자만 입력할 수 있습니다." );
			pointcount="";
			pointcount.focus();
		}
	}

	
	//챌린지 제목 비 기입 시 제어
	var challengetitle = $("#_challengetitle").val();
	if(challengetitle==null || challengetitle==""){
		alert("챌린지 제목을 기입해 주세요.");
		$("#_challengetitle").focus();
	}
	
	//챌린지 소개 비 기입 시 제어
	var challengetext = $("#_challengetext").val();
	if(challengetext==null || challengetext==""){
		challengetext = "챌린지를 소개합니다.";
	}
	

	//데이터 보내기	
	var params = $("#challengeFrm").serialize();
		alert(params);
	$.ajax({
		url:"challengeInsert.do",
		type:"post", 
		data:params,
		contentType:'application/x-www-form-urlencoded; charset=UTF-8',
		dataType:'html',
		success:function(msg){
			alert(msg);
		},
		error:function(){
			alert("error");
		}
		
	});
}	
</script>