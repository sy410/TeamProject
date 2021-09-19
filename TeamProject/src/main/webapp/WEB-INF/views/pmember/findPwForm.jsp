<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>패스워드 찾기</title>
<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script src="resources/myLib/inCheck.js"></script>
<script>
var iCheck = false;
var nCheck = false;	

$(function (){
	$('#id').focus();
	
	$('#id').focusout(function() {
		iCheck=idCheck();
	});
	$('#name').focusout(function() {
		nCheck=nmCheck();
	});
}); //ready

function inCheck() {
	if (iCheck == false) {
		$('#iMessage').html(' 아이디를 입력하세요. ');
	}
	if (nCheck == false) {
		$('#nMessage').html(' 이름을 입력하세요. ');
	}
	if (iCheck && nCheck) {
		return true;
	} else
		return false;
} //inCheck 
</script>
<style>
	table {
    margin-left:auto; 
    margin-right:auto;
	}
</style>
</head>
<body style="text-align:center;">
<h1>패스워드 찾기</h1>
<form action="findPw" method="post" name="findform">
<table>
	<tr height="50"><td>아이디</td>
		<td><input type="text" id="id" name="id"><br>
		<span id="iMessage" class="eMessage"></span></td>
	</tr>
	<tr height="50"><td>이름</td>
		<td><input type="text" id="name" name="name"><br>
		<span id="nMessage" class="eMessage"></span></td>
	</tr></table>
	<br>
		<input type="submit" value="찾기" onclick="return inCheck()">&nbsp;&nbsp;
		<input type="reset" value="취소" onclick="history.go(-1)">
		
	<!-- 정보가 일치하지 않을 때-->
	<c:if test="${check == 1}">
		<script>
			$('id').val="";
			$('name').val="";
			alert("일치하는 정보가 없습니다.");
		</script>
	</c:if>		
</form><br>
<a href="home">HOME</a>
</body>
</html>
