<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="/WEB-INF/includes/vacation/header.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
	<head>
	<style>
		th{
			text-align:center;
			width:10%;
		}
		
		td{
			text-align:center;
		}
	</style>
	    <meta charset="utf-8">
	<title>Insert title here</title>
	</head>
	<body>
		<div class="container-fluid" style="margin:20px">
			<div class="row">
	                <div class="col-lg-12">
	                    <h1 class="page-header">휴가신청서</h1>
	                </div><!-- /.col-lg-12 -->
	        </div>            
	        <div class="row">
	            <div class="col-lg-12">
	                <div class="panel panel-default"><!-- /.panel-heading -->
						<form action="/vacation/update" role="form" method="post">
					        <div class="panel-body">
								<table class="table table-striped table-bordered table-hover">
						            <thead>
							            <tr>
							                <th colspan="4">휴가신청서</th>
							            </tr> 
						            </thead>
						            <tbody>
						                <tr>
						                    <th>분류</th>
						                    <td colspan="3">
						                    	<input type="text" name="type" value="${vacation.type }" readonly="readonly" disabled="disabled">
						                    </td>
						                <tr>
						                    <th>기간</th>
						                    <td>
						                    	<input type="text" name="term" value="<fmt:formatDate pattern="yyyy-MM-dd"  value="${vacation.term}"/>" readonly="readonly" disabled="disabled">
						                    </td>
						                </tr>
						                <tr>
						                    <th>사유</th>
						                    <td colspan="3"><input name="reason" value="${vacation.reason }"> </td>
						                </tr>
					            	</tbody>
					        	</table>
						        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						        <input type="hidden" class="num" name="vacationAppNum" value="${vacation.vacationAppNum }"/>
					        	<input type="hidden" name="id" value="${info.username}"/>
						        <button type="submit" class="btn btn-warning">수정</button>
						        <button type="button" class="btn btn-primary">확인</button>
					        </div>
	   					</form>
	 				</div>
	 			</div>
	 		</div> 
	 	</div>
		<form action="" id="operForm" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<input type="hidden" name="id" value="${info.username}"/>
		</form>

	    <%@include file="/WEB-INF/includes/vacation/footer.jsp" %>
	    <script src="/resources/js/vacation/vacationUserCheckModify.js"></script>
	</body>
</html>