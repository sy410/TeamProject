<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>회원가입</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- Price Slider Stylesheets -->
    <link rel="stylesheet" href="resources/vendor/nouislider/nouislider.css">
    <!-- Google fonts - Playfair Display-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700">
    <!-- Google fonts - Poppins-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,400i,700">
    <!-- swiper-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/css/swiper.min.css">
    <!-- Magnigic Popup-->
    <link rel="stylesheet" href="resources/vendor/magnific-popup/magnific-popup.css">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="resources/css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="resources/css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="resources/img/favicon.png">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
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
		$('#iMessage').html(' 아이디를 입력 하세요.');
	}
	if(pCheck==false) {
		$('#pMessage').html(' 비밀번호를 입력 하세요.');
	}
	if(cCheck==false) {
		$('#cMessage').html(' 비밀번호 확인을 입력 하세요.');
	}
	if(nCheck==false) {
		$('#nMessage').html(' 이름을 입력 하세요.');
	}
	if(bCheck==false) {
		$('#bMessage').html(' 생년월일을 입력 하세요.');
	}
	if(tCheck==false) {
		$('#tMessage').html(' 전화번호를 입력 하세요.');
	}
	if(eCheck==false) {
		$('#emMessage').html(' 이메일을 입력 하세요.');
	}
	if (iCheck && pCheck && cCheck && nCheck && bCheck && tCheck && eCheck) {
		alert('회원가입 되었습니다. \n로그인 후 이용하세요 :-)');
		return true;
	} else 
		return false;
} //inCheck

// ** ID 중복 확인하기
function checkId() {
	var id = $('#id').val();
	$.ajax({
		 url: "idCheck",
         data: {
                id : id
                },
         success : function(data) {
				  if(id=="" && data=='0') {
                    $(".joinbtn").prop("disabled", true);
                    iCheck = 0;
                  	} else if (data == '0') {
                    	$(".trueM").html('사용가능한 아이디입니다.').css ({ fontSize: "small", fontWeight: "bold", color: "Blue" });
                   		iCheck = 1;
                  	  if(iCheck==1) {
                        $(".joinbtn").prop("disabled", false);                       
                        signupCheck();
                   	} 
                } else if (data == '1') {
                    $(".joinbtn").prop("disabled", true);
                    $(".falseM").html('이미 사용중인 아이디입니다.').css ({	fontSize: "small", fontWeight: "bold", color: "Red" });
                    iCheck = 0;
                } 
            }
        });
    }
  
    
// ** 자동 하이픈 추가  
function addHypen(obj) {
    var number = obj.value.replace(/[^0-9]/g, "");
    var phone = "";

    if(number.length < 4) {
        return number;
    } else if(number.length < 7) {
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3);
    } else if(number.length < 11) {
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3, 3);
        phone += "-";
        phone += number.substr(6);
    } else {
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3, 4);
        phone += "-";
        phone += number.substr(7);
    }
    obj.value = phone;
}

</script>
	<style>
		h1 { text-align: center;}
		b { color: red; }
		table {	margin-left:auto; 
    			margin-right:auto; }
	</style>
</head>
<body>
<div class="container-fluid px-3">
	<div class="row min-vh-100">
		<div class="col-md-8 col-lg-6 col-xl-5 d-flex align-items-center">
			<div class="w-100 py-5 px-md-5 px-xxl-6 position-relative">
            	<div class="mb-4"><img class="img-fluid mb-4" src="resources/img/logo-square.svg" alt="..." style="max-width: 4rem;">
              	<h2>Sign up</h2>
              	<p class="text-muted">Welcome</p>
            </div>
<form action="join" method="post" class="form-validate">
	<div class="mb-4">
		<label class="form-label" for="id"> 아이디 <label style="color: red">*</label></label>
        <input class="form-control" name="id" id="id" type="text" oninput="checkId()" required>
        <span id="checkM" class="trueM falseM"></span>
		<span id="iMessage" class="eMessage"></span>
    </div>
	<div class="mb-4">
		<label class="form-label" for="pw"> 비밀번호 <label style="color: red">*</label></label>
        <input class="form-control" name="pw" id="pw" type="password" required>
    	<span id="pMessage" class="eMessage"></span>
    </div>
	<div class="mb-4">
		<label class="form-label" for="checkpw"> 비밀번호 재확인 <label style="color: red">*</label></label>
		<input class="form-control" name="checkpw" id="checkpw" type="password" required>
    	<span id="cMessage" class="eMessage"></span>
    </div>
	<div class="mb-4">
		<label class="form-label" for="name"> 이름 <label style="color: red">*</label></label>
        <input class="form-control" name="name" id="name" type="text" required>
		<span id="nMessage" class="eMessage"></span>
    </div>
	<div class="mb-4">
		<label class="form-label" for="birth"> 생년월일 <label style="color: red">*</label></label>
        <input class="form-control" name="birth" id="birth" type="date" required>
		<span id="bMessage" class="eMessage"></span>
    </div>
    <div class="mb-4">
		<label class="form-label" for="tel"> 연락처 <label style="color: red">*</label></label>
        <input class="form-control" name="tel" id="tel" type="tel" onKeyup = "addHypen(this)" maxlength="13" placeholder="하이픈(-) 없이 입력하세요." required>
		<span id="tMessage" class="eMessage"></span>
    </div>
	<div class="mb-4">
		<label class="form-label" for="email"> 이메일 <label style="color: red">*</label></label>
		<input class="form-control" name="email" id="email" type="email" required>
   		<span id="emMessage" class="eMessage"></span>
    </div>
    <div class="mb-4">
		<label class="form-label" for="addr"> 주소 </label>
		<input class="form-control" type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
		<input class="form-control" name="addr" id="postcode" type="text" placeholder="우편번호" size="10">
		<input class="form-control" name="addr" id="addr" type="text" placeholder="주소" size="45">
		<input class="form-control" name="addr" id="detailAddr" type="text" placeholder="상세주소">
		<input class="form-control" name="addr" id="extraAddr" type="hidden" placeholder="참고항목">
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
</div>
	<div class="d-grid gap-2">   
		<button class="btn btn-lg btn-primary" type="submit" class="joinbtn" onclick="return inCheck()">Sign up</button>
    </div>	
    <hr class="my-4">
    <p class="text-sm text-muted">By signing up you agree to Directory's <a href="#">Terms and Conditions</a> and <a href="#">Privacy Policy</a>.</p>
</form><a class="close-absolute me-md-5 me-xl-6 pt-5" href="home"> 
       <svg class="svg-icon w-3rem h-3rem">
       <use xlink:href="#close-1"> </use>
       </svg></a>
       </div>
      </div>
     <div class="col-md-4 col-lg-6 col-xl-7 d-none d-md-block">
          <!-- Image-->
          <div class="bg-cover h-100 me-n3" style="background-image: url(resources/img/photo/photo-1497436072909-60f360e1d4b1.jpg);"></div>
        </div>
      </div>
    </div>
    <!-- JavaScript files-->
    <script>
      // ------------------------------------------------------- //
      //   Inject SVG Sprite - 
      //   see more here 
      //   https://css-tricks.com/ajaxing-svg-sprite/
      // ------------------------------------------------------ //
      function injectSvgSprite(path) {
      
          var ajax = new XMLHttpRequest();
          ajax.open("GET", path, true);
          ajax.send();
          ajax.onload = function(e) {
          var div = document.createElement("div");
          div.className = 'd-none';
          div.innerHTML = ajax.responseText;
          document.body.insertBefore(div, document.body.childNodes[0]);
          }
      }    
      // to avoid CORS issues when viewing using file:// protocol, using the demo URL for the SVG sprite
      // use your own URL in production, please :)
      // https://demo.bootstrapious.com/directory/1-0/icons/orion-svg-sprite.svg
      //- injectSvgSprite('${path}icons/orion-svg-sprite.svg'); 
      injectSvgSprite('https://demo.bootstrapious.com/directory/1-4/icons/orion-svg-sprite.svg'); 
      
    </script>
    <!-- jQuery-->
    <script src="resources/vendor/jquery/jquery.min.js"></script>
    <!-- Bootstrap JS bundle - Bootstrap + PopperJS-->
    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Magnific Popup - Lightbox for the gallery-->
    <script src="resources/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>
    <!-- Smooth scroll-->
    <script src="resources/vendor/smooth-scroll/smooth-scroll.polyfills.min.js"></script>
    <!-- Bootstrap Select-->
    <script src="resources/vendor/bootstrap-select/js/bootstrap-select.min.js"></script>
    <!-- Object Fit Images - Fallback for browsers that don't support object-fit-->
    <script src="resources/vendor/object-fit-images/ofi.min.js"></script>
    <!-- Swiper Carousel                       -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/js/swiper.min.js"></script>
    <script>var basePath = ''</script>
    <!-- Main Theme JS file    -->
    <script src="resources/js/theme.js"></script>
  </body>
</html>
