<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="/WEB-INF/includes/vacation/header.jsp" %>
<html>
<head>
	<title>Vacation</title>
</head>
<body>
<form action="/vacation/vacationUserList">
    <button>왼쪽화살표</button>

    <input type="text" id="yearMonth"  value="2021년 7월" disabled>
    
    <button>오른쪽화살표</button>

 
<table board="2">
	<thead>
		<tr>
			<th>분류</th>
			<th colspan="2">기간</th>
			
			<th>상태</th>
			<th>신청날짜</th>
			<th>승인날짜</th>
		</tr>	
	</thead>
	<tbody>
	<!-- 게시판 리스트 반복문 -->
	<c:forEach var="vacation" items="${list}">
		<tr>
			<td>
					${vacation.type}
			</td>
			<td>
					<fmt:formatDate pattern="yyyy-MM-dd HH:mm"  value="${vacation.startterm}"/>
				<strong>~</strong>
			</td>
			<td>
					<fmt:formatDate pattern="yyyy-MM-dd HH:mm"  value="${vacation.endterm}"/>
			</td>
			<td>${vacation.state}</td>
			<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"  value="${vacation.applicationDate}"/></td>
			<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"  value="${vacation.approvalDate}"/></td>
					<td>
				<a href="/vacation/vacationUserListOne" class="move">
					확인
				</a> 
				</td>
		</tr>
	</c:forEach>								
	</tbody>
    </table>

</form>
<div align="center">
	<h1>SBP Winds Vacation</h1>
	<pre class="mt-5 mb-3 text-muted text-center"> 
Soldesk Big-Data Professional Winds
김석현 남광우 심태현 이채은 박다영 황다빈
test
	</pre>

</div>
<%@include file="/WEB-INF/includes/vacation/footer.jsp" %>
