<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="contextPath"  value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Side</title>
		<style type="text/css">
			#sideWrap {
				 width: 300px;
    			 height: 100%;
			}
			.sideContent {
				height: 100%;
    			width: 170px;
    			margin-left: auto;
    			margin-right: auto;
			}
			.managerSideMenu {
				margin-left:auto; 
    			margin-right:auto;
    			border-collapse: separate;
				border-spacing: 0 10px;
        		padding: 15px;
        		text-align: left;
        		font-size: 20px;
			}
			.sideContent a {
				text-decoration: none;
 		 		color:black;
 		 		opacity:0.8;
 		 		padding:5px;
			}
			.sideContent a:hover {
				background-color:#0F2859;
				opacity:1.0;
				color:white;
				border-radius: 5px;
				transition: all 0.2s;
			}
		</style>
	</head>
	<body>
		<div id="sideWrap">
			<div class="sideContent">
				<div class="managerSideMenu">
					<a href="${contextPath}/manager/userList">회원 관리</a>
				</div>
				<div class="managerSideMenu">
					<a href="${contextPath}/manager/projectList">프로젝트 관리</a>
				</div>
			</div>
		</div>
	</body>
</html>