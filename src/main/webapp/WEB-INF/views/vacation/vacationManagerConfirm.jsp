<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/includes/vacation/header.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<form action="/vacation/vacationManagerConfirm">
<input type="text" id="yearMonth"  value="휴가심사" disabled>

    <table border="2">
        <thead>
            <th>신청서번호</th>
            <th>사원번호</th>
            <th>이름</th>
            <th>분류</th>
            <th colspan="3">기간</th>
            <th>사유</th>
            <th>상태</th>
        </thead>
        <tbody>
	        <c:forEach var="vacation" items="${list}">
	            <tr>
	                <td>
								${vacation.vacationApplication.id}
						</td>
						<td>
								${vacation.vacationAppNum}
						</td>
						<td>
								${vacation.vacationApplication.name()}
						</td>
						<td>
								${vacation.type}
						</td>
		                <td>
							<fmt:formatDate pattern="yyyy-MM-dd HH:mm"  value="${vacation.startterm}"/>
						</td>
		                <td>
	                		<strong>~</strong>
						</td>
						<td>
							<fmt:formatDate pattern="yyyy-MM-dd HH:mm"  value="${vacation.endterm}"/>
						</td>
	                <th>${vacation.reason}</th>
	                <td>
	                    <button onclick="">승인</button>
	                    <button onclick="">거절</button>
	                 </td>
	            </tr>
  			</c:forEach>          
        </tbody>
    </table>

    <button>닫기</button>
    </form>
</body>
</html>