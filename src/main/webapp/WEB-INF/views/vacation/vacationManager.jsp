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

<form action="">
    <button onclick="preMonth">왼쪽화살표</button>
	<fmt:formatDate pattern="yyyy년 MM월"  value="${cri.nowMonth}"/>
    <button onclick="nextMonth">오른쪽화살표</button>
    

    <table border="2">
        <thead>
	        <tr>
	            <th>신청서번호</th>
	            <th>사원번호</th>
	            <th>이름</th>
	            <th>분류</th>
	            <th>시작기간</th>
	            <th>종료기간</th>
	            <th>상태</th>
	            <th>신청날짜</th>
	            <th>승인날짜</th>
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
					</td>
					<td>
						<fmt:formatDate pattern="yyyy-MM-dd HH:mm"  value="${vacation.endterm}"/>
					</td>
					<td>${vacation.state}</td>
					<td>
						<fmt:formatDate pattern="yyyy-MM-dd HH:mm"  value="${vacation.applicationDate}"/>
					</td>
					<td>
						<fmt:formatDate pattern="yyyy-MM-dd HH:mm"  value="${vacation.approvalDate}"/>
					</td>
					<td>
						<a href="/vacation/vacationUserListOne" class="move">
							확인
						</a> 
					</td>
				</tr>
			</c:forEach>
        </tbody>
    </table>

    <select name="vacation" >
        <option value="none">=== 선택 ===</option>
        <option value="id">사원번호</option>
        <option value="state">분류</option>
    </select>

    <input type="text" value="------">
    <button>검색</button>
    
    <button>휴가심사(${cnt})</button>
    <a href="/vacation/vacationManagerConfirm" class="move">
		휴가심사(${cnt})
	</a> 
   </form>
</body>
</html>