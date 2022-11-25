<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
   table{
      border : 1px solid black;
      width: 100%;
   }
   th, input[type=date]{
      text-align:center;
      padding: 2px;
      font-size: 20px;
      height: 30px;
   }
   td{
      text-align:center;
      font-weight: bold;
      padding: 2px;
      font-size: 20px;
      height: 30px;
   }
   input[type=submit]{
      color: white;
       background-color: #384D59;
       border: 0;
       padding: 5px;
       border-radius: 5px;
       font-weight: bold;
       font-size: 16px;
   }
   textarea{
      font-size: 16px;
   }
   #sm2{
      background-color:#0F2859;
      border-radius: 5px;
      color:white;
      opacity:1.0;
      font-weight: bold;
   }
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
   $(document).ready(function(){
      let start = "";
      let end = "";
      
      $('#calFrm').submit(function(){
    	  let start = document.getElementById("startDate").value;
    	  let end = document.getElementById("endDate").value;

    	  if(start == "" || end == ""){
    		  alert("일정을 정확히 입력해주세요");
    		  return false;
    	  } 
      });
      
      $("#scheduleCategory").on("change",function(){
         document.getElementById("startText").value = "";
         document.getElementById("endText").value = "";
         start = "";
         end = "";
         
         let langSelect = document.getElementById("scheduleCategory");
         
          let selectValue = langSelect.options[langSelect.selectedIndex].value;
      
          document.getElementById("categoryText").value = selectValue;
          if(selectValue == "1"){
             document.getElementById("startDate").type="date";
             document.getElementById("endDate").type="date";
             $(".end").show();
          }
          else if(selectValue == "2"){
             document.getElementById("startDate").type="month";
             document.getElementById("endDate").type="month";
             $(".end").hide();
          } else if(selectValue == "3"){
             document.getElementById("startDate").type="date";
             document.getElementById("endDate").type="date";
             $(".end").show();
          } else{
             document.getElementById("startDate").type="date";
             document.getElementById("endDate").type="date";
             $(".end").hide();
          }
      });
      
      $("#startDate").on("change",function(){
         start = document.getElementById("startDate").value;
         document.getElementById("startText").value = start;
         let langSelect = document.getElementById("scheduleCategory");
         
          let selectValue = langSelect.options[langSelect.selectedIndex].value;
          
          if(selectValue != "1" && selectValue != "3"){
             document.getElementById("endDate").value = document.getElementById("startDate").value;
             document.getElementById("endText").value = start;
          } else{
             if(start != "" && end != "" && start > end){
               alert("시작일자가 종료일자 보다 느립니다");
               document.getElementById("startDate").value = document.getElementById("endText").value;
            }
          }
      });
      
      $("#endDate").on("change",function(){
         end = document.getElementById("endDate").value;
         document.getElementById("endText").value = end;
         if(start != "" && end != "" && start > end){
            alert("시작일자가 종료일자 보다 느립니다");
            document.getElementById("startDate").value = document.getElementById("endText").value;
         }
      });
      
   });
</script>
</head>
<body>
<form action="scheduleProject" method="GET" id="calFrm">
   <input type="hidden" name="projectSeq" id="prjectSeq" value="${project.projectSeq}">
   <input type="hidden" name="startDate" id="startText">
   <input type="hidden" name="endDate" id="endText">
   <input type="hidden" name="scheduleCategory" id="categoryText" value="1">
   <div style="float:center">
      <table>
         <tr>
            <th style="width:10%;">일정구분</th>
            <th style="width:10%;">
               <select id="scheduleCategory" style="width:100%;height:20px;">
                  <option value="1" selected>전체</option>
                  <option value="2">월간</option>
                  <option value="3">주간</option>
                  <option value="4">일일</option>
               </select>
            </th>
            <th class="dateLine">
               시작일자
            </th>
            <th class="dateLine">
               <input type="date" id="startDate" style="width:80%;height:20px;">
            </th>
            <th class="end dateLine">
               종료일자
            </th>
            <th class="end dateLine">
               <input type="date" id="endDate" style="width:80%;height:20px;">
            </th>
         </tr>
         <tr>
            <th>
               내용
            </th>
            <th colspan="5">
               <textarea name="content" id ="content" style="width:98%; height:200px"></textarea>
            </th>
         </tr>
         <tr>
            <th colspan="5"></th>
            <th class="title">
               <input type="submit" value="작  성" style="width:90%;height:30px;float:right;">
            </th>
         </tr>
      </table>
   </div>
   <div style="float:center">
      <table>
         <tr>
            <td style="width:10%;">
               일정구분
            </td>
            <td style="width:10%;">
               시작일자
            </td>
            <td style="width:10%;">
               종료일자
            </td>
            <td>
               내용
            </td>
            <td  style="width:15%;">
               완료여부
            </td>
         </tr>
         <c:forEach var="schedule" items="${list}">
            <tr>
               <td style="width:10%;">
                  <div style="text-align:center">
                     <c:choose>
                        <c:when test="${schedule.scheduleCategory eq '1'}">
                           전체
                        </c:when>
                        <c:when test="${schedule.scheduleCategory eq '2'}">
                           월간
                        </c:when>
                        <c:when test="${schedule.scheduleCategory eq '3'}">
                           주간
                        </c:when>
                        <c:when test="${schedule.scheduleCategory eq '4'}">
                           일일
                        </c:when>
                     </c:choose>
                  </div>
               </td>
               <td>
                  <input type="date" readOnly value="${schedule.startDate}" style="border:0px;width:100%;float:center;">
               </td>
               <td>
                  <input type="date" readOnly value="${schedule.endDate}" style="border:0px;width:100%;float:center;">
               </td>
               <td>
                  <textarea style="width:100%;" readOnly>${schedule.content}</textarea>
               </td>
               <td>
                  <input type="radio" name="finishYn_${schedule.scheduleSeq}" value="Y" ${schedule.finishYn == "Y" ? 'checked="checked"' : '' } onclick="return(false)">
                  완료
                  <input type="radio" name="finishYn_${schedule.scheduleSeq}" value="N" ${schedule.finishYn == "N" ? 'checked="checked"' : '' } onclick="return(false)">
                  미완
               </td>
            </tr>
         </c:forEach>
      </table>
   </div>
</form>
</body>
</html>