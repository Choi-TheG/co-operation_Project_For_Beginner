<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	window.onload = function() {
		today = new Date();
		limitToday = today.toISOString().split("T")[0];
		today = today.toISOString().slice(0,10);
		curDate = document.getElementById("currentDate");
		curDate.value = document.getElementById("title").value;
		document.getElementById("currentDate").setAttribute("max", limitToday);
	}
		 
</script>
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
	.text-deco {
		text-decoration : none;
		color : red;
		border:none;
		background-color: white; 
	}
	textarea {
		resize:none;
	}
</style>
<title>Insert title here</title>
</head>
<body>
<div class="board-main">
<form action="./updateImplementation?boardSeq=${board.boardSeq }&fileName=${board.fileName}&realFileName=${board.realFileName}" method="POST" enctype="multipart/form-data" >
<input type="hidden" name="userSeq" value="${member.userSeq}">
<input type="hidden" name="projectSeq" value="${project.projectSeq }">
<input type="hidden" name="boardSeq" value="${board.boardSeq }">
</br></br>
	<table class="table">
	
		<tr>
			<th class="table-title">제목</th>
			<td class="table-title-text" ><input type="date" name="boardTitle" id="currentDate" />
			<input type="hidden" id="title" value="${board.boardTitle }" />
			</td>
		</tr>
		<tr>
			<th class="table-title">내용</th>
			<td class="table-content" ><textarea name="boardContent" rows="10" cols="50" >${board.boardContent }</textarea></td>
		</tr>
		<tr>
			<th class="table-title">파일</th>

			<c:choose>
				<c:when test="${board.fileName ne null}">
				<td class="text-padding" colspan="5">
					<a href="./fileDownload?fileName=${board.fileName}&realFileName=${board.realFileName}">
						${board.realFileName} 
					</a>
					<c:if test="${not empty board.fileName}">
						<input type="button" class="text-deco" id="deleteFileBtn" value="&#128473" />
						<input type="hidden" id="deleteFileBoard" value="${board.boardSeq}">
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
	<input class="button" type="submit" value="수정">
	
</form>
</div>
<script type="text/javascript">

$('#deleteFileBtn').on('click', function() {

	let boardSeq = $('#deleteFileBoard').attr('value');
	let message = confirm("첨부파일을 삭제하시겠습니까?");
	if(message){
	$.ajax({
		type:'delete',
		url:'./deleteFile/'+boardSeq,
		success:function(response){
			console.log("success");
		},
		error:function(e) {
			console.log("error");
			location.reload();
		},
		complete:function(response) {
			console.log("comlete");
		}
	});//ajax
	}
});//deleteFile
</script>
</body>
</html>