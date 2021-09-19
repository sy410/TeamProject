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
<style>
	table {
    margin-left:auto; 
    margin-right:auto;
	}
</style>
</head>
<body style="text-align:center;">
<h1>아이디 찾기</h1>
<form action="findId" method="post">
<table>
	<tr height="50"><td>이름</td>
		<td><input type="text" id="name" name="name"><br>
		<span id="nMessage" class="eMessage"></span></td>
	</tr>
	<tr height="50"><td>이메일</td>
		<td><input type="email" id="email" name="email"><br>
		<span id="emMessage" class="eMessage"></span></td>
	</tr></table>
		
		<!-- 이름과 이메일이 일치하지 않을 때-->
		<c:if test="${check == 1}">
			<script>
				$('#name').val="";
				$('#email').val="";
				alert("일치하는 정보가 없습니다.");
			</script>
		</c:if>

		<!-- 이름과 이메일이 일치 할 때 -->
		<c:if test="${check == 0 }">
			<script>
				alert("고객님의 아이디는 '${id}' 입니다.");		
			</script>	
		</c:if><br>
	<input type="submit" value="찾기" onclick="return inCheck()">&nbsp;&nbsp;
	<input type="reset" value="취소">
</form><br>
<a href="home">HOME</a>
</body>
</html>
