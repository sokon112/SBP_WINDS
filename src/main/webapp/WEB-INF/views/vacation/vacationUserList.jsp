<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="/WEB-INF/includes/vacation/header.jsp" %>
<html>
<head>
<style>
th,td{
text-align:center;
width:15%;}
</style>
	<title>Vacation</title>
</head>
<body>
<!-- 달을 스크립트로 끌어올려 계산하기  월 달 따로  -->
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
   
			<div class="selectMonth">
				<div class="col-md-4">
					<div></div>
					<button type="button" class="glyphicon glyphicon-arrow-left pull-right" ></button>
				</div>
				<div class="col-md-4">
					<h3 align="center"><fmt:formatDate pattern='yyyy년 MM월'  value='${VacationPageVO.cri.nowMonth}'/></h3>
					<input type="hidden" class="form-control" name="month" readonly="readonly" value="<fmt:formatDate pattern='yyyy년 MM월'  value='${VacationPageVO.cri.nowMonth}'/>"> 
					<input type="hidden" class="form-control11" name="nmonth" readonly="readonly" value="<fmt:formatDate pattern='yyyy년 MM월'  value='${VacationPageVO.cri.nextMonth}'/>">
				</div>
					
				<div class="col-md-4">
					<div></div>
					<button type="button" class="glyphicon glyphicon-arrow-right pull-left" ></button> 
				</div>
			</div>
        <table class="table table-striped table-bordered table-hover">
	<thead>
	<tr>
	
<%-- 		<td >
			<button type="button" class="glyphicon glyphicon-arrow-left" ></button>
		</td>
		<td colspan="4">
			<h3 align="center"><fmt:formatDate pattern='yyyy년 MM월'  value='${VacationPageVO.cri.nowMonth}'/></h3>
			<input type="hidden" class="form-control" name="month" readonly="readonly" value="<fmt:formatDate pattern='yyyy년 MM월'  value='${VacationPageVO.cri.nowMonth}'/>"> 
			<input type="hidden" class="form-control11" name="nmonth" readonly="readonly" value="<fmt:formatDate pattern='yyyy년 MM월'  value='${VacationPageVO.cri.nextMonth}'/>">
		</td>
		<td>
			<button type="button" class="glyphicon glyphicon-arrow-right" ></button> 
		</td> --%>
	</tr>
		<tr>
			<th>분류</th>
			<th>기간</th>
			<th>상태</th>
			<th>신청날짜</th>
			<th>승인날짜</th>
			<th>확인</th>
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
					<fmt:formatDate pattern="yyyy-MM-dd"  value="${vacation.term}"/>

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
</div>
</div>
</div>


<form action="/vacation/vacationManager" method="post" id="listCheckForm">
        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
</form>

<form action="" method="post" id="preMonthForm">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
	<input type="hidden" name="cri" value="${VacationPageVO.cri} " />
	<input type="hidden" name="id" value="${info.username}"/>
	<!-- <input type="hidden" name="monthMove" value="basic"/> -->
</form>
<div align="center">
	<h1>SBP Winds Vacation</h1>
	<pre class="mt-5 mb-3 text-muted text-center"> 
Soldesk Big-Data Professional Winds
김석현 남광우 심태현 이채은 박다영 황다빈
test
	</pre>

</div>     
<script src="/resources/js/vacation/vacationUser.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<%@include file="/WEB-INF/includes/vacation/footer.jsp" %>
</body>
</html>

