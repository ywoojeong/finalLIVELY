<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<link rel="stylesheet" href="./css/element.css" />
<link rel="stylesheet" href="./css/myMainPage2.css" />

<div class="container">
    <div class="row">
        <div class="col-sm-4">
            <div class="member_box">
                <img class="userWrap"/>
                <h3>Admin</h3>
                <h4>0 Point</h4>
                <div class="member_link">
                    <div class="cut_item">
                        <div class="cut_text">찜한챌린지</div>
                        <div class="cut_icon"><a><i class="far fa-heart fa-3x"></i></a></div>
                        <div class="cut_count">0</div>
                    </div>
                    <div class="cut_item">
                        <div class="cut_text">성공챌린지</div>
                        <div class="cut_icon"><a><i class="fas fa-fire-alt fa-3x"></i></a></div>
                        <div class="cut_count">0</div>
                    </div>
                    <div class="cut_item">
                        <div class="cut_text">My팔로워</div>
                        <div class="cut_icon"><a><i class="far fa-handshake fa-3x"></i></a></div>
                        <div class="cut_count">0</div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="col-sm-8">
            <!-- 탭부분 -->
            <div class="member_rightBox">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="member_count">
                            <div class="count_box">
                                <div class="card-panel text-center">
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <div class="easypiechart" id="easypiechart-dibs" data-percent="82" >
                                                <span class="percent">82%</span>
                                                <h5>찜하기</h5>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="easypiechart" id="easypiechart-part" data-percent="82" >
                                                <span class="percent">82%</span>
                                                <h5>참가중</h5>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="easypiechart" id="easypiechart-finish" data-percent="82" >
                                                <span class="percent">82%</span>
                                                <h5>완료</h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>    
                            </div>
                        </div>
                    </div>
                </div>
            
                <div class="row">
                    <div class="col-sm-12">
                        <div class="member_chart">
                            
                        </div>
                    </div>
                </div>
            </div>
        </div> 
    </div>
</div>