<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/WEB-INF/includes/vacation/header.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/resources/dist/css/attach.css" />

<html>
<head>
    <meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">휴가신청서</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>            
            <div class="row">
                <div class="col-lg-12">
                	<div class="panel panel-default">
                        <div class="panel-heading">
                           Board Read Page
                        </div>
                        <!-- /.panel-heading -->

<form action=""role="form">
        <div class="panel-body">
        <table class="table table-striped table-bordered table-hover">
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
                    <td colspan="3">
                       ${vacation.type }
                    </td>
                </tr>
                <tr>
                    <th>기간</th>
                    <td>
                    	<fmt:formatDate pattern="yyyy-MM-dd"  value="${vacation.startterm}"/>
                    </td>
                    <td>~</td>
                    <td><fmt:formatDate pattern="yyyy-MM-dd"  value="${vacation.endterm}"/></td>
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
        <button type="button" class="btn btn-info">확인</button>
        </div>
    </form>
    </div>
                	</div>
                </div>
<form action="" id="operForm">
	<input type="hidden" name="keyType" value="${cri.keyType}" />
	<input type="hidden" name="keyword" value="${cri.keyword}" />
	<input type="hidden" name="pageNum" value="${cri.pageNum}" />
	<input type="hidden" name="amount" value="${cri.amount}" />
<%-- 	<input type="hidden" name="id"  value="${vacation.id}"/> --%>
</form>
<script src="/resources/js/vacation/vacationManagerCheckOne.js"></script>
</body>
</html>