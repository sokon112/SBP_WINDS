<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="/WEB-INF/includes/board/header.jsp"%>

<div class="container-fluid" style="margin: 20px">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">동호회 글쓰기</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">커뮤니티 > 동호회 > 동호회 글쓰기</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<form action="" method="post" role="form">
						<div class="form-group">
							<label>제목</label> <input class="form-control" name="htitle">
						</div>
						<div class="form-group">
							<label>내용</label>
							<textarea class="form-control" rows="3" name="hcontents"></textarea>
						</div>
						<div class="form-group">
							<label>작성자</label> <input class="form-control" name="hwriter">
						</div>
						<div class="form-group">
							<label>비밀번호</label> <input class="form-control" name="hpassword">
						</div>
						
						<!-- 파일첨부 -->
						<div class="row">
							<div class="col-lg-12">
								<div class="panel panel-default">
									<div class="panel-heading">File 첨부</div>
									<div class="panel-body">
										<div class="form-group uploadDiv">
											<input type="file" name="huploadFile" multiple />
										</div>
										<div class="uploadResult">
											<ul></ul>
										</div>
									</div>
								</div>
							</div>
						</div>
						<%-- spring security 추가 --%>
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
						<button type="submit" class="btn btn-default">올리기</button>
						<button type="reset" class="btn btn-default"
							onclick="location.href='hobbylist'">취소</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
</script>
<script src="/resources/js/board/hobby/hregister.js"></script>
<%@include file="/WEB-INF/includes/board/footer.jsp"%>
