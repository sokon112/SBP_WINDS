<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%@include file="../includes/home/header.jsp" %>
<html>
<head>
	<title>Home</title>
</head>
<body style="background-color:#ffffff">
<div class="row" style="margin-left:8px;">
<div>
<table style="width:100%; height:95%;">
<tr></tr>
<tr>
	<td>
		<img src="/resources/img/SBP_Winds_logo_4.png" alt="" style="width: 100%;max-width: 1100px; min-width: 400px;height: auto;">
	</td>
    <sec:authorize access="!isAuthenticated()">   
	<td style="min-width:300px">
		<form class="form-signin" name="loginform" action="/login" method="post">
			<h1 class="h3 mb-3 font-weight-normal">로 그 인</h1>
		  
		    <label for="userid" class="sr-only">로그인 아이디</label>
		    <input type="text" id="username" name="username" class="form-control" 
		    placeholder="아이디를 입력해 주세요" required autofocus> 
		     
		    <label for="password" class="sr-only">비밀번호</label>
		    <input type="password" id="password" name="password" class="form-control" 
		    placeholder="비밀번호를 입력해 주세요" required>
			<div class="error-message">
			<span style="color:red;">${loginError}</span>
			</div>
			<div class="checkbox mb-3">
			   <label>
			      <input type="checkbox" name="remember-me"> 로그인 기억하기
			   </label>
			</div>
			<button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>	
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
		</form>
	</td>
	</sec:authorize>
    <sec:authorize access="isAuthenticated()"> 
	<sec:authentication property="principal" var="info"/>  
	<td style="min-width:300px">
		<form class="form-signin" action="">
			<h1 class="h3 mb-3 font-weight-normal">로그인 정보</h1>
		  
		    <label for="deptInfo" class="sr-only">부서</label>
		    <p id="deptInfo">부&nbsp&nbsp&nbsp서 : &nbsp&nbsp${info.memberVO.deptName} ( ${info.memberVO.deptNum} )</p>
		    <label for="empID" class="sr-only">사번</label>
		    <p id="empID">사&nbsp&nbsp&nbsp번 : &nbsp&nbsp${info.username}</p>
		    <label for="empNAME" class="sr-only">이름</label>
		    <p id="empID">이&nbsp&nbsp&nbsp름 : &nbsp&nbsp${info.memberVO.name}</p>
		    <label for="empTEL" class="sr-only">연락처</label>
		    <p id="empTEL">연락처 : &nbsp&nbsp${info.memberVO.telNum}</p>
		</form>
		<form class="form-signin" action="/logout" method="post" id="logoutForm">
			<button class="btn btn-lg btn-success btn-block" type="submit">로그아웃</button>	
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>
	</td>
	</sec:authorize>
	<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
</tr>
<tr></tr>
<tr>
<td colspan="3">
</td>
</tr>
</table>
</div>
	<div style=" position:fixed; bottom: 0; width:99%;">
	<pre class="mt-5 mb-3 text-muted text-center">
		@Soldesk Big-Data Professional Winds
		& 김석현 남광우 심태현 이채은 박다영 황다빈
	</pre>
	</div>
</div>

<%@include file="../includes/home/footer.jsp" %>
