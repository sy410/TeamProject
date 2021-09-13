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

<script>
$(function(){
	$("#pwBtn").click(function(){
		$.ajax({
			url : "findPw",
			type : "POST",
			data : {
				id : $("#id").val(),
				email : $("#email").val()
			},
			success : function(result) {
				alert(result);
			},
		})
	});
})

</script>

</head>
<body>
<h1>패스워드 찾기</h1>
<form action="findPw" method="post">
<table>
	<tr height="50">
		<td><input type="text" id="id" name="id" placeholder="아이디"><br>
		<span id="iMessage" class="eMessage"></span></td>
	</tr>
	<tr height="50">
		<td><input type="text" id="name" name="name" placeholder="이름"><br>
		<span id="nMessage" class="eMessage"></span></td>
	</tr></table>
	<br>
		<input type="submit" value="찾기" id="pwBtn" onclick="return inCheck()">&nbsp;&nbsp;
		<input type="reset" value="취소" onclick="history.go(-1);">
</form>
</body>
</html>