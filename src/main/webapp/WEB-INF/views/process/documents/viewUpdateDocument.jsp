<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update page</title>
<style>
#container, html{
	width: 500px;
	height: 300px;
}

#content{
	margin-left: 10px;
	float:left;
	width: 96%;
	height: 100%;
}

#header, #footer, #sidebar-left{
	height: 0px;
	padding: 0px;
	border: 0px;
	width: 0px;
}

body{
	margin: 0px;
}

a{text-decoration:none;color:#000;}
table{
	width: 100%;
	
}

th{
	text-align: center;
	border-bottom: 1px solid #c2c2c2;
	font-size: 20px;
}

tr:hover{ background-color:#f5f5f5; }

input[type=text]{
	border: 0px;
	width: 98%;
	height: 30px;
	font-size: 20px;
	display: center;
}

button, input[type=button]{
	color: white;
    background-color: #384D59;
    border: 0;
    padding: 5px;
    border-radius: 5px;
    font-weight: bold;
    margin-right: 5px;
}

input[type=submit]{
	width: 100%;
	margin: 0px;
	height: 25px;
	border: 1px solid #c2c2c2;
	border-radius: 5px;
	background-color: #fff;
	color: #000;
	text-align: center;
	font-size: 14px;
}
input[type=submit]:hover{
	border-radius: 5px;
	background-color: #f5f5f5;
}
</style>
</head>
<body>
<form action="./updateDocument?documentsSeq=${documents.documentsSeq}&fileName=${documents.fileName}&realFileName=${documents.realFileName}" method="POST" enctype="multipart/form-data" id="updateForm">
<div id="headDiv">
	ㅇㅅㅇ
</div>
<div hidden="hidden">
	<input type="text" value="${documents.documentsSeq}" name="documentsSeq">
</div>
<div>
	<input type="text" value="${documents.documentsName}" name="documentsName" placeholder="문서명">
</div>
<div>
	드롭박스
</div>
<div>
	파일 업로드
	<c:choose>
		<c:when test="${documents.realFileName ne null}">
			<div style="float:left;width:50%">
				업로드된 파일 
				<a href="./fileDownload?fileName=${board.fileName}&realFileName=${board.realFileName}">
					${documents.realFileName}
				</a>
			</div>
			<div style="float:right;width:50%;">
				<input type="file" name="uploadFile">
			</div>
		</c:when>
		<c:otherwise>
			<div>
				<input type="file" name="uploadFile">
			</div>
		</c:otherwise>
	</c:choose>
</div>
<div>
	<input type="submit" value="수정" id="updateBtn">
</div>
</form>
<script>
$(document).ready(function(){
	console.log('ready');
	
	// upload file 이름추출
	var fileTarget = $('.filebox .upload-hidden');
	
	fileTarget.on('change', function(){  // 값이 변경되면
	if(window.FileReader){  // modern browser
		var filename = $(this)[0].files[0].name;
	} 
	else {  // old IE
		var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
	}
	// 추출한 파일명 삽입
	$(this).siblings('.upload-name').val(filename);
	}); // upload file end
}); // document end

// 창 닫기
$(function(){
	$('#updateBtn').click(function(){
		$('#updateForm').submit();
		setTimeout(function(){
			window.close();
		},100);
	});
});

</script>
</body>
</html>