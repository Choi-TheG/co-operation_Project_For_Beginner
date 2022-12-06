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
//////////////////////////////////////
///////////// 문서관리 유물 /////////////
//////////////////////////////////////

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
</head>
<body>
<form action="uploadFile" method="POST" enctype="multipart/form-data">
<table id="documentsTable">
	<tr><th width="30%">문서명</th><th width="35%">파일</th><th width="15%">업로드일자</th><th width="10%">작성자</th><th style="width:8%;border-bottom:none;background-color:none;">수정</th></tr>
	<c:forEach var="documents" items="${list}" varStatus="index">
		<tr><td hidden="hidden"><input type="text" value="${documents.documentsSeq}" name="documentsSeq"></td><td hidden="hidden"></td></tr>
		<tr>
			<td>
				<a onclick="updateBtn(${documents.documentsSeq});"><input type="text" value="${documents.documentsName}" name="documentsName" class="documentsName" id="documentsName${documents.documentsSeq}" placeholder="문서명" readonly="readonly"></a>
			</td>
			<td>
				<input type="hidden" value="${documents.fileName}" name="fileName">
				<input type="hidden" value="${documents.realFileName}" name="realFileName">
				<a href="./downloadFiles?documentsSeq=${documents.documentsSeq}"></a>
			</td>
			<td>
				<input type="text" value="${documents.updateTime}" name="updateTime" class="updateTime" readonly="readonly">
			</td>
			<td>
				<input type="text" value="${documents.writer}" name="writer" id="writer${documents.documentsSeq}" readonly="readonly">
			</td>
			<td>
				<input type="button" onclick="viewUpdateBtn(${documents.documentsSeq});" value="수정" style="width:90%;margin-bottom:3px;">
				<input type="button" value="삭제" onclick="deleteBtn(${documents.documentsSeq});" style="width:90%;">
			</td>
		</tr>
	</c:forEach>
</table>
<input type="button" onclick="location.href='createDocument.do'" value="+ 추가" id="createBtn">
</form>

<!-- ////////////////////////////////////////script////////////////////////////////////// -->
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
	
	// 수정 시 팝업창 닫고 새로고침
	const updateTime = $('.updateTime');
	
	updateTime.on('change',function(){
		
	});
	
}); // document end

function viewUpdateBtn(seq){
	
	var option = "width=600,height=500, top=0%, left=0%, location=1, status=1";
	window.open("./viewUpdateDocument?documentsSeq="+seq,"_parent",option);
	window.opener="nothing";
	/* window.open('','_parent',''); */
}

function deleteBtn(documentsSeq){
	const check = confirm('삭제하시겠습니까?');
	if(check){
		location.href='deleteDocument?documentsSeq='+documentsSeq;
	}
	return check;
}

</script>
</body>
</html>