<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/includes/vacation/header.jsp" %>
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
            <th>기간</th>
            <th>사유</th>
            <th>상태</th>
        </thead>
        <tbody>
            <tr>
                <td>123</td>
                <td>1234</td>
                <td>김길동</td>
                <td>휴가</td>
                <td>2021.07.13 00:00~2021.07.14 23:59</td>
                <th>사유</th>
                <td>
                    <button onclick="">승인</button>
                    <button onclick="">거절</button>
                 </td>
            </tr>
            <tr>
                <td>123</td>
                <td>1234</td>
                <td>김길동</td>
                <td>휴가</td>
                <td>2021.07.13 00:00~2021.07.14 23:59</td>
                <th>사유</th>
                <td>
                    <button>승인</button>
                    <button>거절</button>
                 </td>
            </tr>            
            <tr>
                <td>123</td>
                <td>1234</td>
                <td>김길동</td>
                <td>휴가</td>
                <td>2021.07.13 00:00~2021.07.14 23:59</td>
                <th>사유</th>
                <td>
                   <button>승인</button>
                   <button>거절</button>
                </td>
            </tr>            
            <tr>
                <td>123</td>
                <td>1234</td>
                <td>김길동</td>
                <td>휴가</td>
                <td>2021.07.13 00:00~2021.07.14 23:59</td>
                <th>사유</th>
                <td>
                    <button>승인</button>
                    <button>거절</button>
                 </td>
            </tr>
        </tbody>
    </table>

    <div>
        <button>←</button>
        <button>1</button>
        <button>2</button>
        <button>3</button>
        <button>4</button>
        <button>5</button>
        <button>→</button>
    </div>
    <button>닫기</button>
    </form>
</body>
</html>