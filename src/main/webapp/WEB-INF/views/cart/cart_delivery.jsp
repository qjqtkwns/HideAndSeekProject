<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<title>술래잡기 장바구니</title>
	<c:if test="${empty userId }">
		<jsp:include page="../banner/none_top.jsp" />
	</c:if>
	
	<c:if test="${!empty userId }">
		<jsp:include page="../banner/user_top.jsp" />
	</c:if>
<link href="resources/css/cart/cart.css" rel="stylesheet" type="text/css"/>
<jsp:include page="cart_delivery_script.jsp" />
	
	<div class="main_wrap">
		<div class="cart_wrap">
			<div style="height: 80px;"></div>
			<span></span>
			
			<div class="cart_content_wrap">
				<div class="cart_content">
					<div class="head">
						<div>
							<c:forEach items="${list }" var="dto">
								<c:if test="${dto.deli_default == 1 }">
									<input type="radio" name="delivery_spot" value="${dto.deli_no}" checked="checked"> ${dto.deli_name }
								</c:if>
								
								<c:if test="${dto.deli_default != 1 }">
									<input type="radio" name="delivery_spot" value="${dto.deli_no}"> ${dto.deli_name }
								</c:if>
								&nbsp;&nbsp;
							</c:forEach>
						</div>
					</div>
								
					<div class="none_block"></div>
					
					<div class="content_delivery">
						<div class="content_delivery_wrap">
							<c:forEach items="${list }" var="dto">
								<c:if test="${dto.deli_default == 1 }">
									<div class="delivery_info">
										<div class="delivery_title">우편 번호</div>
										<div class="zipcode">${dto.deli_zipcode }</div>
									</div>
									
									<div class="delivery_info">
										<div class="delivery_title">주소</div>
										<div class="addr1">${dto.deli_addr1 }</div>
									</div>
									
									<div class="delivery_info">
										<div class="delivery_title">상세 주소</div>
										<div class="addr2">${dto.deli_addr2 }</div>
									</div>
									
									<div class="delivery_info">
										<div class="delivery_title">핸드폰</div>
										<div class="phone">${dto.deli_phone1 }-${dto.deli_phone2 }-${dto.deli_phone3 }</div>
									</div>
									
									<div class="delivery_point_info">
										<div class="delivery_title">포인트</div>
										<div class="point_info">
											<div class="point_input"><input name="point" placeholder="사용 할 포인트를 입력해 주세요" ></div>
											<div class="point">사용 가능한 포인트: ${point }</div>
										</div>
									</div>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
			
			
			<div class="cart_bill_wrap">
				<div class="bill">
					<div class="bill_title">계산서</div>
					<div class="solid_top"></div>
					<div class="bill_content">
						<div class="bill_content_row">
							<div>총 상품금액</div>
							<div class="bill_price"><fmt:formatNumber>${sum }</fmt:formatNumber>원</div>
						</div>
						<div class="bill_content_row">
							<div>총 배송비</div>
							<div class="bill_delivery"><fmt:formatNumber>${delivery }</fmt:formatNumber>원</div>
						</div>
						<div class="bill_content_row">
							<div>포인트 사용</div>
							<div class="bill_point">0원</div>
						</div>
						<div class="bill_info">
							<div class="icon">
								<img src="resources/image/icon_circle_info.png">
							</div>
							
							<div class="bill_text">제주도 및 도서산간의 경우 배송비가 추가될 수 있습니다.</div>
						</div>
					</div>
					<div class="solid_bottom"></div>
					<div class="bill_footer">
						<div class="bill_footer_text">총 결제 예상 금액</div>
						<div class="bill_footer_price"><fmt:formatNumber>${sum + delivery }</fmt:formatNumber>원</div>
					</div>
				</div>
				
				<div class="action_button_wrap">
					<button type="button" class="insert_button">구매하기</button>
				</div>
			</div>
		</div>
	</div>
	
<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
<script type="text/javascript">
	
	// 로딩창 종료
	window.onload = function () {
	    $(".loading").fadeOut(100,function(){
	        $("#div_load_image").fadeOut(300);
	    });
	}

</script>

<jsp:include page="../banner/bottom.jsp" />