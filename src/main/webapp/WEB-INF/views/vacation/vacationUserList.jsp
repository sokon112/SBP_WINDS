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
    <button onclick="preMonth">왼쪽화살표</button>
		<fmt:formatDate pattern="yyyy년 MM월"  value="${cri.nowMonth}"/>
    <button onclick="nextMonth">오른쪽화살표</button>

 
<div class="panel-body">
        <table class="table table-striped table-bordered table-hover">
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
			<td>
					${vacation.type}
			</td>
			<td>
					<fmt:formatDate pattern="yyyy-MM-dd HH:mm"  value="${vacation.startterm}"/>
					
				<strong>~</strong>

					<fmt:formatDate pattern="yyyy-MM-dd HH:mm"  value="${vacation.endterm}"/>
			</td>
			<td>${vacation.state}</td>
			<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"  value="${vacation.applicationDate}"/></td>
			<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"  value="${vacation.approvalDate}"/></td>
					<td>
				<a href="${vacation.vacationAppNum}" class="move">
					확인
				</a> 
				</td>
		</tr>
	</c:forEach>								
	</tbody>
    </table>
</div>
</form>
<div align="center">
	<h1>SBP Winds Vacation</h1>
	<pre class="mt-5 mb-3 text-muted text-center"> 
Soldesk Big-Data Professional Winds
김석현 남광우 심태현 이채은 박다영 황다빈
test
	</pre>

</div>
<script src="/resources/js/vacation/list.js"></script>
<%@include file="/WEB-INF/includes/vacation/footer.jsp" %>
</body>
</html>

