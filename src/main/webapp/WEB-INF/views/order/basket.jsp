<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<div style="margin:10% 5%; text-align: center;">
		<h2 style="letter-spacing: 0.15rem; margin-bottom: 5%">CART</h2>
		<c:if test="${items ne null}">
			<div style="text-align: left;">
				<strong>일반상품(<c:out value="0"></c:out>)</strong>
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
							<td> <!-- 섬네일 -->
							
							</td>
							<td><!-- 상품이름 --> <!-- 그 아래에는 내가 선택한 옵션도 적혀있게된다. -->
								<c:out value="${item.productName}"></c:out>
							</td>
							<td><!-- 가격 --><!-- 할인 가격은 제대로 안나옴 결제할때 할인 나오려나봄 -->
							
							</td>
							<td><!-- 선택 개수 -->
								
							</td>
							<td><!-- 주는 마일리지 -->
							
							</td>
							<td><!-- 배달방식 -->
							
							</td>
							<td><!-- 배달비용 -->
							
							</td>
							<td><!-- 전체 총합 가격 -->
							
							</td>
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
			<div style="padding:1% 4.25%">
			</div>
			<div>
				<button id="buyall">BUY NOW</button> 
				<button id="buyselects">ORDER SELECT</button>
			</div>
			<div>
				<a href="/" style="text-decoration: none; color: gray; border: gray 2px outset; background-color: white; padding:1px 6px;">GO SHOPPING</a>
			</div>
		</div>
		<div style="text-align: left; font-size: 0.75rem; margin-top:3%;">
			<strong><span>이용안내</span></strong><br><br>
			<strong><span>장바구니 이용안내</span></strong>
			<ol style="list-style: none; padding-left: 0;">
				<li>해외배송 상품과 국내배송 상품은 함께 결제하실 수 없으니 장바구니 별로 따로 결제해 주시기 바랍니다.</li>
			    <li>해외배송 가능 상품의 경우 국내배송 장바구니에 담았다가 해외배송 장바구니로 이동하여 결제하실 수 있습니다.</li>
			    <li>선택하신 상품의 수량을 변경하시려면 수량변경 후 [변경] 버튼을 누르시면 됩니다.</li>
			    <li>[쇼핑계속하기] 버튼을 누르시면 쇼핑을 계속 하실 수 있습니다.</li>
			    <li>장바구니와 관심상품을 이용하여 원하시는 상품만 주문하거나 관심상품으로 등록하실 수 있습니다.</li>
			    <li>파일첨부 옵션은 동일상품을 장바구니에 추가할 경우 마지막에 업로드 한 파일로 교체됩니다.</li>
			</ol>
		</div>
	</div>
	<form id="canclemerchant" method="post">
		<input id="merchant_uid" type="text">
	</form>
	<button id="cancle">전송</button>
	<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/footer.jsp"></c:import>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/order/basket.js"></script>
	<script>
		$("#cancle").click(function(){
			$("#canclemerchant").attr("action", "./cancle/"+$("#merchant_uid").val());
			$("#canclemerchant").submit();
		});
	</script>
</body>
</html>