/**
 *  Pmember input Data 무결성 확인 function */

// ** Pmember 무결성 확인사항
// ID : 길이(4이상), 영문자,숫자 로만 구성
// password : 길이(4이상), 영문,숫자,특수문자로 구성, 특수문자는 반드시 1개 이상 포함할것
// Name : 길이(2이상), 영문 또는 한글로 만 입력
// BirthDay : 입력 여부 확인  ( length == 10 )
// tel : 정수의 범위  ( 숫자이면서, '.'이 없어야함 )
// email: @ 필수
// addr : 필수 사항이 아님 (X)

function idCheck(){
	var id=$('#id').val();
	if (id.length<4) {
		$('#iMessage').html('아이디는 4글자 이상 입력하세요.');
		return false;
	}else if (id.replace(/[a-z.0-9]/gi,'').length > 0) {
		$('#iMessage').html('아이디는 영문자/숫자로만 입력하세요.');
		return false;
	}else {
		$('#iMessage').html('');
		return true;
	}
} //idCheck

function pwCheck(){
	var pw=$('#pw').val();
	if (pw.length<4) {
		$('#pMessage').html('비밀번호는 4글자 이상 입력하세요.');
		return false;
	}else if (pw.replace(/[!-*]/gi,'').length >= pw.length ) {
		$('#pMessage').html('특수문자가 반드시 1개 이상 포함되어야 합니다.');
		return false;
	}else if (pw.replace(/[a-z.0-9.!-*]/gi,'').length > 0) {
		$('#pMessage').html('비밀번호는 영문자/숫자/특수문자로 만 입력하세요.');
		return false;
	}else {
		$('#pMessage').html('');
		return true;
	}
} //pwCheck

//  password 재입력 동일성 확인
function cpCheck() {
	var pw=$('#pw').val();
	var checkpw=$('#checkpw').val();
	if (pw != checkpw) {
		$('#cMessage').html('비밀번호가 일치하지 않습니다.');
		return false;
	}else {
		$('#cMessage').html('');
		return true;
	}
} //cpCheck

function nmCheck() {
	var name=$("#name").val();
	if(name.length < 2){
		$('#nMessage').html('이름은 2글자 이상 입력하세요.');
	    return false;
	}else if(name.replace(/[a-z.가-힣]/gi,'').length > 0 ){
	   	$('#nMessage').html('이름은 한글/영문으로만 입력하세요.');	
	    return false;
	}else {
	 	$('#nMessage').html('');
	   	return true;
	}
} //nmCheck

function bdCheck() {
	var birth=$("#birth").val();
	if(birth.length != 10){
		$('#bMessage').html('생일은 YYYY-MM-DD 정확하게 입력하세요.');
	    return false;
	}else {
	 	$('#bMessage').html('');
	   	return true;
	}
} //bdCheck 


function telCheck() {
	var tel=$("#tel").val();
	var regt = /(01[0|1|6|9|7])-(\d{3}|\d{4})-(\d{4}$)/g;
	if(!regt.test(tel)){
		$('#tMessage').html('잘못된 휴대폰 번호입니다.');
  		return false;     
	}else {
	 	$('#tMessage').html('');
	   	return true;
	}
} //telCheck 


function emCheck() {
	var email=$("#email").val();
 	var regem=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;

 	if(regem.test(email) == false){
		$('#emMessage').html('적합하지 않은 이메일 형식입니다.');
  		return false;    
	}else {
	 	$('#emMessage').html('');
	   	return true;
	}
 } //emCheck
