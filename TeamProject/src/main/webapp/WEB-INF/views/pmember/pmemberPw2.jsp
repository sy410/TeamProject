<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>패스워드 찾기</title>
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script>
$(function(){
	$("#findBtn").click(function(){
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
<h3>패스워드 찾기</h3>	
		<!-- 아이디와 이름이 일치하지 않을 때-->
		<c:if test="${check == 1}">
			<script>
				opener.document.getElementById('id').value = "";
				opener.document.getElementById('name').value = "";
			</script>
				<label>일치하는 정보가 없습니다.</label>
		</c:if>
		
		<!-- 아이디와 이름이 일치하지 할 때 -->
		<c:if test="${check == 0}">
			<label> 고객님의 비밀번호는 '${pw}' 입니다.</label>
		</c:if><br><br>
<button type="button" id="loginBtn">로그인화면으로 돌아가기</button>
</body>
</html>