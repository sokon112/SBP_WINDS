<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/WEB-INF/includes/vacation/header.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/resources/dist/css/attach.css" />

<html>
	<head>
		<style>
			th{
				text-align:center;
				width:10%;
				font-size:15px;
			}
			
			td{
				text-align:center;
				width:30%;
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
	                 <div class="panel panel-default">
	                    <div class="panel-heading"></div><!-- /.panel-heading -->
						<form action=""role="form">
						        <div class="panel-body">
							        <table class="table table-striped table-bordered ">
							            <thead>
							            <tr>
							                <th colspan="4">휴가신청서</th>
							                </tr> 
							            </thead>
							            <tbody>
							                <tr>
							                    <th>문서번호</th>
							                    <td>${vacation.vacationAppNum}</td>
							                    <th>상태</th>
							                    <td>${vacation.state}</td>
							                </tr>
							                <tr>
							                    <th>사원번호</th>
							                    <td>${vacation.id}</td>
							                    <th>이름</th>
							                    <td>${vacation.vacationApplication.name}</td>
							                </tr>
							                <tr>
							                    <th>분류</th>
							                    <td>${vacation.type }</td>
							                    <th>기간</th>
												<td>
													<fmt:formatDate pattern="yyyy-MM-dd"  value="${vacation.startterm}"/>
												<c:if test="${vacation.type eq '월차'}">
													~
													<fmt:formatDate pattern="yyyy-MM-dd"  value="${vacation.endterm}"/>
												</c:if>
												</td>
							                </tr>
							                <tr>
							                    <th>사유</th>
							                    <td>${vacation.reason }</td>
								        		<c:if test="${not empty vacation.refusalReason}">
							                    	<th>거절사유</th>
								                    <td>${vacation.refusalReason }</td>  
								                </c:if>
							                </tr>
							            </tbody>
							        </table>
						        	<button type="button" class="btn btn-info">확인</button>
						        </div>
						    </form>
	    				</div>
					</div>
	            </div>
	        </div>
			<form action="" id="operForm" method="post">
				<input type="hidden" name="keyType" value="${cri.keyType}" />
				<input type="hidden" name="keyword" value="${cri.keyword}" />
				<input type="hidden" name="pageNum" value="${cri.pageNum}" />
				<input type="hidden" name="amount" value="${cri.amount}" />
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			</form>

		<script src="/resources/js/vacation/vacationManagerCheckOne.js"></script>
		<%@include file="/WEB-INF/includes/vacation/footer.jsp" %>
		<% response.setHeader("Cache-Control","no-store"); response.setHeader("Pragma","no-cache"); response.setDateHeader("Expires",0); if (request.getProtocol().equals("HTTP/1.1")) response.setHeader("Cache-Control", "no-cache"); %>
	</body>
</html>