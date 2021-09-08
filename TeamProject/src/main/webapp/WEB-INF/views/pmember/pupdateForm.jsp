<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script src="resources/myLib/inCheck.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

function updateCh() {
	alert('회원정보가 정상적으로 수정되었습니다.');
}

</script>
</head>
<body>
<h2>회원정보 수정</h2>
<table>
<form action="pupdate" method="post">

	<tr height="50"><td bgcolor="HoneyDew">회원번호</td>
		<td><input type="text" name="no" size="20" value="${Apple.no}" readonly></td>
		<!-- ** input Tag 입력 막기 
				=> disabled :  서버로 전송 안됨 
				=> readonly :  서버로 전송 됨   -->
	</tr>
	<tr height="50"><td bgcolor="HoneyDew">아이디</td>
		<td><input type="text" name="id" value="${Apple.id}" readonly></td>
	</tr>
	<tr height="50"><td bgcolor="HoneyDew">비밀번호</td>
		<td><input type="password" name="pw" value="${Apple.pw}"></td>
	</tr>
	<tr height="50"><td bgcolor="HoneyDew">이름</td>
		<td><input type="text" name="name" value="${Apple.name}"></td>
	</tr>
	<tr height="50"><td bgcolor="HoneyDew">생년월일</td>
		<td><input type="date" name="birth" value="${Apple.birth}"></td>
	</tr>
	<tr height="50"><td bgcolor="HoneyDew">연락처</td>
		<td><input type="tel" name="tel" value="${Apple.tel}" placeholder="하이픈(-) 없이 입력하세요."></td>
	</tr>
	<tr height="50"><td bgcolor="HoneyDew">이메일</td>
		<td><input type="email" name="email" value="${Apple.email}"></td>
	</tr>
<%-- 		<tr height="40"><td bgcolor="PaleGreen">주소</td>
		<td><input type="text" name="addr" value="${Apple.addr}"></td>
	</tr> --%>
	<tr height="50"><td bgcolor="HoneyDew">주소</td>
		<td><input type="text" id="postcode" placeholder="우편번호" size="10">
			<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
			<input type="text" id="addr" name="addr" placeholder="주소" size="45" value="${Apple.addr}"><br>
			<input type="text" id="detailAddr" name="addr" placeholder="상세주소">
			<input type="text" id="extraAddr" name="addr" placeholder="참고항목">
	<script>
      function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddr").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddr").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("addr").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddr").focus();
          		  }
        	}).open();
   		 }
		</script>
		</td>
	</tr><br>
	<tr height="40"><td></td>
		<td><input type="submit" value="수정" onclick="return updateCh()">&nbsp;&nbsp;
			<input type="reset" value="취소"></td>
	</tr>
</form></table>
<c:if test="${message != null}">
	<br>${message}<br><br>	
</c:if>
<hr>
<a href="home">HOME</a>
</body>
</html>