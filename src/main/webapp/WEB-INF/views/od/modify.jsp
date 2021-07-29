<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../../includes/od/header.jsp"%>
<link rel="stylesheet" href="/resources/dist/css/attach.css" />
<div class="center">
	<div class="col-lg-12">
		<h1 class="page-header">공문 수정</h1>
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
					<!-- 상신 Modal -->
					<div class="modal fade" id="modal1" data-backdrop="static"
						tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel"
						aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
								</div>
								<p></p>
								<div class="modal-body">
									<div>
										<div class="form-group">
										<p></p>
											<label for="odtitle" class="control-label">공문
												제목:</label> <input type="text" class="form-control"
												id="modaltitle" readonly="readonly">
										</div>
										<div class="form-group">
											<label for="attachfilelist" class="control-label">첨부파일
												리스트:</label> <input type="text" class="form-control"
												id="modalattach" readonly="readonly">
										</div>
										<sec:authentication property="principal.memberVO" var="info"/>
											<c:forEach items="${info.authority}" var="auth">
                								<c:set var="userauth" value="${auth.authority}"/>
                							</c:forEach>
                						<c:if test="${userauth=='ad'||userauth=='mg'}">
										<div class="form-group">
											<label for="message-text" class="control-label">의견:</label>
											<textarea class="form-control" id="message" name="message"></textarea>
										</div>
										</c:if>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
									<button type="submit" class="btn btn-primary">상신</button>
								</div>
							</div>
						</div>
					</div>
					<!-- 결재선 Modal -->
					<div class="modal fade" id="modal2" data-backdrop="static"
						tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel"
						aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="staticBackdrop">결재선 지정</h5>
								</div>
								<div class="modal-body">
									<label class="input-group-text" for="dest">결재자</label>
									<select class="form-select" id="dest">
										<option selected>결재자 선택</option>
										<option value="15080002">인사팀</option>
										<option value="15080003">기획팀</option>
										<option value="15080004">개발팀</option>
										<option value="15080005">재무홍보팀</option>
										<option value="15080006">총무팀</option>
									</select>
									<p></p>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">취소</button>
									<button type="button" class="btn btn-primary" id="selectDest">저장</button>
								</div>
							</div>
						</div>
					</div>
            		<button type="button" class="btn btn-info" data-toggle="modal" data-target="#modal1" id="reg">상신</button>
					<button type="button" class="btn btn-info" data-toggle="modal" data-target="#modal2">결재선</button>
					<button type="reset" class="btn btn-info" onclick="location.href='/od/'">취소</button>
					<p></p>
					<div class="col-sm-4">
						<label class="form-label">공문번호</label> 
						<input class="form-control" name="docNum" readonly="readonly" value="${vo.docNum}"> 
						<label class="form-label">작성일자</label> 
						<input class="form-control" value="${vo.regDate}" readonly="readonly">
						<p></p>
						<label class="input-group-text" for="retentDate">보존기한</label>
						<p></p>
						<select class="form-select"
							name="retentDate" id="retentdate">
							<option value="0"selected>보존기한을 선택하세요</option>
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
						<input class="form-control" readonly="readonly" value="${vo.dest}" id="destinput">
					</div>
					<p></p>
					<div class="col-md-6">
						<label class="form-label">공문제목</label> 
						<input class="form-control" name="title" id="title" value="${vo.title}">
					</div>
					<div class="col-md-12">
						<label>내용</label>
						<textarea class="form-control" rows="20" name="contents">${vo.contents}</textarea>
					</div>
					<input type='hidden' name='${_csrf.parameterName}' value='${_csrf.token}'>
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
					<input type="file" name="uploadFile" id="attachlist" multiple />
				</div>
				<div class="uploadResult">
					<ul></ul>
				</div>
			</div>
		</div>
	</div>
</div>   
<script>
	let docNum = ${vo.docNum};
	
	var csrfHeaderName="${_csrf.parameterName}";
	var csrfTokenValue="${_csrf.token}";
</script>
<script src="/resources/js/od/modify.js"></script>
<%@include file="../../includes/od/footer.jsp"%>


















