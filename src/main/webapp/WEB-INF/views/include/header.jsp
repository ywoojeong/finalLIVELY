<%@page import="com.a.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%MemberDto memberInfo = (MemberDto)session.getAttribute("memberInfo");%>   
<%	if(memberInfo !=null){
	System.out.println("session memberInfo : " + memberInfo.getNickname() + " Auth : " + memberInfo.getAuth());
	}else {System.out.println("memberInfo:null "); }%>

<style>
nav a:first-child {
  margin-top: 3px;
}
.navbar-light .navbar-nav .nav-link{
	 list-style: none;
	  padding: 20px;
	  color: #73737d;
	  font-size: 1em;
	  display: block;
	  transition: all 0.3s ease-in-out;
}
.navbar-light .navbar-nav .nav-link:hover {
  color: #cb98ed;
  transform: scale(1.2);
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

</style>



<nav class="navbar navbar-expand-md fixed-top navbar-light" style="background-color: white">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">
    	<img src="./image/logo.png" style="height: 45px">
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
<!--         <li class="nav-item">
          <a class="nav-link" href="myMainPage2.do">마이페이지탭</a>
        </li> -->
        <li class="nav-item">
          <a class="nav-link" href="javascript:signOut();">log out</a>
        </li>
      </ul>
      <form class="d-flex">
      	
      	<%if(memberInfo == null){ %>
        	<button type="button" class="loginbtn" id="loginbtn" onClick="location.href='memberLogin.do'">LIVELY LOGIN</button>
      	<%}else if(memberInfo != null && memberInfo.getAuth() == 1) {%>
      		<button type="button" class="loginbtn" id="loginbtn" onClick="location.href='manager.do'">MANAGER</button>
      	<%}else if(memberInfo != null && memberInfo.getAuth() == 3) {%>
      		<button type="button" class="loginbtn" id="loginbtn" onClick="location.href='myMainPage2.do'">MYPAGE</button>
      	<%} %>
      	<%-- 
        <!-- 로그인 시 데이터 변경 관리자 : MANAGER / 로그인 : MYPAGE / 비로그인 LIVELY LOGIN 
      	<%if(memberInfo = null ){%>
      	<%}else if(memberInfo != null && memberInfo.getAuth() == 1){%>
          	<button type="button" class="loginbtn" id="loginbtn" onClick="location.href='manager.do'">MANAGER</button>
      	 
      	<%}else if(memberInfo != null && memberInfo.getAuth() == 3){%>
            <button type="button" class="loginbtn" id="loginbtn" onClick="location.href='mypage.do'">MYPAGE</button>
          
            -->          
         --%>
      </form>
    </div>
  </div>
</nav> 

<!-- <script>
$('#nav-item a').click(function() {
    $('#nav-item a').removeClass('focus');
    $(this).addClass('focus');
});
</script> -->