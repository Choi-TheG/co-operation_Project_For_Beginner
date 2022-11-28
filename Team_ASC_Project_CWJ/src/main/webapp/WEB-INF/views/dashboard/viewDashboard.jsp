<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
#sm4{
   background-color:#0F2859;
   border-radius: 5px;
   color:white;
   opacity:1.0;
   font-weight: bold;
}
.dashboard {
    text-align:center;
   width: 100%;
    height: 800px;
    text-decoration: none;
}

.dashboardUp {
    width: 100%;
    height: 45%;
    text-align:center;
}

.project {
    width: 400px;
    height: 100%;
    background-color:rgba(119, 134, 165, 0.2);
    display:inline-block;
    vertical-align:middle;
    margin-top: 10px;
    border-radius: 10px;
}

.team {
    width: 400px;
    height: 100%;
     background-color:rgba(119, 134, 165, 0.2);
    display:inline-block;
    vertical-align:middle;
    margin-top: 10px;
    border-radius: 10px;
}

.today {
    width: 400px;
    height: 100%;
      background-color:rgba(119, 134, 165, 0.2);
    display:inline-block;
    vertical-align:middle;
    margin-top: 10px;
    border-radius: 10px;
}

.dashboardDown {
    width: 100%;
    height: 45%;
    text-align:center;
    margin-top: 10px;
}

.error {
    width: 603px;
    height: 100%;
      background-color:rgba(119, 134, 165, 0.2);
    display:inline-block;
    vertical-align:middle;
    margin-top: 7px;
    border-radius: 10px;
}

.document {
    width: 603px;
    height: 100%;
      background-color:rgba(119, 134, 165, 0.2);
    display:inline-block;
    vertical-align:middle;
    margin-top: 7px;
    border-radius: 10px;
}

.title {
    text-align: left;
    margin-top: 10px;
    margin-left: 10px;
    margin-bottom: 10px;
    font-family: "고딕체";
    font-weight: bold;
}
.issue-table {
   display:block;
   border-collapse: collapse;
   width:95%;
   height: 300px;
   table-layout: fixed;
   overflow: auto;
   margin-left: auto;
   margin-right: auto;
   text-decoration: none;
}
.issue-table th {
   border-bottom: 2px solid gray;
}
.issue-table td {
   /* border-bottom: 1px solid gray; */
}
   .table-title {
      display: block;
      overflow:hidden;
      text-overflow: ellipsis;
      white-space: nowrap;
      vertical-align: middle;
      max-width: 230px;
      height: 25px;
   }
   .text-deco {
      text-decoration : none;
      color : black;
   }
   .issue-table-short {
      width: 100px;
   }
   .issue-table-long {
      width: 230px;
   }
</style>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"> -->
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet"> 
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
  </head>
  


<title>Insert title here</title>
</head>
<body>
<div class="body">
    <div class="dashboard">
        <div class="dashboardUp">
            <div class="project">
                <div class="title">프로젝트 진행률</div>
            </div>
            <div class="team">
                <div class="title">팀별 진행률</div>
            </div>
            <div class="today">
                <div class="title">오늘의 할일</div>
            </div>
        </div>
        <div class="dashboardDown">
            <div class="error">
                <div class="title">이슈 리스트</div>
                <div>
                   <input type="hidden" name="projectSeq" value="${project.projectSeq }">
               <table class="issue-table">
                  <tr align="center">
                     <th class="issue-table-short">분류</th><th class="issue-table-long">제목</th><th class="issue-table-short">작성자</th><th class="issue-table-short">작성일자</th><th class="issue-table-short">완료여부</th>
                  </tr>
                  <c:forEach var="board" items="${errorList}" begin="0" step="1" >
                  <tr align="center">
                     <td>${board.boardCategory}</td>
                     <td class="table-title"><a class="text-deco" href="../board/readBoard?boardSeq=${board.boardSeq}">${board.boardTitle}</a></td>
                     <td>${board.id}</td>
                     <td>${board.createDate}</td>
                     <c:choose>
                        <c:when test="${board.completeYn eq 'N' }"><td>진행중</td></c:when>
                        <c:otherwise><td>완료</td></c:otherwise>
                     </c:choose>
                  </tr>
                  </c:forEach>   
               </table>
                </div>
            </div>
            <div class="document">
                <div class="title">문서 목록</div>
                <div class="" align="center">
               <c:forEach var="documents" items="${documentsList}" varStatus="index">
                  <label>
                     <a href="../documents/readPlan?projectSeq=${documents.projectSeq}&pageNum=${documents.pageNum}" class="none">
                        ${documents.documentsName}
                     </a>
                     <input type="hidden" value="${documents.documentsSeq}">
                  </label>
               </c:forEach>
            </div>
            </div>
        </div>
    </div>    
</div>
   
</body>
</html>