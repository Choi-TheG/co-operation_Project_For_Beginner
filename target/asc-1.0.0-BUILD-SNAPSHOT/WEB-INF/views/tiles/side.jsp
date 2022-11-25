<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Side</title>
<style>
.menu{
    width: 300px;
    height: 100%;
}

.menuPostion{
    height: 100%;
    width: 170px;
    margin-left: auto;
    margin-right: auto;
}

.sideMenu{
        margin-left:auto; 
    	margin-right:auto;
    	border-collapse: separate;
		border-spacing: 0 10px;
        padding: 15px;
        text-align: left;
        font-size: 20px;
}

.sideMenu a {
 		 text-decoration: none;
 		 color:black;
 		 opacity:0.8;
 		 padding:5px;
	}
.sideMenu a:hover{
		background-color:#0F2859;
		opacity:1.0;
		color:white;
		border-radius: 5px;
		transition: all 0.2s;
   
	
</style>
</head>
<body>
<div class="menu">
    <div class="menuPostion">
        <div class="sideMenu"><a href="${contextPath}/dashboard/viewDashboard?projectSeq=${project.projectSeq }" id="sm4">대시보드</a></div>
        <div class="sideMenu"><a href="${contextPath}/project/manageProject" id="sm1">프로젝트 관리</a></div>
        <div class="sideMenu"><a href="${contextPath}/project/viewScheduleProject" id="sm2">프로젝트 일정</a></div>
        <div class="sideMenu"><a href="${contextPath}/documents/readPlan?projectSeq=${project.projectSeq}&pageNum=1" id="sm3">문서 관리</a></div>
        <div class="sideMenu"><a href="${contextPath}/board/boardListPaging?projectSeq=${project.projectSeq }&pageNum=1" id="sm5">이슈리스트</a></div>
    </div>       
</div>
</body>
</html>