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
	<h1></h1>
	<div style="margin:10% 8% 5% 8%; text-align: center;">
		<h2 style="letter-spacing: 0.15rem; margin-bottom: 5%">ORDER</h2>
		<div style="text-align: left;">
			<strong>일반상품(<c:out value="${orderCount}"></c:out>)</strong>
		</div>
		<table style="width:100%; margin-bottom: 1%;">
			<thead style="border-bottom: 1px gray solid;">
				<tr>
					<th style="width:15%;padding:1%;">
						THUMB
					</th>
					<th>
						PRODUCT
					</th>
					<th style="width:12%;">
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
					<th style="width:14%;">
						TOTAL
					</th>
				</tr>
			</thead>
			<tbody style="text-align: center; border-bottom: 1px gray solid;">
				<c:forEach items="${items}" var="item">
					<tr>
						<td style="padding:1%;">
							<div style="width:100px; height:100px; display:inline-block; border: 1px black solid;"></div>
						</td>
						<td style="text-align: left; padding:1% 3%;">
							<c:out value="${item.productVO.productTitle}"></c:out><br>
							<span>[옵션: <c:out value="${item.productInfoVO.size}"></c:out>]</span>
						</td>
						<td>
							<strong><span>KRW</span> <c:out value="${item.productVO.productPrice}"></c:out></strong><br>
							<span>[할인률 : <c:out value="${item.productVO.productDisRate}"></c:out>%]</span>
						</td>
						<td><!-- 선택 개수를 찍어야 한다. -->
							<c:out value="${item.productCount}"></c:out>
						</td>
						<td><!-- 받을 수 잇는 총 마일리지를 체크해야한다. -->
							<img alt="적립" src="${pageContext.request.contextPath}/images/cartAndOrder/icon_cash.gif">
							<span> <c:out value=""></c:out>원</span>
						</td>
						<td>
							<span>기본배송</span>
						</td>
						<td>
							<span>[무료]</span>
						</td>
						<td>
							<c:if test="${item.productVO.productDisRate eq 0}">
								<span><strong>KRW <c:out value="${item.productCount*item.productVO.productPrice}"></c:out></strong></span>
							</c:if>
							<c:if test="${item.productVO.productDisRate ne 0}">
								<del>KRW <c:out value="${item.productCount*item.productVO.productPrice}"></c:out></del><br>
								<strong>KRW <c:out value="${item.finalPrice}"></c:out></strong>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr style="border-bottom:1px gray solid;">
					<td colspan="8">
						<br>
						<div style="display: flex; justify-content: space-between; width:100%;">
							<div>
								[기본배송]
							</div>
							<div>
								<span>상품구매금액 <strong><c:out value="${totalprice}"></c:out></strong>+배송비 0 (무료) = 합계:</span>
								<strong>KRW <span style="font-size: 1.5em;"><c:out value="${totalprice}"></c:out></span></strong>
							</div>
						</div>
						<br>
					</td>
				</tr>
				<tr style="border-bottom:1px rgba(128,128,128,0.5) solid;">
					<td colspan="8" style="text-align: left;">
						<span>할인 적용 금액은 주문서작성의 결제예정금액에서 확인가능합니다.</span>
					<td>
				</tr>
			</tfoot>
		</table>
		<div style="text-align: right;">
			<strong>최종결제 금액</strong>
			<p><strong>KRW <span style="font-size:1.8rem;"><c:out value="${totalprice}"></c:out></span></strong></p>
			<input type="checkbox" id="agreepayment">
			<span>결제정보를 확인하였으며, 구매진행에 동의합니다.</span><br>
			<button id="purchasebutton">PAYMENT</button>
		</div>
		<div style="text-align: right; margin-top:3%;">
			<table style="float: right;">
				<tbody>
					<tr>
						<th>적립예정금액</th>
						<td>&ensp;<td>
						<td><c:out value="${totalMileage}"></c:out>원</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<div style="font-size: 0.75rem; clear: both; text-align: left;">
			<p><strong>이용안내</strong></p>
			<ol style="list-style: none; padding-left: 0;">
				<li>결제가능브라우저 : 크롬,파이어폭스,사파리,오페라 브라우저에서 결제 가능</li>
				<li>(단, window os 사용자에 한하며 리눅스/mac os 사용자는 사용불가)</li>
				<li>최초 결제 시도시에는 플러그인을 추가 설치 후 반드시 브라우저 종료 후 재시작해야만 결제가 가능합니다.</li>
				<li>(무통장, 휴대폰결제 포함)</li>
			</ol>
		</div>
	</div>
	
	<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/footer.jsp"></c:import>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/order/orderform.js"></script>
</body>
</html>