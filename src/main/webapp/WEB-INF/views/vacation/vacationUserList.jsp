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
<!-- 사용자 리스트 보여주는 페이지 -->
<div>
	<button id='preMonth' type='button' class='btn btn-xs pull-left' onclick="">이전달</button>
 	<input id="titleDate" type="text" value="2021.07"> 
	<button id='nextMonth' type='button' class='btn btn-xs pull-right' onclick="">다음달</button>
</div>	
 
<table>
	<thead>
		<tr>
			<th>분류</th>
			<th>기간</th>
			<th>상태</th>
			<th>신청날짜</th>
			<th>승인날짜</th>
		</tr>	
	</thead>
	<tbody>
	<!-- 게시판 리스트 반복문 -->
	<c:forEach var="vacation" items="${list}">
	<tr>
		<td>${vacation.type}</td>
		<td><a href="${vacation.vacationAppNum}" class="move">
				<fmt:formatDate pattern="yyyy-MM-dd HH:mm"  value="${vacation.startterm}"/>
				~
				<fmt:formatDate pattern="yyyy-MM-dd HH:mm"  value="${vacation.endterm}"/>
			</a> <strong></strong></td>
		<td>${vacation.state}</td>
		<td>${vacation.applicationDate}</td>
		<td>${vacation.approvalDate}</td>
	</tr>
	</c:forEach>								
	</tbody>
    </table>
</table>
<div align="center">
	<h1>SBP Winds Vacation</h1>
	<pre class="mt-5 mb-3 text-muted text-center"> 
Soldesk Big-Data Professional Winds
김석현 남광우 심태현 이채은 박다영 황다빈
test
	</pre>

</div>
<%@include file="/WEB-INF/includes/vacation/footer.jsp" %>
