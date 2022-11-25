<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
	.button {
		color:white;
		background-color: #384D59;
		border:0;
		padding: 8px 15px;
		margin-left:15px;
		border-radius:5px;
		font-weight: bold;
	}
	.table-title {
		width:10%;
		height:40px;
		text-align: center;
		font-weight: bold;
	}
	.button-option {
		position:absolute;
		left:35%;
	}
	.table-content {
		height : 500px;
		overflow: auto;
		
	}
	.table-short {
		text-align: center;
		width: 15%;
	}
	.text-padding {
		padding-left: 15px;
		padding-right: 15px;
	}
	.table-title-text {
		width:10%;
		height:40px;
		font-weight: bold;
	}
	.table-title-text input {
		height: 30px;
		width: 98%;
		font-size: 16px;
	}
	.table-content input {
		height: 96%;
		width: 98%;
		font-size: 16px;
	}
	.text-deco {
		text-decoration : none;
		color : red;
	}
</style>
<title>Insert title here</title>
</head>
<body>
<div class="board-main">
<form action="./updateBoard?boardSeq=${board.boardSeq}&fileName=${board.fileName}&realFileName=${board.realFileName}" method="post"  enctype="multipart/form-data" >
	<table class="table">
		<tr>
			<td class="table-title">분류</td><td class="table-short">${board.boardCategory }</td>
			<td class="table-title">작성자</td><td class="table-short">${member.id}</td>
			<td class="table-title">완료여부</td><td class="table-short">완료<input type="radio" id="completeCheck" name="completeYn" value="Y">
							   진행중<input type="radio" id="completeCheck" name="completeYn" value="N" checked="checked"></td>
			
		</tr>
		<tr>
			<td class="table-title">제목</td><td class="text-padding table-title-text" colspan="5"><input type="text" name="boardTitle" value="${board.boardTitle}"></td>
		</tr>
		<tr>
			<td class="table-title">내용</td><td class="text-padding table-content" colspan="5"><input type="text" name="boardContent" value="${board.boardContent }"></td>
		</tr>
		<tr>
			<td class="table-title">첨부파일</td>
			<c:choose>
				<c:when test="${board.fileName ne null}">
				<td class="text-padding" colspan="5">
					<a href="/asc/board/fileDownload?fileName=${board.fileName}&realFileName=${board.realFileName}">
						${board.realFileName} 
					</a>
					<c:if test="${not empty board.fileName}">
						<a class="text-deco" href="./deleteFile?boardSeq=${board.boardSeq}">&#128473</a>
					</c:if>
					&nbsp&nbsp
					<input type="file" name="uploadFile">
				</td>
				</c:when>
				<c:otherwise>
					<input type="file" name="uploadFile">
				</c:otherwise>
			</c:choose>
		</tr>
	</table>
	</br></br>
<input class="button button-option" type="submit" value="수정">
	
	
</form>
</div>
</body>
</html>