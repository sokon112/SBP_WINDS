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
                    <td colspan="3"><input readonly="readonly" value="${vacation.state}"></td>
                </tr>
                <tr>
                    <th>기간</th>
                    <td>
                    <input readonly="readonly" value="<fmt:formatDate pattern="yyyy-MM-dd"  value="${vacation.startterm}"/>"></td>
                    <td>~</td>
                    <td><input readonly="readonly" value="<fmt:formatDate pattern="yyyy-MM-dd"  value="${vacation.endterm}"/>"></td>
                </tr>
                
                <tr>
                    <th>사유</th>
                    <td colspan="3"><input readonly="readonly" value="${vacation.reason }"></td>
                </tr>
                <tr>
                <c:if test="${not empty vacation.refusalReason}">
		                <tr>
	                    <th>거절사유</th>
                <td colspan="3"><input readonly="readonly" value="${vacation.refusalreason }"></td>
                </tr>
	                </c:if>
            </tbody>
        </table>
        <c:if test="${vacation.state eq '신청' }">
        <button type="submit">수정</button>
        <button type="submit">삭제</button>
        </c:if>
        <c:if test="${vacation.state eq '승인' }">
        <button type="submit">반납</button>
        </c:if>
        <button type="submit">확인</button>
        </div>
        					
<h1>거절</h1>	
				
    </form>




<%@include file="/WEB-INF/includes/vacation/footer.jsp" %>
<script src="/resources/js/vacation/vacationManagerCheckOne.js"></script>
</body>
</html>