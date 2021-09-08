<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script>
	$(function(){
		$("#loginBtn").click(function(){
			location.href='loginf';
		})
	})
</script>
</head>
<body>
<h3>아이디 찾기 검색결과</h3>
		<!-- 이름과 이메일이 일치하지 않을 때-->
		<c:if test="${check == 1}">
			<script>
				opener.document.getElementById('name').value = "";
				opener.document.getElementById('email').value = "";
			</script>
			<label>일치하는 정보가 없습니다.</label><br>
		</c:if>

		<!-- 이름과 이메일이 일치 할 때 -->
		<c:if test="${check == 0 }">
			<label> 고객님의 아이디는 '${id}' 입니다.</label>
		</c:if><br><br>
<button type="button" id="loginBtn">로그인화면으로 돌아가기</button>
</body>
</html>