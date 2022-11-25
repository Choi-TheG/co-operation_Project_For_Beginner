<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   td{
      height: 40px;
   }
   .title{
      text-align:center;
   }
   #sm1{
      background-color:#0F2859;
      border-radius: 5px;
      color:white;
      opacity:1.0;
      font-weight: bold;
   }
   .invite-main{
      width:80%;
      margin-left:auto;
      margin-right:auto;
      display:box;
      
   }
   .invite-table{
      border:1px solid;
      margin: 5px;
      width: 100%;
   }
   
   button{
   color: white;
    background-color: #384D59;
    border: 0;
    padding: 5px;
    border-radius: 5px;
    font-weight: bold;
   }
</style>
</head>
<body>
<div class="invite-main">
<table class="invite-table">
   <tr>
      <td colspan="4" class="title">
         <h1>
            팀원 초대
         </h1>
      </td>
   </tr>
   <tr>
      <td width="2%"></td>
      <td style="font-weight: bold;">
         ID
      </td>
      <td style="font-weight: bold;">
         이름
      </td>
      <td style="font-weight: bold;">
         초대
      </td>
   </tr>
   <c:forEach var="user" items ="${userList}">
      <tr>
         <td></td>
         <td width="40%">
            ${user.id}
         </td>
         <td width="40%">
            ${user.name}
         </td>
         <td width="10%">
            <button onclick="location.href='inviteProject?userSeq=${user.userSeq}'" style="width:90%">
               초대
            </button>
         </td>
      </tr>
   </c:forEach>
</table>
<button onclick="javascript:history.back();" style="margin-left:10px;">뒤로가기</button>
</div>
</body>
</html>