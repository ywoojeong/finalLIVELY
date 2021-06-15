<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<link rel="stylesheet" href="./css/managerPage.css" />
<link rel="stylesheet" href="./css/main.css" />

<link rel="stylesheet" type="text/css" href="./css/jquery.datetimepicker.css"/ >
<script src="./js/jquery.datetimepicker.full.min.js"></script>

<div class="container-fluid">
<div class="row">
    <div class="tab col-sm-3 col-xs-1" id="sidebar">
        <div class="nav nav-tab list-group" style="width: 318px; height:277vh;margin-top:58px; background-color:#60bfa4;">
        	<div class="mtop" style="margin-top: 46px;">
        	<h1 style="text-align: center; color: white">ADMIN님</h1>
        	</div>
        	<hr style="">
            <a href="#menu1" class="list-group-item" data-toggle="tab">
                <span class="hidden-sm-down">전체</span> 
            </a>
            <a href="#menu2" class="list-group-item" data-toggle="tab">
                <span class="hidden-sm-down">회원관리</span> 
            </a>
            <a href="#menu3" class="list-group-item" data-toggle="tab">
                <span class="hidden-sm-down">챌린지관리</span> 
            </a>
            <a href="#menu4" class="list-group-item" data-toggle="tab">
                <span class="hidden-sm-down">test</span> 
            </a>
        </div>
    </div>
    
    
    <div class="tab-content col-sm-9 col-xs-1" id="sidebar" style="margin-top: 185px; ">
    	<div id="menu1" class="tab-pane fade">
    		<p>네 제가 피태그인데여</p>
    	</div>
    	
    	<div id="menu2" class="tab-pane fade">
    		<div class="row">
    			<div class="col-sm-12" style="display: flex; flex-direction: column; align-items: center; margin-left: -50px;">
    				<p>네 제가 두번째 탭인데요 회원관리 담당이에요</p>
    				<div class="searchArea" style="width: 100%;">
						<div class="md-form md-outline d-flex Search" align="right" style="margin-left: 93px;">
                           	<select class="form-control form-control-sm" name="categorys" id="categorys" style="margin-right: 15px; height: auto; width: 131px; margin-left: 3px;">
		 						<option value="0">전체</option>
		 						<option value="1">닉네임</option>
		 						<option value="2">이메일</option>
	 						</select>
	 						<div class="searchBox" style="height: 100%;">
                            <input type="text" class="form-control input-Search" id="searchs" placeholder="검색하세요" name="search" style="width: 378px;">
                           	</div>
                           	<button type="button" class="memSearchBtn" id="memSearchBtn" style="margin-left: 15px;">SEARCH</button>
						</div>
    				</div>
    			</div>
    			<div class="row" style="margin: 15px auto 30px auto;">
    				<div class="col-xs-12 col-sm-4">
    					<div class="card" style="width: 250px; height: 400px;">
							<div class="daily_card">
							<img class="card-img-top" src="https://www.w3schools.com/bootstrap4/img_avatar1.png" alt="Card image" style="width:100%">
								<div class="card-body">
								<p class="card-title"> 닉네임 </p>
								<p class="card-text"><span class="category4">메일</span><span class="category5">  </span><span class="category6"></span></p>
								</div>   
							</div>   
						</div>
    				</div>
    			</div>
    		</div>
    	</div>
    	
    	<div id="menu3" class="tab-pane active">
    		<div class="row">
    			<div class="col-sm-12" style="display: flex; flex-direction: column; align-items: center; margin-left: -25px;">
    				<div class="tableBox" style="width: 775px; margin-left: -26px;">
	                <table class="table table-bordered" style="margin-bottom: 0.4rem; margin-top: 0.3rem;">
					  <thead>
					  </thead>
					  <tbody>
					    <tr>
					      <td class="td1">시작날짜</td>
					      <td colspan="2">
							<input class="datestart" id="datestart" type="text" >
					      </td>
					    </tr>
					    <tr>
					      <td class="td1">종료날짜</td>
					      <td colspan="2">
							<input class="dateend" id="dateend" type="text" >
					      </td>
					    </tr>
					    <tr>
					      <td class="td1">카테고리</td>
					      <td colspan="2">
							<select class="selectpicker" data-style="btn-inverse" name="category" id="category">
							    <option value="0">선택하세요</option>
							    <option value="1">건강</option>
							    <option value="2">역량</option>
							    <option value="3">정서</option>
							    <option value="4">자산</option>
							    <option value="5">생활</option>
							    <option value="6">취미</option>
							</select>
					      </td>
					    </tr>
					    
					  </tbody>
					</table>
		            </div>
		            
					<div class="searchBox2" style="display: flex; margin-left: 86px;">
						<input type="search2" class="form-control form-control" name="mSearch" id="mSearch" 
							style="border-radius: 0rem; width: 612px; margin-left: -114px;" placeholder="검색어를 입력하세요">
	                <button type="button" class="searchBtn" id="searchBtn" style="margin-left: 10px;">SEARCH</button>
						</div>
    				
		    		<!-- 탭위치 -->
		            <div class="row">
		                <div class="col-sm-12" style="margin-top: 27px;">
		                    <!-- 카드 위치 -->
		                    <div class="diy">
		                        <div class="sub_tab"> 탭 위치카테고리 개설일 시작일 종료일</div>
		                        <div class="challbox">
									<!-- 챌린지 보이는곳 -->
		                        </div>
		                        
		                        <!-- 페이징 처리 되는 곳 -->
								<div class="challPage">
									<ul class="challPageUl" id="challPageUl"></ul>
								</div>
		                        
		                    </div>
		
		                </div>
		            </div>
    			
    			</div>
    		</div>
    	</div>
    	
    	<div id="menu4" class="tab-pane fade">
    		<div class="row">
    			<div class="col-sm-12" style="display: flex; flex-direction: column; align-items: center;">
    				<p>네 저는 테스트에요</p>
    			</div>
    		</div>
    	</div>
    </div>
</div>
</div>




<script>
//카테고리 변환 
function setCategory(category){
	console.log("category ===>"+category)
	var categoryName = ""
	if(category ==1){
		categoryName = "건강";
     }else if(category ==2){
    	 categoryName = "역량";
     }else if(category ==3){
    	 categoryName = "정서";
     }else if(category ==4){
    	 categoryName = "자산";
     }else if(category ==5){
    	 categoryName = "생활";
     }else if(category ==6){
    	 categoryName = "취미";
     }
	return categoryName;
}
</script>

<script>
// 챌린지 총 수 가져오기 등등
managerList(1);

//검색 시

$('#searchBtn').click(function(){
	managerList(1);
	$('#mSearch').val("");
});

function managerList(now){
	console.log("managerListmanagerListmanagerList")
	console.log(now)
	console.log($("#datestart").val())
	console.log($("#dateend").val())
	$.ajax({
		url:"./managerList.do",
		type:"POST",
		data: {page:now, 'mSearch':$("#mSearch").val(), 'category':$("#category").val(), 'datestart':$("#datestart").val(), 'dateend':$("#dateend").val()},
		success:function(list){
//			alert("리스트 불러오는");
			console.log(list)
			var total = list[0].TOTALCNT
			console.log("토탈 값 보여줘")
			console.log(total)
			var data = "";
	    	for(var i=0; i<list.length; i++){
	    	var categoryName = setCategory(list[i].CATEGORY);
	    	console.log("category ==>"+categoryName)
	    	// 검색어가 있을때 없을때 제어해주기	
	    	data += "<div class='mainBox'>"
	            +	"<div class='main_text main_common'>"
	            +	"<div class='mainInfo'>"
	            +	"<span class='challDataCard-category' title='카테고리'>"+categoryName+" | </span>"
	            +	"<span class='challDataCard-sdate' title='시작일'>"+list[i].CHALLENGESTART+" ~ </span>"
	            +	"<span class='challDataCard-startdate' title='종료일'>"+list[i].CHALLENGEEND+" | </span>"
	            +	"<span class='challDataCard-enddate' title='개설일'>"+list[i].CHALLENGESDATE+"</span>"
	            +	"</div>"
	            +	"<div class='mainTitle'>"
	            +	"<p class='challDataCard-title'>"+list[i].CHALLENGETITLE+"</p>"
	            +	"</div> </div>"
	            +	"<div class='main_btn main_common btns'>"
	            +	"<button type='button' class='challStopBtn' id='stopBtn'>정지</button>"
	            +	"<button type='button' class='challPlayBtn' id='startBtn'>해제</button>"
	            +	"</div> </div>";
        		// 댓글 쓸때 seq를 modal로 보내줌
//        		$('#suggestSeq').val(list[i].SUGGESTBBSSEQ);

	    	}
	    	mListPaging(total,now)
	    	$(".challbox").html(data);
		},
		error:function(){
	           alert("리스트 불러오는 error");
		   	}
	});
}

//페이지 처리
function mListPaging(total,now){
	console.log("mListPaging total",total)
	console.log("mListPaging now",now)
	var pagecnt = Math.ceil(total/5.0)
	var startCnt = Math.floor((now-1)/5) * 5 + 1
	//전체 페이지
	var pageBlock = Math.ceil(pagecnt/5)
	var nowBlock = Math.ceil(now/5)
	console.log("pagecnt",pagecnt)
	console.log("startCnt",startCnt)
	console.log(total,pagecnt)
	console.log("pageBlock",pageBlock)
	console.log("nowBlock",nowBlock)
	var nowTotal = nowBlock*5
	if(nowTotal > pagecnt){
		nowTotal = pagecnt
	}
	var html = ""
	if(pageBlock > 1 && nowBlock > 1){
		html += "<li  onclick='managerList("+(nowBlock*5-9)+")'> &laquo;</li>"
	}
	for(var i=startCnt;i<=nowTotal;i++){
		if(now == i){
			html += "<li class='nowpage' style='color:#56b397' onclick='managerList("+i+")'>"+i+"</li>"
		}else{
			html += "<li onclick='managerList("+i+")'>"+i+"</li>"
		}
		
	}
	
	if(pageBlock > 1 && nowBlock < pageBlock){
		html += "<li onclick='managerList("+(nowBlock*5+1)+")'>&raquo;</li>"
	}
	console.log(html)
	$(".challPageUl").html(html);
//	document.getElementById('sugPageUl').innerHTML = html
}
</script>
<script>
jQuery('#datestart').datetimepicker();
jQuery('#dateend').datetimepicker();
</script>