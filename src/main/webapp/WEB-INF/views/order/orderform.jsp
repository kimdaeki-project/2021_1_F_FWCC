<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/headStatics.jsp"></c:import>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/header.jsp"></c:import>
	<div style="margin:10% 5% 0% 5%; text-align: center;">
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
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
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
		<div style="position: absolute; right: 5%; text-align: right;">
			<h4>최종결제 금액</h4>
			<p><span>KRW</span><span></span></p>
			<input type="checkbox" id="agreepayment">
			<span>결제정보를 확인하였으며, 구매진행에 동의합니다.</span><br>
			<div style="text-align: center;">
				<button id="purchasebutton">PAYMENT</button>
			</div>
		</div>
	</div>
	
	
	
	<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/bodyStatics.jsp"></c:import>
	<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/footer.jsp"></c:import>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/order/orderform.js"></script>
</body>
</html>