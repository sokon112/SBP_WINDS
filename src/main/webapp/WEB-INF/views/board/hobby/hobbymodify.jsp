<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="/WEB-INF/includes/board/header.jsp" %>
<div class="container-fluid" style="margin: 20px">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">동호회 게시물 수정</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">커뮤니티 > 동호회 > 동호회 게시물 수정</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<form action="" method="post" role="form">
						<div class="form-group">
							<label>제목</label> <input class="form-control" name="title"
								value="${vo.htitle}">
						</div>
						<div class="form-group">
							<label>내용</label>
							<textarea class="form-control" rows="3" name="content">${vo.hcontents}</textarea>
						</div>
						<div class="form-group">
							<label>작성자</label> <input class="form-control" name="writer"
								readonly="readonly" value="${vo.hwriter}">
						</div>
						<%-- spring security 추가 --%>
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />




						<button type="submit" data-oper='list' class="btn btn-info">List</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<%-- remove와 list를 위한 폼--%>
<form action="" id="operForm" method="post">
	<input type="hidden" name="type" value="${cri.type}" /> <input
		type="hidden" name="keyword" value="${cri.keyword}" /> <input
		type="hidden" name="pageNum" value="${cri.pageNum}" /> <input
		type="hidden" name="amount" value="${cri.amount}" /> <input
		type="hidden" name="eno" value="${vo.eno}" />

	<%-- spring security 추가 --%>
	<input type="hidden" name="${_csrf.parameterName}"
		value="${_csrf.token}" /> <input type="hidden" name="writer"
		value="${vo.writer}" />
</form>

<%-- 스크립트 --%>
<script>
	let bno = $
	{
		vo.bno
	};
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
</script>
<script src="/resources/js/board/hobby/modify.js"></script>
<%@include file="/WEB-INF/includes/board/footer.jsp" %>
