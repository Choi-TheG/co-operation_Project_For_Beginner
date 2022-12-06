<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	 whatIsSeq = function(seq) {
		$('#deleteFileBtn_'+seq).one('click', function() {
			let boardSeq = $('#deleteFileBoard').attr('value');
			let message = confirm("첨부파일을 삭제하시겠습니까?");
			if(message){
			$.ajax({
				type:'delete',
				url:'./deleteFile/'+seq,
				success:function(data,response){
					let jsonBoolean = JSON.parse(data);
	                if(jsonBoolean){
					console.log("success");
					location.reload();
	                }
				},
				error:function(e) {
					console.log("error");
				},
				complete:function(response) {
					console.log("comlete");
				}
			});//ajax
			}
		});//deleteFile
		
		$('#deleteBoardBtn_'+seq).one('click', function() {
			let message = confirm("게시글을 삭제하시겠습니까?");
			if(message){
			$.ajax({
				type:'delete',
				url:'./deleteImplementation/'+seq,
				success:function(data,response){
					let jsonBoolean = JSON.parse(data);
	                if(jsonBoolean){
					console.log("success");
					location.reload();
	                }
				},
				error:function(e) {
					console.log("error");
				},
				complete:function(response) {
					console.log("comlete");
				}
			});//ajax
			}
		});//deleteBoard
		
		
 }//whatIsSeq
	
 });//ready 
 </script>
<title>구현</title>

<style type="text/css">
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
.processNav .li5>a {
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
	a {
		text-decoration: none;
		color:black;
	}
	.board-main {
		width:68%;
		position:relative;
		left:18%;
		float:center;
		top:5%;
	}
	.table {
		width:850px;
		/* border-collapse: collapse;	 */
		table-layout: fixed;
	}
	th {
		border-bottom: 2px solid gray;
		height:30px;
		font-size: 20px;
	}
	td {
		height:40px;
		border-bottom: 1px solid gray;
		line-height: 40px;
		border-right: 1px solid gray;
	}
	.button-write {
		color:white;
		background-color: #384D59;
		border:0;
		padding: 5px 10px;
		border-radius:5px;
		font-weight: bold;
		float:center; 	
	}
.accordion {
  background-color:#0F2859;
  color: white;
  cursor: pointer;
  padding: 18px;
  width: 82%;
  border: none;
  border-bottom:1px solid gray;
  font-weight:bold;
  outline: none;
  font-size: 18px;
  transition: 0.4s;
}

.active, .accordion:hover {
  	border: 5px solid #0F2859;
	background-color: white;
	color: #384D59;
	text-decoration: none;
	font-size: 20px;
	font-weight: bold;
	display: block;
}

.panel {
  padding: 0 18px;
  display: none;
  background-color: white;
  overflow: hidden;
}
.accordion .acc-title {
	width:80%; 
	padding-right:55%;
    text-align: left;
	/* background-color: white; */
}
.acc-id {
	text-align: center;
	/* background-color: blue; */
	padding:0 5%;
}
.content {
	height:200px;
	overflow: auto;
	width: 82%;
}
  .edit-button {
      color:white;
      background-color: #384D59;
      padding: 5px 7px;
      border:0;
      border-radius:5px;
      font-weight: bold;
   }
	.text-deco {
		text-decoration : none;
		color : red;
		border:none;
		background-color: white; 
	}
	.button {
		color:white;
		background-color: #384D59;
		border:0;
		padding: 5px;
		border-radius:5px;
		font-weight: bold;
	}
	.page-option {
		position:relative;
		text-align: center;
		margin-right:15%;
	}
	.search-option {
		position:relative;
		left:25%;
	}
	.search-button {
		padding: 6px 10px;
		margin-left: 30px;
	}
	.search-content-select {
		text-align:center;
		width: 120px;
		height: 30px;
		margin-right: 5px;
	}
	.search-content-text {
		width: 150px;
		height: 23px;
	}
	.search-date {
		margin:6px 10px;
		width: 120px;
		height: 25px;
	}
</style>
</head>
<body>
<nav class="processNav">
	<ul>
		<li><a href="../project/manageProject">프로젝트</a></li>
		<li><a href="../documents/manageDocuments">문서 관리</a></li>
		<li><a href="../task/manageTask">기능</a></li>
		<li><a href="../wbs/manageWbs">일정</a></li>
		<li class="li5"><a href="../implementation/viewImplementation?pageNum=1&projectSeq=${project.projectSeq }">구현</a></li>
		<li><a href="../test/manageTest">테스트</a></li>
		<li><a href="../project/viewComplete">완성</a></li>
	</ul>
</nav>
<div class="board-main">

<h1>개발일지</h1>

<div class="">
<input type="hidden" id="projectSeq" value="${project.projectSeq }">
<c:forEach var="board" items="${boardList}">
	<div>
		<button class="accordion">
			<span class="acc-title" name="boardTitle">${board.boardTitle } 개발일지</span>
			<span class="acc-id" name="userName">${board.name }</span>
		</button>
		<div class="panel">
			<p class="content" name="boardContent">${board.boardContent }</p>
			<c:if test="${not empty board.fileName }">
				<hr style="width:82%; margin-right: 20%;">
			
			<p>
				<span>
					<a href="./fileDownload?fileName=${board.fileName}&realFileName=${board.realFileName}" name="realFileName">&#128190;${board.realFileName }</a>
					<c:if test="${member.userSeq eq board.userSeq }">
					<input type="button" class="text-deco" id="deleteFileBtn_${board.boardSeq}" onmouseover="whatIsSeq(${board.boardSeq});" value="&#128473">
					<input type="hidden" id="deleteFileName" value="${board.fileName}">
					<input type="hidden" id="deleteFileBoard" value="${board.boardSeq}">
					</c:if>
				</span>
				
			</c:if>
			<c:if test="${member.userSeq eq board.userSeq }">
				<hr style="width:82%; margin-right: 20%;">
				<p>
				<span>
					<a href="./viewUpdateImplementation?boardSeq=${board.boardSeq}"><input class="edit-button" type="button" value="수정"></a>
					<input class="edit-button" type="button" id="deleteBoardBtn_${board.boardSeq}" onmouseover="whatIsSeq(${board.boardSeq});" value="삭제" />
				</span>
				</p>
			</c:if>
			</p>
			
		</div>
	</div>
</c:forEach>
</div>
</br>
</br>
	<a class="button-write" href="./viewWriteImplementation?projectSeq=${project.projectSeq}&userSeq=${member.userSeq}">일지작성</a>
</br></br>
<div>
<form action="#" method="GET">
<div class="search-option">
	<input type="hidden" name="projectSeq" value="${project.projectSeq }" />
	<input class="search-date" type="date" name="boardTitle" />
	
<%-- 	<select  class="search-content-select" type="button" data-bs-toggle="dropdown" aria-expanded="false" name="teamMember">
		<option value="">-- 작성자 --</option>
		<c:forEach var="teamMember" items="${teamMemberList }">
			<option value="" name="selectTeamMember">${teamMember.name }</option>
		</c:forEach>
	</select> --%>
	
	
	<input class="search-content-text" type="text" name="keyword">
	
	<input class="button search-button" type="button" value="검색" onclick="return submit1(this.form);">
	
</div>
	
	
</form>
</div>
</br>
<c:choose>
	<c:when test="${empty searchBoard }">
		<div class="page-option">
		 <c:forEach var="num" items="${pageRange}" varStatus="status"> 
		 	<a href="#" onclick="page(${status.count})" name="pageNum">${status.count}</a>
		 </c:forEach> 
		</div>
	</c:when>
	<c:otherwise>
		<div class="page-option">
		 <c:forEach var="num" items="${pageRange}" varStatus="status"> 
		 	<a href="../implementation/searchImplementationList?projectSeq=${project.projectSeq }&boardTitle=${searchBoard.boardTitle}&keyword=${searchBoard.keyword}&pageNum=${status.count}&totalBoardNum=${page.totalBoardNum}"  name="pageNum">${status.count}</a>
		 </c:forEach> 
		</div>
	</c:otherwise>
</c:choose>

</br>
</br>
</div>
<script>
	var acc = document.getElementsByClassName("accordion");
	var i;
	
	for (i = 0; i < acc.length; i++) {
	  acc[i].addEventListener("click", function() {
	    this.classList.toggle("active");
	    var panel = this.nextElementSibling;
	    if (panel.style.display === "block") {
	      panel.style.display = "none";
	    } else {
	      panel.style.display = "block";
	    }
	  });
	}
</script>

<script type="text/javascript">
	function page(currentPage){
		location.href = "../implementation/viewImplementation?projectSeq="+${project.projectSeq }+"&pageNum=" + currentPage;
	}
	function submit1(frm) {
		frm.action="../implementation/searchImplementationList?projectSeq="+${project.projectSeq };
		frm.method="GET";
		frm.submit();
		return true;
	}
</script>

</body>
</html>