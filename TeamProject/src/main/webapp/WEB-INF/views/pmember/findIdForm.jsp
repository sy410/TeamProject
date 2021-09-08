<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script src="resources/myLib/inCheck.js"></script>
<script>
var nCheck = false;
var eCheck = false;	

$(function (){
	$('#name').focus();
	
	$('#name').focusout(function() {
		nCheck=nmCheck();
	});
	$('#email').focusout(function() {
		eCheck=emCheck();
	});

}); //ready

function inCheck() {
	if (nCheck == false) {
		$('#nMessage').html(' 이름을 입력하세요.');
	}
	if (eCheck == false) {
		$('#emMessage').html(' 이메일을 입력 하세요.');
	}
	if (nCheck && eCheck) {
		return true;
	} else
		return false;
} //inCheck 

</script>

</head>
<body>
<h1>아이디 찾기</h1>
<form action="findId" method="post">
<table>
	<tr height="50">
		<td><input type="text" id="name" name="name" placeholder="이름"><br>
		<span id="nMessage" class="eMessage"></span></td>
	</tr>
	<tr height="50">
		<td><input type="email" id="email" name="email" placeholder="이메일"><br>
		<span id="emMessage" class="eMessage"></span></td>
	</tr></table>
	<br>
		<input type="submit" value="찾기" onclick="return inCheck()">&nbsp;&nbsp;
		<input type="reset" value="취소" onclick="history.go(-1);">
</form>
</body>
</html>
