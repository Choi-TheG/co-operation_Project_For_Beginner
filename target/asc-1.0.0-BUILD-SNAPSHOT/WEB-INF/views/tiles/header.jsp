<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath"  value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Header</title>
		<style type="text/css">
			/* body 영역 및 마진 0 */
			body {
				width: 100%;
				height: 100%;
				position: relative;
				margin: 0px;
			}
			/* 
			#container {
				width: 100%;
				height: 100%;
			} */
			
			/* 헤더 좌상단 로고 및 선택된 프로젝트 박스 */
			.logo{
				width: 400px;
				height: 100px;
				float: left;
			}
			
			/* 로그인 메인 퀵메뉴 및 헤더 패딩 */
			#topDiv{
				padding: 5px;
			}
			
	         #a-font:hover{
	         	color: #80F2E7;
	         	border: 2px solid #80F2E7;
	         }
	         
			/* 헤더 좌상단 이미지 */
			.logo img {
				width: 100px;
				height: 100px;
				float: left;
			}
			
			/* 헤더 좌상단 선택된 프로젝트 */
			.selectedProjectName {
	    		width: 290px;
	    		height: 100px;
	    		float: left;
	    		margin-left: 6px;
	         }
	         
	         /* 선택된 프로젝트 이름 */
	         #p-font {
	         	font-size: 20px;
	         	font-weight: bold;
	         	color: #fff;
	         	width: 100%;
	         	margin-block-start: 0;
	         	margin-block-end: 0;
	         	margin-inline-start: 0;
	         	margin-inline-end: 0;
	         	margin-top: 16px;
	         	margin-bottom: 8px;
	         	display: block;
	         }
	         
	         /* 선택된 프로젝트 선택 버튼 */
	         #a-font {
	         	border : 2px solid white;
	         	padding:5px;
	         	border-radius: 7px;
	         	color: #fff;
	         	text-decoration:none;
	         	font-size: 16px;
	         }
	         
			/* 헤더 우상단 로그인 관련 및 프로젝트 생성 박스 */
	         .headLogin {
	       		top:30px;
	         	width:400px;
	         	float:right;
	         	white-space : nowrap; 
	         	text-align: right;
	       		color:#fff;
	         }
	         
			/* 헤더 우상단 로그인 */
			.headLogin a {
			    color: white;
			    font-weight: bold;
			    text-decoration: none;
			    font-size: small;
			}
			
			.headLogin a:hover{
				color: #80F2E7;
			}
			
			/* 헤더 우상단 프로젝트 생성 버튼 */
			.newProject {
				width: 120px;
				color:white;
				background-color: #384D59;
				border:0;
				padding: 5px;
				border-radius:5px;
				font-weight: bold;
			}
			
			.newProject:hover{
				color: #80F2E7;
			}
		</style>
	</head>
	<body>
		<div id="topDiv">
			<div class="logo">
				<a href="${contextPath}/main">
					<img src="${contextPath}/resources/images/cloud.png" />
				</a>
				<div class="selectedProjectName">
					<c:choose>
						<c:when test="${isLogon == true && member != null}">
							<c:choose>
								<c:when test="${project != null}">
									<p id="p-font"> 프로젝트 : ${project.projectName}</p>
									<a id="a-font" href="${contextPath}/project/changeProject">프로젝트 선택</a>
								</c:when>
							</c:choose>
						</c:when>
					</c:choose>
				</div>
			</div>
			<div class="headLogin">
				<c:choose>
					<c:when test="${isLogon == true && member.id eq 'admin'}">
						<a href="${contextPath}/manager/userList">관리자 페이지</a>
						<span>|</span>
					</c:when>
				</c:choose>			
				<c:choose>
					<c:when test="${isLogon == true && member != null}">
						<a href="${contextPath}/user/logout">로그아웃</a>
						<span>|</span>
						<a href="${contextPath}/user/viewMyPage?id=${member.id}">마이페이지</a>
						<span>|</span>
						<a href="${contextPath}/project/viewCreateProject"><button class="newProject">프로젝트 생성</button></a>
					</c:when>
					
					<c:otherwise>
						<a href="${contextPath}/user/viewLogin">로그인</a>
						<span>|</span>
						<a href="${contextPath}/user/viewJoin">회원가입</a>
						<span>|</span>
						<a href="${contextPath}/user/viewLoginBeforeProject"><button class="newProject">프로젝트 생성</button></a>
					</c:otherwise>
				</c:choose>
			</div>	
		</div>
	</body>
</html>