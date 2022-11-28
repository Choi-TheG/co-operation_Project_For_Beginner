<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath"  value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>Footer</title>
      <style type="text/css">
      #footLink {
         padding-top: 30px;
         padding-bottom: 20px;
         padding-left: 30px;
         text-align: left;
      }
      .list {
         margin-bottom: 70px;
      }
      .list ul{
         list-style: none;
         margin: 0;
         padding: 0;
      }
      .list ul li {
         margin: 0 0 0 0;
         padding: 0 0 0 0;
         border: 0;
         float: left;
      }
      .list a {
         color: white;
         font-weight: bold;
         font-size: 14px;
         text-decoration: none;
      }
      .list font {
         color: white;
      }
      .intro p {
         color: white;
         font-size: 14px;
      }
      </style>
   </head>
   <body>
      <div id="footLink">
         <div class="list">
            <ul>
               <li>
                  <a href="">ASC 소개</a>
                  <font>&nbsp;|</font>
               </li>
               
               <li>
                  <font>&nbsp;</font>
                  <a href="">ASC 고객센터</a>
                  <font>&nbsp;|</font>
               </li>
               
               <li>
                  <font>&nbsp;</font>
                  <a href="">이용약관</a>
                  <font>&nbsp;|</font>
               </li>
               <li>
                  <font>&nbsp;</font>
                  <a href="">개인정보처리방침</a>
               </li>
            </ul>
         </div>
         <div class="intro">
            <p>e-mail : asc@gmail.com</p>
            <p>©TEAM_ASC</p>
            <a href="${contextPath}/message/messageList" style="text-decoration: none; color: white;">메세지</a>
         </div>
      </div>
   </body>
</html>