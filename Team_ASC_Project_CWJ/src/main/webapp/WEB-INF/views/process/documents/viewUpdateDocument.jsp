<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문서관리 수정</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
#container, html{
	width: 584px;
	height: 500px;
}

#content{
	float:left;
	width: 100%;
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

.filebox input[type="file"] {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip:rect(0,0,0,0);
  border: 0;
}

.filebox label {
  display: inline-block;
  padding: .5em .75em;
  color: #999;
  font-size: inherit;
  line-height: normal;
  vertical-align: middle;
  background-color: #fdfdfd;
  cursor: pointer;
  border: 1px solid #ebebeb;
  border-bottom-color: #e2e2e2;
  border-radius: .25em;
}

/* named upload */
.filebox .upload-name {
  display: inline-block;
  padding: .5em .75em;  /* label의 패딩값과 일치 */
  font-size: inherit;
  font-family: inherit;
  line-height: normal;
  vertical-align: middle;
  background-color: #f5f5f5;
  border: 1px solid #ebebeb;
  border-bottom-color: #e2e2e2;
  border-radius: .25em;
  -webkit-appearance: none; /* 네이티브 외형 감추기 */
  -moz-appearance: none;
  appearance: none;
}


#updateBtn{
	width: 580px;
	margin: 0px;
	margin-left: 2px;
	height: 25px;
	border: 1px solid #c2c2c2;
	border-radius: 5px;
	background-color: #fff;
	color: #000;
	text-align: center;
	font-size: 14px;
}
#updateBtn:hover{
	border-radius: 5px;
	background-color: #f5f5f5;
}

.popContent{margin-left:4px;}
#headDiv{
	height: 30px;
	background-color: #0F2859;
	color: #fff;
	font-size: 24px;
}
</style>
</head>
<body>
<form id="updateForm" action="./updateDocument?documentsSeq=${documents.documentsSeq}&fileName=${documents.fileName}&realFileName=${realFileName}" method="POST" enctype="multipart/form-data">
<div id="headDiv">
	ㅇㅅㅇ
</div>
<div class="popContent">
	<label for="documentsName">문서명</label>
	<input type="text" value="${documents.documentsName}" id="documentsName" name="documentsName" placeholder="문서명">
</div>
<div class="popContent">
	<label for="dropbox">아래 영역에 드래그로 파일을 업로드 할 수 있습니다.</label>
	<br><input id="dropbox" value="드롭박스">
</div>
<div class="popContent">
	파일 업로드
	<c:choose>
		<c:when test="${documents.realFileName ne null}">
			<div style="float:left;width:100%">
				업로드된 파일 
				<a href="./downloadFile?fileName=${documents.fileName}&realFileName=${documents.realFileName}">
					${documents.realFileName}
				</a>
			</div><br>
			<div style="float:right;width:100%;">
				<input type="file" name="uploadFile">
			</div>
		</c:when>
		<c:otherwise>
			<div>
				<input type="file" name="uploadFile">
			</div>
		</c:otherwise>
	</c:choose>
	<div class="filebox">
			<input class="upload-name" value="업로드 파일" style="width:70%;" disabled="disabled">
			<label for="ex_filename">업로드</label> 
			<input type="file" id="ex_filename" class="upload-hidden" name="uploadFile">
	</div>
</div>
<div>
	<input type="button" value="수정" id="updateBtn" onclick="updateCell();">
</div>
</form>
<script>
$(document).ready(function(){
	console.log('ready');
	
	// upload file 이름추출
	const fileTarget = $('.filebox .upload-hidden');
	
	fileTarget.on('change', function(){  // 값이 변경되면
	if(window.FileReader){  // modern browser
		const filename = $(this)[0].files[0].name;
	} 
	else {  // old IE
		const filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
	}
	// 추출한 파일명 삽입
	$(this).siblings('.upload-name').val(filename);
	}); // upload file end
	
}); // document end

// 수정하고 부모창에 반영하고 창 닫기
function updateCell(){
	
	console.log(window.opener);
	$('#updateForm').submit();
	window.opener.location.reload();
	window.close();
}

/* 
$(function(){
	$('#updateBtn').click(function(){
		$('#updateForm').submit();
		setTimeout(function(){
			window.close();
		},100);
	});
}); */

</script>
</body>
</html>