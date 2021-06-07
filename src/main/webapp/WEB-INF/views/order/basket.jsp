<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/head.jsp"></c:import>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/order/basket.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/navbar.jsp">
		<c:param name="isCommon" value="true"></c:param>
	</c:import>
	<h1></h1>
	<div id="container">
		<h2 id="mainTag">CART</h2>
		<c:if test="${items ne null}">
			<div class="textleft">
				<strong>일반상품(<c:out value="${cartCount}"></c:out>)</strong>
			</div>
			<table class="table bottom1">
				<thead class="bd100">
					<tr>
						<th>
							<input class="checkbox" type="checkbox" id="allcheck"/>
						</th>
						<th class="thumbnail">
							THUMB
						</th>
						<th>
							PRODUCT
						</th>
						<th class="wid12">
							PRICE
						</th>
						<th class="wid8">
							QUANTITY
						</th>
						<th class="wid8">
							MILEAGE
						</th>
						<th class="wid8">
							DELIVERY
						</th>
						<th class="wid8">
							CHARGE
						</th>
						<th class="wid14">
							TOTAL
						</th>
						<th class="wid8">
							SELECT
						</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${items}" var="item">
						<tr class="bd50">
							<td>
								<input type="checkbox" class="selectcheck checkbox" 
										data-cartNum='<c:out value="${item.cartNum}"></c:out>'
										name="checklist">
							</td>
							<td style="padding: 1%;"> <!-- 섬네일 -->
								<img alt="" src="${pageContext.request.contextPath}/images/product/${item.productVO.productNum}/${item.productFileVO.fileName}"
									width="100px" height="100px">
							</td>
							<td style="text-align: left; padding:1% 3%;"><!-- 상품이름 --> <!-- 그 아래에는 내가 선택한 옵션도 적혀있게된다. -->
								<c:out value="${item.productVO.productTitle}"></c:out><br>
								<span>[옵션: <c:out value="${item.productInfoVO.size}"></c:out>]</span>
							</td>
							<td><!-- 가격 --><!-- 할인 가격은 제대로 안나옴 결제할때 할인 나오려나봄 -->
								<span><strong>KRW <c:out value="${item.productVO.productPrice}"></c:out></strong></span><br>
								<span>[할인률 : <c:out value="${item.productVO.productDisRate}"></c:out>%]</span>
							</td>
							<td><!-- 선택 개수 -->
								<input style="width:60%; border-radius: 0.4rem;" type="number" value='<c:out value="${item.productCount}"></c:out>' min="1" max='<c:out value="${item.productInfoVO.stock}"></c:out>'>
								<input type="hidden" readonly="readonly"
								data-productCount="${item.productCount}"
								data-cartNum='<c:out value="${item.cartNum}"></c:out>'
								data-pInfoNum='<c:out value="${item.PInfoNum}"></c:out>'>
								<button class="countchange">변경</button>
							</td>
							<td><!-- 주는 마일리지 -->
								<img alt="적립" src="${pageContext.request.contextPath}/images/cartAndOrder/icon_cash.gif">
								<span> <c:out value="${item.productVO.productMileage}"></c:out>원</span>
							</td>
							<td><!-- 배달방식 -->
								<span>기본배송</span>
							</td>
							<td><!-- 배달비용 -->
								<span>[무료]</span>
							</td>
							<td><!-- 전체 총합 가격 -->
								<c:if test="${item.productVO.productDisRate eq 0}">
									<span><strong>KRW <c:out value="${item.productCount*item.productVO.productPrice}"></c:out></strong></span>
								</c:if>
								<c:if test="${item.productVO.productDisRate ne 0}">
									<del>KRW <c:out value="${item.productCount*item.productVO.productPrice}"></c:out></del><br>
									<strong>KRW <c:out value="${item.finalPrice}"></c:out></strong>
								</c:if>
							</td>
							<td>
								<button class="oneOrder" data-cartNum='<c:out value="${item.cartNum}"></c:out>'>주문하기</button><br>
								<button class="oneDelete" data-cartNum='<c:out value="${item.cartNum}"></c:out>'>삭제하기</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr class="bd100 bt100">
						<td colspan="10">
							<br>
							<div style="display: flex; justify-content: space-between;" class="table">
								<div>
									[기본배송]
								</div>
								<div>
									상품구매금액 <strong><c:out value="${totalprice}"></c:out></strong> + 배송비 0 (무료) = 합계: 
									<strong>KRW <span style="font-size: 1.5em;"><c:out value="${totalprice}"></c:out></span></strong>
								</div>
							</div>
							<br>
						</td>
					</tr>
					<tr class="bd50">
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
		<div style="display:flex; justify-content: space-between;" class='table'>
			<div>
				<span>선택상품을 </span><button id="selectcartremove">삭제하기</button>
			</div>
			<div>
				<button id="allcartremove">장바구니 비우기</button>
			</div>
		</div>
		<div style="margin-top: 3%; display: flex; justify-content: space-between;"  class='table'>
			<div style="padding:1% 4.25%">
			</div>
			<div>
				<button id="buyall">BUY NOW</button>
				<button id="buyselects">ORDER SELECT</button>
			</div>
			<div>
				<a class="likebutton" href="/">GO SHOPPING</a>
			</div>
		</div>
		<div style=" font-size: 0.75rem; margin-top:3%;" class="textleft">
			<strong><span>이용안내</span></strong><br><br>
			<strong><span>장바구니 이용안내</span></strong>
			<ol class="list">
				<li>해외배송 상품과 국내배송 상품은 함께 결제하실 수 없으니 장바구니 별로 따로 결제해 주시기 바랍니다.</li>
			    <li>해외배송 가능 상품의 경우 국내배송 장바구니에 담았다가 해외배송 장바구니로 이동하여 결제하실 수 있습니다.</li>
			    <li>선택하신 상품의 수량을 변경하시려면 수량변경 후 [변경] 버튼을 누르시면 됩니다.</li>
			    <li>[쇼핑계속하기] 버튼을 누르시면 쇼핑을 계속 하실 수 있습니다.</li>
			    <li>장바구니와 관심상품을 이용하여 원하시는 상품만 주문하거나 관심상품으로 등록하실 수 있습니다.</li>
			    <li>파일첨부 옵션은 동일상품을 장바구니에 추가할 경우 마지막에 업로드 한 파일로 교체됩니다.</li>
			</ol>
		</div>
	</div>
	<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/footer.jsp"></c:import>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/order/basket.js"></script>
	<script>
		var msg = "${msg}";
		
		if(msg=="재고보다 선택한 수량이 더 많습니다."){
			swal({
				icon:"info",
				title:"INFO",
				text:msg
			});
		}
	</script>
</body>
</html>