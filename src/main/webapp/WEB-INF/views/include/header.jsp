<%@page import="com.a.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%MemberDto memberInfo = (MemberDto)session.getAttribute("memberInfo");%>   
<%	if(memberInfo !=null){
	System.out.println("session memberInfo header: " + memberInfo.getNickname() + " Auth : " + memberInfo.getAuth() + " MEMBERSTOP : " +  memberInfo.getMemberstop());
	}else {System.out.println("memberInfo:null "); }%>

<%if(memberInfo != null && memberInfo.getMemberstop() == 2){
	session.invalidate(); // 모든세션정보 삭제
%>
	<script>
	alert("정지횐원 입니다.");
	window.location.href = "intro.do"
	</script>
<%
	
   
}%>


<style>
nav a:first-child {
  margin-top: 3px;
}
.navbar-light .navbar-nav .nav-link{
	 list-style: none;
	  padding: 20px;
	  color: #73737d;
	  font-size: 10pt;
	  display: block;
	  transition: all 0.3s ease-in-out;
}
.navbar-light .navbar-nav .nav-link:hover {
  color: #cb98ed;
  transform: scale(1.1);
  cursor: pointer;
}
.navbar-light .navbar-nav .nav-link .active, .navbar-light .navbar-nav .nav-link:focus{
  color: #cb98ed;
  font-weight: 700;
}
#nav-item>a:focus{
  color: #cb98ed;
  font-weight: 700;
}
.navbar-light .navbar-nav .nav-link{
font-size: 11pt;
}
</style>



<nav class="navbar navbar-expand-md fixed-top navbar-light" style="background-color: white;height: 50px">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">
    	<img src="./image/logo.png" style="height: 36px;padding-bottom: 3px;margin-top: 0">
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse">
      <ul class="navbar-nav me-auto mb-2 mb-md-0 ">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="intro.do">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link " href="hotChallenge.do">HOT CHALLENGE</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="newChallenge.do">NEW CHALLENGE</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="managerPage.do">매니저페이지</a>
        </li>
        <li class="nav-item">
        	<%if(memberInfo != null){ %>
         		<a class="nav-link" href="javascript:signOut();">log out</a>
          	<%}%>
        </li>
      </ul>
      <form class="d-flex">
      	
      	<%if(memberInfo == null){ %>
        	<button type="button" class="loginbtn" id="loginbtn" onClick="location.href='memberLogin.do'">LIVELY LOGIN</button>
      	<%}else if(memberInfo != null && memberInfo.getAuth() == 1) {%>
      		<button type="button" class="loginbtn" id="loginbtn" onClick="location.href='managerPage.do'">MANAGER</button>
      	<%}else if(memberInfo != null && memberInfo.getAuth() == 3) {%>
      		<button type="button" class="loginbtn" id="loginbtn" onClick="location.href='myMainPage2.do'">MYPAGE</button>
      	<%} %>
      </form>
    </div>
  </div>
</nav> 

<<script type="text/javascript">
<!--

//-->
</script>

<!-- <script>
$('#nav-item a').click(function() {
    $('#nav-item a').removeClass('focus');
    $(this).addClass('focus');
});
</script> -->