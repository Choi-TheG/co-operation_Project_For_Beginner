<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기획안 작성</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/bootstrap.css"/>
<style>
input[type=text]{
	width: 100%;
	margin-top: 5px;
}

textarea{
	width: 100%;
	margin-top: 5px;
	padding: 1px 2px;
}

#createDate{
	border: none;
	float: right;
}

/* 문서 버튼 */
.documentsButton{
	text-decoration: none;
	color: black;
	float: right;
	margin-right: 5px;
}

/* 문서 버튼 마우스 반응 */
.documentsButton:hover{
	text-decoration: none;
	color: tomato;
}

/* 문서 이름 */
.documentsName{
	font-size: 18px;
	font-style: bold;
	font-weight: bolder;
	border: none;
	width: 100%;
}
#sm3{
		background-color:#0F2859;
		border-radius: 5px;
		color:white;
		opacity:1.0;
		font-weight: bold;
	}
</style>
</head>
<body>
<form action="updatePlan.do" method="post">
<table>
	<tr>
		<td class="documentsSelected">
			<h1>기획안</h1>
		</td>
	<tr>
	<tr>
		<td colspan="6">
			<input type="submit" onclick="return confirm('수정하시겠습니까?');" class="documentsButton" value="작성 완료">
			<input type="button" onclick="return deleteDocuments(this.form);" class="documentsButton" value="초기화">
			<input type="button" onclick="return historyBack();" class="documentsButton" value="뒤로가기">
		</td>
	</tr>
	<tr>
		<td>
			<input type="hidden" name="documentsSeq" value="${documents.documentsSeq}">
			<input type="hidden" name="projectSeq" value="${documents.projectSeq}">
			<input type="hidden" name="pageNum" value="${documents.pageNum}">
		</td>
	</tr>
	<tr>
		<td>
			<input type="text" id="documentsName" name="documentsName" class="documentsName" value="${documents.documentsName}">
		</td>
	</tr>
	<tr>
		<td colspan="5"></td>
		<td>
			<input type="text" style="width:10%;" id="createDate" name="createDate" pattern="\d{8}" title="19940816 형식으로 입력해주세요" maxlength="8" value="${documents.createDate}">
		</td>
	</tr>
	<tr>
		<td>
			<input type="text" id="documentsItem1" name="documentsItem1" value="${documents.documentsItem1}">
		</td>
		<td colspan="5">
			<input type="text" id="documentsContent1" name="documentsContent1" value="${documents.documentsContent1}">
		</td>
	</tr>
	<tr>
		<td>
			<input type="text" id="documentsItem2" name="documentsItem2" value="${documents.documentsItem2}">
		</td>
		<td colspan="5">
			<input type="text" id="documentsContent2" name="documentsContent2" value="${documents.documentsContent2}">
		</td>
	</tr>
	<tr>
		<td>
			<input type="text" id="documentsItem3" name="documentsItem3" value="${documents.documentsItem3}">
		</td>
		<td colspan="5">
			<textarea rows="2" cols="100%" id="documentsContent3" name="documentsContent3">${documents.documentsContent3}</textarea>
		</td>
	</tr>
	<tr>
		<td>
			<input type="text" id="documentsItem4" name="documentsItem4" value="${documents.documentsItem4}">
		</td>
		<td colspan="5">
			<textarea rows="6" cols="100%" id="documentsContent4" name="documentsContent4">${documents.documentsContent4}</textarea>
		</td>
	</tr>
	<tr>
		<td>
			<input type="text" id="documentsItem5" name="documentsItem5" value="${documents.documentsItem5}">
		</td>
		<td colspan="5">
			<textarea rows="20" cols="100%" id="documentsContent5" name="documentsContent5">${documents.documentsContent5}</textarea>
		</td>
	</tr>
</table>
</form>
<script src="${contextPath}/resources/js/documents.js"></script>
</body>
</html>