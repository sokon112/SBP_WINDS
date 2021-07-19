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
                    <th>시간</th>
                    <td><fmt:formatDate pattern="HH:mm"  value="${vacation.startterm}"/></td>
                    <td>~</td>
                    <td><fmt:formatDate pattern="HH:mm"  value="${vacation.endterm}"/></td>
                </tr>
                <tr>
                    <th>사유</th>
                    <td colspan="3"><input value="${vacation.reason }" disabled>	</td>
                </tr>
                
            </tbody>
        </table>
        <button type="submit">수정</button>
        <button type="submit">확인</button>
        </div>
        				
<h1>승인</h1>	
				
    </form>

    <script src="/resources/js/vacation/modify.js"></script>
</body>
</html>