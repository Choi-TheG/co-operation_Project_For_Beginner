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
	width: 350px;
	height: 300px;
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
body{margin: 0px;}
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
button, input[type=button]{
	color: white;
    background-color: #384D59;
    border: 0;
    padding: 5px;
    border-radius: 5px;
    font-weight: bold;
    margin-right: 5px;
}
input[type=file]{width:340px; height:30px;}

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

/* documentsName */
.input-wrapper{
	position:relative;
	margin:10px 0;
}
.input-wrapper > input{
	background:transparent;
	border: none;
	border-bottom: solid 1px #ccc;
	padding:20px 0px 5px 0px;
	font-size:14pt;
	width:340px;
}

input::placeholder{	color:transparent; }
input:placeholder-shown + label{
	color:#aaa;
	font-size:14pt;
	top:15px;
}
input:focus + label, label{
	color:#8aa1a1;
	font-size:10pt;
	pointer-events: none;
	position: absolute;
	left:0px;
	top:0px;
	transition: all 0.2s ease ;
	-webkit-transition: all 0.2s ease;
	-moz-transition: all 0.2s ease;
	-o-transition: all 0.2s ease;
}
input:focus, input:not(:placeholder-shown){
	border-bottom: solid 1px #2b96f1;
	outline:none;
}
input:focus + label{ color:#2b96f1;}
input:not(:placeholder-shown){border-bottom: 1px solid #8aa1a1;}

/* id, class */
#updateBtn{
	width: 340px;
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
.popContent{margin-left:6px;margin-bottom:20px;}
#headDiv{
	height: 34px;
	margin-bottom:20px;
	background-color: #0F2859;
	color: #fff;
	font-size: 24px;
}
#nameCell{
	margin-top: 20px;
	margin-left: 5px;
}
#link:hover, #link:focus { 
	font-weight: bold;
	animation-duration: 1s;
	animation-name: rainbowLink; 
	animation-iteration-count: infinite; 
} 
@keyframes rainbowLink {     
	0% { color: #ff2a2a; }
	15% { color: #ff7a2a; }
	30% { color: #ffc52a; }
	45% { color: #43ff2a; }
	60% { color: #2a89ff; }
	75% { color: #202082; }
	90% { color: #6b2aff; } 
	100% { color: #e82aff; }
}
.dropBox{
	height: 250px;
	overflow: auto;
	display: flex;
	justify-content: center;
	align-items: center;
	border-radius: 5px;
	border: 4px dashed #ddd;
	user-select: none;
	transition: 0.4s;
}

.active { background: #c8c8c8; }

</style>
</head>
<body>
<form id="updateForm" action="./updateDocument?documentsSeq=${documents.documentsSeq}&fileName=${documents.fileName}&realFileName=${documents.realFileName}" method="POST" enctype="multipart/form-data">
	<div id="headDiv">
		문서 관리
	</div>
	<div class="popContent input-wrapper">
		<input type="text" value="${documents.documentsName}" id="documentsName" name="documentsName" placeholder="문서명">
		<label for="documentsName">문서명</label>
	</div>
	<div class="popContent">
		<div style="font-size:14px;margin-bottom:10px;font-weight:bold">파일 업로드</div>	
			<div style="margin-bottom:20px;">
				<input type="file" name="uploadFile">
			</div>
			<div style="margin-bottom:10px;">
				<div style="font-size:14px;font-weight:bold">업로드된 파일</div>
				<div style="height:24px;margin-top:10px;">
					<a id="link" href="./downloadFile?fileName=${documents.fileName}&realFileName=${documents.realFileName}">
						${documents.realFileName}
					</a>
				</div>
			</div>
	</div>
	<div>
		<input type="button" value="수정" id="updateBtn" onclick="updateCell()">
	</div>
</form>
<script>
$(document).ready(function(){
	console.log('ready');
	
	/* let drop = document.querySelector(".dropBox");
	let text = document.querySelector(".dropBox h3");
	
	drop.addEventListener("drop", (e) => {
		e.preventDefault();
		console.log(e);
		drop.className = "dropBox";
		
		let files = [...e.dataTransfer?.files];
		
		text.innerHTML = files.map(v => v.name).join("<br/>");
		drop.classList.remove("active");
	});
	drop.addEventListener("dragover", (e) => {
		e.preventDefault();
		
		drop.classList.add("active");
	});
	drop.addEventListener("dragenter", (e) => {
		e.preventDefault();
		
		drop.classList.add("active");
	});
	drop.addEventListener("dragleave", (e) => {
		e.preventDefault();
		
		drop.classList.remove("active");
	});
	 */
}); // document end

function updateCell(){
	let formName = document.getElementById("updateForm");
	let text = document.getElementById("documentsName").value;
	
	if(text == ''){
		alert('문서명을 입력해주세요');
	} else{
		$('#updateForm').submit();
	}
}
</script>
</body>
</html>