<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>messageList</title>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400&display=swap');
	
	#msWrap {
		width: 80%;
		height: 100%;
		text-align: center;
		/* border: 1px solid black;  */
	}
	h1 {
		height: 60px;
		padding: 10px 0;
		/* border: 1px solid black; */
	}
	table{
		margin: auto;
		width: 70%;
		color: #384D59;
		border-collapse: collapse;
		border-radius: 10px;
 		border-style: hidden;
		box-shadow: 1px 1px 5px 1px lightgray;
	}
	td {
		border: 1px solid lightgray;
	}
	.msName {
		width: 100px;
	}
	.msContent {
		width: 400px;
		text-align: left;
	}
	.msContent>a {
		text-decoration: none;
		display: block;
		color: #384D59;
		padding: 40px 0 40px 10px;

	}
	.msContent>a:hover {
		text-decoration: none;
		display: block;
		color: #384D59;
		background-color: #F1F3F5;
		padding: 40px 0 40px 10px;

	}
	.msTime {
		width: 100px;
		color: gray;
	}
	.msBtn {
		float: left;
		width: 100px; 
		height: 40px; 
		border: 2px solid #384D59;
		border-radius: 5px; 
		font-size: 15px; 
		font-family: 'Noto Sans KR', sans-serif;
		text-align: center;
		color: #384D59;
		background-color: white;
	}
</style>
</head>
<body>
<div id="msWrap">
	<h1>Message</h1>
	<table>
		<c:forEach var="message" items="${list}">
			<tr>
				<td class="msName"><c:if test="${message.readCount eq 0}">❗</c:if>${message.fromUserName}</td>
				<td class="msContent"><a href="/asc/message/readMessage?messageSeq=${message.messageSeq}">${message.content}</a></td>
				<td class="msTime">${message.sendTime}</td>
			</tr>
		</c:forEach>
	</table>
	<button class="msBtn" onclick="location.href='viewCreateMessage'">메세지 작성</button>
</div>
</body>
</html>