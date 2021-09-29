<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
 	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>로그인</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="noindex">
    <!-- Price Slider Stylesheets -->
    <link rel="stylesheet" href="https://d19m59y37dris4.cloudfront.net/directory/2-0-1/vendor/nouislider/nouislider.css">
    <!-- Google fonts - Playfair Display-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700">
    <!-- Google fonts - Poppins-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,400i,700">
    <!-- swiper-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/css/swiper.min.css">
    <!-- Magnigic Popup-->
    <link rel="stylesheet" href="https://d19m59y37dris4.cloudfront.net/directory/2-0-1/vendor/magnific-popup/magnific-popup.css">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="https://d19m59y37dris4.cloudfront.net/directory/2-0-1/css/style.default.222cad84.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="https://d19m59y37dris4.cloudfront.net/directory/2-0-1/css/custom.0a822280.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="https://d19m59y37dris4.cloudfront.net/directory/2-0-1/img/favicon.png">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
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
function inCheck() {
	if (iCheck == false) {
		$('#iMessage').html(' 아이디를 입력하세요.');
	}
	if (pCheck == false) {
		$('#pMessage').html(' 패스워드를 입력하세요.');
	}
	if (iCheck && pCheck) {
		return true;
	} else
		return false;
} //inCheck

</script>
</head>
<body>
<div class="container-fluid px-3">     
	<div class="row min-vh-100">
		<div class="col-md-8 col-lg-6 col-xl-5 d-flex align-items-center">
			<div class="w-100 py-5 px-md-5 px-xxl-6 position-relative">
            	<div class="mb-5"><img class="img-fluid mb-3" src="https://d19m59y37dris4.cloudfront.net/directory/2-0-1/img/logo-square.svg" alt="..." style="max-width: 4rem;">
              	<h2>Welcome back</h2>
            </div>
<form action="login" method="post" class="form-validate">
	<div class="mb-4">
		<label class="form-label" for="id"> 아이디 </label>
        <input class="form-control" name="id" id="id" type="text" required>
    	<span id="iMessage" class="eMessage"></span>
   	</div>
  	<div class="mb-4">
		<label class="form-label" for="pw"> 비밀번호 </label>
	     <input class="form-control" name="pw" id="pw" type="password" required>
    	 <span id="pMessage" class="eMessage"></span>
    </div>
    <div class="mb-4">
     <div class="form-check">
       <input class="form-check-input" id="loginRemember" type="checkbox">
       <label class="form-check-label text-muted" for="loginRemember"> <span class="text-sm">아이디 저장</span></label>
     </div>
    </div>
    <!-- Submit-->
    <div class="d-grid">
		<button class="btn btn-lg btn-primary" type="submit" onclick="return inCheck()">Sign in</button>
    </div>
    <!-- <hr class="my-3 hr-text letter-spacing-2" data-content="OR">
    <div class="d-grid gap-2">
		<button class="btn btn btn-outline-primary btn-social"><i class="fa-2x fa-facebook-f fab btn-social-icon"> </i>Connect <span class="d-none d-sm-inline">with Facebook</span></button>
        <button class="btn btn btn-outline-muted btn-social"><i class="fa-2x fa-google fab btn-social-icon"> </i>Connect <span class="d-none d-sm-inline">with Google</span></button>
    </div> -->
    <hr class="my-4">
     <p class="text-center"><small class="text-muted text-center"><a href="findIdf"> 아이디찾기</a>&nbsp;&nbsp; | &nbsp;&nbsp;<a href="findPwf"> 비밀번호찾기</a>&nbsp;&nbsp; | &nbsp;&nbsp;<a href="joinf"> 회원가입</a></small></p>
  </form>
  <c:if test="${message != null}">
 	 <script>
		alert("${message}");
	 </script>	
  </c:if>
  	<a class="close-absolute me-md-5 me-xl-6 pt-5" href="home"> 
	<svg class="svg-icon w-3rem h-3rem">
      <use xlink:href="#close-1"> </use>
    </svg></a>
   </div>
  </div>
  <div class="col-md-4 col-lg-6 col-xl-7 d-none d-md-block">
  	<!-- Image-->
          <div class="bg-cover h-100 me-n3" style="background-image: url(https://d19m59y37dris4.cloudfront.net/directory/2-0-1/img/photo/photo-1497436072909-60f360e1d4b1.jpg);"></div>
        </div>
      </div>
    </div>
    <button class="btn btn-primary btn-sm d-none d-lg-block" type="button" data-bs-toggle="collapse" data-bs-target="#style-switch" id="style-switch-button">
      <svg class="svg-icon svg-icon-md">
        <use xlink:href="#configuration-1"> </use>
      </svg>
    </button>
    <div class="collapse" id="style-switch">
      <div class="p-4">
        <h6 class="text-uppercase mb-4">Select theme colour</h6>
        <form class="mb-3">
          <select class="form-select style-switch-select" name="colour" id="colour">
            <option value="">select colour variant</option>
            <option value="resources/css/style.default.222cad84.css">blue</option>
            <option value="resources/css/style.pink.8e944c0e.css">pink</option>
            <option value="resources/css/style.green.dbb19695.css">green</option>
            <option value="resources/css/style.red.25441cbe.css">red</option>
            <option value="resources/css/style.violet.46bbf1a3.css">violet</option>
            <option value="resources/css/style.sea.e2d18689.css">sea</option>
          </select>
        </form>
        <p class="text-muted text-xs mb-0">Stylesheet switching in this demo is done with JavaScript and can cause a blink while page loads. This will not happen in your production code.</p>
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
      //- injectSvgSprite('${path}icons/orion-svg-sprite.69651a96.svg'); 
      injectSvgSprite('https://demo.bootstrapious.com/directory/1-4/icons/orion-svg-sprite.svg'); 
      
    </script>
    <!-- jQuery-->
    <script src="https://d19m59y37dris4.cloudfront.net/directory/2-0-1/vendor/jquery/jquery.min.js"></script>
    <!-- Bootstrap JS bundle - Bootstrap + PopperJS-->
    <script src="https://d19m59y37dris4.cloudfront.net/directory/2-0-1/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Magnific Popup - Lightbox for the gallery-->
    <script src="https://d19m59y37dris4.cloudfront.net/directory/2-0-1/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>
    <!-- Smooth scroll-->
    <script src="https://d19m59y37dris4.cloudfront.net/directory/2-0-1/vendor/smooth-scroll/smooth-scroll.polyfills.min.js"></script>
    <!-- Bootstrap Select-->
    <script src="https://d19m59y37dris4.cloudfront.net/directory/2-0-1/vendor/bootstrap-select/js/bootstrap-select.min.js"></script>
    <!-- Object Fit Images - Fallback for browsers that don't support object-fit-->
    <script src="https://d19m59y37dris4.cloudfront.net/directory/2-0-1/vendor/object-fit-images/ofi.min.js"></script>
    <!-- Swiper Carousel                       -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/js/swiper.min.js"></script>
    <script src="https://d19m59y37dris4.cloudfront.net/directory/2-0-1/vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="resources/js/demo.36f8799a.js"></script>
    <script>var basePath = ''</script>
    <!-- Main Theme JS file    -->
    <script src="resources/js/theme.0750373b.js"></script>
  </body>
</html>
