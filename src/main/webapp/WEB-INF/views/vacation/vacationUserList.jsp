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
<div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">휴가신청관리</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        
                        <!-- /.panel-heading -->
                        <div class="panel-body">
    <button type="button" class="glyphicon glyphicon-arrow-left" onclick="preMonth()">왼쪽화살표</button>
    <input class="form-control" name="bno" readonly="readonly" value="<fmt:formatDate pattern='yyyy년 MM월'  value='${VacationPageVO.cri.nowMonth}'/>">
	
    <button class="glyphicon glyphicon-arrow-right" onclick="nextMonth">오른쪽화살표</button>

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
					<fmt:formatDate pattern="yyyy-MM-dd"  value="${vacation.startterm}"/>
					
				<strong>~</strong>

					<fmt:formatDate pattern="yyyy-MM-dd"  value="${vacation.endterm}"/>
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

<div align="center">
	<h1>SBP Winds Vacation</h1>
	<pre class="mt-5 mb-3 text-muted text-center"> 
Soldesk Big-Data Professional Winds
김석현 남광우 심태현 이채은 박다영 황다빈
test
	</pre>

</div>
<form action="/vacation/vacationManager" method="post" id="listCheckForm">
        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
        </form>
       
<script src="/resources/js/vacation/vacationUser.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script>
<%@include file="/WEB-INF/includes/vacation/footer.jsp" %>
</body>
</html>

