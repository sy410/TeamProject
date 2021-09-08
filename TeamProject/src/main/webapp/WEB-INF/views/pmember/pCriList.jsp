<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 리스트</title>
<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script>

$(function() {
	// SearchType이 '----'면 keyword 클리어
	$('#searchType').change(function() {
		if ($(this).val()=='n') $('#keyword').val('');
	}); //change
	
	// 검색 후 요청
	$('#searchBtn').on("click", function(){
		self.location = "pcplist"
			+"${pageMaker.makeQuery(1)}"
			+"&searchType="
			+$('#searchType').val()
			+'&keyword='
			+$('#keyword').val()		
	}); //on_click
}); //ready
</script>
</head>
<body  style="text-align:center;">
<h1>회원정보 리스트</h1>
<br>
<c:if test="${not empty message}">
=> ${message}<br>
</c:if>
<div id="searchBar">
	<select name="searchType" id="searchType">
		<option value="n" <c:out value="${pageMaker.cri.searchType == null ? 'selected' : ''}"/> >----</option>
		<option value="o" <c:out value="${pageMaker.cri.searchType == 'o' ? 'selected' : ''}"/> >NO</option>
		<option value="i" <c:out value="${pageMaker.cri.searchType == 'i' ? 'selected' : ''}"/> >ID</option>
		<option value="m" <c:out value="${pageMaker.cri.searchType == 'm' ? 'selected' : ''}"/> >Name</option>
		<option value="b" <c:out value="${pageMaker.cri.searchType == 'b' ? 'selected' : ''}"/> >Birth</option>
		<option value="t" <c:out value="${pageMaker.cri.searchType == 't' ? 'selected' : ''}"/> >Tel</option>
		<option value="a" <c:out value="${pageMaker.cri.searchType == 'a' ? 'selected' : ''}"/> >Addr</option>
		<option value="im" <c:out value="${pageMaker.cri.searchType == 'im' ? 'selected' : ''}"/> >ID or Name</option>
	</select>
	<input type="text" name="keyword" id="keyword" value="${pageMaker.cri.keyword}">
	<button id="searchBtn">Search</button>
</div>
<br><hr>
<table border="1" width=1100 style="margin-left: auto; margin-right: auto;">
<tr height="35" bgcolor="Beige">
	<th>No</th><th>ID</th><th>Name</th><th>Birth</th>
	<th>Tel</th><th>Email</th><th>Addr</th>
</tr>
<c:forEach var="list" items="${Banana}">
<tr height="30" align="center">
	<td>${list.no}</td>
	<td><a href="pdetail?id=${list.id}">${list.id}</a></td>
	<td>${list.name}</td><td>${list.birth}</td>
	<td>${list.tel}</td><td>${list.email}</td><td>${list.addr}</td>
</tr>
</c:forEach>
</table><br>


<div align ="center">
	<!--  Paging 2 : Criteria 적용
	
	1) First << , Prev < 처리 -->
	<c:if test="${pageMaker.prev && pageMaker.spageNo > 1}">
		<a href="pcplist${pageMaker.searchQuery(1)}">FF</a>&nbsp;
		<a href="pcplist${pageMaker.searchQuery(pageMaker.spageNo-1)}">Prev</a>
	</c:if>
	
	<!-- 2) sPageNo ~ ePageNo까지, displayPageNo만큼 표시 -->
	<c:forEach var="i" begin="${pageMaker.spageNo}" end="${pageMaker.epageNo}">	
		<c:if test="${i == pageMaker.cri.currPage}">
			<font size="5" color="Orange">${i}</font>&nbsp;
		</c:if>
		<c:if test ="${i != pageMaker.cri.currPage }">
			<a href ="pcplist${pageMaker.searchQuery(i)}">${i}</a>&nbsp;
		</c:if>
	</c:forEach>
	&nbsp;
	
	<!-- 3) Next > , Last >> 처리 -->
	<c:if test="${pageMaker.next && pageMaker.epageNo > 0}">
		<a href="pcplist${pageMaker.searchQuery(pageMaker.epageNo+1)}">Next</a>&nbsp;
		<a href="pcplist${pageMaker.searchQuery(pageMaker.lastPageNo)}">LL</a>&nbsp;&nbsp;
	</c:if>
</div>
<hr>
<a href="home">HOME</a> 
</body>
</html>