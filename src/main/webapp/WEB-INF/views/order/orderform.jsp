<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/head.jsp"></c:import>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/navbar.jsp">
	<c:param name="isCommon" value="true"></c:param>
</c:import>
	<div style="margin:10% 8% 5% 8%; text-align: center;">
		<h2 style="letter-spacing: 0.15rem; margin-bottom: 5%">ORDER</h2>
		<div style="text-align: left;">
			<h5>일반상품(<c:out value="0"></c:out>)</h5>
		</div>
		<table style="width:100%;">
			<thead>
				<tr>
					<th style="width:15%;">
						THUMB
					</th>
					<th>
						PRODUCT
					</th>
					<th style="width:10%;">
						PRICE
					</th>
					<th style="width:10%;">
						QUANTITY
					</th>
					<th style="width:10%;">
						MILEAGE
					</th>
					<th style="width:10%;">
						DELIVERY
					</th>
					<th style="width:10%;">
						CHARGE
					</th>
					<th style="width:10%;">
						TOTAL
					</th>
				</tr>
			</thead>
			<tbody style="text-align: center;">
				<c:forEach items="${items}" var="item">
					<tr>
						<td>
							<div style="width:100px; height:100px; display:inline-block; border: 1px black solid;"></div>
						</td>
						<td style="text-align: left; padding:1% 3%;">
							<c:out value="${item.productVO.productTitle}"></c:out><br>
							<span>[옵션: <c:out value="${item.productInfoVO.size}"></c:out>]</span>
						</td>
						<td>
							<strong><span>KRW</span> <c:out value="${item.productVO.productPrice}"></c:out></strong>
						</td>
						<td><!-- 선택 개수를 찍어야 한다. -->
							<c:out value="${item.productCount}"></c:out>
						</td>
						<td><!-- 받을 수 잇는 총 마일리지를 체크해야한다. -->
							<img alt="적립" src="${pageContext.request.contextPath}/images/cartAndOrder/icon_cash.gif">
						</td>
						<td>
							<span>기본배송</span>
						</td>
						<td>
							<span>무료</span>
						</td>
						<td>
							<strong><span>KRW <c:out value="${item.productCount*item.productVO.productPrice}"></c:out></span></strong>
						</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="8">
						<div style="display: flex; justify-content: space-between; width:100%;">
							<div>
								[기본배송]
							</div>
							<div>
								상품구매금액 <c:out value=""></c:out>+배송비 0 (무료) = 합계: 
								<span>KRW <c:out value=""></c:out></span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="8" style="text-align: left;">
						<span>할인 적용 금액은 주문서작성의 결제예정금액에서 확인가능합니다.</span>
					<td>
				</tr>
			</tfoot>
		</table>
		<div style="text-align: right;">
			<h4>최종결제 금액</h4>
			<p><span>KRW</span><span></span></p>
			<input type="checkbox" id="agreepayment">
			<span>결제정보를 확인하였으며, 구매진행에 동의합니다.</span><br>
			<button id="purchasebutton">PAYMENT</button>
		</div>
		<div style="text-align: right; margin-top:3%;">
			<table style="float: right;">
				<thead>
					<tr>
						<th>총 적립예정금액</th>
						<th>원</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>상품별 적립금</td>
						<td><span>원</span></td>
					</tr>
					<tr>
						<td>회원 적립금</td>
						<td><span>원</span></td>
					</tr>
					<tr>
						<td>쿠폰 적립금</td>
						<td><span>원</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<div style="font-size: 0.75rem; clear: both; text-align: left;">
			<p><strong>이용안내</strong></p>
			<p>
				결제가능브라우저 : 크롬,파이어폭스,사파리,오페라 브라우저에서 결제 가능<br>
				(단, window os 사용자에 한하며 리눅스/mac os 사용자는 사용불가)<br>
				최초 결제 시도시에는 플러그인을 추가 설치 후 반드시 브라우저 종료 후 재시작해야만 결제가 가능합니다.<br>
				(무통장, 휴대폰결제 포함)
			</p>
		</div>
	</div>
	
	<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/footer.jsp"></c:import>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/order/orderform.js"></script>
</body>
</html>