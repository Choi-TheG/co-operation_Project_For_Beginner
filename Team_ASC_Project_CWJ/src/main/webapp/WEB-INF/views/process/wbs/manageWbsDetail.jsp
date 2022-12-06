<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WBS 상세페이지</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap');
table{
	width: 95%;
}

th{
	text-align: center;
	border-bottom: 1px solid #c2c2c2;
	font-size: 20px;
	background-color:#ffc054;
}

#subTask{
	text-align: center;
	border-bottom: 1px solid #c2c2c2;
	font-size: 40px;
}
tr:hover{ }


button, input[type=button] {
	color: white;
    background-color: #384D59;
    border: 0;
    padding: 5px;
    border-radius: 5px;
    font-weight: bold;
    margin-right: 5px;
}
textarea{
	border: 0px;
	padding:0px;
	margin : 0 auto;
	width: 100%;
	height:50px;
	text-align:left;
	font-size: 20px;
	border: solid 2px #1E90FF;
	border-radius: 5px;
}
input[type=text]{
	border: 0px;
	padding:0px;
	margin : 0 auto;
	width: 100%;
	height:50px;
	text-align:center;
	font-size: 20px;
}
input[type=date],input[type=time]{
	border: 0px;
	padding:0px;
	margin : 0 auto;
	width: 95%;
	height:50px;
	text-align:center;
	font-size: 14px;
}
input[type=checkbox]{
	border: 0px;
	padding:0px;
	margin:0px;
	width: 90%;
	height:20px;
	text-align:center;
	font-size: 10px;
}
#createBtn{
	width: 86.5%;
	float:left;
	margin: 0px 77px 0px 0px;
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
.btn1 {
	float: left;
	margin-right:75px;
}
.btn2 {
	float: right;
	margin: 0px 200px 0px 0px;
}
#updateReasonTable td{
	text-align:center;
}
#updateReasonDiv{
	width:25%;
	margin-left:auto;
	margin-right:auto;
}
#updateReasonSelect{
	width:100%;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
function cancel(taskSeq){
	if(confirm('정말로 취소하시겠습니까?') == true){
		location.href = 'manageWbsDetail?taskSeq=' + taskSeq;
	}
}
function submit1(frm) {//처리 버튼
	var temp = 0;
	$('#detailTable tr').each(function() {//행 전체 for문 검색
		if (this.rowIndex > 1){
	    	  var work = $(this).children().eq(0).find("textarea");
		      var date = $(this).children().eq(1).find("input");
		      var startTime = $(this).children().eq(2).find("input");
		      var endTime = $(this).children().eq(3).find("input");
		      var status = $(this).children().eq(7).find("input");
				
		      if(work.val()==""){
				  alert(this.rowIndex-1 + "행의 작업을 입력해주세요");
				  temp = temp + 1;
				  return false;
			  } else if(date.val()==""){
				  alert(this.rowIndex-1 + "행의 일자를 입력해주세요");
				  temp = temp + 1;
				  return false;
			  } else if(startTime.val()==""){
				  alert(this.rowIndex-1 + "행의 시작시간을 입력해주세요");
				  temp = temp + 1;
				  return false;
			  } else if(endTime.val()==""){
				  alert(this.rowIndex-1 + "행의 종료시간을 입력해주세요");
				  temp = temp + 1;
				  return false;
			  } else if(startTime.val() > endTime.val()){
				  alert(this.rowIndex-1 + "행의 종료시간이 시작시간보다 빠릅니다");
				  temp = temp + 1;
				  return false;
			  } else if(status.val()=="R"){
				  alert(this.rowIndex-1 + "행의 수정사유를 입력해주세요");
				  temp = temp + 1;
				  return false;
			  }
	   }
	});
	
	if(temp == 0){ // 이상 없으면 처리 유무 알람 표시
 	   if(confirm('처리 하시겠습니까?') == true){
 		   frm.action="updateWbsDetail";
 		   frm.method="GET";
 		   frm.submit();
 		   return true;	
   	   }
    }  
}	
function addRow(startDate,endDate) {//신규 행 추가
    var table = document.getElementById('detailTable');
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
    
    cell0.innerHTML = '<textarea name="operation"></textarea>';
    cell1.innerHTML = '<input type="date" value="'+startDate+'" name="date" min="' + startDate + '" max="' + endDate + '">';
    cell2.innerHTML = '<input type="time" value="" name="startTime">';
    cell3.innerHTML = '<input type="time" value="" name="endTime">';
    cell4.innerHTML = '<input type="text" value="" name="leadTime" readonly>';
    cell5.innerHTML = '<input type="checkbox" value="N" name="finishYn" disabled>';
    cell6.innerHTML = '<textarea name="updateReason" disabled></textarea>';
    cell7.innerHTML = '<input type="hidden" value="N" name="status">';
    cell8.innerHTML = '<input type="hidden" value="0" name="wbsDetailSeq">';
    
    $('.btn2').show();
}
$(document).ready(function () {
	var operation = "";
	var date = "";
	var startTime = "";
	var endTime = "";
	var updateReason = "";
	$('#detailTable tr').click(function(){ //클릭시, 변경 전 데이터 삽입
		// 현재 클릭된 Row(<tr>)
		var tr = $(this); 
		var td = tr.children(); // tr 자식 td 값
		
		operation = $(this).children().eq(0).find("textarea").val();
	    date = $(this).children().eq(1).find("input").val();
	    startTime = $(this).children().eq(2).find("input").val();
	    endTime = $(this).children().eq(3).find("input").val();
	    updateReason = $(this).children().eq(6).find("textarea").val();
		
	});
	
	$('#detailTable tr').change(function(){//변경시, 변경 후 데이터 변경 전 데이터랑 비교
		// 현재 클릭된 Row(<tr>)
		var tr = $(this); 
		var td = tr.children(); // tr 자식 td 값
		
		var changeOperation = $(this).children().eq(0).find("textarea").val();
	    var changeDate = $(this).children().eq(1).find("input").val();
	    var changeStartTime = $(this).children().eq(2).find("input").val();
	    var changeEndTime = $(this).children().eq(3).find("input").val();
	    var changeUpdateReason = $(this).children().eq(6).find("textarea").val();
	    
		if(changeStartTime != "" && changeEndTime != "" && changeStartTime > changeEndTime){
			alert("종료일자가 시작일자보다 빠릅니다");
			td.eq(3).html('<input type="time" value="' + endTime + '" name="endTime">');
		}
		
		var td7 = td.eq(7); //맨 앞 td의 값
		td7.html('<input type="text" value="R" name="status">');
		$('.btn2').show();
		
		if(updateReason != changeUpdateReason){
			td.eq(7).html('<input type="text" value="U" name="status">');
		}
	});
	
	$(".updateReason").click(function(){ // 수정 사유 클릭시
		var updateReasonTextarea = $(this);
		var tr = updateReasonTextarea.parent().parent();
        var td = tr.children();
		var status = td.eq(7).find("input").val();
		
		if(status ==""){
			alert("수정 상태가 아닙니다");
		} else if(status == "U"){
			alert("이미 수정 사유를 입력했습니다");
		} else if(status == "R"){
			var updateReasonTable = document.getElementById('updateReasonTable');
			var updateRow = document.getElementById('updateRow');
			updateReasonTable.style.display = "block";
			updateRow.innerHTML = tr.index();
			document.getElementById("updateReasonDiv").scrollIntoView();
			jQuery("#updateReasonDiv").focus();
		}
	});
	
	$("#updateReasonSelect").change(function(){
		var updateReasonSelect = document.getElementById('updateReasonSelect');
		var updateReasonSelectedOption = updateReasonSelect.options[updateReasonSelect.selectedIndex].value;
		if(updateReasonSelectedOption=="etc"){
			document.getElementById("updateReasonTd").style.display = "block";
		} else{
			document.getElementById("updateReasonTd").style.display = "none";
		}
		
		$("#updateReasonTextare").html(updateReasonSelectedOption=="3" ? "" :updateReasonSelect.options[updateReasonSelect.selectedIndex].text);
	});
	
	$(".finishYn").change(function(){
		var tr = $(this).parents().parents();
		var td = tr.children();
		var operation = td.eq(0).find('textarea').val();
		var wbsDetailSeq = td.eq(8).find('input').val();
		var finishYn = td.eq(5).find('input').val();
		var taskSeq = document.getElementById('taskSeq');

		if(finishYn=="N"){
			alert(operation + " 작업 완료 처리했습니다");
			location.href="finishWbsDetail?wbsDetailSeq="+wbsDetailSeq+"&finishYn=Y&taskSeq=" + taskSeq.value;
		} else{
			location.href="finishWbsDetail?wbsDetailSeq="+wbsDetailSeq+"&finishYn=N&taskSeq=" + taskSeq.value;
		}
	});
	
	
});

function updateReasonConfirm(){//수정 사유 확인
	var updateReasonTable = document.getElementById('updateReasonTable');
	var updateRow = document.getElementById('updateRow');
	
	$('#detailTable tr').each(function() {
		if (this.rowIndex == updateRow.innerHTML){
	    	  var updateReason = $(this).children().eq(6).find("textarea");
	    	  var text = updateReason.val() + (updateReason.val()=="" ? "" : "&#10;") + $("#updateReasonTextare").val();
	    	  updateReason.html(text);
	    	  alert(updateRow.innerHTML-1 +"행에 수정 사유를 입력했습니다");
	    	  $(this).children().eq(7).html('<input type="text" value="U" name="status">');
	   }
	});
	updateReasonTable.style.display = "none";
	document.getElementById("updateReasonTd").style.display = "none";
	updateRow.innerHTML="";
	$("#updateReasonTextare").html="";
	$("#updateReasonSelect option:eq(0)").prop("selected", true);
}

function updateReasonCancel(){//수정 사유 취소
	var updateReasonTable = document.getElementById('updateReasonTable');
	var updateRow = document.getElementById('updateRow');
	updateReasonTable.style.display = "none";
	updateRow.innerHTML="";
	$("#updateReasonTextare").html("");
	$("#updateReasonSelect option:eq(0)").prop("selected", true);
}
</script>
</head>
<body>
<form>
	<input type="hidden" value="${task.taskSeq}" name="taskSeq" id="taskSeq">
	<div id="container">
		<table id="detailTable">
			<tr><td colspan="7" id="subTask">${task.subTask}</td></tr>
			<tr><!-- 컬럼 -->
				<th style="width:30%;">작업</th>
				<th style="width:8%;">일자</th>
				<th style="width:8%;">시작시간</th>
				<th style="width:8%;">종료시간</th>
				<th style="width:6%;">소요시간</th>
				<th style="width:3%;">완료</th>
				<th style="width:28%;">수정사유</th>
				<td style="width:5%;"></td>
			</tr>
			<c:forEach var="wbsDetail" items="${wbsDetailList}">
				<tr>
					<td><textarea name="operation">${wbsDetail.operation}</textarea></td>
					<td><input type="date" value="${wbsDetail.date}" name="date" min="${task.startDate}" max="${task.endDate}"></td>
					<td><input type="time" value="${wbsDetail.startTime}" name="startTime"></td>
					<td><input type="time" value="${wbsDetail.endTime}" name="endTime"></td>
					<td><input type="text" value="${wbsDetail.leadTime}" name="leadTime"></td>
					<td><input type="checkbox" value="${wbsDetail.finishYn}" name="finishYn" class="finishYn" <c:if test="${wbsDetail.finishYn eq 'Y'}">checked</c:if>></td>
					<td><textArea name="updateReason" class="updateReason" readonly>${wbsDetail.updateReason}</textArea></td>
					<td style="visibility:hidden;"><input type="hidden" value="" name="status"></td>
					<td style="visibility:hidden;"><input type="hidden" value="${wbsDetail.wbsDetailSeq}" name="wbsDetailSeq"></td>
				</tr>
			</c:forEach>
			
		</table>
		<input type="button" onclick="addRow('${task.startDate}','${task.endDate}')" value="+ 추가" id="createBtn">
		<div style="height:40px;"></div>
		<div class="btn1"><input type="button" value="뒤로가기" onclick="location.href='manageWbs'"></div>
		<div class="btn2" style="display:none;">
			<input type="button" value="처리" class="btn" onclick="submit1(this.form);">
			<input type="button" value="취소" class="nBtn" onclick="cancel(${task.taskSeq})">
		</div>
	</div>
	<div id="updateReasonDiv">
		<table id="updateReasonTable" style="display:none;" >
			<tr><td><div id="updateRow" style="display:none;"></div></td></tr>
			<tr><td>수정사유</td></tr>
			<tr>
				<td>
					<select id="updateReasonSelect">
						<option value="">사유 선택</option>
						<option value="">코드미숙</option>
						<option value="">환경설정</option>
						<option value="etc">기타(직접입력)</option>
					</select>
				</td>
			</tr>
			<tr>
				<td style="display:none;width:100%;" id="updateReasonTd"><textarea id="updateReasonTextare"></textarea></td>
			</tr>
			<tr>
				<td>
					<div>
						<input type="button" value="확인" class="btn" onclick="updateReasonConfirm();">
						<input type="button" value="취소" class="nBtn" onclick="updateReasonCancel();">
					</div>
				</td>
			</tr>
		</table>
	</div>
</form>
</body>
</html>