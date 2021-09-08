<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Home</title>
<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script>
function setClock() {
	var now = new Date();
	var t = "* Now : "
		+now.getFullYear()+"년"+(now.getMonth()+1)+"월"+now.getDate()+"일_"
		+now.getHours()+":"+now.getMinutes()+":"+now.getSeconds() ;
	// => t = "Now: 2021년8월9일_12:3:5"
	document.getElementById("clock").innerHTML=t;	
	// 시계처럼 표시하려면 1초 단위로 재호출 해야함
	//setTimeout("setClock()",1000) ; // 실행단위: 1/1000 초
	//setInterval("setClock()",1000);
}
 
</script>
</head>
<body onload="setClock()">
<span>* Start : ${serverTime}</span><br>
<span id="clock"></span>
<c:if test="${loginID != null }"><br>
 => ${loginName}님 안녕하세요 ~!
</c:if> <br>
<c:if test="${message != null}">
 => ${message}
</c:if>
<hr>
<img src="resources/image/phello.gif" width="300" height="200">
<div id="resultArea"></div>
<hr>
<c:if test="${loginID == null}">
	<a href="loginf">로그인</a>&nbsp;&nbsp;
	<a href="joinf">회원가입</a>&nbsp;&nbsp;
</c:if>
<c:if test="${loginID != null}">
	<a href="pdetail">MyPage</a>&nbsp;&nbsp;
	<a href="logout">로그아웃</a><br><hr>
	<a href="plist">회원관리</a>&nbsp;
	<a href="pcplist">회원관리_서치</a>&nbsp;
</c:if>
</body>
</html>
