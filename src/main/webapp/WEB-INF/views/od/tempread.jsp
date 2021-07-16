<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../../includes/od/header.jsp"%>
<link rel="stylesheet" href="/resources/dist/css/attach.css" />
<div class="center">
	<div class="col-lg-12">
		<h1 class="page-header">공문 보기</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading"></div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<form action="" method="post" role="form">
					<sec:authentication property="principal" var="info"/>
                				<sec:authorize access="isAuthenticated()"><%--로그인 여부 확인--%>
									<c:if test="${info.id==vo.send}"><%--로그인한 사용자와 작성자가 동일여부 확인 --%>
										<button type="submit" class="btn btn-info">수정</button>
										<button type="submit" class="btn btn-info">삭제</button>
                					</c:if>
                				</sec:authorize>	
					<button type="reset" class="btn btn-info">취소</button>
					<p></p>
					<div class="col-sm-4">
						<label class="form-label">공문번호</label> <input class="form-control"
							name="docNum" readonly="readonly" value="${vo.docNum}"> <label
							class="form-label">작성일자</label> <input class="form-control"
							name="regDate" readonly="readonly" value="${vo.regDate}">
						<p></p>
						<label class="input-group-text" for="inputGroupSelect01">보존기한</label>
						<p></p>
						<select class="form-select" id="inputGroupSelect01"
							name="retentDate">
							<option selected>보존기한을 선택하세요</option>
							<option value="1">1년</option>
							<option value="2">2년</option>
							<option value="3">3년</option>
						</select>
						<p></p>
					</div>

					<div class="col-sm-4">
						<label class="form-label">작성자</label> 
						<input class="form-control" name="send" readonly="readonly" value="${vo.send}">
					</div>
					<div class="col-sm-4">
						<label class="form-label">수신자</label> 
						<input class="form-control" name="dest" readonly="readonly" value="${vo.dest}">
					</div>
					<p></p>
					<div class="col-md-6">
						<label class="form-label">공문제목</label> 
						<input class="form-control" name="title" readonly="readonly" value="${vo.title}">
					</div>
					<div class="col-md-12">
						<label>내용</label>
						<textarea class="form-control" rows="20" name="contents" readonly="readonly" value="${vo.contents}"></textarea>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<%-- 첨부파일 목록 보여주기 --%>
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<i class="fa fas fa-file"></i> Files
			</div>
			<div class="panel-body">				
				<div class="uploadResult">
					<ul></ul>
				</div>
			</div>			
		</div>
	</div>
</div> 
<div class="bigPictureWrapper">
	<div class="bigPicture"></div>
</div>
<form action="" id="operForm">
	<input type="hidden" name="type" value="${cri.type}" />
	<input type="hidden" name="keyword" value="${cri.keyword}" />
	<input type="hidden" name="pageNum" value="${cri.pageNum}" />
	<input type="hidden" name="amount" value="${cri.amount}" />	
	<input type="hidden" name="docNum"  value="${vo.docNum}"/>
</form>       
<script>
	let docNum = ${vo.docNum};
	
	var csrfHeaderName="${_csrf.parameterName}";
	var csrfTokenValue="${_csrf.token}";
</script>
<script src="/resources/js/read.js"></script>
<%@include file="../../includes/od/footer.jsp"%>


















