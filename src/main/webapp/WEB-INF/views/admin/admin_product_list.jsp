<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="list" value="${list }" />
<c:set var="page" value="${page }"/>
<c:set var="field" value="${field }"/>
<c:set var="keyword" value="${keyword }"/>
<jsp:include page="../banner/admin_top.jsp" />


<title>관리자 상품 목록</title>


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<link href="resources/css/banner/admin_banner.css" rel="stylesheet" type="text/css">

<div style="height: auto; min-height: 100%;">
<br>
<br>
<br>

	<div class="adminProductListTitle" align="center">
		<br> <br> <br>
		<h4>전체 제품 목록</h4>
		<br>
	</div>
	<div align="center">

		<table class="table table-hover table-bordered" style="margin-left: auto; margin-right: auto; text-align: center; width: 66em;">
			<tr>
				<th>상품번호</th>
				<th style="width: 120px;">상품이름</th>
				<th>이미지</th>
				<th>카테고리</th>
				<th style="width: 110px;">제조사</th>
				<th style="width: 80px;">판매가</th>
				<th style="width: 80px;">재고</th>
				<th>등록일</th>
				<th>상태</th>
			</tr>

			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="dto">
					<tr>
						<td onclick="location.href='<%=request.getContextPath()%>/admin_product_content.do?no=${dto.product_no }&page=${page.page }'">${dto.product_no }</td>
						<td onclick="location.href='<%=request.getContextPath()%>/admin_product_content.do?no=${dto.product_no }&page=${page.page }'">${dto.product_name }</td>
						<td onclick="location.href='<%=request.getContextPath()%>/admin_product_content.do?no=${dto.product_no }&page=${page.page }'">
						
						<img height="60px" width="auto" src = "resources/upload/${dto.product_thumbnail }">
						
						</td>
						<td onclick="location.href='<%=request.getContextPath()%>/admin_product_content.do?no=${dto.product_no }&page=${page.page }'">${dto.product_category }</td>
						<td onclick="location.href='<%=request.getContextPath()%>/admin_product_content.do?no=${dto.product_no }&page=${page.page }'">${dto.product_company }</td>
						<td onclick="location.href='<%=request.getContextPath()%>/admin_product_content.do?no=${dto.product_no }&page=${page.page }'">${dto.product_price }</td>
						<td onclick="location.href='<%=request.getContextPath()%>/admin_product_content.do?no=${dto.product_no }&page=${page.page }'">${dto.product_stock }</td>
						<td onclick="location.href='<%=request.getContextPath()%>/admin_product_content.do?no=${dto.product_no }&page=${page.page }'"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${dto.product_date }" /></td>
						<td>
						<c:if test="${dto.product_status eq '판매' }">
						<input type="button" class="btn btn-outline-dark" value="${dto.product_status}"
							onclick="if(confirm('판매상태를 판매 중지로 변경하시겠습니까?')){
							location.href='<%=request.getContextPath() %>/admin_product_statusChange.do?no=${dto.product_no }&page=${page.page }'} 
							else{return; }">
						</c:if>
						<c:if test="${dto.product_status eq '판매중지' }">
						<input type="button" class="btn btn-outline-danger" value="${dto.product_status}"
							onclick="if(confirm('판매상태를 판매중으로 변경하시겠습니까?')){
							location.href='<%=request.getContextPath() %>/admin_product_statusChange2.do?no=${dto.product_no }&page=${page.page }'} 
							else{return; }">
						</c:if>
						<c:if test="${dto.product_status eq '품절' }">
						<input type="button" class="btn btn-secondary" value="${dto.product_status}" disabled>
						</c:if>
						
						</td>
					</tr>
				</c:forEach>
			</c:if>

			<c:if test="${empty list }">
				<tr>
					<td colspan="8" align="center">
						<h4>게시물이 없습니다.</h4>
					</td>
				</tr>
			</c:if>

			<tr>
				<td colspan="9" align="right">
				<input type="button"
					class="btn btn-outline-primary" value="상품추가"
					onclick="location.href='admin_product_insert.do'">
					<c:if test="${!empty keyword }">
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" class="btn btn-light" value="전체목록" onclick="location.href='admin_product_list.do'">
					</c:if>
				</td>
			</tr>
		</table>
		<br>
	</div>

	<%-- 페이징 처리 --%>
		<div class="page-paging">
		    <c:if test="${page.startBlock > 1}"><span><a href="admin_product_list.do?page=1"><i class="fa fa-angle-double-left"></i></a></span></c:if>
		    <c:if test="${page.startBlock <= 1}"><span class="nolink"><i class="fa fa-angle-double-left"></i></span></c:if>
		
		    <c:if test="${page.page > 1}"><span><a href="admin_product_list.do?page=${page.page - 1}"><i class="fa fa-angle-left"></i></a></span></c:if>
		    <c:if test="${page.page <= 1}"><span class="nolink"><i class="fa fa-angle-left"></i></span></c:if>
		
		    <ol class="paging_1">
		        <c:forEach begin="${page.startBlock}" end="${page.endBlock}" var="i">
		        <c:if test="${i == page.page}"><li class="now">${i}</li></c:if>
		        <c:if test="${i != page.page}"><li><a href="admin_product_list.do?page=${i}">${i}</a></li></c:if>
		        </c:forEach>
		    </ol>
		
		    <c:if test="${page.page < page.allPage}"><span><a href="admin_product_list.do?page=${page.page + 1}"><i class="fa fa-angle-right"></i></a></span></c:if>
		    <c:if test="${page.page >= page.allPage}"><span class="nolink"><i class="fa fa-angle-right"></i></span></c:if>
		
		    <c:if test="${page.endBlock < page.allPage}"><span><a href="admin_product_list.do?page=${page.allPage}"><i class="fa fa-angle-double-right"></i></a></span></c:if>
		    <c:if test="${page.endBlock >= page.allPage}"><span class="nolink"><i class="fa fa-angle-double-right"></i></span></c:if>
		</div>
	<%-- 페이징 처리 end --%>
		
		<br>
		
		<div class="searchWrab" align="center">
		<div>
			<form method="post"
				action="<%=request.getContextPath()%>/admin_product_search.do">

				<span> <select name="field" class="form-select"
					style="width: 8em; display: inline-block;">
						<option value="allSearch"
							<c:if test="${field == 'all'}"> selected="selected"</c:if>>통합</option>
						<option value="name"
							<c:if test="${field == 'name'}"> selected="selected"</c:if>>상품이름</option>
						<option value="company"
							<c:if test="${field == 'company'}"> selected="selected"</c:if>>제조사</option>
				</select>
				
				</span> <span> <input type="text" name="keyword" value="${keyword}"
					class="form-control" style="width: 20em; display: inline-block;" /></span>
				&nbsp;&nbsp;&nbsp;

				<button type="submit" class="btn btn-secondary ml-1">
					<i class="fa fa-search"></i> 검색
				</button>

			</form>
		</div>
		</div>
</div>
<br><br>

<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<jsp:include page="../banner/bottom.jsp" />