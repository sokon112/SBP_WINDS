<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/includes/vacation/header.jsp" %>>
<html>
<head>
    <meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<button>왼쪽화살표</button>
<form action="/vacation/vacationManager">
    <input type="text" id="yearMonth"  value="2021년 7월" disabled>
    
    <button>오른쪽화살표</button>
    <table border="2">
        <thead>
            <th>신청서번호</th>
            <th>사원번호</th>
            <th>이름</th>
            <th>분류</th>
            <th colspan="2">기간</th>
            <th>상태</th>
            <th>신청날짜</th>
            <th>승인날짜</th>
        </thead>
        <tbody>
            <tr>
                <td>123</td>
                <td>1234</td>
                <td>김길동</td>
                <td>휴가</td>
                <td>2021.07.13 00:00~2021.07.14 23:59</td>
                <td>승인</td>
                <td>2021.06.13 12:00</td>
                <td>2021.06.14 09:30</td>
            </tr>
           <c:forEach var="vacation" items="${list}">
		<tr><td>
					${vacation.id}
			</td>
			<td>
					${vacation.name}
			</td>
			<td>
					${vacation.type}
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
			<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"  value="${vacation.applicationDate}"/></td>
			<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"  value="${vacation.approvalDate}"/></td>
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
    <div>
        <button>←</button>
        <button>1</button>
        <button>2</button>
        <button>3</button>
        <button>4</button>
        <button>5</button>
        <button>→</button>
    </div>
    <button>휴가심사(n)</button>
   </form>
</body>
</html>