<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 조회</title>
</head>
<body>
<h2>예약 조회</h2>
<table>
	<tr height="40">
		<td bgcolor="Lavender">접수번호</td><td>${Apple.rno}</td>
	</tr>
	<tr height="40">
		<td bgcolor="Lavender">회원번호</td><td>${Apple.no}</td>
	</tr>
	<tr height="40">
		<td bgcolor="Lavender">사업자번호</td><td>${Apple.cno}</td>
	</tr>
	<tr height="40">
		<td bgcolor="Lavender">선택일자</td><td>${Apple.rpdate}</td>
	</tr>
	<tr height="40">
		<td bgcolor="Lavender">선택시간</td><td>${Apple.rptime}</td>
	</tr>
	<tr height="40">
		<td bgcolor="Lavender">접수날짜(시간포함)</td><td>${Apple.rdate}</td>
	</tr>
	<tr height="40">
		<td bgcolor="Lavender">요청란</td><td>${Apple.rmemo}</td>
	</tr>
	<tr height="40">
		<td bgcolor="Lavender">예약상태</td><td>${Apple.rstate}</td>
	</tr>
	<tr height="40">
		<td bgcolor="Lavender">확정날짜(시간포함)</td><td>${Apple.rcdate}</td>
	</tr>
	<tr height="40">
		<td bgcolor="Lavender">결제금액</td><td>${Apple.rprice}</td>
	</tr>
	<tr height="40">
		<td bgcolor="Lavender">결제수단</td><td>${Apple.rpay}</td>
	</tr>
</table>
<hr>
<a href="rdetail?rno=${Apple.id}&jcode=U">예약 수정</a>&nbsp;&nbsp;
<a href="rdelete?rno=${Apple.rno}">예약 취소</a><br>
</body>
</html>