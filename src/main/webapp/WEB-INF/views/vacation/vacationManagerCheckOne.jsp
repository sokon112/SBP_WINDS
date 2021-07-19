<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<form action="/vacation/vacationManagerCheckOne">
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
                    <td colspan="3">${vacation.state}</td>
                </tr>
                <tr>
                    <th>사원번호</th>
                    <td>#{vacation.id}</td>
                    <th>이름</th>
                    <td>#{vacation.name }</td>
                </tr>
                <tr>
                    <th>분류</th>
                    <td colspan="3">
                       #{vacation.type }
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
                    <th>시간</th>
                    <td><fmt:formatDate pattern="HH:mm"  value="${vacation.startterm}"/></td>
                    <td>~</td>
                    <td><fmt:formatDate pattern="HH:mm"  value="${vacation.endterm}"/></td>
                </tr>
                <tr>
                    <th>사유</th>
                    <td colspan="3">${vacation.reason }</td>
                </tr>
                <tr>
                    <th>거절사유</th>
                    <td colspan="3">${vacation.refusalreason }</td>
                </tr>
            </tbody>
        </table>
        <button type="button" class="btn btn-success" id="modalRegisterBtn">확인</button>
        </div>
    </form>
    <script src="/resources/js/vacation/list.js"></script>
</body>
</html>