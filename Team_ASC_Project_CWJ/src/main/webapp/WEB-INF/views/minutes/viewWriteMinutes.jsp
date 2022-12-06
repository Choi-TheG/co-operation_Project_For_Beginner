<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회의록 작성</title>
		<style type="text/css">
		@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300; 400&display=swap');
		
			#wmWrap {
				width: 80%;
				text-align: center;
				margin-top: 50px;
			}
			table {
				width: 100%;
				height: 100%;
				border-collapse: collapse;
			}
			th {
				border: 1px solid black;
				width: 15%; 
				height: 100%;
			}
			td {
				border: 1px solid black;
				text-align: left;
				height: 100%;
			}
			textarea, .place {
				resize: none;
				width: 100%;
				height: 100%;
				box-sizing: border-box;
				display: inline-table;
				border-color: #00ff0000;
				outline: none;
			}
			.cbText {
				width: 200px;
				border-bottom: 1px solid gray;
				border-left: 0;
				border-right: 0;
				border-top: 0;
				outline: none;
			}
			.empty {
				height: 10px;
			}
			input[type=datetime-local] {
				width: 100%;
				height: 100%;
				box-sizing: border-box;
				display: inline-table;
				border: #00ff0000;
				text-align: center;
				font-size: 15px;
				font-weight: bold;
			}
			.tr1, .tr2, .tr3>th {
				height: 80px;
			}
			.tr4>th {
				height: 100px;
			}
			.tr5>th {
				height: 500px;
			}
			.tr6, .tr7>th {
				height: 150px;
			}
			.wmBtn {
				margin-top: 60px;
				margin-bottom: 60px;
			}
			.wb {
				position: relative;
				border: 0px;
				padding: 10px 20px;
				display: inline-block;
				background-color: #ff0062;
				box-shadow: 0px 4px 0px #d40051;
				color: white;
				font-weight: 400;
				font-family: 'Noto Sans KR', sans-serif;
				font-size: 17px;
			}
			.wb:active {
				top: 4px;
				background-color: #d40051;
				box-shadow: 0px 0px #d40051; 
				color: white;
				font-weight: 400;
				font-family: 'Noto Sans KR', sans-serif;
				font-size: 17px;
			}
			.backBtn {
				margin-top: 50px;
				margin-bottom: 10px;
				float: left;
			}
			.backBtn>button[type=button] {
				color: #384D59;
				padding: 7px 10px;
				font-weight: 300;
				background-color: white;
				border-radius: 15px;
				border: 1px solid #384D59;
				font-size: 15px;
			}
		</style>
		<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script type="text/javascript">
		
			function checkPerson(frm) {
				
				frm.action = "../project/writeMinutes";
				frm.method = "POST";
				
				var checkedCnt = 0;
				
				$('.att').each(function(){
					var att = $(this);
					if(att.context.checked){
						checkedCnt += 1;
					}
				});
				
				if(checkedCnt==0) {
					alert('참여 인원을 선택해 주세요.')
					return false;
				}
				
				if(document.getElementById('extraCheck').checked == true && document.getElementById('extraText').value == "") {
					alert("추가 인원이 있으신가요? \n해당 사항이 없으면 체크를 해제해 주세요.");
					return false;
				}
				
				frm.submit();
			}; // checkPerson end
		
			$(document).ready(function() {
				console.log('ready');
				
				$("#extraCheck").on("click", function() { // 추가인원 텍스트 체크박스 누를 때만 활성화
					
					if(document.getElementById('extraCheck').checked == true) {
						console.log("check");
						document.getElementById('extraText').removeAttribute('disabled');
					} else {
						console.log("unCheck");
						document.getElementById('extraText').setAttribute('disabled', 'disabled');
						document.getElementById('extraText').value= "";
					}
					
				}); // .extraCheck end
				
				$(".back").on("click", function() { // 뒤로 가기 버튼 클릭 시 이벤트
					
					let message = confirm('뒤로 가기 시 내용이 초기화 됩니다. \n정말 이 페이지에서 나가시겠습니까?')
					
					if(message == true) {
						location.href="../project/minutesList?pageNum=1";
						return true;
					} else {
						return false;
					}
				}); // .back end
				
				$('input[type = "text"]').keydown(function() { // text 입력 시 엔터 submit 방지
					
					if(event.keyCode === 13) {
						event.preventDefault();
					};
				}); // keydown end
				
				$("#startTime").on("change", function(){
					
					let start = document.getElementById('startTime').value;
					let end = document.getElementById('endTime').value;
					
					if(start != "" && end != "" && start > end) {
						alert("시작일자가 종료일자보다 느립니다.");
						document.getElementById('endTime').value = document.getElementById('startTime').value;
					}
				}); // startTime end
				
				$("#endTime").on("change", function(){
					
					start = document.getElementById('startTime').value;
					end = document.getElementById('endTime').value;
					
					if(start != "" && end != "" && start > end) {
						alert("종료일자가 시작일자보다 빠릅니다.");
						document.getElementById('endTime').value = document.getElementById('startTime').value;
					}
				}); // endTime end
				
				/* $("#checkPerson").on("submit", function() {
					
					alert("ready");
					
					let extra = document.getElementById('extraText').value;
					let check = document.getElementById('extraCheck').value;
					
					if(check.checked == true && extra == "") {
						alert("추가 인원을 입력하세요.");
						document.getElementById('extraText').focus();
					}
				}); // extraCheck end */
				
			}); // document end
		</script>
	</head>
	<body>
		<div id="wmWrap">
			<h1>회의록</h1>
			<div class="backBtn">
				<button type="button" class="back">뒤로</button>
			</div>
			<form action="#" method="POST" name="form">
			<input type="hidden" name="userSeq" value="${member.userSeq}">
			<input type="hidden" name="projectSeq" value="${project.projectSeq}">
				<table>
					<tr class="tr1">
						<th>참석 인원</th>
						<td colspan="3">
							<c:forEach var="teamMember" items="${list}">
								<label>
									<input type="checkbox" name="attendees" class="att" value="${teamMember.userName}"
									<c:if test="${teamMember.userSeq eq member.userSeq}">checked</c:if>> <%-- 작성자 자동 체크 --%>
									${teamMember.userName}
								</label>
							</c:forEach>
							<div class="empty"></div>
							<label>
								<input type="checkbox" id="extraCheck">
								추가 인원
								<input type="text" name="extraPerson" class="cbText" id="extraText" disabled="disabled">
							</label>
						</td>
					</tr>
					<tr class="tr2">
						<th>시작</th>
						<td>
							<input type="datetime-local" name="startTime" id="startTime" required="required">
						</td>
						<th>종료</th>
						<td>
							<input type="datetime-local" name="endTime" id="endTime" required="required">
						</td>
					</tr>
					<tr class="tr3">
						<th>장소</th>
						<td colspan="3">
							<input type="text" name="meetingPlace" placeholder="회의 장소를 입력하세요." class="place" required="required">
						</td>
					</tr>
					<tr class="tr4">
						<th>회의 안건</th>
						<td colspan="3">
							<textarea name="meetingTitle" placeholder="회의 안건을 입력하세요." required="required"></textarea>
						</td>
					</tr>
					<tr class="tr5">
						<th>회의 내용</th>
						<td colspan="3">
							<textarea name="meetingContent" placeholder="회의 내용을 입력하세요." required="required"></textarea>
						</td>
					</tr>
					<tr class="tr6">
						<th>회의 결과</th>
						<td colspan="3">
							<textarea name="meetingResult" placeholder="회의 결과를 입력하세요." required="required"></textarea>
						</td>
					</tr>
					<tr class="tr7">
						<th>비고</th>
						<td colspan="3">
							<textarea name="meetingRemark" placeholder="비고"></textarea>
						</td>
					</tr>
				</table>
				<div class="wmBtn">
					<input type="button" value="작성하기" class="wb" onclick="checkPerson(this.form)">
				</div>
			</form>
		</div>
	</body>
</html>