<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
    <%@include file="/WEB-INF/includes/vacation/header.jsp" %>

<html>
<head>
    <meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<form action="/vacation/vacationApply">
        <div class="panel-body">
        <table class="table table-striped table-bordered table-hover">
            <thead>
           	 <tr>
                <th colspan="3">휴가신청서</th>
                </tr> 
            </thead>
            <tbody>
                <tr>
                    <th>분류</th>
                    <td colspan="3">
                        <select name="type" >
                            <option value="none">=== 선택 ===</option>
                            <option value="annual">연차</option>
                            <option value="vacation1">공가</option>
                            <option value="sickleave">병가</option>
                            <option value="compensation">보상</option>
                          </select>
                    </td>
                </tr>
                <tr>
                    <th>기간</th>
                    <td><input type="date" id="startDay"></td>
                    <td>~</td>
                    <td><input type="date" id="endDay"></td>
                </tr>
                <tr>
                    <th>시간</th>
                    <td><input id="startTime" type="time" value="xxx" min="yyy" max="zzz"></td>
                    <td>~</td>
                    <td><input id="endTime" type="time" value="xxx" min="yyy" max="zzz"></td>
                </tr>
                <tr>
                    <th>사유</th>
                    <td colspan="3">
                    	<textarea class="form-control" rows="3" name="reason">
                    	</textarea> 
                    </td>
                </tr>
            </tbody>
        </table>
        </div>
        
        <button type="button" class="btn btn-success" id="modalRegisterBtn">신청</button>
    </form>
    <script type="text/javascript">
    	let id=${vo.id}
    </script>
    <script src="/resources/js/vacation/list.js"></script>
</body>
</html>