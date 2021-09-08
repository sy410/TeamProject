<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
</head>
<body>
<h2>My Page</h2>
<table border="1">
	<tr height="50">
		<td bgcolor="LightBlue">회원번호</td><td>${Apple.no}</td>
	</tr>
	<tr height="50">
		<td bgcolor="LightBlue">아이디</td><td>${Apple.id}</td>
	</tr>
	<tr height="50">
		<td bgcolor="LightBlue">비밀번호</td><td>${Apple.pw}</td>
	</tr>
	<tr height="50">
		<td bgcolor="LightBlue">이름</td><td>${Apple.name}</td>
	</tr>
	<tr height="50">
		<td bgcolor="LightBlue">생년월일</td><td>${Apple.birth}</td>
	</tr>
	<tr height="50">
		<td bgcolor="LightBlue">연락처</td><td>${Apple.tel}</td>
	</tr>
	<tr height="50">
		<td bgcolor="LightBlue">이메일</td><td>${Apple.email}</td>
	</tr>
	<tr height="50">
		<td bgcolor="LightBlue">주소</td><td>${Apple.addr}</td>
	</tr>
</table>
<hr>
<a href="pdetail?id=${Apple.id}&jcode=U">내정보수정</a>
<%-- <a href="rdetail?rno=${Apple.rno}">예약 조회</a>&nbsp;&nbsp; --%>
<a href="pdelete?id=${Apple.id}">회원탈퇴</a>
<hr>
<a href="home">HOME</a>
</body>
</html>