<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	h2 {
		border-bottom: 2px solid black;
	}
</style>
<title>메인</title>
<link rel="stylesheet" href="${contextPath}/resources/css/loginMain.css"/>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>

</head>

<body>
<div class="quickmenu">
  <ul>
   <li><a href="#ongoingDiv" class="scrollMove">진행</a></li>
   <li><a href="#finishedDiv" class="scrollMove">완료</a></li>
   <li><a href="#stoppedDiv" class="scrollMove">중단</a></li>
   <li><a href="#topDiv" class="scrollMove">위로가기</a></li>
   <li><a href="#bottomDiv" class="scrollMove">밑으로가기</a></li>
  </ul>
</div>
<table>
   <tr>
      <td class="headerDiv" colspan="2">
         <a href="#ongoingDiv" class="scrollMove topmenu">
            진행 프로젝트
         </a>
      </td>
      <td class="headerDiv" colspan="2">
         <a href="#finishedDiv" class="scrollMove topmenu">
            완료 프로젝트
         </a>
      </td>
      <td class="headerDiv" colspan="2">
         <a href="#finishedDiv" class="scrollMove topmenu">
            중단 프로젝트
         </a>
      </td>
   </tr>
   
   <tr>
      <td id="ongoingDiv">
         <div style="margin-left:10px;margin-top:10px; width: 160px;">
            <h2>진행 프로젝트</h2>
         </div>
      </td>
   </tr>
   <tr>
      <td>
         <div style="margin-left:16px;margin-top:10px;">
            <h4>개인 프로젝트</h4>
         </div>
      </td>
   </tr>
   <tr>
      <td colspan="6">
         <c:forEach var="project" items="${list}" varStatus="index">
            <c:if test="${project.percentage ne 100 && project.teamCategory eq 'S' && project.finishYn eq 'N'}">
               <div class="card" style="width: 16rem;height:180px;display: inline-block;margin-left: 10px;margin-top: 10px;border:1px solid #acacac;">
                    <div class="card-body">
                      <div class="projectNameDiv">프로젝트명</div>
                      	<h5 class="card-title">
	                      	<a class="card-link" href="project/readProject?seq=${project.projectSeq}">
	                      		${project.projectName}
	                      	</a>
                      	</h5>
                      	<h6 class="card-subtitle mb-2 text-muted">
                      		완료 여부 : 진행
                      	</h6>
                      	<div class="progress">
                          <div class="progress-bar" role="progressbar" aria-label="Basic example" style="width: ${project.percentage}%" aria-valuenow="${project.percentage}" aria-valuemin="0" aria-valuemax="100">
	                          <c:if test="${project.percentage >= 50}">
	                             진행률 ${project.percentage}%
	                          </c:if>
                          </div>
                          <c:if test="${project.percentage < 50}">
                             진행률 ${project.percentage}%
                          </c:if>
                     	</div>
                     	<a href="project/readProject?seq=${project.projectSeq}" class="card-link">
                     		<button class="enterProjectButton">
                     			프로젝트 들어가기
                     		</button>
                     	</a>
                  </div>
               </div>
            </c:if>
         </c:forEach>
      </td>
   </tr>
   <tr>
      <td>
         <div style="margin-left:16px;margin-top:10px;">
            <h4>
               팀 프로젝트
            </h4>
         </div>
      </td>
   </tr>
   <tr>
      <td colspan="4">
         <c:forEach var="project" items="${list}" varStatus="index">
            <c:if test="${project.percentage ne 100  && project.teamCategory eq 'T' && project.finishYn eq 'N'}">
               <div class="card" style="width: 16rem;height:180px;display: inline-block;margin-left: 10px;margin-top: 10px;border:1px solid #acacac;">
                    <div class="card-body">
                       <div class="projectNameDiv">프로젝트명</div>
                         <h5 class="card-title">
                            <a class="card-link" href="project/readProject?seq=${project.projectSeq}">
	                      		${project.projectName}
	                      	</a>
                         </h5>
                         <h6 class="card-subtitle mb-2 text-muted">
                            완료 여부 : 진행
                         </h6>
                      <div class="progress">
                          <div class="progress-bar" role="progressbar" aria-label="Basic example" style="width: ${project.percentage}%" aria-valuenow="${project.percentage}" aria-valuemin="0" aria-valuemax="100">
                             <c:if test="${project.percentage >= 50}">
                                진행률 ${project.percentage}%
                             </c:if>
                          </div>
                          <c:if test="${project.percentage < 50}">
                             진행률 ${project.percentage}%
                          </c:if>
                     </div>
                     <a href="project/readProject?seq=${project.projectSeq}" class="card-link">
                     	<button class="enterProjectButton">
                   			프로젝트 들어가기
                   		</button>
                     </a>
                  </div>
               </div>
            </c:if>
         </c:forEach>
      </td>
   </tr>
   <tr>
      <td id="finishedDiv">
         <div style="margin-left:10px;margin-top:10px;  width: 160px;">
            <h2>완료 프로젝트</h2>
         </div>
      </td>
   </tr>
   <tr>
      <td>
         <div style="margin-left:16px;margin-top:10px;">
            <h4>개인 프로젝트</h4>
         </div>
      </td>
   </tr>
   <tr>
      <td colspan="4">
         <c:forEach var="project" items="${list}" varStatus="index">
            <c:if test="${project.finishYn eq 'Y' && project.teamCategory eq 'S'}">
               <div class="card" style="width: 16rem;height:180px;display: inline-block;margin-left: 10px;margin-top: 10px;border:1px solid #acacac;">
                    <div class="card-body">
                       <div class="projectNameDiv">
                          프로젝트명
                       </div>
                      <h5 class="card-title">
                        <a class="card-link" href="project/readProject?seq=${project.projectSeq}">
	                      		${project.projectName}
                   		</a>
                      </h5>
                      <h6 class="card-subtitle mb-2 text-muted">
                         완료 여부 : 완료
                      </h6>
                      <div class="progress">
                          <div class="progress-bar" role="progressbar" aria-label="Basic example" style="width: ${project.percentage}%" aria-valuenow="${project.percentage}" aria-valuemin="0" aria-valuemax="100">
                             진행률 ${project.percentage}%
                          </div>
                     </div>
                      <a href="project/readProject?seq=${project.projectSeq}" class="card-link">
                      	<button class="enterProjectButton">
                   			프로젝트 들어가기
                   		</button>
                      </a>
                  </div>
               </div>   
            </c:if>
         </c:forEach>
      </td>
   </tr>
   <tr>
      <td>
         <div style="margin-left:16px;margin-top:10px;">
            <h4>팀 프로젝트</h4>
         </div>
      </td>
   </tr>
   <tr>
      <td colspan="4">
         <c:forEach var="project" items="${list}" varStatus="index">
            <c:if test="${project.finishYn eq 'Y' && project.teamCategory eq 'T'}">
               <div class="card" style="width: 16rem;height:180px;display: inline-block;margin-left: 10px;margin-top: 10px;border:1px solid #acacac;">
                   <div class="card-body">
                      <div class="projectNameDiv">
                       	프로젝트명
                      </div>
                      <h5 class="card-title">
                 		<a class="card-link" href="project/readProject?seq=${project.projectSeq}">
	                      		${project.projectName}
                      	</a>
                      </h5>
                      <h6 class="card-subtitle mb-2 text-muted">
                      	완료 여부 : 완료
                      </h6>
                      <div class="progress">
                          <div class="progress-bar" role="progressbar" aria-label="Basic example" style="width: ${project.percentage}%" aria-valuenow="${project.percentage}" aria-valuemin="0" aria-valuemax="100">
                          	진행률 ${project.percentage}%
                          </div>
                     </div>
                     <a href="project/readProject?seq=${project.projectSeq}" class="card-link">
                     	<button class="enterProjectButton">
                   			프로젝트 들어가기
                   		</button>
                     </a>
                  </div>
               </div>   
            </c:if>
         </c:forEach>
      </td>
   </tr>
   <tr>
      <td id="stoppedDiv">
         <div style="margin-left:10px;margin-top:10px;  width: 160px;">
            <h2>중단 프로젝트</h2>
         </div>
      </td>
   </tr>
   <tr>
      <td>
         <div style="margin-left:16px;margin-top:10px;">
            <h4>개인 프로젝트</h4>
         </div>
      </td>
   </tr>
   <tr>
      <td colspan="4">
         <c:forEach var="project" items="${list}" varStatus="index">
            <c:if test="${project.finishYn eq 'S' && project.teamCategory eq 'S'}">
               <div class="card" style="width: 16rem;height:180px;display: inline-block;margin-left: 10px;margin-top: 10px;border:1px solid #acacac;">
                    <div class="card-body">
                       <div class="projectNameDiv">프로젝트명</div>
                         <h5 class="card-title">
                            <a class="card-link" href="project/readProject?seq=${project.projectSeq}">
	                      		${project.projectName}
	                      	</a>
                         </h5>
                         <h6 class="card-subtitle mb-2 text-muted">
                            완료 여부 : 중단
                         </h6>
                      <div class="progress">
                          <div class="progress-bar" role="progressbar" aria-label="Basic example" style="width: ${project.percentage}%" aria-valuenow="${project.percentage}" aria-valuemin="0" aria-valuemax="100">
                             <c:if test="${project.percentage >= 50}">
                                진행률 ${project.percentage}%
                             </c:if>
                          </div>
                          <c:if test="${project.percentage < 50}">
                             진행률 ${project.percentage}%
                          </c:if>
                     </div>
                     <a href="project/readProject?seq=${project.projectSeq}" class="card-link">
                     	<button class="enterProjectButton">
                   			프로젝트 들어가기
                   		</button>
                     </a>
                  </div>
               </div>
            </c:if>
         </c:forEach>
      </td>
   </tr>
   <tr>
      <td>
         <div style="margin-left:16px;margin-top:10px;">
            <h4>팀 프로젝트</h4>
         </div>
      </td>
   </tr>
   <tr>
      <td colspan="4">
         <c:forEach var="project" items="${list}" varStatus="index">
            <c:if test="${project.finishYn eq 'S' && project.teamCategory eq 'T'}">
               <div class="card" style="width: 16rem;height:180px;display: inline-block;margin-left: 10px;margin-top: 10px;border:1px solid #acacac;">
                    <div class="card-body">
                       <div class="projectNameDiv">프로젝트명</div>
                         <h5 class="card-title">
                            <a class="card-link" href="project/readProject?seq=${project.projectSeq}">
	                      		${project.projectName}
	                      	</a>
                         </h5>
                         <h6 class="card-subtitle mb-2 text-muted">
                            완료 여부 : 중단
                         </h6>
                      <div class="progress">
                          <div class="progress-bar" role="progressbar" aria-label="Basic example" style="width: ${project.percentage}%" aria-valuenow="${project.percentage}" aria-valuemin="0" aria-valuemax="100">
                             <c:if test="${project.percentage >= 50}">
                                진행률 ${project.percentage}%
                             </c:if>
                          </div>
                          <c:if test="${project.percentage < 50}">
                             진행률 ${project.percentage}%
                          </c:if>
                     </div>
                     <a href="project/readProject?seq=${project.projectSeq}" class="card-link">
                     	<button class="enterProjectButton">
                   			프로젝트 들어가기
                   		</button>
                     </a>
                  </div>
               </div>
            </c:if>
         </c:forEach>
      </td>
   </tr>
   <tr><td id="bottomDiv"></td></tr>
</table>
<script src="${contextPath}/resources/js/loginMain.js"></script>
</body>
</html>