<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="/WEB-INF/includes/board/header.jsp"%>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style>
th, td {
	text-align: center;
}
</style>
<div class="container-fluid" style="margin: 20px">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">익명 게시판</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					커뮤니티 > 익명 게시판
				</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<table class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th style="width: 10%">번 호</th>
								<th style="width: 50%">제 목</th>
								<th style="width: 12%">닉네임</th>
								<th style="width: 16%">작성일</th>
								<th style="width: 12%">조회수</th>
							</tr>
						</thead>
						<tbody>
							<!-- 게시판 리스트 반복문 -->
							<c:forEach var="vo" items="${boardlist}">
								<tr>
									<td>${vo.bno}</td>
									<td><a href="${vo.bno}" class="move">${vo.title}</a></td>
									<td>${vo.nickname}</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${vo.uploaddate}" /></td>
									<td><span class="badge badge-pill badge-primary">${vo.views}</span></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="row">
						<!-- start search -->
						<div class="col-md-12">
							<div class="col-md-8">
								<!--search Form-->
								<form action="" id="searchForm">
								<div class="col-md-2">
									<select name="type" id="" class="form-control">
										<option value="">-----------</option>
										<option value="T"
											<c:out value="${boardPageVO.cri.type=='T'?'selected':''}"/>>제목</option>
										<option value="C"
											<c:out value="${boardPageVO.cri.type=='C'?'selected':''}"/>>내용</option>
										<option value="TC"
											<c:out value="${boardPageVO.cri.type=='TC'?'selected':''}"/>>제목
											or 내용</option>
									</select> 
									</div>
									<input type="text" name="keyword" value="${boardPageVO.cri.keyword}" />
									<!-- 검색시에도 페이지당 게시물 수와 현재 페이지에 대한 정보가 따라가야 함 -->
									<input type="hidden" name="pageNum"
										value="${boardPageVO.cri.pageNum}" /> <input type="hidden"
										name="amount" value="${boardPageVO.cri.amount}" />
									<button type="button" class="btn btn-default">검색</button>
								</form>
							</div>
							<div class="col-md-4"></div>
							<div class="col-md-1 col-md-offset-2">
								<!--페이지 목록 갯수 지정하는 폼-->
								<select name="" id="amount" class="form-control">
									<option value="10"
										<c:out value="${boardPageVO.cri.amount==10?'selected':''}"/>>10</option>
									<option value="20"
										<c:out value="${boardPageVO.cri.amount==20?'selected':''}"/>>20</option>
									<option value="30"
										<c:out value="${boardPageVO.cri.amount==30?'selected':''}"/>>30</option>
									<option value="40"
										<c:out value="${boardPageVO.cri.amount==40?'selected':''}"/>>40</option>
								</select>
								<p></p>
							</div>
								<a href="boardregister" class="btn btn-primary pull-right">글쓰기</a>
						</div>
					</div>
					<!-- end search -->
					<!-- start Pagination -->
					<div class="text-center">
						<ul class="pagination">
							<c:if test="${boardPageVO.prev}">
								<li class="paginate_button previous"><a
									href="${boardPageVO.startPage-1}">Previous</a></li>
							</c:if>

							<c:forEach var="idx" begin="${boardPageVO.startPage}"
								end="${boardPageVO.endPage}">
								<li
									class="paginate_button ${boardPageVO.cri.pageNum==idx?'active':''}">
									<a href="${idx}">${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${boardPageVO.next}">
								<li class="paginate_button next"><a
									href="${boardPageVO.endPage+1}">Next</a></li>
							</c:if>

						</ul>
					</div>
					<!-- end Pagination -->
				</div>
				<!-- end panel-body -->
			</div>
			<!-- end panel -->
		</div>
	</div>
</div>
<!-- /.row -->
<!-- 페이지 나누기 추가 -->
<form action="boardlist" method="get" id="actionForm">
	<input type="hidden" name="type" value="${boardPageVO.cri.type}" /> 
	<input type="hidden" name="keyword" value="${boardPageVO.cri.keyword}" /> 
	<input type="hidden" name="pageNum" value="${boardPageVO.cri.pageNum}" /> 
	<input type="hidden" name="amount" value="${boardPageVO.cri.amount}" />
</form>

<!-- 모달 추가 
<div class="modal" tabindex="-1" id="myModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">게시글 등록</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<p>처리가 완료되었습니다.</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>-->
<!-- 스크립트 -->
<script>
	let result = '${result}';
</script>
<script src="/resources/js/board/main/list.js"></script>
<%@include file="/WEB-INF/includes/board/footer.jsp"%>