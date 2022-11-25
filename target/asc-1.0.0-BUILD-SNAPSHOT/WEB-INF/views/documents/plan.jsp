
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기획안</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<%-- <link rel="stylesheet" href="${contextPath}/resources/css/bootstrap.css"/> --%>
<style>
input[type=text]{
	width: 100%;
	height: 100%;
	margin-top: 5px;
}

textarea{
	width: 100%;
	height: 100%;
	margin-top: 5px;
}

#createDate{
	border: none;
	float: right;
}

/* 문서 버튼 */
.documentsButton{
	text-decoration: none;
	float: right;
	margin-right: 5px;
	background-color: #384D59;
	border:0;
	color:white;
	padding: 5px 15px;
	font-weight: bold;
	border-radius:5px;
	
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
/* 	table,td,tr{
		border:1px solid red;
		border-collapse: collapse;
	}
	 */
	docu-table td, tr{
		border:none;
		border-collapse: collapse;
	}
</style>
</head>
<body>
<form action="viewUpdatePlan.do" method="post">
<table>
	<tr>
		<td class="documentsSelected">
			<h1>기획안</h1>
		</td>
	<tr>
	<tr>
		<td colspan="4">
		</td>
		<td colspan="2">
			<input type="submit" class="documentsButton" value="작성">
		<c:if test="${documents.teamLeader eq member.userSeq}">
			<input type="button" onclick="return deleteDocuments(this.form);" class="documentsButton" value="초기화">
		</c:if>
			<input type="button" onclick="return examplePop(this.form);" class="documentsButton" value="예문보기">
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
			<input type="text" id="documentsName" name="documentsName" class="documentsName" value="${documents.documentsName}" readonly="readonly">
		</td>
	</tr>
	<tr>
		<td colspan="5"></td>
		<td>
			<input type="text" style="width:10%;" id="createDate" name="createDate" class="createDate" value="${documents.createDate}" readonly="readonly">
		</td>
	</tr>
	<tr>
		<td>
			<input type="text" id="documentsItem1" name="documentsItem1" class="documentsItem" value="${documents.documentsItem1}" readonly="readonly">
		</td>
		<td colspan="5">
			<input type="text" id="documentsContent1" name="documentsContent1" class="documentsContent" readonly="readonly" value="${documents.documentsContent1}">
		</td>
	</tr>
	<tr>
		<td>
			<input type="text" id="documentsItem2" name="documentsItem2" class="documentsItem docu-table" value="${documents.documentsItem2}" readonly="readonly">
		</td>
		<td colspan="5">
			<input type="text" id="documentsContent2" name="documentsContent2" class="documentsContent docu-table" readonly="readonly" value="${documents.documentsContent2}">
		</td>
	</tr>
	<tr>
		<td>
			<input type="text" id="documentsItem3" name="documentsItem3" class="documentsItem" value="${documents.documentsItem3}" readonly="readonly">
		</td>
		<td colspan="5">
			<textarea rows="2" cols="100%" id="documentsContent3" class="documentsContent" name="documentsContent3" readonly="readonly">${documents.documentsContent3}</textarea>
		</td>
	</tr>
	<tr>
		<td>
			<input type="text" id="documentsItem4" name="documentsItem4" class="documentsItem" value="${documents.documentsItem4}" readonly="readonly">
		</td>
		<td colspan="5">
			<textarea rows="6" cols="100%" id="documentsContent4" class="documentsContent" name="documentsContent4" readonly="readonly">${documents.documentsContent4}</textarea>
		</td>
	</tr>
	<tr>
		<td>
			<input type="text" id="documentsItem5" name="documentsItem5" class="documentsItem" value="${documents.documentsItem5}" readonly="readonly">
		</td>
		<td colspan="5">
			<textarea rows="20" cols="100%" id="documentsContent5" class="documentsContent" name="documentsContent5" readonly="readonly">${documents.documentsContent5}</textarea>	
		</td>
	</tr>
</table>
</form>
<script src="${contextPath}/resources/js/documents.js"></script>
</body>
</html>