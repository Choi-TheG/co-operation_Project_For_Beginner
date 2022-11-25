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
		left:25%;
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
	.button-option-list {
		position:relative;
		left:58%;
	}
</style>

</head>
<body>
<div class="board-main">
<input type="hidden" name="projectSeq" value="${project.projectSeq }">
	<table class="table">
		<tr>
			<td class="table-title">분류</td><td class="table-short">${board.boardCategory }</td>
			
			<td class="table-title">작성자</td><td class="table-short">${member.id}</td>
			<td class="table-title">완료여부</td>
				<c:choose>
					<c:when test="${board.completeYn eq 'N' }">
					<td class="table-short">진행중</td></c:when>
				<c:otherwise>
					<td class="table-short">완료</td></c:otherwise>
				</c:choose>
		</tr>
		<tr>
			<td class="table-title">제목</td><td class="text-padding" colspan="5">${board.boardTitle}</td>
			
		</tr>
		<tr>
			<td class="table-title">내용</td><td class="table-content text-padding" colspan="5">${board.boardContent}</td>
		</tr>
		<tr>
			<td class="table-title">첨부파일</td>
				<c:if test="${board.fileName ne null}">
			<td class="text-padding" colspan="5">
				<a href="./fileDownload?fileName=${board.fileName}&realFileName=${board.realFileName}">
					${board.realFileName}
				</a>
			</td>
			</c:if>
		</tr>
		</table>
	</br>
	
			<c:choose>
			<c:when test="${member.userSeq == board.userSeq && board.completeYn eq 'N' || member.id eq 'admin' 
							|| project.teamLeaderSeq == member.userSeq && board.completeYn eq 'N'}">
		<div class="button-option">
					<a href="../board/viewUpdateBoard?boardSeq=${board.boardSeq}"><input  class="button" type="button"  value="수정"></a>
					<a href="../board/deleteBoard?boardSeq=${board.boardSeq}&projectSeq=${project.projectSeq }"><input class="button" type="button" onclick="return confirm('정말로 삭제하시겠습니까 ?');" value="삭제"></a>
		</div>		
					<a class="button-option-list" href="./boardListPaging?projectSeq=${project.projectSeq }&pageNum=1"><input class="button" type="button"  value="리스트"></a>
			
			</c:when>
			<c:otherwise>
				<a class="button-option-list" href="./boardListPaging?projectSeq=${project.projectSeq }&pageNum=1"><input class="button" type="button"  value="리스트"></a>
			</c:otherwise> 
			</c:choose>
	

</div>
</body>
</html>