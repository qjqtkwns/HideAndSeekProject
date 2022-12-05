<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dto" value="${Cont }" />
<c:set var="pcdto" value="${PCCont }" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<jsp:include page="../banner/admin_top.jsp" />

<title>관리자 상품 상세 ${dto.product_no }) ${dto.product_name }</title>
<div style="height: 100%" align="center">
<br><br>

<table class="table table-bordered" style="width: 50em">

	<tr>
		<td class="admin_table_tdLabel">상품명</td>
		<td colspan="3">${dto.product_name }</td>
		<td colspan="2" rowspan="3"><img width="110px;" src = "resources/image/logo.png"></td>
		
	</tr>
	
	<tr>
		<td class="admin_table_tdLabel">원료</td>
		<td colspan="3">${dto.product_material }</td>
	</tr>
	
	<tr>
		<td class="admin_table_tdLabel">도수</td>
		<td colspan="3">${dto.product_alcohol }</td>
	</tr>
	
	<tr>
		<td class="admin_table_tdLabel">당도</td>
		<td>${dto.product_sweet }</td>
		<td class="admin_table_tdLabel">산미</td>
		<td>${dto.product_acidity }</td>
		<td class="admin_table_tdLabel">탄산</td>
		<td>${dto.product_soda }</td>
	</tr>
	
	<tr>
		<td class="admin_table_tdLabel">가격</td>		
		<td>${dto.product_price }</td>
		<td class="admin_table_tdLabel">재고</td>		
		<td>${dto.product_stock }</td>
		<td class="admin_table_tdLabel">적립포인트</td>		
		<td>${dto.product_point }</td>
	</tr>
	
	<tr>
		<td class="admin_table_tdLabel">판매상태</td>
		<td colspan="2">${dto.product_status }</td>
		<td class="admin_table_tdLabel">상품등록일</td>
		<td colspan="3">${dto.product_date }</td>
	</tr>
	
	<tr>
		<td class="admin_table_tdLabel">사진1</td>
		<td colspan="5">
		<c:if test="${!empty pcdto.product_file1  }" > <img src = "resources/image/${pcdto.product_file1 }"> </c:if>
		<c:if test="${empty pcdto.product_file1  }" > </c:if>
		</td>
	</tr>
	
	<tr>
		<td class="admin_table_tdLabel">설명1</td>
		<td colspan="5">${pcdto.product_cont1 }</td>
	</tr>
	
	<tr>
		<td class="admin_table_tdLabel">사진2</td>
		<td colspan="5">
		<c:if test="${!empty pcdto.product_file2  }" > <img src = "resources/image/${pcdto.product_file2 }"> </c:if>
		<c:if test="${empty pcdto.product_file2  }" > </c:if>
		</td>
	</tr>
	
	<tr>
		<td class="admin_table_tdLabel">설명2</td>
		<td colspan="5">${pcdto.product_cont2 }</td>
	</tr>
	
	<tr>
		<td class="admin_table_tdLabel">사진3</td>
		<td colspan="5">
		<c:if test="${!empty pcdto.product_file3  }" > <img src = "resources/image/${pcdto.product_file3 }"> </c:if>
		<c:if test="${empty pcdto.product_file3  }" > </c:if>
		</td>
	</tr>
	
	<tr>
		<td class="admin_table_tdLabel">설명3</td>
		<td colspan="5">${pcdto.product_cont3 }</td>
	</tr>
	
</table>


</div>
<jsp:include page="../banner/bottom.jsp" />