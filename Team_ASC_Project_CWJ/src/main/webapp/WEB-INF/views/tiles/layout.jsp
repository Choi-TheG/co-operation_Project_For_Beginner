<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false"
 %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	/* 화면 크기 */
	#container {
		width: 100%;
		height: 100%;
		margin: 0px auto;
		text-align:left;
		box-sizing: border-box;
		/* border: 0px solid #bcbcbc; */
	 }
	/* 상단 */
	#header {
		/* margin-bottom: 5px; */
		background-color:#0F2859;
		height:106px;
		margin: 0px auto;
		/* border: 0px solid #bcbcbc;  */
	  
	}
	
	/* 중간 좌측 */
	#sidebar-left {
		width: 18%;
		height : 780px;

		float: left;
		/* border: 1px solid gold;  */
	 } 
	 
	/* 중간 우측 */
	#content {
	   width: 80%;
	   height : auto;
	   /* padding: 5px; */
	   float: right;
	   margin:0 auto;        
	  /*  border: 1px solid red;  */
	}
	
	/* 하단 */
	#footer {
	   clear: both;
	   padding: 5px;
	   border: 0px solid #bcbcbc; 
	   border-top: 1px solid #bcbcbc; 
	   background-color:#0F2859;
	}
</style>
<title><tiles:insertAttribute name="title" /></title>
</head>
    <body>
    <div id="container">
      <div id="header">
         <tiles:insertAttribute name="header"/>
      </div>
      <div id="sidebar-left">
          <tiles:insertAttribute name="side"/> 
      </div>
      <div id="content">
          <tiles:insertAttribute name="body"/>
      </div>
      <div id="footer">
          <tiles:insertAttribute name="footer"/>
      </div>
    </div>
  </body>
</html>