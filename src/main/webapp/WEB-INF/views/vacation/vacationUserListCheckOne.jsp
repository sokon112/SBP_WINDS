<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="/WEB-INF/includes/vacation/header.jsp" %>
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
		<title>Vacation</title>
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
                	<div class="panel panel-default">
                        <div class="panel-heading">
                        </div><!-- /.panel-heading -->
						<form action="/vacation/cancle" role="form" method="post">
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
					                    <td colspan="3">${vacation.type }</td>
					                <tr>
					                    <th>기간</th>
										<td><fmt:formatDate pattern="yyyy-MM-dd"  value="${vacation.term}"/></td>
					                </tr>
					                <tr>
					                    <th>사유</th>
					                    <td colspan="3">${vacation.reason }</td>
					                </tr>
					                <c:if test="${not empty vacation.refusalReason}">
								        <tr>
									        <th>거절사유</th>
									        <td colspan="3">${vacation.refusalReason }</td>
							           	</tr>
						             </c:if>
					            </tbody>
					        </table>
					         <button type="button" class="btn btn-primary pull-right">확인</button>
						        <c:if test="${vacation.state eq '신청' }">
							        <button type="button" class="btn btn-warning pull-right">수정</button>
							        <button type="button" class="btn btn-danger pull-right">삭제</button>
						        </c:if>
						        <c:if test="${vacation.state eq '승인' }">
						        	<button type="button" class="btn btn-info pull-right">반납</button>
						        </c:if>
					        </div>
					    </form>
					 </div>
				 </div>
 			</div>  
		<!--  modify 실행시 실행됨 -->
			<form action="" id="operForm" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<input type="hidden" name="id" value="${info.username}"/>
				<input type="hidden" name="vacationAppNum" value="${vacation.vacationAppNum}" />	
			</form>
			<form action="" id="operForm" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<input type="hidden" name="id" value="${info.username}"/>
				<input type="hidden" name="vacationAppNum" value="${vacation.vacationAppNum}" />
				<input type="hidden" name="cri" value="${VacationPageVO.cri} " />
			</form>
		</div>
		
	<%@include file="/WEB-INF/includes/vacation/footer.jsp" %>
	<script src="/resources/js/vacation/vacationUserCheckOne.js"></script>
	</body>
</html>