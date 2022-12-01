<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문서 관리</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
/*  processNavi */
.processNav>ul {
	list-style: none;
	display: inline-block;
	width: 95%;
	height: 100px;
	text-align: center;
}
.processNav>ul>li {
	float: left;
}
.processNav>ul>li>a {
	border: 2px solid white;
	background-color: #F1F3F5;
	color: #384D59;
	text-decoration: none;
	font-size: 20px;
	display: block;
	width: 130px;
	padding: 30px 30px;
}
.processNav>ul>li>a:hover {
	border: 5px solid #0F2859;
	background-color: white;
	color: #384D59;
	text-decoration: none;
	font-size: 20px;
	font-weight: bold;
	display: block;
	width: 130px;
	padding: 30px 30px;
}
.processNav .li2>a {
	border: 5px solid #0F2859;
	background-color: white;
	color: #384D59;
	text-decoration: none;
	font-size: 20px;
	font-weight: bold;
	display: block;
	width: 130px;
	padding: 30px 30px;
}
.btnClick{
   width: 100px; 
   height: 40px; 
   border: 0px;
   border-radius: 5px; 
   font-size: 16px; 
   font-weight: bold; 
   text-align: center;
   color: white;
   background-color: #384D59;
}
/* //////////////////////////////// */
/* documents */
/* //////////////////////////////// */
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
	height: 70px;
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
.documentsSide{
	width:100%;
	height: 25px;
	color: white;
    background-color: #384D59;
    border: 0;
    padding: 5px;
    border-radius: 5px;
    font-weight: bold;
    margin-right: 5px;
}

#documentsName{
	text-align: center;
}
#createBtn{
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
#createBtn:hover{
	border-radius: 5px;
	background-color: #f5f5f5;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<nav class="processNav">
	<ul>
		<li><a href="../project/manageProject">프로젝트</a></li>
		<li class="li2"><a href="../documents/manageDocuments">문서 관리</a></li>
		<li><a href="../function/manageFunction">기능</a></li>
		<li><a href="../wbs/manageWbs">일정</a></li>
		<li><a href="../implementation/viewImplementation">구현</a></li>
		<li><a href="../test/manageTest">테스트</a></li>
		<li><a href="../project/viewComplete">완성</a></li>
	</ul>
</nav>
<div>
<h1>문서 관리</h1>
</div>
<div>
	<input type="button" value="완료" id="complete2" class="btnClick" style="float:right">
</div>
<form action="uploadFile" method="POST" enctype="multipart/form-data">
<table id="documentsTable">
	<tr><th width="30%">문서명</th><th width="35%">파일</th><th width="15%">업로드일자</th><th width="10%">작성자</th><th style="width:8%;border-bottom:none;background-color:none;">수정</th></tr>
	<c:forEach var="documents" items="${list}" varStatus="index">
		<tr><td hidden="hidden"><input type="text" value="${documents.documentsSeq}" name="documentsSeq"></td><td hidden="hidden"></td></tr>
		<tr>
			<td>
				<a onclick="updateBtn(${documents.documentsSeq});">
				${documents.documentsName}
				<input type="hidden" value="${documents.documentsName}" name="documentsName" class="documentsName" id="documentsName${documents.documentsSeq}" placeholder="문서명" readonly="readonly">
				</a>
			</td>
			<td>
				<div class="filebox">
				<c:choose>
					<c:when test="${documents.fileName ne null}">
						<input type="hidden" value="${documents.fileName}" name="fileName">
						<input type="hidden" value="${documents.realFileName}" name="realFileName">
						<a href="./downloadFile?documentsSeq=${documents.documentsSeq}&fileName=${documents.fileName}&realFileName=${documents.realFileName}">
							${documents.realFileName}
							<input type="hidden" value="${documents.realFileName}" id="download${documents.documentsSeq}" style="width:100%;" disabled="disabled">
						</a>
					</c:when>
				</c:choose>
				</div>
			</td>
			<td>
				<input type="hidden" value="${documents.updateTime}" name="updateTime" readonly="readonly">
				${documents.updateTime}
			</td>
			<td>
				<input type="hidden" value="${documents.writer}" name="writer" id="writer${documents.documentsSeq}" readonly="readonly">
				${documents.writer}
			</td>
			<td>
				<input type="button" onclick="updateBtn(${documents.documentsSeq});" value="수정" style="width:90%;margin-bottom:3px;">
				<%-- <input type="button" id="updateBtn${documents.documentsSeq}" value="수정" style="width:90%;margin-bottom:3px;"> --%>
				<br/>
				<input type="button" value="삭제" onclick="deleteBtn(${documents.documentsSeq});" style="width:90%;">
			</td>
		</tr>
	</c:forEach>
</table>
<input type="button" onclick="location.href='./createDocument'" value="+ 추가" id="createBtn">
</form>
<script>
$(document).ready(function() {
	console.log('ready');
	
	$("#complete2").on("click", function() {
		
		let message = confirm('현재 과정을 완료하시겠습니까?');
		
		if(message == true) {
			alert("완료");
			$(".li2>a").css({"border" : "2px solid white", "background" : "#faf43e", "color" : "white", "text-decoration" : "none", "font-size" : "20px"})
			return true;
		} else {
			return false;
		}
		
	}); // #complete2 end
	
	// 이름 셀 클릭 시 수정 페이지로 이동
	
	
	// 파일 셀 클릭 시 파일 다운로드
	
	
}); // document end

// 팝업창 위치 화면 중앙으로
function updateBtn(seq){
	window.screen.width // 좌우화면 크기
	window.screen.height // 상하화면 크기
	let popupWidth = 600;
	let popupHeight = 500;
	let popupX = (window.screen.width /2) - (popupWidth /2); // 팝업창 가로크기(X축) 1/2
	let popupY = (window.screen.height /2) - (popupHeight /2); // 팝업창 세로크기(Y축) 1/2
	window.open("./viewUpdateDocument?documentsSeq="+seq,"문서 수정","width="+popupWidth+", height="+popupHeight+", top="+popupY+", left="+popupX+", directories=0, location=0, menubar=0, toolbar=0, scrollbars=0, status=1");
	/* window.opener="nothing";
	window.open('','_parent','');
	window.close(); */
}


// 삭제 버튼 confirm
function deleteBtn(seq){
	let check = confirm('삭제하시겠습니까?');
	if(check){
		location.href='deleteDocument?documentsSeq='+seq;
	}
	return check;
}

</script>
</body>
</html>