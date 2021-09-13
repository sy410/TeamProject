<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){
	// 취소
	$(".cencle").on("click", function(){
		location.href = "pdetail";		    
	})

	$("#submit").on("click", function(){
		if($("#pw").val()==""){
			alert("비밀번호를 입력해주세요.");
			$("#pw").focus();
			return false;
		}
		$.ajax({
			url : "passCheck",
			type : "POST",
			dataType : "json",
			data : $("#delForm").serializeArray(),
			success: function(data){
				
				if(data==0){
					alert("패스워드가 틀렸습니다.");
					return;
				}else{
					if(confirm("회원탈퇴하시겠습니까?")){
						$("#delForm").submit();
					}
					
				}
			}
		})
		
	});
});
</script>
</head>
<body>
<h2>회원탈퇴</h2>
<form action="pdelete" method="post" id="delForm">
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
</form>
<button class="btn" type="button" id="submit">회원탈퇴</button>
<button class="cencle" type="button">취소</button>
</body>
</html>
