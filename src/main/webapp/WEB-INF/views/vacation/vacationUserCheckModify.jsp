<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="/WEB-INF/includes/vacation/header.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <meta charset="utf-8">
<title>Insert title here</title>
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
                    <td colspan="3">${vacation.state}</td>
                </tr>
                <tr>
                    <th>기간</th>
                    <td>
                    <fmt:formatDate pattern="yyyy-MM-dd"  value="${vacation.startterm}"/></td>
                    <td>~</td>
                    <td><fmt:formatDate pattern="yyyy-MM-dd"  value="${vacation.endterm}"/></td>
                </tr>
                
                <tr>
                    <th>사유</th>
                    <td colspan="3"><input>	${vacation.reason }</td>
                </tr>
                <tr>
                    <th>거절사유</th>
                   <%--  <td colspan="3">${vacation.refusalreason }</td> --%>
                </tr>
            </tbody>
        </table>
        <button type="submit">수정</button>
        <button type="submit">확인</button>
        </div>
        <input type="hidden" value="${vacation.vacationAppNum}" />			
<h1>수정</h1>	
				
    </form>
    <form action="" id="operForm" method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<input type="hidden" name="id" value="${info.username}"/>
</form>
    <script src="/resources/js/vacation/vacationUserCheckOnemodify.js"></script>
    <%@include file="/WEB-INF/includes/vacation/footer.jsp" %>
</body>
</html>