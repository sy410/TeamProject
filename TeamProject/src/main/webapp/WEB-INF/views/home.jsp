<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Home</title>
<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
</head>
<body>
<c:if test="${loginID != null }">
  <b>${loginName}</b>님 환영합니다.
</c:if><br>
<c:if test="${message != null}">
  ${message}
</c:if><br>
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
