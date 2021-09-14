<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록 리스트</title>
<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">

</head>
<body style="text-align:center;">
<h1>회원목록 리스트</h1>
<br>
<c:if test="${not empty message}">
=> ${message}<br>
</c:if>
<hr>
<table border="1" width=1100 style="margin-left: auto; margin-right: auto;">
<tr height="35" bgcolor="Beige">
	<th>ID</th><th>Name</th><th>Birth</th>
	<th>Tel</th><th>Email</th><th>Addr</th>
</tr>
<c:forEach var="list" items="${Banana}">
<tr height="30" align="center">
	<td><a href="pdetail?id=${list.id}">${list.id}</a></td>
	<td>${list.name}</td><td>${list.birth}</td>
	<td>${list.tel}</td><td>${list.email}</td><td>${list.addr}</td>
</tr>
</c:forEach>
</table>
<hr>
<a href="home">HOME</a> 
</body>
</html>
