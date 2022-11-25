<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath"  value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>비로그인 메인</title>
		<style type="text/css">
			@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@900&display=swap');
			@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;900&display=swap');
	
			.btnDiv {
				width: 50%;
				height: 800px;
				background-color: #0F2859;
				float:left;
				padding-top: 250px;
				/* border: 2px solid white; */
			}
			.imgDiv {
				width: 50%;
				height: 800px;
				background-color: #0F2859;
				float: right;
				padding-top: 250px;
			}
			.mainText {
				width: 100%;
				text-align: left;
				/* border: 2px solid white; */
			}
			.mainText font {
				font-family: 'Noto Sans KR', sans-serif;
				color: #80F2E7;
				font-size: 110px;
			}
			.newB {
				margin-top: 50px;
			}
			.newBtn {
				height: 50px;
				border: none;
				border-radius: 10px;
				
				color: #0F2859;
				background-color: white;
				padding: 0 15px;
				font-size: 20px;
				font-family: 'Noto Sans KR', sans-serif;
			}
	      	.nMain {
	      		width: 65%;
	      		height: 500px;
	      	}
			.button {
				color:white;
				padding: 7px 20px;
				font-weight: bold;
				background-color: #384D59;
				border-radius:5px;
				border:0;
				font-size: 25px;
			}
		</style>
		<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				console.log('ready');
						
				$(".newBtn").hover(
					function() { // mouseover
						$(".nMain").attr("src","./resources/images/nonMain2.png");
					},
					function() { // mouseout
						$(".nMain").attr("src","./resources/images/nonMain1.png")
					}
				); // .newBtn end
			}); // document end
		</script>
	</head>
	<body>
		<div id="nmWrap">
			<div class="btnDiv">
				<div class="mainText">
					<font>Create</font><br />
					<font>your Idea</font>
				</div>
				<div class="newB">
					<a class="a-font" href="${contextPath}/user/viewLoginBeforeProject"><button class="newBtn button">프로젝트 생성</button></a>
	      		</div>
			</div>
			<div class="imgDiv">
					<img src="${contextPath}/resources/images/nonMain1.png" class="nMain">
			</div>
		</div>
	</body>
</html>