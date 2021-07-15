<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="/WEB-INF/includes/od/header.jsp" %>
<%@include file="/WEB-INF/includes/od/footer.jsp" %>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<h1>searchlist 페이지 입니다.</h1>
	  <div class="col-4">
	    <div class="list-group" id="myList" role="tablist">
	      <a class="list-group-item list-group-item-action" id="list-profile-list" data-toggle="list" href="#waitlist" role="tab" aria-controls="profile">미결 문서 보관함</a>
	      <a class="list-group-item list-group-item-action" id="list-profile-list" data-toggle="list" href="#completelist" role="tab" aria-controls="profile">결제 완료 보관함</a>
	      <a class="list-group-item list-group-item-action" id="list-profile-list" data-toggle="list" href="#templist" role="tab" aria-controls="profile">임시 보관함</a>
	    </div>
	  </div>
</body>
</html>