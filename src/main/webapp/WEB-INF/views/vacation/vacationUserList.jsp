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
			
			h3{
				margin-top:1px;
			}
			.glyphicon{
				background: 0;
				border: 0;
				padding: 0;
				cursor: pointer
			}
		</style>
		<title>Vacation</title>
	</head>
	<body>
		<div class="container-fluid" style="margin: 20px">
			<div class="row">
	       		<div class="col-lg-12">
	            	<h1 class="page-header">휴가신청관리</h1>
	            </div><!-- /.col-lg-12 -->
	        </div><!-- /.row -->
	        <div class="row">
	            <div class="col-lg-12">
	                <div class="panel panel-default"><!-- /.panel-heading -->
		            <div class="panel-body">
						<div class="selectMonth">
							<div class="col-md-4">
								<div></div>
								<button type="button" class="glyphicon glyphicon-arrow-left pull-right btn-lg" ></button>
							</div>
							<div class="col-md-4">
								<h3 align="center"><fmt:formatDate pattern='yyyy년 MM월'  value='${VacationPageVO.cri.nowMonth}'/></h3>
								<input type="hidden" class="form-control" name="month" readonly="readonly" value="<fmt:formatDate pattern='yyyy년 MM월'  value='${VacationPageVO.cri.nowMonth}'/>"> 
								<input type="hidden" class="form-control11" name="nmonth" readonly="readonly" value="<fmt:formatDate pattern='yyyy년 MM월'  value='${VacationPageVO.cri.nextMonth}'/>">
							</div>
							<div class="col-md-4">
								<div></div>
								<button type="button" class="glyphicon glyphicon-arrow-right pull-left btn-lg" ></button> 
							</div>
						</div>
		        		<table class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th>분류</th>
									<th>기간</th>
									<th>상태</th>
									<th>신청날짜</th>
									<th>승인날짜</th>
									<th>확인</th>
								</tr>	
							</thead>
								<tbody><!-- 게시판 리스트 반복문 -->
									<c:forEach var="vacation" items="${list}">
										<tr>
											<td>${vacation.type}</td>
											<td><fmt:formatDate pattern="yyyy-MM-dd"  value="${vacation.startterm}"/>
											<c:if test="${vacation.type eq '월차'}">
											~
											<fmt:formatDate pattern="yyyy-MM-dd"  value="${vacation.endterm}"/>
											</c:if>
											</td>
											<td>${vacation.state}</td>
											<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"  value="${vacation.applicationDate}"/></td>
											<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"  value="${vacation.approvalDate}"/></td>
											<td>
												<a href="${vacation.vacationAppNum}" class="move">확인</a> 
											</td>
										</tr>
									</c:forEach>	
																
								</tbody>
						    </table>
						</div>
					</div>
				</div>
			</div>
		</div>
	<form action="/vacation/vacationManager" method="post" id="listCheckForm">
       	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<input type="hidden" name="pageNum" value="${VacationPageVO.cri.pageNum}" />
		<input type="hidden" name="amount" value="${VacationPageVO.cri.amount}" /> 
		<input type="hidden" name="amount" value="${VacationPageVO.cri.nowMonth}" /> 
	</form>
	<form action="" method="post" id="preMonthForm">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
		<input type="hidden" name="cri" value="${VacationPageVO.cri} " />
		<input type="hidden" name="id" value="${info.username}"/>
	</form>
 
	<script type="text/javascript">
		let result='${result}';
		let error='${error}';
	</script>   

	<script src="/resources/js/vacation/vacationUser.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<%@include file="/WEB-INF/includes/vacation/footer.jsp" %>
	<% response.setHeader("Cache-Control","no-store"); response.setHeader("Pragma","no-cache"); response.setDateHeader("Expires",0); if (request.getProtocol().equals("HTTP/1.1")) response.setHeader("Cache-Control", "no-cache"); %>
	</body>
</html>

