<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기능 정의</title>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap');
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
.processNav .li3>a {
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

a{text-decoration:none;color:#000;}

table{
	width: 95%;
}

th{
	text-align: center;
	border-bottom: 1px solid #c2c2c2;
	font-size: 20px;
}

tr:hover{ 
	background-color:#f5f5f5; 
}


input[type=text], select{
	border: 0px;
	width: 98%;
	height: 70px;
	font-size: 20px;
	display: center;
}

button, input[type=button] ,input[type=submit] {
	color: white;
    background-color: #384D59;
    border: 0;
    padding: 5px;
    border-radius: 5px;
    font-weight: bold;
    margin-right: 5px;
}
.textMiddle{
	text-align : center;
}
.deleteRow{
	text-align:center;
	color: black;
	width:20px;
	height:20px;
    background-color: #fff;
    border: 0;
    padding: 0;
    margin: 0;
    border-radius: 10px;
    font-weight: bold;
    font-size:10px;
}
#createBtn{
	width: 93%;
	float:right;
	margin: 0px 70px 0px 0px;
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

.btn {
	color: #384D59;
	padding: 7px 10px;
	font-weight: 300;
	background-color: white;
	border-radius: 15px;
	border: 1px solid #384D59;
	font-size: 15px;	
}
.nBtn {
	color: #ff3333;
	padding: 7px 10px;
	font-weight: 300;
	background-color: white;
	border-radius: 15px;
	border: 1px solid #ff3333;
	font-size: 15px;
}
.btn2 {
	float: right;
	margin-right:75px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
window.onload = function() {
	$('#taskTable tr').each(function() {
      if (!this.rowIndex) return; // skip first row
      var step = $("select[name=step] option:selected");

	//select 값에 따라 행 css 변경 
	//안됨
    });
}
function addRow() {
    var table = document.getElementById('taskTable');
    var newRow = table.insertRow();
    var cell0 = newRow.insertCell(0);
    var cell1 = newRow.insertCell(1);
    var cell2 = newRow.insertCell(2);
    var cell3 = newRow.insertCell(3);
    var cell4 = newRow.insertCell(4);
    var cell5 = newRow.insertCell(5);
    var cell6 = newRow.insertCell(6);
    var cell7 = newRow.insertCell(7);
    var cell8 = newRow.insertCell(8);
    
    
    cell0.innerHTML = '<input type="text" value="N" name="status" style="visibility:hidden;">';
    cell1.innerHTML = '<input type="text" value="1" name="taskSeq" style="visibility:hidden;">';
    cell2.innerHTML = '<input type="text" value="">';
    cell3.innerHTML = '<input type="text" value="" name="title" style="text-align:center;">';
    cell4.innerHTML = '<select class="textMiddle" name="step"><option value="분석">분석</option><option value="설계">설계</option><option value="구현">구현</option><option value="검수">검수</option></select>';
    cell5.innerHTML = '<input type="text" value="" name="mainTask">';
    cell6.innerHTML = '<input type="text" value="" name="subTask">';
    cell7.innerHTML = '<input type="text" value="" name="remark1">';
    cell8.innerHTML = '<input type="text" value="" name="remark2">';
    
    $('.btn2').show();
}
function submit1(frm) {
	
	//빈칸 있으면 return false;
	let temp = 0;
	
	$('#taskTable tr').each(function() {
      if (!this.rowIndex) return; // skip first row
      var title = $(this).children().eq(3).find("input");
      var main = $(this).children().eq(5).find("input");
      var sub = $(this).children().eq(6).find("input");

	  if(title.val()==""){
		  alert(this.rowIndex + "행의 번호를 입력해주세요");
		  temp = temp + 1;
		  return false;
	  } else if(main.val()==""){
		  alert(this.rowIndex + "행의 주요기능을 입력해주세요");
		  temp = temp + 1;
		  return false;
	  } else if(sub.val()==""){
		  alert(this.rowIndex + "행의 세부기능을 입력해주세요");
		  temp = temp + 1;
		  return false;
	  } 
	  
    });
	
	if(temp == 0){
		if(confirm('처리 하시겠습니까?') == true){
			frm.action="manageTaskList";
			frm.method="GET";
			frm.submit();
			return true;
		}
	}
}
$(document).ready(function(){
	
	$('.nBtn').on('click',function(){
		if(confirm('정말로 취소하시겠습니까?') == true){
			location.href = 'manageTask';
		}
	});
	
	$('#taskTable tr').change(function(){
		$('.btn2').show();
		
		// 현재 클릭된 Row(<tr>)
		var tr = $(this); 
		var td = tr.children(); // tr 자식 td 값
		var td0 = td.eq(0); //맨 앞 td의 값
		td0.html('<input type="text" value="U" name="status">');
	});
	
	$('.deleteRow').click(function(){
		$('.btn2').show();
		
        var checkBtn = $(this);
        var tr = checkBtn.parent().parent();
        tr.hide();
        var td = tr.children();
        var td0 = td.eq(0); //맨 앞 td의 값
		td0.html('<input type="text" value="D" name="status">');
	});
});

</script>
</head>
<body>
<nav class="processNav">
	<ul>
		<li><a href="../project/manageProject">프로젝트</a></li>
		<li><a href="../documents/manageDocuments">문서 관리</a></li>
		<li class="li3"><a href="../task/manageTask">기능</a></li>
		<li><a href="../wbs/manageWbs">일정</a></li>
		<li><a href="../implementation/viewImplementation?projectSeq=${project.projectSeq }&pageNum=1">구현</a></li>
		<li><a href="../test/manageTest">테스트</a></li>
		<li><a href="../project/viewComplete">완성</a></li>
	</ul>
</nav>
<form action="#" method="GET">
	<table id="taskTable">
		<thead>
			<tr><td></td><th width="5%" style="visibility:hidden; width:1px">상태</th><th style="visibility:hidden; width:1px" width="5%">seq</th><th width="10%">번호</th><th width="10%">단계</th><th width="20%">주요기능</th><th  width="30%">세부기능</th><th width="15%">비고1</th><th width="15%">비고2</th></tr>
		</thead>
		<tbody>
			<c:forEach var="task" items="${list}" varStatus="status">
				<tr>
					<td style="visibility:hidden; width:1px"><input type="text" value="" name="status"></td>
					<td style="visibility:hidden; width:1px"><input type="text" value="${task.taskSeq}" name="taskSeq"></td>
					<td class="textMiddle"><input type="button" value="-" class="deleteRow" style="background-color:red; border-radius:50%;"></td>
					<td><input type="text" value="${task.title}" name="title" class="textMiddle"></td>
					<td>
						<select class="textMiddle" name="step">
    						<option value="분석" <c:if test ="${task.step eq '분석'}">selected="selected"</c:if>>분석</option>
    						<option value="설계" <c:if test ="${task.step eq '설계'}">selected="selected"</c:if>>설계</option>
    						<option value="구현" <c:if test ="${task.step eq '구현'}">selected="selected"</c:if>>구현</option>
    						<option value="검수" <c:if test ="${task.step eq '검수'}">selected="selected"</c:if>>검수</option>
  						</select>
					</td>
					<td><input type="text" value="${task.mainTask}" name="mainTask"></td>
					<td><input type="text" value="${task.subTask}" name="subTask"></td>
					<td><input type="text" value="${task.remark1}" name="remark1"></td>
					<td><input type="text" value="${task.remark2}" name="remark2"></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<input type="button" onclick="addRow(taskTable)" value="+ 추가" id="createBtn">
	<div style="height:40px;"></div>
	<div class="btn2" style="display:none;">
		<input type="button" value="처리" class="btn" onclick="submit1(this.form);">
		<input type="button" value="취소" class="nBtn">
	</div>	
</form>
</body>
</html>