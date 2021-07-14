<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<form action="/vacation/vacationManagerCheckOne">
        <table border="3">
            <thead>
                <th colspan="4">휴가신청서</th> 
            </thead>
            <tbody>
                
                <tr>
                    <th>문서번호</th>
                    <td colspan="3">0002563</td>
                </tr>
                <tr>
                    <th>사원번호</th>
                    <td>1234</td>
                    <th>이름</th>
                    <td>김길동</td>
                </tr>
                <tr>
                    <th>분류</th>
                    <td colspan="3">
                        <select name="vacation" >
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
                    <td><input type="date"></td>
                    <td>~</td>
                    <td><input type="date"></td>
                </tr>
                <tr>
                    <th>시간</th>
                    <td><input type=""></td>
                    <td>~</td>
                    <td><input type=""></td>
                </tr>
                <tr>
                    <th>사유</th>
                    <td colspan="3">병원에 다녀와야함</td>
                </tr>
                <tr>
                    <th>거절사유</th>
                    <td colspan="3">병원에 다녀와야함</td>
                </tr>
            </tbody>
        </table>
        <button type="submit">확인</button>
    </form>
</body>
</html>