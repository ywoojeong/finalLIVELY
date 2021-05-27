<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>index</title>

<tiles:insertAttribute name="commons"/>   
</head>
<body>

	<div>
		<tiles:insertAttribute name="header" />
	</div>
	
	<div>
		<tiles:insertAttribute name="body"/>   <!--요청에의해 바뀌는 body부분-->
	</div>
	
	<div  style="display:flex; height: 80px;width:100%;background:white;bottom: 0; padding-top: 10px;">
		<tiles:insertAttribute name="footer"/> 
	</div>
</body>
</html>