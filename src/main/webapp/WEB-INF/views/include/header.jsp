<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Russo+One&display=swap" rel="stylesheet">


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


<nav class="navbar navbar-expand-md fixed-top navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="intro.do">
    	<img src="./image/logo.png" style="height: 45px">
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse">
      <ul class="navbar-nav me-auto mb-2 mb-md-0 ">
        <li class="nav-item" id="nav-item">
          <a class="nav-link active" aria-current="page" href="intro.do">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link " href="hotChallenge.do">HOT CHALLENGE</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="newChallenge.do">NEW CHALLENGE</a>
        </li>
      </ul>
      <form class="d-flex">
        <button type="button" class="loginbtn" id="loginbtn" onClick="location.href='memberLogin.do'">LIVELY LOGIN</button>
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
