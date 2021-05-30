<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates2/head.jsp"></c:import>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates2/navbar.jsp"></c:import>
	<div style="margin:10% 5%; text-align: center;">
		<h2 style="letter-spacing: 0.15rem; margin-bottom: 5%">CART</h2>
		<div style="text-align: left;">
			<h5>일반상품(<c:out value="0"></c:out>)</h5>
		</div>
		<table>
			<thead>
				<tr>
					<th>
						THUMB
					</th>
					<th>
						PRODUCT
					</th>
					<th>
						PRICE
					</th>
					<th>
						QUANTITY
					</th>
					<th>
						MILEAGE
					</th>
					<th>
						DELIVERY
					</th>
					<th>
						CHARGE
					</th>
					<th>
						TOTAL
					</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${items}" var="item">
					<tr>
						<td>
							섬네일
						</td>
						<td>
							<c:out value="${item.productName}"></c:out>
							<c:out value="${item.productInfo.pInfoName}"></c:out>
						</td>
						<td>
							<c:out value="${item.productPrice}"></c:out>
						</td>
						<td><!-- 선택 개수를 찍어야 한다. -->
							<c:out value=""></c:out>
						</td>
						<td><!-- 받을 수 잇는 총 마일리지를 체크해야한다. -->
						
						</td>
						<td>
							기본배송
						</td>
						<td>
							무료
						</td>
						<td>
							총 가격
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
	</div>
	
	<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates2/footer.jsp"></c:import>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/order/orderform.js"></script>
</body>
</html>