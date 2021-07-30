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
							<label>제목</label> <input class="form-control" name="htitle"
								value="${vo.htitle}">
						</div>
						<div class="form-group">
							<label>내용</label>
							<textarea class="form-control" rows="3" name="hcontents">${vo.hcontents}</textarea>
						</div>
						<div class="form-group">
							<label>작성자</label> <input class="form-control" name="hwriter"
								readonly="readonly" value="${vo.hwriter}">
						</div>
						
						<!-- 파일첨부 -->
						<div class="row">
							<div class="col-lg-12">
								<div class="panel panel-default">
									<div class="panel-heading">File 첨부</div>
									<div class="panel-body">
										<div class="form-group uploadDiv">
											<input type="file" name="buploadFile" multiple  value="${vo.hattachList}"/>
										</div>
										<div class="uploadResult">
											<ul></ul>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<%-- spring security 추가 --%>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

						<button type="submit" data-oper='list' style="margin-right: 3px;"  class="btn btn-success pull-right">목록</button>
						<button type="submit" data-oper='modify' style="margin-right: 3px;"  class="btn btn-primary pull-right">수정</button>
				
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
	<input type="hidden" name="hno" value="${vo.hno}" />
	<input type="hidden" name="hpassword" value="${vo.hpassword}">
	<input type="hidden" name="hcontents" value="${vo.hcontents}">
	<input type="hidden" name="himages" value="${vo.hattachList}">
	

	<%-- spring security 추가 --%>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
	<input type="hidden" name="hwriter" value="${vo.hwriter}" />
</form>

<%-- 스크립트 --%>
<script>
	let hno = ${vo.hno};
	
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
</script>
<script src="/resources/js/board/hobby/hmodify.js"></script>
<%@include file="/WEB-INF/includes/board/footer.jsp" %>
