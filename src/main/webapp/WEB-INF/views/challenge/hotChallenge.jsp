<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <link href="./css/challenge.css" rel="stylesheet">   

<div class="" style="margin-top:70px;">
	<div class="hotMain">
		<h2>최근 인기있는 챌린지에 동참하세요</h2>
		
	
		
		<!-- 챌린지 만들기 버튼 -->
		<div class="chall-buttons">
		 	<button type="button" class="chall-btn-hover color-3"  onclick="challengeMake()" >START</button>
		 </div>
			
	
	</div>
	

</div>    
 
   
   <div class="container">

   	 <!-- Nav pills -->
		  <ul class="nav nav-pills" role="tablist">
		    <li class="nav-item">
		      <a class="nav-link active" data-toggle="pill" href="#home">전  체</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" data-toggle="pill" href="#category2">건  강</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" data-toggle="pill" href="#category3">역  량</a>
		    </li>
		     <li class="nav-item">
		      <a class="nav-link" data-toggle="pill" href="#category4">정  서</a>
		    </li>
		     <li class="nav-item">
		      <a class="nav-link" data-toggle="pill" href="#category5">자  산</a>
		    </li>
		     <li class="nav-item">
		      <a class="nav-link" data-toggle="pill" href="#category6">생 활</a>
		    </li>	
		    <li class="nav-item">
		      <a class="nav-link" data-toggle="pill" href="#category6">취 미</a>
		    </li>		 
		  </ul>
		
			
	
		
		
		  <!-- Tab panes -->
		  <div class="tab-content">
		    <!-- 검색창 -->	
			<div class="md-form md-outline d-flex Search">
				<input type="text" class="form-control input-Search" id="search" placeholder="인기있는 챌린지를 검색하세요" name="search">
		    	<button type="button" class="btn btn-Search" >SEARCH</button>
		    </div>
		  		
	
		    <div id="home" class="container tab-pane active"><br>
		    	<!-- 카드 -->
		     	<div class="row">
		     		<%for(int i=0;i<3;i++){
		     			for(int j=0;j<3;j++){
		     			%>
		     			
			     		<div class="col-xs-12 col-sm-4 p-2">
			     			<div class="card challCard">
		     				 	<img class="card-img-top zoom" src="https://www.w3schools.com/bootstrap4/img_avatar1.png" alt="Card image cap">
 							  <div class="card-img-overlay"> 
							    <h5 class="card-title">Card title</h5>
							    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
							    <a href="#" class="btn">Go somewhere</a>
							  </div>
							</div>
			     		</div>
		     		
		     			<%}
		     		}%>
		     	</div>
		     	<!-- 페이지네이션 -->
		     
				  <ul class="pagination" style="justify-content: center">
				    <li class="page-item disabled">
				      <a class="page-link" href="#" tabindex="-1">Previous</a>
				    </li>
				    <li class="page-item"><a class="page-link" href="#">1</a></li>
				    <li class="page-item active">
				      <a class="page-link" href="#">2 <span class="sr-only">(current)</span></a>
				    </li>
				    <li class="page-item"><a class="page-link" href="#">3</a></li>
				    <li class="page-item">
				      <a class="page-link" href="#">Next</a>
				    </li>
				  </ul>
				   	
		    </div>
		      
		      <div id="category1" class="container tab-pane fade"><br>
			      <h3>Menu 1</h3>
			      <p>각 메뉴의 데이터를 보여준다</p>
			    </div>
			    
			    <div id="category2" class="container tab-pane fade"><br>
			      <h3>Menu 2</h3>
			      <p>각 메뉴의 데이터를 보여준다</p>
			    </div>
			    
			    <div id="category3" class="container tab-pane fade"><br>
			      <h3>Menu 3</h3>
			      <p>각 메뉴의 데이터를 보여준다</p>
			    </div>
			  		   
		  </div>
		
 
   </div>


<script>
function challengeMake(){
	location.href="challengeMake.do";	
}

/* $(".nav-pills").find('a').click(function(){
	window.location.hash = $(this).attr('href').
});
 */
</script> 

