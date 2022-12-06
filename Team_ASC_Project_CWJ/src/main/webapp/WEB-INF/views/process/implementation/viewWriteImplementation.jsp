<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		curDate.value = today;
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
		width:100%;
		height:100%;
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
		.table-content > textarea {
		width:100% !important;
		height:100% !important;
		font-size: 16px;
		display:inline-table;
		box-sizing: border-box;
		resize:none;
		float:left;
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
		.table-title-text input {
		height: 30px;
		width: 98%;
		font-size: 16px;
	}
		.table-title-text {
		height:40px;
		font-weight: bold;
	}
</style>

<title>Insert title here</title>
</head>
<body>
<div class="board-main">
<form action="./writeImplementation" method="POST" enctype="multipart/form-data" name="form1">
<input type="hidden" name="userSeq" id="userSeq_id" value="${member.userSeq}">
<input type="hidden" name="projectSeq" id="projectSeq_id" value="${project.projectSeq }">
<input type="hidden" name="userId" id="id" value="${member.id}">
<input type="hidden" name="pwd" id="password" value="${member.pwd}">
</br></br>
	<table class="table">
		<tr>
			<th class="table-title">제목</th>
			<td class="table-title-text" ><input class="selectDate" type="date" name="boardTitle" id="currentDate" onchange="selectDate();" /></td>
		</tr>
		<tr>
			<th class="table-title">내용</th>
			<td class="table-content" id="ajaxData" >
					<textarea name="boardContent" rows="10" cols="50" id="content">${not empty str?str:'' }</textarea>	
			</td>
		</tr>
		<tr>
			<th class="table-title">파일</th>
			<td>
				<input type="file" name="uploadFile">
			</td>
		</tr>
	</table>
	</br></br>
	<input class="button" type="submit" onclick="boardNullCheck(); return false;" value="글쓰기">
	
</form>
</div>
<script type="text/javascript">
currentDate.onchange = function selectDate(e){
	let date = e.target.value;
	let userSeq = document.getElementById('userSeq_id').value;
	let projectSeq = document.getElementById('projectSeq_id').value;
	$.ajax({
		type:'get',
		url:'./getSchedule?projectSeq='+projectSeq+'&userSeq='+userSeq+'&boardTitle='+date,
		data:'text',
		success:function(data, status) {
		 	var html = "";
		 	html += '<textarea name="boardContent" rows="10" cols="50" id="content">';
			html += data;
			html += '</textarea>';
			document.getElementById('ajaxData').innerHTML = html;
		},
		error:function(data, status) {
			console.log(status);
		}
	})
}

 function boardNullCheck() {
	let frm = document.form1;
	if(!frm.boardContent.value) {
		alert("내용을 입력하세요");
		frm.boardContent.focus();
		return false;
	} else {
		frm.submit();
	}
}

</script>
</body>
</html>