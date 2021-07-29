<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="/WEB-INF/includes/board/header.jsp"%>

<div class="container-fluid" style="margin: 20px">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">이벤트 게시물 수정</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">커뮤니티 > 이벤트 > 이벤트 게시물 수정</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<form action="" method="post" role="form">
						<div class="form-group">
							<label>제목</label> <input class="form-control" name="etitle"
								value="${vo.etitle}">
						</div>
						<div class="form-group">
							<label>내용</label>
							<textarea class="form-control" rows="3" name="econtents">${vo.econtents}</textarea>
						</div>
						<div class="form-group">
							<label>작성자</label> 
							<input class="form-control" name="ewriter" readonly="readonly" value="${vo.ewriter}">
						</div>
						<%-- spring security 추가 --%>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

						<button type="button"  class="btn btn-primary pull-right" onclick="location.href='boardlist'">목록</button>
						<button type="submit" data-oper='list' style="margin-right: 3px;"  class="btn btn-success pull-right" id="emodifySubmit">완료</button>

					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<%-- remove와 list를 위한 폼--%>
<form action="" id="operForm" method="post">
	<input type="hidden" name="type" value="${cri.type}" /> 
	<input type="hidden" name="keyword" value="${cri.keyword}" />
	<input type="hidden" name="pageNum" value="${cri.pageNum}" /> 
	<input type="hidden" name="amount" value="${cri.amount}" /> 
	<input type="hidden" name="eno" value="${vo.eno}" />	
	<input type="hidden" name="epassword" value="${vo.epassword}">
	<input type="hidden" name="econtents" value="${vo.econtents}">
		

	<%-- spring security 추가 --%>
	<input type="hidden" name="${_csrf.parameterName}"
		value="${_csrf.token}" /> 
	<input type="hidden" name="ewriter" value="${vo.ewriter}" />
</form>

<%-- 스크립트 --%>
<script>
	let eno = $
	{
		vo.eno
	};
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
</script>
<script src="/resources/js/board/event/modify.js"></script>
<%@include file="/WEB-INF/includes/board/footer.jsp"%>
