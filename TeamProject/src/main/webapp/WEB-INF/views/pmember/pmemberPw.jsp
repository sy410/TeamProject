<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정</title>
<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script src="resources/myLib/inCheck.js"></script>
<script>
var pCheck = false;
var cCheck = false;

$(function (){
	$('#pw').focus();
	
	$('#pw').focusout(function() {
		pCheck=pwCheck();
	}); 
	$('#checkpw').focusout(function() {
		cCheck=cpCheck();
	}); 
}); //ready

function inCheck() {
	if(pCheck==false) {
		$('#pMessage').html(' 비밀번호를 입력 하세요.');
	}
	if(cCheck==false) {
		$('#cMessage').html(' 비밀번호 확인을 입력 하세요.');
	}
	if (pCheck && cCheck) {
		 alert("비밀번호가 변경되었습니다.\n변경된 비밀번호로 로그인해 주세요.");
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
<h3>비밀번호 재설정</h3><br>
비밀번호를 변경해주세요.<br>
<form action="updatePw" method="post">
<table>
	<tr height="50"><td>아이디</td>	
		<td><input type="text" id="id" name="id" value="${Apple.id}"><br>
			<span id="iMessage" class="eMessage"></span></td>
	</tr>
			
	<tr height="50"><td>새 비밀번호</td>	
		<td><input type="password" id="pw" name="pw"><br>
			<span id="pMessage" class="eMessage"></span></td>
	</tr>
	<tr height="50"><td>새 비밀번호 확인</td>	
		<td><input type="password" id="checkpw" name="checkpw"><br>
			<span id="cMessage" class="eMessage"></span></td>
	</tr>
	</table><br>
			<input type="submit" value="확인" onclick="return inCheck()">
</form>			
</body>
</html>
