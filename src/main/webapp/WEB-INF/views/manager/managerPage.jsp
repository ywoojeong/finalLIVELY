<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<link rel="stylesheet" href="./css/managerPage.css" />
<link rel="stylesheet" href="./css/main.css" />

<link rel="stylesheet" type="text/css" href="./css/jquery.datetimepicker.css"/ >


<style>
.list-group{
   border-radius: 0;
}

.list-group-item {
    padding: .75rem 3.0rem;
    letter-spacing: 3px;
    font-size: 13pt;  
    width:100%;
    color: white;
    font-weight: 400;
}

.list-group-item.active {
    z-index: 2;
    color: #000;
/*     background-color: #60bfa4; */
     text-decoration: none; 
    font-weight: 400;
    /* border-color: #007bff; */
    background-color: white;
}
.list-group-item:hover {
    color: #000;
    font-weight: 400;
     text-decoration: none; 
      background-color: white;
}
</style>
<script>
console.log("받아오는지 확인하자 || allCount ${allCount} || challengeMonth ${challengeMonth} || userMonth ${userMonth['6']}  || ${memberData}")

</script>
<div class="container-fluid"> 
<div class="row" style="background-color: rgb(238,238, 238);">
    <div class="tab col-sm-2 col-xs-1" id="sidebar" style="padding: 0">
        <div class="nav nav-tab list-group" style="width: 100%; height:100%;padding-top:58px; background-color:#60bfa4;box-shadow: 1px 1px 8px 5px rgb(0 0 0 / 10%);">
        	<div class="mtop" style="margin-top: 46px;">
        	<h1 style="text-align: center; color: white;font-size: 27pt">${memberData.NICKNAME }님</h1>
        	</div>

             <a href="#menu1" class="list-group-item active" data-toggle="tab">
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
    
    
    <div class="tab-content col-sm-10 col-xs-1" id="sidebar">

    	<div id="menu1" class="tab-pane active" style="padding-top: 58px;">
			<div class="row" style="">
				<!-- 챌린지 상단 -->
				<div class="col-sm-6">
					<div style="text-align:center;width: 450px;font-size: 15pt;margin: 20px auto;font-weight: 600;border-bottom: 3px solid rgba(0,0,0,0.7);color: rgba(0,0,0,0.7)">
						LIVELY에 가입한 전체 회원 수는 <span style="font-size: 23pt;font-weight: 700">${allCount.userall }</span>명입니다
					</div>
				</div>
				<div class="col-sm-6">
					<div style="text-align:center;width: 520px;font-size: 15pt;margin: 20px 0 20px 93px;font-weight: 600;border-bottom: 3px solid rgba(0,0,0,0.7);color: rgba(0,0,0,0.7)">
						LIVELY에 생성된 전체 CHALLENGE 수는 <span style="font-size: 23pt;font-weight: 700">${allCount.challengeall }</span>개 입니다
					</div>
				</div>
				<!-- 챌린지 데이터 -->
				<div class="col-sm-12" style="padding:10px 10px 6px 3px;width: 100%;margin: 20px auto;background-color: white;font-weight: 700px;background-color: rgba(96,191,164, 0.3)">
					<h1 style="padding-left: 30px;font-weight: 700;font-family: 'Raleway', sans-serif;">CHALLENGE</h1>
				</div>
				<div class="col-sm-6">
					<div style="width: 700px;margin: 30px;background-color: white;box-shadow: 0 1px 9px 3px rgba(0,0,0, 0.1);border-radius: .35rem;">
						<div style="padding: .75rem 1.25rem;margin-bottom: 0;background-color: rgba(96,191,164, 0.1);border-bottom: 1px solid #e3e6f0;color:#5dbaa0;border-top-left-radius:.35rem;border-top-right-radius:.35rem;font-weight: 600">
							월별 챌린지 생성 개수
						</div>
						<div style="padding: 30px">
							<canvas id="challengeAdd"></canvas>
						</div>
					</div>
				</div>	
				
				<div class="col-sm-6">
					<div style="width: 700px;margin: 30px 0;background-color: white;box-shadow: 0 1px 9px 3px rgba(0,0,0, 0.1);border-radius: .35rem;">
							<div style="padding: .75rem 1.25rem;margin-bottom: 0;background-color: rgba(96,191,164, 0.1);border-bottom: 1px solid #e3e6f0;color:#5dbaa0;border-top-left-radius:.35rem;border-top-right-radius:.35rem;font-weight: 600">
								카테고리별 챌린지
							</div>
						<div style="display: flex">
							<div style="width: 380px;padding: 30px">
								<canvas id="challengeCategory"></canvas>
							</div>
							<div style="margin: 64px 0 0 42px">
								<table class="categoryTable">
									<tr>
										<td>
											<div style="width: 50px;height: 12px;background-color:rgb(255, 99, 132);margin-left: 20px"></div>
										</td>
										<td>
											<span style="font-size: 10pt;font-weight: 500;margin: 0 20px;letter-spacing: 6px;">건   강</span>
										</td>
										<td>
											<span style="margin-right: 20px">${challengeCategory['1'] }</span>
										</td>
									</tr >
									<tr>
										<td>
											<div style="width: 50px;height: 12px;background-color:rgb(255, 159, 64);margin-left: 20px"></div>
										</td>
										<td>
											<span style="font-size: 10pt;font-weight: 500;margin: 0 20px;letter-spacing: 6px;">역    량</span>
										</td>
										<td>
											<span style="margin-right: 20px"> ${challengeCategory['2'] }</span>
										</td>
									</tr>
									<tr>
										<td>
											<div style="width: 50px;height: 12px;background-color:rgb(255, 205, 86);margin-left: 20px"></div>
										</td>
										<td>
											<span style="font-size: 10pt;font-weight: 500;margin: 0 20px;letter-spacing: 6px;">정    서</span>
										</td>
										<td> 
											<span style="margin-right: 20px"> ${challengeCategory['3'] }</span>
										</td>
									</tr >
									<tr >
										<td >
											<div style="width: 50px;height: 12px;background-color:rgb(75, 192, 192);margin-left: 20px"></div>
										</td>
										<td >
											<span style="font-size: 10pt;font-weight: 500;margin: 0 20px;letter-spacing: 6px;">자    산</span>
										</td>
										<td >
											<span style="margin-right: 20px"> ${challengeCategory['4'] }</span>
										</td>
									</tr>
									<tr >
										<td>
											<div style="width: 50px;height: 12px;background-color:rgb(54, 162, 235);margin-left: 20px"></div>
										</td>
										<td >
											<span style="font-size: 10pt;font-weight: 500;margin: 0 20px;letter-spacing: 6px;">생    활</span>
										</td> 
										<td >
 											<span style="margin-right: 20px"> ${challengeCategory['5'] }</span> 
										</td>
									</tr>
									<tr>
										<td>
											<div style="width: 50px;height: 12px;background-color:rgb(153, 102, 255);margin-left: 20px"></div>
										</td>
										<td>
											<span style="font-size: 10pt;font-weight: 500;margin:  0 20px;letter-spacing: 6px;">취    미</span>
										</td>
										<td>
											<span style="margin-right: 20px">${challengeCategory['6'] }</span>
										</td>
									</tr>
									
								</table>
							</div>
						</div>
					</div>
				</div>

				<div class="col-sm-6">
					<div style="width: 700px;margin: 30px;background-color: white;box-shadow: 0 1px 9px 3px rgba(0,0,0, 0.1);border-radius: .35rem;">
						<div style="padding: .75rem 1.25rem;margin-bottom: 0;background-color: rgba(96,191,164, 0.1);border-bottom: 1px solid #e3e6f0;color:#5dbaa0;border-top-left-radius:.35rem;border-top-right-radius:.35rem;font-weight: 600">
							챌린지 가입 수
						</div>
						<div style="padding: 30px">
							<canvas id="challengeMember"></canvas>
						</div>
					</div>
				</div>
				<div class="col-sm-6">
					<div style="width: 700px;margin: 30px 0;background-color: white;box-shadow: 0 1px 9px 3px rgba(0,0,0, 0.1);border-radius: .35rem;">
						<div style="padding: .75rem 1.25rem;margin-bottom: 0;background-color: rgba(96,191,164, 0.1);border-bottom: 1px solid #e3e6f0;color:#5dbaa0;border-top-left-radius:.35rem;border-top-right-radius:.35rem;font-weight: 600">
					   	챌린지 인증률
					   	</div>
					   	<div style="padding: 30px">
							<canvas id="challengeIdentify"></canvas>
						</div>
					</div>
				</div>
				
				<!-- 유저 -->
				
				<div class="col-sm-12" style="padding:10px 10px 6px 3px;width: 100%;margin: 20px auto;background-color: white;font-weight: 700px;background-color: rgba(96,191,164, 0.3)">
					<h1 style="padding-left: 30px;font-weight: 700;font-family: 'Raleway', sans-serif;">MEMBER</h1>
				</div>
				<div class="col-sm-6" >
					<div style="width: 700px;margin: 30px;background-color: white;box-shadow: 0 1px 9px 3px rgba(0,0,0, 0.1);border-radius: .35rem;">
						<div style="padding: .75rem 1.25rem;margin-bottom: 0;background-color: rgba(96,191,164, 0.1);border-bottom: 1px solid #e3e6f0;color:#5dbaa0;border-top-left-radius:.35rem;border-top-right-radius:.35rem;font-weight: 600">
							월별 사용자 가입 수
						</div>
						<div style="padding: 30px">
							<canvas id="userAdd"></canvas>
						</div>
					</div>	
				</div>
				
				<div class="col-sm-6">
					<div style="width: 700px;margin: 30px 0;background-color: white;box-shadow: 0 1px 9px 3px rgba(0,0,0, 0.1);border-radius: .35rem;">
						<div style="padding: .75rem 1.25rem;margin-bottom: 0;background-color: rgba(96,191,164, 0.1);border-bottom: 1px solid #e3e6f0;color:#5dbaa0;border-top-left-radius:.35rem;border-top-right-radius:.35rem;font-weight: 600">
						인증률이 높은 순
						</div>
						<div style="display: flex">
							<div style="width: 380px;padding:30px">
								<canvas id="userIdentify"></canvas>
							</div>
							<div id="userData" style="margin: 64px 0 0 5px">										
							</div>
						</div>

					</div>
				</div>
				
				<div class="col-sm-6">
					<div style="width: 700px;margin: 30px;background-color: white;box-shadow: 0 1px 9px 3px rgba(0,0,0, 0.1);border-radius: .35rem;">
						<div style="padding: .75rem 1.25rem;margin-bottom: 0;background-color: rgba(96,191,164, 0.1);border-bottom: 1px solid #e3e6f0;color:#5dbaa0;border-top-left-radius:.35rem;border-top-right-radius:.35rem;font-weight: 600">
							좋아요 많이 받은 순
						</div>
						<div style="padding: 30px">
							<canvas id="userFollowing"></canvas>
						</div>
					</div>
				</div>
				<div class="col-sm-6">
					<div style="width: 700px;margin: 30px 0 50px 0;background-color: white;box-shadow: 0 1px 9px 3px rgba(0,0,0, 0.1);border-radius: .35rem;">
						<div style="padding: .75rem 1.25rem;margin-bottom: 0;background-color: rgba(96,191,164, 0.1);border-bottom: 1px solid #e3e6f0;color:#5dbaa0;border-top-left-radius:.35rem;border-top-right-radius:.35rem;font-weight: 600">
					 		포인트가 많은 사용자 순
					 	</div>
					 	<div style="padding: 30px">
							<canvas id="userPoint"></canvas>
						</div>
					</div>
				</div>
							
			</div>    		


    	</div>
    	
    	<div id="menu2" class="tab-pane fade" style="min-height: 92vh">
    		<div class="row" style="margin-top: 185px;display: flex;flex-direction: column;align-items: center;">
    			<div class="col-sm-12" style="display: flex; flex-direction: column; align-items: center; margin-left: -50px;">
    				<div class="searchArea" style="width: 100%;">
						<div class="md-form md-outline d-flex Search" align="right">
                           	<select class="form-control form-control-sm" name="categorys" id="categorys" style="margin-right: 15px; height: auto; width: 131px;">
		 						<option value="" selected="selected">선택</option>
		 						<option value="1">닉네임</option>
		 						<option value="2">이메일</option>
	 						</select>
	 						<div class="searchBox" style="height: 100%;">
                            <input type="text" class="form-control input-Search" id="searchs" placeholder="검색하세요" name="searchs" style="width: 378px;" >
                           	</div>
                           	<button type="button" class="memSearchBtn" id="memSearchBtn">SEARCH</button>
						</div>
    				</div>
    			
    					<div class="member_daily">
	  						<div class="row" id="membox" style="width: 925px; margin-top: 86px;">
								<!-- 챌린지 보이는곳 -->
								
	                        </div>
                       </div>
                        
                        <!-- 페이징 처리 되는 곳 -->
						<div class="memPage">
							<ul class="memPageUl" id="memPageUl"></ul>
						</div>
    			</div>	
    		</div>
    	</div>
    	
    	<div id="menu3" class="tab-pane fade"  style="margin-top: 185px; ">
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
    	
    	<div id="menu4" class="tab-pane fade"  style="margin-top: 185px; ">
    		<div class="row">
    			<div class="col-sm-12" style="display: flex; flex-direction: column; align-items: center;">
    				<p>네 저는 테스트에요</p>
    			</div>
    		</div>
    	</div>

    </div>
</div>
</div>


<script src="./js/jquery.datetimepicker.full.min.js"></script>
<!-- 차트.js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>


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
console.log("managerList =>")
			console.log(list)
			var data = "";
			if(list.length > 0){
				
			
			var total = list[0].TOTALCNT
			console.log("managerList토탈 값 보여줘")
			console.log(total)
			
	    	for(var i=0; i<list.length; i++){
	    	var categoryName = setCategory(list[i].CATEGORY);
	    	console.log("category ==>"+categoryName)
	    	var challState = ""
    		if(list[i].CHALLENGESTOP == "0"){
    			challState = "<button type='button' class='challStopBtn' id='stopBtn"+list[i].CHALLENGESEQ+"' onclick=\"cStopBtn('"+list[i].CHALLENGESEQ+"')\">정지</button>"
	    	}else{
	    		challState = "<button type='button' class='challPlayBtn' id='startBtn"+list[i].CHALLENGESEQ+"' onclick=\"cPlayBtn('"+list[i].CHALLENGESEQ+"')\">해제</button>"
	    	}
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
	            +	challState
	            +	"</div> </div>";
        		// 댓글 쓸때 seq를 modal로 보내줌
//        		$('#suggestSeq').val(list[i].SUGGESTBBSSEQ);

	    	}
	    	mListPaging(total,now)
			}else{
				mListPaging('0','1')
	    		data += "<div class='mainBox'>검색 결과가 없습니다</div>";
			}
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
//   document.getElementById('sugPageUl').innerHTML = html
}

function cStopBtn(seq) {
	console.log("cStopBtn")
	$.ajax({
		type : 'POST',
		url : 'challStop.do',
		data:{seq:seq},
		success : function(data){
			alert(data);
			if(data == "YES"){
				console.log($("#startBtn"+seq))
				$("#stopBtn"+seq).replaceWith("<button type='button' class='challPlayBtn' id='startBtn"+seq+"' onclick=\"cPlayBtn('"+seq+"')\">해제</button>")
				alert("챌린지가 정지 되었습니다.");
				
				
			}else{
				alert("챌린지 정지를 실패했습니다.");
			}
		},
		error: function(xhr, status, error){
			alert('회원 정지 error');
		}
	});
}

function cPlayBtn(seq) {
	console.log("cPlayBtn")
	$.ajax({
		type : 'POST',
		url : 'challPlay.do',
		data:{seq:seq},
		success : function(data){
			alert(data);
			if(data == "YES"){
				alert("챌린지 정지가 해제 되었습니다.");
				$("#startBtn"+seq).replaceWith("<button type='button' class='challPlayBtn' id='stopBtn"+seq+"' onclick=\"cStopBtn('"+seq+"')\">정지</button>")
			}else{
				alert("챌린지 정지 해제 실패");
			}
		},
		error: function(xhr, status, error){
			alert('회원 정지 error');
		}
	});
}
</script>
<script>
jQuery('#datestart').datetimepicker();
jQuery('#dateend').datetimepicker();
</script>

<script>
//멤버 총 수 가져오기 등등
memberCntList(1);

//검색 시

$('#memSearchBtn').click(function(){
	memberCntList(1);
	$('#searchs').val("");
});

function memberCntList(now){
	console.log("memberCntListmemberCntList")
	console.log(now)
	$.ajax({
		url:"./memberCntList.do",
		type:"POST",
		data: {page:now, 'searchs':$("#searchs").val(), 'categorys':$("#categorys").val()},
		success:function(list){
			console.log("멤버 리스트 불러오는애")
			console.log(list)
			var data = "";
			if(list.length < 1){
				var total = 0;
				data += "<div class='searchss' style='margin-left: 393px; color: #6e6e6e;'> 검색 결과가 없습니다 </div>"
			} else {
				var total = list[0].TOTALCNT
				console.log("멤버 토탈 값 보여줘")
				console.log(total)
		    	for(var i=0; i<list.length; i++){
		    	var state =""
		    	if(list[i].MEMBERSTOP == "2"){
		    		state = "<button type='button' class='memPlayBtn' id='mPlayBtn' onclick=\"mPlayBtn('"+list[i].EMAIL+"')\">해제</button>"
		    	}else{
		    		state = "<button type='button' class='memStopBtn' id='mStopBtn' onclick=\"mStopBtn('"+list[i].EMAIL+"')\">정지</button>"
		    	}
		    	// 검색어가 있을때 없을때 제어해주기	
		    	data += "<div class='col-xs-12 col-sm-4' style='display: flex; justify-content: center;'>"
		    		+	"<div class='card' style='width: 230px; height: 370px; margin-bottom: 49px;'>"
					+	"<div class='daily_card'>"
					+	"<img class='card-img-top' style='width:100%; height: 245px;' src='https://s3.ap-northeast-2.amazonaws.com/livelybucket/"+list[i].MEMBERPHOTONAME+"'>"
					+	"<div class='card-body'>"
					+	"<p class='card-title' style='margin-bottom: 0.25rem; font-size: 15px;margin-left: 14px;'>"+list[i].NICKNAME+"</p>"
					+	"<p class='card-text' style='font-size: 13px; margin-left: 15px;'>"+list[i].EMAIL+"</p>"
		            +	"<div class='memBtn'>"
		            +state
		            +	"</div> </div>"
					+	"</div> </div> </div></div>";
		    	}
			}
	    	memListPaging(total,now)
	    	$("#membox").html(data);
		},
		error:function(){
	           alert("멤버 리스트 불러오는 error");
		   	}
	});
}
// 멤버 페이지 처리
function memListPaging(total,now){
	console.log("memListPaging total",total)
	console.log("memListPaging now",now)
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
		html += "<li  onclick='memberCntList("+(nowBlock*5-9)+")'> &laquo;</li>"
	}
	for(var i=startCnt;i<=nowTotal;i++){
		if(now == i){
			html += "<li class='nowpage' style='color:#56b397' onclick='memberCntList("+i+")'>"+i+"</li>"
		}else{
			html += "<li onclick='memberCntList("+i+")'>"+i+"</li>"
		}
		
	}
	
	if(pageBlock > 1 && nowBlock < pageBlock){
		html += "<li onclick='memberCntList("+(nowBlock*5+1)+")'>&raquo;</li>"
	}
	console.log(html)
	$(".memPageUl").html(html);
//	document.getElementById('sugPageUl').innerHTML = html
}

function mStopBtn(email) {
	$.ajax({
		type : 'POST',
		url : 'memberStop.do',
		data:{email:email},
		success : function(data){
			alert(data);
			if(data == "YES"){
				alert("회원이 정지 되었습니다.");
			}else{
				alert("회원 정지를 실패했습니다.");
			}
		},
		error: function(xhr, status, error){
			alert('회원 정지 error');
		}
	});
}

function mPlayBtn(email) {
	$.ajax({
		type : 'POST',
		url : 'memberPlay.do',
		data:{email:email},
		success : function(data){
			alert(data);
			if(data == "YES"){
				alert("회원 정지가 해제 되었습니다.");
			}else{
				alert("정지 해제 실패");
			}
		},
		error: function(xhr, status, error){
			alert('회원 정지 error');
		}
	});
}
</script>


<script>
//민선 차트

//challengeMemberMax 챌린지 멤버 많은 순 (challengeMember)

/*  //userFollowingMax  팔로우 많은 순 (userFollowing)
  ${userFollowingMax} 
 //userPointMax 포인트 많은 순 (userPoint)
 ${userPointMax} 
 //challengeIdentifyMax 챌린지 인증 많은 순 (challengeIdentify)
 ${challengeIdentifyMax}
 //userIdentify 개인별 인증 많은 순 (userIdentify) 도넛차트
  ${userIdentify}
 */
//라인 차트 
   //userAdd 
 var myChart = new Chart(
       document.getElementById('userAdd'),
       {  type: 'line',
          data: {
             labels: ['JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN', 'JUL', 'AUS', 'SEP', 'OCT', 'NOV', 'DEC'],
             datasets: [{
               label: '월별 가입자 수',
               data: [ "${userMonth['1']}", "${userMonth['2']}", "${userMonth['3']}", "${userMonth['4']}", "${userMonth['5']}", "${userMonth['6']}",
                  "${userMonth['7']}", "${userMonth['8']}", "${userMonth['9']}", "${userMonth['10']}", "${userMonth['11']}", "${userMonth['12']}"],
               fill: true,
               borderColor: 'rgb(89, 29, 169)'
             }]
          }, 
          options: {
                scales: {
                   y: {
                     beginAtZero: true
                   }
                 }
               }
        }
     );
  
    //challengeAdd

var myChart1 = new Chart(
    document.getElementById('challengeAdd'),
    {
        type: 'line',
        data: {
             labels: ['JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN', 'JUL', 'AUS', 'SEP', 'OCT', 'NOV', 'DEC'],
             datasets: [{
               label: '월별 CHALLENGE 생성 개수',
            data: ["${challengeMonth['1']}", "${challengeMonth['2']}", "${challengeMonth['3']}", "${challengeMonth['4']}", "${challengeMonth['5']}", "${challengeMonth['6']}",
            "${challengeMonth['7']}", "${challengeMonth['8']}", "${challengeMonth['9']}", "${challengeMonth['10']}", "${challengeMonth['11']}", "${challengeMonth['12']}",],
           
               fill: true,
               borderColor: 'rgb(89, 29, 169)'
             }]
           },
        options: {
             scales: {
               y: {
                 beginAtZero: true
               }
             }
           }
    }
  );

//바 차트
//챌린지 가입자가 많은 순

let challengeMemberMax = JSON.parse('${challengeMemberMax}'); 
console.log(challengeMemberMax)

let ctitle = ['없음', '없음','없음','없음','없음','없음','없음'];
let mcount = [0,0,0,0,0,0,0];
for(let i=0;i<challengeMemberMax.length;i++){
   ctitle[i] = challengeMemberMax[i].challengetitle;
   mcount[i] = challengeMemberMax[i].percent;
}
console.log(ctitle + " ||| " +mcount )

var myChart2 = new Chart(
       document.getElementById('challengeMember'),
       {
            type: 'bar',
            data: {
               labels: ctitle,
               datasets: [{
                 label: '가입자가 많은 순',
                 data: mcount,
                 backgroundColor: [
                	  'rgba(255, 99, 132, 0.5)',
                      'rgba(255, 159, 64, 0.5)',
                      'rgba(255, 205, 86, 0.5)',
                      'rgba(75, 192, 192, 0.5)',
                      'rgba(54, 162, 235, 0.5)',
                      'rgba(153, 102, 255, 0.5)',
                      'rgba(201, 203, 207, 0.5)'
          
                 ],
                 borderColor: [
                	 'rgb(255, 99, 132)',
                     'rgb(255, 159, 64)',
                     'rgb(255, 205, 86)',
                     'rgb(75, 192, 192)',
                     'rgb(54, 162, 235)',
                     'rgb(153, 102, 255)',
                     'rgb(201, 203, 207)'
       
                 ],
                 borderWidth: 1,
                 barThickness: 50
               }]
             },
            options: {
              scales: {
                y: {
                  beginAtZero: true
                }                
              },
              
            },
          }
     );
//챌린지 달성률이 높은 순(유저 많은 순)
let challengeIdentifyMax = JSON.parse('${challengeIdentifyMax}'); 
console.log(challengeIdentifyMax)
let cititle = ['없음', '없음','없음','없음','없음','없음','없음'];
let cicount = [0,0,0,0,0,0,0];
for(let i=0;i<challengeIdentifyMax.length;i++){
	cititle[i] = challengeIdentifyMax[i].challengetitle;
	cicount[i] = challengeIdentifyMax[i].percent;
}
console.log(cititle + " ||| " +cititle )

var myChart3 = new Chart(
       document.getElementById('challengeIdentify'),
       {
            type: 'bar',
            data: {
            	labels: cititle,
               datasets: [{
                 label: 'CHALLENGE 달성률이 높은 순',
                 data: cicount,
                 backgroundColor: [
                   'rgba(255, 99, 132, 0.5)',
                   'rgba(255, 159, 64, 0.5)',
                   'rgba(255, 205, 86, 0.5)',
                   'rgba(75, 192, 192, 0.5)',
                   'rgba(54, 162, 235, 0.5)',
                   'rgba(153, 102, 255, 0.5)',
                   'rgba(201, 203, 207, 0.5)'
                 ],
                 borderColor: [
                   'rgb(255, 99, 132)',
                   'rgb(255, 159, 64)',
                   'rgb(255, 205, 86)',
                   'rgb(75, 192, 192)',
                   'rgb(54, 162, 235)',
                   'rgb(153, 102, 255)',
                   'rgb(201, 203, 207)'
                 ],
                 borderWidth: 1,
                 barThickness: 50
               }]
             },
            options: {
              scales: {
                y: {
                  beginAtZero: true
                }
              }
            },
          }

     );
     
//유저 팔로잉 많은 순
let userFollowingMax = JSON.parse('${userFollowingMax}'); 
console.log(userFollowingMax)
let ftitle = ['없음', '없음','없음','없음','없음','없음','없음'];
let fcount = [0,0,0,0,0,0,0];
for(let i=0;i<userFollowingMax.length;i++){
	ftitle[i] = userFollowingMax[i].nickname;
	fcount[i] = userFollowingMax[i].following;
}
console.log(ftitle + " ||| " +fcount )
var myChart4 = new Chart(
       document.getElementById("userFollowing"),
       {
            type: 'bar',
            data: {
            	 labels: ftitle,
               datasets: [{
                 label: '다른 유저에게 좋아요 많이 받은 유저 수',
                 data: fcount,
                 backgroundColor: [
                   'rgba(255, 99, 132, 0.5)',
                   'rgba(255, 159, 64, 0.5)',
                   'rgba(255, 205, 86, 0.5)',
                   'rgba(75, 192, 192, 0.5)',
                   'rgba(54, 162, 235, 0.5)',
                   'rgba(153, 102, 255, 0.5)',
                   'rgba(201, 203, 207, 0.5)'
                 ],
                 borderColor: [
                   'rgb(255, 99, 132)',
                   'rgb(255, 159, 64)',
                   'rgb(255, 205, 86)',
                   'rgb(75, 192, 192)',
                   'rgb(54, 162, 235)',
                   'rgb(153, 102, 255)',
                   'rgb(201, 203, 207)'
                 ],
                 borderWidth: 1,
                 barThickness: 50
               }]
             },
            options: {
              scales: {
                y: {
                  beginAtZero: true
                }
              }
            },
          }
     );
     
     

//유저 포인트가 많은 순
let userPointMax = JSON.parse('${userPointMax}'); 
console.log(userPointMax)
let ptitle = ['없음', '없음','없음','없음','없음','없음','없음'];
let pcount = [0,0,0,0,0,0,0];
for(let i=0;i<userPointMax.length;i++){
	ptitle[i] = userPointMax[i].nickname;
	pcount[i] = userPointMax[i].point;
}
console.log(ptitle + " ||| " +pcount )
var myChart5 = new Chart(
       document.getElementById("userPoint"),
       {
            type: 'bar',
            data: {
                labels: ptitle,
               datasets: [{
                 label: '가입한 CHALLENGE가 많은 유저 수',
                 data: pcount,
                 backgroundColor: [
                   'rgba(255, 99, 132, 0.5)',
                   'rgba(255, 159, 64, 0.5)',
                   'rgba(255, 205, 86, 0.5)',
                   'rgba(75, 192, 192, 0.5)',
                   'rgba(54, 162, 235, 0.5)',
                   'rgba(153, 102, 255, 0.5)',
                   'rgba(201, 203, 207, 0.5)'
                 ],
                 borderColor: [
                   'rgb(255, 99, 132)',
                   'rgb(255, 159, 64)',
                   'rgb(255, 205, 86)',
                   'rgb(75, 192, 192)',
                   'rgb(54, 162, 235)',
                   'rgb(153, 102, 255)',
                   'rgb(201, 203, 207)'
                 ],
                 borderWidth: 1,
                 barThickness: 50
               }]
             },
            options: {
              scales: {
                y: {
                  beginAtZero: true
                }
              }
            },
          }
     );
     
//도넛 차트
//챌린지 카테고리별 생성 개수
var myChart6 = new Chart(
       document.getElementById("challengeCategory"),
       {
        type: 'doughnut',
        data: {
                 datasets: [{
                   label: '카테고리별 CHALLENGE 수',
                   data: ["${challengeCategory['1']}", "${challengeCategory['2']}", "${challengeCategory['3']}", "${challengeCategory['4']}", "${challengeCategory['5']}", "${challengeCategory['6']}"],
                   backgroundColor: [
                     'rgb(255, 99, 132)',
                     'rgb(255, 159, 64)',
                     'rgb(255, 205, 86)',
                     'rgb(75, 192, 192)',
                     'rgb(54, 162, 235)',
                     'rgb(153, 102, 255)',
                   ],
                   hoverOffset: 4
                 }]
               }
          }

);

//유저 인증률이 가장 높은 순
let userIdentify = JSON.parse('${userIdentify}'); 
console.log(userIdentify)
let utitle = ['없음', '없음','없음','없음','없음','없음'];
let ucount = [0,0,0,0,0,0];
let color = ['255, 99, 132', '255, 159, 64', '255, 205, 86', '75, 192, 192', '54, 162, 235', '153, 102, 255'];
for(let i=0;i<userIdentify.length;i++){
	utitle[i] = userIdentify[i].nickname;
	ucount[i] = userIdentify[i].totalpercent;
}
console.log(utitle + " ||| " +utitle )
var myChart7 = new Chart(
       document.getElementById("userIdentify"),
       {
        type: 'doughnut',
        data: {
             
                 datasets: [{
                   label: '인증 성공률이 높은 순',
                   data: ucount,
                   backgroundColor: [
                     'rgb(255, 99, 132)',
                     'rgb(255, 159, 64)',
                     'rgb(255, 205, 86)',
                     'rgb(75, 192, 192)',
                     'rgb(54, 162, 235)',
                     'rgb(153, 102, 255)',
                   ],
                   hoverOffset: 4
                 }]
               }
          }

);

//카테고리별 챌린지
let userData = "<table class='categoryTable'>";				
for(i=0;i<utitle.length;i++){
	userData += "<tr><td><div style='width: 50px;height: 12px;background-color:rgb("+color[i]+");margin-left: 20px'></div></td>"
	 + "<td><span style='font-size: 10pt;font-weight: 500;margin: 0 20px;letter-spacing: 3px;'>"
	+ utitle[i] + "</span></td>"
	+ "<td><span style='margin-right: 20px'>"
	+ ucount[i]+"</span></td></tr>";
}
userData += "</table>";
document.getElementById('userData').innerHTML = userData;


//유저 활동 많은 순
</script>