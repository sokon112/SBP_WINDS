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

<div class="panel-body">
        <table class="table table-striped table-bordered table-hover">
        <thead>
        <tr>
            <th>신청서번호</th>
            <th>사원번호</th>
            <th>이름</th>
            <th>분류</th>
            <th>기간</th>
            <th>사유</th>
            <th>상태</th>
            </tr>
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
								${vacation.vacationApplication.name}
						</td>
						<td>
								${vacation.type}
						</td>
		                <td>
							<fmt:formatDate pattern="yyyy-MM-dd HH:mm"  value="${vacation.startterm}"/>

	                		<strong>~</strong>

							<fmt:formatDate pattern="yyyy-MM-dd HH:mm"  value="${vacation.endterm}"/>
						</td>
	                <th>${vacation.reason}</th>
	                <td>
	                    <button onclick="">승인</button>
	                    <button onclick="">거절</button>
	                    <input type="text" value="${vacation.state }" disabled>	
	                 </td>
	                 
	            </tr>
  			</c:forEach>          
        </tbody>
    </table>
</div>
    <button type='button' onclick="location.href='vacationManager'">닫기</button>
    </form>
    
<form action="vacationManagerCheckOne" method="get" id="actionForm">	
	<input type="hidden" name="keyType" value="${cri.type}" />
	<input type="hidden" name="keyword" value="${keyword}" />
</form> 
    <script src="/resources/js/vacation/list.js"></script>
</body>
</html>