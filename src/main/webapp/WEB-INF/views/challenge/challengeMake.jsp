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
<!-- ${member.nickname} -->
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
DateFormat dateVal = new SimpleDateFormat("yyyy-MM-dd");
//dateVal.format(cal.getTime());
System.out.println(dateVal.format(cal.getTime()));

%>

<script>
//_endDateTd 선택요일 td숨기기
$(document).ready(function(){
	$("#_endDateTd").hide();	
	$("#periodText").hide();
});
	

</script>
<!-- 해당 페이지의 css -->
<link rel="stylesheet" href="./css/challengeMake.css" />
	
 <div class="container">
	 <header class="challengeHeader">
	 		<img class="userWrap" src="https://th.bing.com/th/id/OIP.wTFsSYLWKoHwmv9OOZIp9wHaHa?pid=ImgDet&w=500&h=500&rs=1">
	 	<h4>${memberInfo.nickname} 님,</h4>
	 	<p>관심있는 주제로 챌린지를 생성해 보세요.</p>
	 </header>

	 <div class="">
	 	<form  id="challengeFrm" enctype="multipart/form-data">
	 		<input type="hidden" name="email" value="${memberInfo.email}">
	 	<div class="row challengeMain">
	 		<div class="col-sm-4 pt-5 pl-5" style="text-align: center">
	 		
	              <label for="newImg">
		                  <img id="chall_Img" class="img-responsive challImg"  style="opacity: 0.8;" src="./image/noneImage.jpg">
		            </label>
		            <input type="file" name="uploadFile" id="newImg" style="display: none" onerror="this.src='./image/noneImage.jpg'">
		            <p style="font-size: 10pt; color:#b8b8b8;font-weight: 600">이미지가 없으면 기본 이미지로 들어갑니다.</p>	 			
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
	 						<p class="periodTe"></p>
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
	 						<input type="hidden" name="challengeend" id="_endDate" value="">
	 						<label for="endDate">챌린지 기간</label>
	 						<select class="form-control form-control-sm challSelect2" name="challengeperiod" id="_challengeperiod" onchange="challengeperiodChange(this.value)">
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
	 						<select class="form-control form-control-sm challSelect" id="_identifyfrequency" name="identifyfrequency" onchange="challengeFreChange(this.value)">
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
 	 							    <input type="checkbox" id="_dateWeek" name="dateWeek" value="<%=i+1%>"><span style="color: #777777;margin-left: 3px;margin-right: 6px"><%=dateWeek[i] %></span> 
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
	 					<td>
	 						<label for="certifyPhoto">인증 방법(선택)</label>
	 						<label for="newImg2">
		                  <img id="chall_Img2" class="img-responsive challImg2"  style="opacity: 0.8;" src="./image/certifyNone.jpg">
				            </label>
				          <input type="file" name="uploadFileCer" id="newImg2" style="display: none">
	 					</td>
	 					<td>
	 						<textarea class="form-control form-control-sm" placeholder="인증방법을 작성해 주세요" name="certify" id="_certify" style=" margin: 20px 0 0 35px;height: 149px;width: 360px;;"></textarea>
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
            $("#chall_Img").attr("src", e.target.result);
        }
        reader.readAsDataURL(f);
    });
}
</script>
<script>
var sel_file1;

$(document).ready(function() {
    $("#newImg2").on("change", handleImgFileSelect1);
}); 


function handleImgFileSelect1(e) {
    var files1 = e.target.files;
    var filesArr1 = Array.prototype.slice.call(files1);

    filesArr1.forEach(function(f1) {
        if(!f1.type.match("image.*")) {
            alert("확장자는 이미지 확장자만 가능합니다.");
            return;
        }

        sel_file2 = f1;

        var reader1 = new FileReader();
        reader1.onload = function(e) {
            $("#chall_Img2").attr("src", e.target.result);
        }
        reader1.readAsDataURL(f1);
    });
}
</script>

<script>
//onchange 인증빈도 제어
function challengeFreChange(val){
 	$("input:checkbox[name='dateWeek']").attr('checked', false);
	if(val>=1 && val<=6){
		$("#_endDateTd").show();
	}else{
		$("#_endDateTd").hide();
		if(val==9){ //월-일
			$("input:checkbox[name='dateWeek']").attr('checked', true);
			
		}else if(val==8){ 	//월-금
			for(var i=1;i<6;i++){
				//$("input:checkbox[id='_dayWeek"+i+"']").attr('checked', true);
				$("input:checkbox[name='dateWeek']:nth-of-type(-n+6)").attr('checked', true);
				$("input:checkbox[name='dateWeek']:nth-of-type(1)").attr('checked', false);
			}
		}else if(val==7){	//토일
			$("input:checkbox[name='dateWeek']:nth-of-type(1)").attr('checked', true);
			$("input:checkbox[name='dateWeek']:nth-of-type(7)").attr('checked', true);
		}
	}
}



//date 2021-05-23형식으로 바꾸기(문자열)
function dateToYear(date) {
    var year = date.getFullYear();

    var month = date.getMonth()+1;
    if (month < 10)  {
        month = '0' + month;
    }

    var date = date.getDate();
    if (date < 10) {
        date = '0' + date;
    }
    
    return year + '-' + month + '-' + date;
}



//챌린지 기간 계산 _challengeperiod challperiodChange
function challengeperiodChange(period){
	//챌린지 시작일
	var startDay =  $("select[name=challengestart]").val();
	if(startDay==null||startDay==0){	//_challengeperiod
		alert("챌린지 시작일을 선택해 주세요.");
		$('#_challengeperiod').prop('selectedIndex',0);
		return false;
	}else{
		//console.log(startDay)
		const strArr = startDay.split('-');
		const sDate = new Date(strArr[0], strArr[1]-1, strArr[2]);
		//console.log(sDate)
		//alert("시작 날짜:"+sDate);
		//alert(a+7  + "sDate.getDate()");
		//alert(typeof(sDate.getDate()));
		var endDate = "";	
		if(period==1){
			endDate = sDate.setDate(sDate.getDate()+6);//new Date(strArr[0], strArr[1]-1, (strArr[2]+7));
			endDate = new Date(endDate)
		}
		else if(period==2){
			endDate = sDate.setDate(sDate.getDate()+13);//new Date(strArr[0], strArr[1]-1, (strArr[2]+7));
			endDate = new Date(endDate)
		}
		else if(period==3){
			endDate = sDate.setDate(sDate.getDate()+20);//new Date(strArr[0], strArr[1]-1, (strArr[2]+7));
			endDate = new Date(endDate)
		}
		else if(period==4){
			endDate = sDate.setDate(sDate.getDate()+27);//new Date(strArr[0], strArr[1]-1, (strArr[2]+7));
			endDate = new Date(endDate)
		}
		
		$("#_endDate").val(dateToYear(endDate));
		//alert("종료 날짜"+dateToYear(endDate));	
		document.getElementById('periodText').innerHTML="<p class='periodTe'>챌린지 기간은 "+startDay+"부터 "+dateToYear(endDate)+"까지 입니다.</p>";
		$("#periodText").show();
	}	
}


//챌린지 만들기 버튼(enter) 제어
function challengeMake(){

	//카테고리 비 선택 시 제어
	var category = $("select[name=category]").val();
	//alert(category);
	if (category==0 || category==null){
		alert("주제를 선택해 주세요");
		return false;
	}
	
	//챌린지 시작일 비 선택 시 제어
	var challengestart = $("select[name=challengestart]").val();
	//alert(challengestart);
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
	var identifyfrequency = $("select[name=identifyfrequency]").val();
	console.log("오긴 하냐?"+identifyfrequency)
	if (identifyfrequency==0 || identifyfrequency==null){
		alert("인증 빈도를 선택해 주세요");
		return false;
	}else if(identifyfrequency<=6 && identifyfrequency>=1){
		console.log("인증빈도 얼만데 이자식아"+identifyfrequency)
		let checkLen = $("input:checkbox[name=dateWeek]:checked").length;
		console.log("몇개 선택인지 당장말해"+checkLen)		
			if(checkLen!=identifyfrequency){
				alert("인증빈도에 맞는 요일을 선택해 주세요.("+identifyfrequency+"일까지 선택 가능)");
				return false;
		
		}
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
			 $("#_pointcount").val("");
			pointcount.focus();
			return false;
		}
	}
	
	//챌린지 제목 비 기입 시 제어
	var challengetitle = $("#_challengetitle").val();
	if(challengetitle==null || challengetitle==""){
		alert("챌린지 제목을 기입해 주세요.");
		$("#_challengetitle").focus();
		return false;
	}
	
	//챌린지 소개 비 기입 시 제어
	if($("#_challengetext").val()==null || $("#_challengetext").val()==""){
		alert("간단한 챌린지 소개글을 적어주세요.");
		return false;
	}
	
// 	//챌린지 이미지 비 선택시 제어(대체 이미지 넣기)
// 	if ($('input[name="uploadFile"]').get(0).files[0] == undefined) {
// 		alert("챌린지 이미지를 생성해 주세요.");
// 		return false;
// 	}
	
	//데이터 보내기		
	let params = new FormData($("#challengeFrm")[0]);
	//alert(params);
	params.append('uploadFile', $('input[name="uploadFile"]').get(0).files[0]);
	params.append('uploadFileCer', $('input[name="uploadFileCer"]').get(0).files[0]);
	//input file추가
	//alert(params);
	
	$.ajax({
		url:"challengeInsert.do",
		type:"post", 
		data:params,
		enctype:"multipart/form-data",	//파일업로드 설정데이터, 인코딩
		processData:false,
		contentType:false,
		cache:false,	//파일 새고고침 시 저장할 것이냐(아니오)
		success:function(msg){
			//alert(msg);
			if(msg=="SUCCESS"){
				alert("챌린지가 생성되었습니다.");
				location.href="newChallenge.do";
			}else{
				alert("챌린지를 다시 생성해 주세요.");
				location.href="challengeMake.do";
			}
		},
		error:function(){
			alert("error");
		}
		
	});
}	
</script>