<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<link rel="stylesheet" href="myMainPage.css" />
<link rel="stylesheet" href="element.css" />

<!-- nav tab바 -->
<div class="container">
    <!-- Nav pills -->
    <ul class="nav nav-pills" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" data-toggle="pill" href="#home">전체현황</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="pill" href="#menu1">월간리포트</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="pill" href="#menu2">제안하기</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="pill" href="#menu3">회원정보수정</a>
        </li>
    </ul>

    <!-- Tab panes -->
    <div class="tab-content">
        <div id="home" class="container tab-pane active">
            <br>
            <h3>home</h3>
            <p>각 메뉴의 데이터를 보여준다</p>
        </div>

        <div id="menu1" class="container tab-pane fade"><br>
            <h3>Menu 1</h3>
            <p>각 메뉴의 데이터를 보여준다</p>
        </div>

        <div id="menu2" class="container tab-pane fade"><br>
            <h3>Menu 2</h3>
            <p>각 메뉴의 데이터를 보여준다</p>
        </div>

        <div id="menu3" class="container tab-pane fade"><br>
            <h3>Menu 3</h3>
            <p>각 메뉴의 데이터를 보여준다</p>
        </div>

    </div>
</div>