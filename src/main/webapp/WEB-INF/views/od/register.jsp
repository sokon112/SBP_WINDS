<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../../includes/od/header.jsp"%>
<link rel="stylesheet" href="/resources/dist/css/attach.css" />
<div class="center">
	<div class="col-lg-12">
		<h1 class="page-header">공문 작성</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">공문작성</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<form action="" method="post" role="form">
					<button type="submit" class="btn btn-info">상신</button>
					<button type="submit" class="btn btn-info">결재선</button>
					<button type="submit" class="btn btn-info">임시저장</button>
					<button type="reset" class="btn btn-info">취소</button>
					<p></p>
					<div class="col-sm-4">
						<label class="form-label">공문번호</label> <input class="form-control"
							name="send" readonly>
					</div>
					<div class="col-sm-4">
						<label class="form-label">작성일자</label> <input class="form-control"
							name="send" readonly>
					</div>
						<div class="input-group mb-5">
							<label class="input-group-text" for="inputGroupSelect01">보존기한</label>
							<select class="form-select" id="inputGroupSelect01">
								<option selected>보존기한을 선택하세요</option>
								<option value="1">1년</option>
								<option value="2">2년</option>
								<option value="3">3년</option>
							</select>
						</div>

					<div class="col-sm-4">
						<label class="form-label">작성자</label> <input class="form-control"
							name="send" readonly>
					</div>
					<div class="col-sm-4">
						<label class="form-label">작성부서</label> <input class="form-control"
							name="send" readonly>
					</div>
					<div class="col-sm-4">
						<label class="form-label">수신처</label> <input class="form-control"
							name="send" readonly>
					</div>
					<div class="col-md-6">
						<label class="form-label">공문제목</label> <input class="form-control"
							name="title">
					</div>
					<div class="col-md-12">
						<label>내용</label>
						<textarea class="form-control" rows="20" name="contents"></textarea>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">File 첨부</div>
			<div class="panel-body">
				<div class="form-group uploadDiv">
					<input type="file" name="uploadFile" multiple />
				</div>
				<div class="uploadResult">
					<ul></ul>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="/resources/js/register.js"></script>
<%@include file="../../includes/od/footer.jsp"%>


















