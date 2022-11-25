<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Project Manager</title>
<style>
table {
   width: 90%;
   border: 1px solid #bcbcbc;
}
input {
   width : 120px;
}
td{
   border: 0px solid black;
   margin-bottom: 5px;
}
tr{
   height: 60px;
}
#sm1{
   background-color:#0F2859;
   border-radius: 5px;
   color:white;
   opacity:1.0;
   font-weight: bold;
}
.manageProject-man{
   width:100%;
   position:relative;
   left:20px;
   display:block;
   margin-left:auto;
   margin-right:auto;
}
.teamMember-table{
   display:block;
   margin-left:auto;
   margin-right:auto;
   text-align:center;
}
.tableName{
   text-align: center;
   width: 20%;
   border: 5px;
   font-size: 18px;
   font-weight: bold;
}
input[type=text]{
   width: 100%;
   height: 40px;
   border-radius: 5px;
   font-size: 16px;
   border-color: #e0e0e0;
}
input[type=text]:hover{
   background-color: #e0e0e0;
}
input[type=submit]{
   color: white;
    background-color: #384D59;
    border: 0;
    padding: 5px;
    border-radius: 5px;
    font-weight: bold;
}
button{
   color: white;
    background-color: #384D59;
    border: 0;
    padding: 5px;
    border-radius: 5px;
    font-weight: bold;
}
#projectNameChange{
   width: 70%; 
   height: 40px; 
   border: 0px;
   border-radius: 5px; 
   font-size: 16px; 
   font-weight: bold; 
   text-align: center;
   color: white;
   background-color: #384D59;
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
</style>
<%-- <link rel="stylesheet" href="${contextPath}/resources/css/bootstrap.css"/> --%>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">


$(document).ready(function(){
   let teamLeaderSeq = document.getElementById("teamLeaderSeq").value;
   let userSeq = document.getElementById("userSeq").value;
   if(teamLeaderSeq === userSeq){
       document.getElementById("projectName").readOnly=false;
   }
   
   let oldProjectName = document.getElementById("projectName").value;
   let thisProjectSeq = document.getElementById("projectSeq").value;
   let checkProjectName = false;
   
   $("#projectNameChange").on("click",function(){

      let newProjectName = document.getElementById("projectName").value;
      if(oldProjectName == newProjectName){
         alert("동일한 프로젝트명 입니다");
         return false;
      } else if (newProjectName == ""){
         alert("프로젝트명을 입력해 주세요");
         document.getElementById("projectName").value = oldProjectName;
         return false;
      } else {
         let modifyPossible = false;
         $.ajax({
            type : "get",
            url : "checkProjectName",
            dataType : "text",
            data : {projectName:newProjectName},
            success : function(data,status){
            
            let jsonBoolean = JSON.parse(data);
               if(!jsonBoolean){
                  alert("이미 존재하는 프로젝트명 입니다");
                  document.getElementById("projectName").value = oldProjectName;
                  return false;
               } else{
                  if(confirm('수정하시겠습니까?') == true){
                     $.ajax({
                        type : "get",
                        url : "modifyProjectName",
                        dataType : "text",
                        data : {projectName:newProjectName,projectSeq:thisProjectSeq},
                        success : function(data,status){
                        let jsonBoolean = JSON.parse(data);
                           if(jsonBoolean){
                              alert("수정 완료");
                              oldProjectName = newProjectName;
                              location.reload();
                           } else{
                              alert("수정 실패");
                              document.getElementById("projectName").value = oldProjectName;
                           }
                        },
                        error : function(data,status){
                           console.log("error");
                        },
                        complete : function(data,status){
                           console.log("finish");
                        }
                     }); // 두번째 ajax end
                  } else{
                     document.getElementById("projectName").value = oldProjectName;
                  }
                  
               }
            },
            error : function(data,status){
               console.log("error");
            },
            complete : function(data,status){
               console.log("finish");
            }
         }); // 첫번째 ajax end 
      }
   });
   
   $("#btnModify").on("click",function(){
      
      let message = confirm('프로젝트 수정 하시겠습니까 ?');
      
      if(message){
         this.form.action="/asc/project/modifyProjectName2";
         this.form.method="GET";
         this.form.submit();
         return true;
      } else{
         return false;
      }
   });
   
   $("#btnStop").on("click",function(){
      
      let message = confirm('정말로 프로젝트를 중단하시겠습니까 ?');
      
      if(message){
         this.form.action="/asc/project/deleteProject";
         this.form.method="GET";
         this.form.submit();
         return true;
      } else{
         return false;
      }
   });
});
</script>
</head>
<body>
<div class="manageProject-man">
<form action="/asc/project/modifyProjectName2" method="get">
<input type="hidden" name="projectSeq" value="${project.projectSeq}" id="projectSeq">
<input type="hidden" name="teamId" value="${project.teamId}">
<input type="hidden" name="memberSeq" value="${member.userSeq}" id="userSeq">
<input type="hidden" name="teamLeaderSeq" value="${project.teamLeaderSeq}" id="teamLeaderSeq">
<table>
   <tr>
      <th colspan="3" align="center"><h1>프로젝트 관리</h1></th>
   </tr>
   <tr>
      <td class="tableName">
         프로젝트명
      </td>
      <td>
         <input type="text" value="${project.projectName}" id="projectName" readOnly name="projectName">
      </td>
      <c:if test="${project.teamLeaderSeq eq member.userSeq && project.finishYn ne 'S'}">
         <td class="tableName">
            <input type="button" value="수정" id="projectNameChange">
         </td>
      </c:if>
   </tr>
   <tr>
      <td class="tableName">
         완료여부
      </td>
      <td>
         <input type="text" value="${project.finishYn eq 'Y' ? '완료' : (project.finishYn eq 'N' ? '진행' : '중단')}" readOnly="true">
      </td>
   </tr>
   <tr>
      <td class="tableName">
         진척률
      </td>
      <td>
         <input type="text" value="${project.percentage}%" readOnly="true">
      </td>
   </tr>
   <tr>
      <td class="tableName">
         프로젝트 시작일자
      </td>
      <td>
         <input type="text" value="${project.createDate}" readOnly="true">
      </td>
   </tr>
   <tr><td></td>
      <td>
         <tr>
            <td></td>
            <td style="font-size:20px;font-weight:bold;">
               팀원 목록
            </td>
            <th style="font-size:20px;text-align:center;">팀장/팀원</th>
         </tr>
         <c:forEach var="teamMember" items ="${list}">
            <tr><td></td>
               <td><input type="text" value="${teamMember.userName}" style="width:100%;" readOnly="true"></td>
               <c:choose>
                  <c:when test="${project.teamLeaderSeq eq teamMember.userSeq}">
                     <td style="text-align:center;font-size:18px;font-weight:bold;">팀장</td>
                  </c:when>
                  <c:when test="${project.teamLeaderSeq eq member.userSeq && teamMember.userSeq ne member.userSeq}">
                     <td style="text-align:center;font-size:18px;font-weight:bold;"><a style="color:red;" href="deleteTeamMember?userSeq=${teamMember.userSeq}&teamId=${project.teamId}" onclick="return confirm('정말로 제외하시겠습니까 ?');">제외</a></td>
                  </c:when>
                  <c:when test="${project.teamLeaderSeq ne member.userSeq}">
                     <td style="text-align:center;font-size:18px;font-weight:bold;">팀원</td>
                  </c:when>
               </c:choose>
            </tr>
         </c:forEach>
         <c:choose>
            <c:when test="${project.teamLeaderSeq eq member.userSeq && project.finishYn ne 'S'}">
               <tr><td></td><td><button type="button" onclick="location.href='viewInviteProject'" style="width: 100%; height:40px;display:block;">팀원초대</button></td></tr>
            </c:when>
         </c:choose>
</table>
<c:if test="${project.finishYn ne 'S'}">
   <input type="button" value="중단" style="margin-top: 8px;margin-left: 5px;" id="btnStop" class="btnClick">
</c:if>
</form>
</div>
</body>



</html>