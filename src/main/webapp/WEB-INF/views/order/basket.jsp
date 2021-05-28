<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/headStatics.jsp"></c:import>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/header.jsp"></c:import>
	<div style="margin:10% 5% 0% 5%; text-align: center;">
		<h2 style="letter-spacing: 0.15rem; margin-bottom: 5%">CART</h2>
		<c:if test="${items ne null}">
			<div style="text-align: left;">
				<h5>일반상품(<c:out value="0"></c:out>)</h5>
			</div>
			<table>
				<thead>
					<tr>
						<th>
							<input type="checkbox" id="allcheck"/>
						</th>
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
						<th>
							SELECT
						</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${items}" var="item">
						<tr>
							<td>
								<input type="checkbox" name="checklist">
							</td>
							<td>
							
							</td>
							<td>
								<c:out value="${item.productName}"></c:out>
							</td>
							<td></td>
							<td>
							
							</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td>
								<button>주문하기</button>
								<button>삭제하기</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="10">
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
						<td colspan="10" style="text-align: left;">
							<span>할인 적용 금액은 주문서작성의 결제예정금액에서 확인가능합니다.</span>
						<td>
					</tr>
				</tfoot>
			</table>
		</c:if>
		<c:if test="${items eq null}">
			<div>
				<span>장바구니가 비어 있습니다.</span>
			</div>
		</c:if>
		<div style="display:flex; width:100%; justify-content: space-between;">
			<div>
				<span>선택상품을 </span><button id="selectcartremove">삭제하기</button>
			</div>
			<div>
				<button id="allcartremove">장바구니 비우기</button>
			</div>
		</div>
		<div style="margin-top: 3%; display: flex; width:100%; justify-content: space-between;">
			<div style="padding:1% 4.25%"></div>
			<div>
				<button id="buyall">BUY NOW</button> 
				<button id="buyselects">ORDER SELECT</button>
			</div>
			<div>
				<a href="/">GO SHOPPING</a>
			</div>
		</div>
	</div>
	
	<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/bodyStatics.jsp"></c:import>
	<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/footer.jsp"></c:import>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/order/basket.js"></script>
</body>
</html>