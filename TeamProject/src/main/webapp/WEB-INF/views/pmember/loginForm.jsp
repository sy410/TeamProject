<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script src="resources/myLib/inCheck.js"></script>
<script>
// 1) 전역변수 정의
var iCheck = false;
var pCheck = false;

// 2) 개별컬럼의 무결성 점검
$(function (){
	$('#id').focus();
	
	$('#id').focusout(function() {
			iCheck=idCheck();
	}); //id_focusout
	
	$('#pw').focusout(function() {
			pCheck=pwCheck();
	}); //pw_focusout

}); //ready

// 3) submit 처리
// => Error 있으면 : return false
//	        없으면 : return true -> submit 진행
function inCheck() {
	if (iCheck == false) {
		$('#iMessage').html(' 아이디를 입력 하세요.');
	}
	if (pCheck == false) {
		$('#pMessage').html(' 패스워드를 입력 하세요.');
	}
	if (iCheck && pCheck) {
		return true;
	} else
		return false;
} //inCheck

</script>
</head>
<body>
<h1>로그인</h1><br>
<form action="login" method="post">
<table>
	<tr height="50"><td>아이디</td>
		<td><input type="text" id="id" name="id"><br>
		<span id="iMessage" class="eMessage"></span></td>
	</tr>
	<tr height="50"><td>비밀번호</td>
		<td><input type="password" id="pw" name="pw"><br>
		<span id="pMessage" class="eMessage"></span></td>
	</tr>
</table><br>
		<input type="submit" value="로그인" onclick="return inCheck()">&nbsp;
		<input type="reset" value="취소">
</form><br>
<c:if test="${message != null}">
		${message}
</c:if><br><br>
<a href="findIdf">ID찾기 </a>|
<a href="findPwf">PW찾기 </a>|
<a href="joinf">회원가입</a><br><br>	

<a href="home">HOME</a>
</body>
</html>