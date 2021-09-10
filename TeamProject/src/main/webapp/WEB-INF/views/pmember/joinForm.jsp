<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
<!-- 	<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" /> -->
	<!--<meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
	<!--<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
	
	<!-- 부트스트랩 css 사용 -->
	<!-- <link rel="stylesheet" href="/resources/css/bootstrap.css">-->
	
<title>회원가입</title>
<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script src="resources/myLib/inCheck.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 <script>
//1) 전역변수 정의
var iCheck = false;
var pCheck = false;
var cCheck = false;
var nCheck = false;
var bCheck = false;
var tCheck = false;
var eCheck = false;
var aCheck = false;

//2) 개별컬럼의 무결성 점검
$ (function (){
	$('#id').focus();
	
	$('#id').focusout(function() {
		iCheck=idCheck();
	}); //id_focusout 
	
	$('#pw').focusout(function() {
		pCheck=pwCheck();
	}); //pw_focusout
	
	$('#checkpw').focusout(function() {
		cCheck=cpCheck();
	}); //checkpw_focusout
	
	$('#name').focusout(function() {
		nCheck=nmCheck();
	}); //name_focusout
	
	$('#birth').focusout(function() {
		bCheck=bdCheck();
	}); //birth_focusout
	
	$('#tel').focusout(function() {
		tCheck=telCheck();
	}); //tel_focusout
	
	$('#email').focusout(function() {
		eCheck=emCheck();
	}); //email_focusout
	
	$('#addr').focusout(function() {
		aCheck=adCheck();
	}); //addr_focusout

}); //ready

//3) submit 처리
function inCheck() {

	if(iCheck==false) {
		$('#iMessage').html(' 아이디를 입력 하세요 ~');
	}
	if(pCheck==false) {
		$('#pMessage').html(' 비밀번호를 입력 하세요 ~');
	}
	if(cCheck==false) {
		$('#cMessage').html(' 비밀번호 확인을 입력 하세요 ~');
	}
	if(nCheck==false) {
		$('#nMessage').html(' 이름을 입력 하세요 ~');
	}
	if(bCheck==false) {
		$('#bMessage').html(' 생년월일을 입력 하세요 ~');
	}
	if(tCheck==false) {
		$('#tMessage').html(' 전화번호를 입력 하세요 ~');
	}
	if(eCheck==false) {
		$('#emMessage').html(' 이메일을 입력 하세요 ~');
	}
	if (iCheck && pCheck && cCheck && nCheck && bCheck && tCheck && eCheck) {
		alert('회원가입 되었습니다. \n로그인 후 이용하세요 :-)');
		return true;
	} else 
		return false;
} //inCheck

// ** ID 중복 확인하기
function idDupCheck() {
	if (iCheck == false) {
		iCheck = idCheck();
	} else {
		// => 서버로 입력값을 보내어 중복확인, 결과처리
		// => window.open(....)
		//	  url 요청을 서버로 전달(request)하고, 그 결과(response)를 Open 해줌
		var url="idCheck?id="+$('#id').val();
		window.open(url,"_blank",
				"toolbar=no,menubar=yes,scrollbars=yes,resizable=yes,width=500,height=400");
	}
} //idDupCheck 


</script>
	<style>
		h1 { text-align: center; }
		b { color: red; }
	</style>
</head>
<body>
<h1>회원가입</h1><br><hr><br>
<form action="join" method="post" id="myForm">
<table>
	<tr height="50"><td><b>*</b> 아이디</td>
		<td><input type="text" name="id" id="id" required>&nbsp;&nbsp;
			<input type="button" value="ID중복확인" id="idDup" onclick="idDupCheck()"><br>
			<span id="iMessage" class="eMessage"></span></td>
	</tr>	
	<tr height="50"><td><b>*</b> 비밀번호</td>
		<td><input type="password" name="pw" id="pw"><br>
			<span id="pMessage" class="eMessage"></span></td>
	</tr>
	<tr height="50"><td><b>*</b> 비밀번호 재확인</td>
		<td><input type="password" name="checkpw" id="checkpw"><br>
			<span id="cMessage" class="eMessage"></span></td>
	</tr>	
	<tr height="50"><td><b>*</b> 이름</td>
		<td><input type="text" name="name" id="name"><br>
			<span id="nMessage" class="eMessage"></span></td>
	</tr>	
	<tr height="50"><td><b>*</b> 생년월일</td>
		<td><input type="date" name="birth" id="birth"><br>
			<span id="bMessage" class="eMessage"></span></td>
	</tr>
	<tr height="50"><td><b>*</b> 연락처</td>
		<td> <input type="tel" name="tel" id="tel" placeholder="하이픈(-) 포함 입력하세요."><br>
			 <span id="tMessage" class="eMessage"></span></td>
		</tr>
	<tr height="50"><td><b>*</b> 이메일</td>
	<td><input type="email" name="email" id="email"><br>
			<span id="emMessage" class="eMessage"></span></td>
	</tr>
			<!-- <select name="email2">
				<option value="naver.com">naver.com</option>
				<option value="hanmail.net">hanmail.net</option>
				<option value="gmail.com">gmail.com</option>
				<option value="nate.com">nate.com</option>
			</select>  -->	
			
			
<!-- 	<tr height="50"><td>주소</td>	
		<td><input type="text" name="addr" id="addr"><br> -->
	<tr height="50"><td>주소</td>
		<td><input type="text" id="postcode" name="addr" placeholder="우편번호" size="10">
			<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
			<input type="text" id="addr" name="addr" placeholder="주소" size="45"><br>
			<input type="hidden" id="detailAddr" name="addr" placeholder="상세주소">
			<input type="hidden" id="extraAddr" name="addr" placeholder="참고항목">
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
                
                document.getElementById("detailAddr").focus();
          		  }
        	}).open();
   		 }
		</script>
		</td>
	</tr>
</table><br><hr><br>	
		<input type="submit" value="가입" onclick="return inCheck()" disabled id="submit">&nbsp;&nbsp;
		<input type="reset" value="취소"><br>
</form>	
<c:if test="${message != null}">
	<br>${message}<br><br>	
</c:if><br>	
<a href="home">HOME</a>

<!--  부트스트랩 js 사용 -->
<!-- <script type="text/javascript" src="/resources/js/bootstrap.js"></script>-->

</body>
</html>