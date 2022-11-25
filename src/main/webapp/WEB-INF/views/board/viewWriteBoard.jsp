<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	.board-main {
		width:68%;
		position:relative;
		left:18%;
		float:center;
		top:5%;
		height: 100%;
	}
	.table { 
		display:block;
		border-collapse: collapse;
		width:700px;
		height: 85%;
		table-layout: fixed;
		overflow: auto;
	}
	.table tr,td {		
		border: 1px solid gray;
		word-break:break-all;	
	}
	.table-title {
		width:10%;
		height:40px;
		text-align: center;
		font-weight: bold;
	}
	.table-content {
		width:630px;
		height : 500px;
		overflow: auto;
	}
	.table-content textarea {
		height: 96%;
		width: 98%;
		font-size: 16px;
	}
	.table-title-text {
		height:40px;
		font-weight: bold;
	}
	.table-title-text input {
		height: 30px;
		width: 98%;
		font-size: 16px;
	}
	.search-content-select {
		text-align:center;
		width: 120px;
		height: 30px;
		margin-right: 5px;
		font-size: 16px;
	}
	.button {
		color:white;
		background-color: #384D59;
		border:0;
		padding: 5px 15px;
		border-radius:5px;
		font-weight: bold;
		float:center; 	
		margin-left: 35%;
		font-size: 16px;
	}
</style>
<title>Insert title here</title>
</head>
<body>
<div class="board-main">
<form action="./writeBoard" method="POST" enctype="multipart/form-data" >
<input type="hidden" name="userSeq" value="${member.userSeq}">
<input type="hidden" name="projectSeq" value="${project.projectSeq }">

	<table class="table">
		<tr>
			<th class="table-title">분류</th>
			<td class="table-short">
				<select class="search-content-select" name="boardCategory">
					<option value="에러">에러</option>
					<option value="논의">논의</option>
				</select>
			</td>
		</tr>
		<tr>
			<th class="table-title">제목</th>
			<td class="table-title-text" ><input type="text" name="boardTitle"></td>
		</tr>
		<tr>
			<th class="table-title">내용</th>
			<td class="table-content" ><textarea name="boardContent" rows="10" cols="50" placeholder="내용을 입력하세요."></textarea></td>
		</tr>
		<tr>
			<th class="table-title">파일</th>
			<td>
				<input type="file" name="uploadFile">
			</td>
		</tr>
	</table>
	</br></br>
	<input class="button" type="submit" value="글쓰기">
	
	
</form>
</div>
</body>
</html>