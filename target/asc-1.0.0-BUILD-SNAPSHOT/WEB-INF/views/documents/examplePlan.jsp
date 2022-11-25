<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기획안 예시</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/documents.css"/>
<link rel="stylesheet" href="${contextPath}/resources/css/examplePlan.css"/>
</head>
<body>
<table>
	<tr>
		<td class="documentsSelected">
			기획안
		</td>
	<tr>
	<tr>
		<td colspan="4">
		</td>
		<td colspan="2">
			<input type="submit" onclick="return submit1(this.form);" class="documentsButton" value="작성">
			<div class=""></div>
			<input type="submit" onclick="return submit0(this.form);" class="documentsButton" value="초기화">
			<input type="button" onclick="javascript:history.back();" class="documentsButton" value="뒤로가기">
			
		</td>
	</tr>
	<tr>
		<td colspan="6" onclick="documentsName();">
			<input type="button" id="documentsName" name="documentsName" class="documentsName" value="예시 프로젝트 기획안">
			<div class="modal hidden" id="modal">
				<div class="bg" id="bg"></div>
				<div class="modalBox">
					<p>프로젝트 기획안 설명</p>
					<button class="closeBtn" id="closeBtn">✖</button>
				</div>
			</div>
		</td>
	</tr>
	<tr>
		<td colspan="6">
			<input type="text" id="createDate" name="createDate" value="예시 20021001" readonly="readonly">
		</td>
	</tr>
	<tr>
		<td>
			<input type="text" id="documentsItem" name="documentsItem" value="예시 이름" readonly="readonly">
		</td>
		<td colspan="5">
			<input type="text" id="documentsContent" name="documentsContent" value="예시 프로젝트 이름" readonly="readonly">
		</td>
	</tr>
	<tr>
		<td>
			<input type="text" id="documentsItem" name="documentsItem" value="예시 타이틀" readonly="readonly">
		</td>
		<td colspan="5">
			<input type="text" value="예시 프로젝트 제목" readonly="readonly" id="documentsContent" name="documentsContent">
		</td>
	</tr>
	<tr>
		<td>
			<input type="text" id="documentsItem" name="documentsItem" value="예시 주제" readonly="readonly">
		</td>
		<td colspan="5">
			<textarea rows="2" cols="100%" id="documentsContent" name="documentsContent" placeholder="예시 프로젝트 주제" readonly="readonly"></textarea>
		</td>
	</tr>
	<tr>
		<td>
			<input type="text" id="documentsItem" name="documentsItem" value="내용" readonly="readonly">
		</td>
		<td colspan="5">
			<textarea rows="6" cols="100%" id="documentsContent" name="documentsContent" readonly="readonly">예시 프로젝트 내용</textarea>
		</td>
	</tr>
	<tr>
		<td>
			<input type="text" id="documentsItem" name="documentsItem" value="예시 구체화방향" readonly="readonly">
		</td>
		<td colspan="5">
			<textarea rows="20" cols="100%" id="documentsContent" name="documentsContent" readonly="readonly">예시 프로젝트 내용을 구현하기 위한 기능</textarea>	
		</td>
	</tr>
</table>
<script src="${contextPath}/resources/js/examplePlan.js"></script>
</body>
</html>