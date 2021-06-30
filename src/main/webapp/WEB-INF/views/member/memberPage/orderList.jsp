<%@ page
	language="java"
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ taglib
	prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"
%>
<%@ taglib
	prefix="form"
	uri="http://www.springframework.org/tags/form"
%>
<!DOCTYPE html>
<html>
<head>
<c:import url="/WEB-INF/views/templates/head.jsp"></c:import>
<link
	rel="stylesheet"
	href="/css/member/memberLogin.css"
>
<link
	rel="stylesheet"
	href="/css/member/memberPage/orderList.css"
>
<!-- CDN example (unpkg) -->
<script src="https://unpkg.com/dayjs@1.8.21/dayjs.min.js"></script>
<meta charset="UTF-8">
<title>FWCC-orderList</title>
</head>
<body>

	<!-- header START -->
	<c:import url="/WEB-INF/views/templates/navbar.jsp">
		<c:param name="isCommon" value="true"></c:param>
	</c:import>
	<!-- header END -->

	<!-- contents START -->
	<div class="container">
		<div id="contents">
			<div class="titleArea">
				<h2>ORDER LIST</h2>
			</div>

			<div class="xans-element- xans-myshop xans-myshop-orderhistorytab ec-base-tab ">
				<ul class="menu">
					<li class="tab_class"><a href="#">주문내역조회 (<span id="xans_myshop_total_orders">0</span>)
					</a></li>
					<li class="tab_class_cs"><a href="#">취소/반품/교환 내역 (<span
							id="xans_myshop_total_orders_cs"
						>0</span>)
					</a></li>
				</ul>
			</div>
			<!-- 검색 필터 START -->
			<form
				action="./filteredList"
				method="GET"
			>
				<div class="xans-element- xans-myshop xans-myshop-orderhistoryhead ">
					<fieldset class="ec-base-box">
						<legend>검색기간설정</legend>
						<!-- <div class="stateSelect ">
							<select
								id="order_status"
								name="orderState"
								class="fSelect"
							>
								<option value="0">전체 주문처리상태</option>
								<option value="1">주문완료</option>
								<option value="2">배송중</option>
								<option value="3">배송완료</option>
								<option value="4">취소</option>
							</select>
						</div> -->
						<span class="period"> <a
							href="#"
							id="btn01"
							class="btnNormal"
							days="00"
						><img
								src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date1.gif"
								alt="오늘"
							/></a> <a
							href="#"
							id="btn07"
							class="btnNormal"
							days="07"
						><img
								src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date2.gif"
								alt="1주일"
							/></a> <a
							href="#"
							id="btn30"
							class="btnNormal"
							days="30"
						><img
								src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date3.gif"
								alt="1개월"
							/></a> <a
							href="#"
							id="btn90"
							class="btnNormal"
							days="90"
						><img
								src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date4.gif"
								alt="3개월"
							/></a> <a
							href="#"
							id="btn180"
							class="btnNormal"
							days="180"
						><img
								src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date5.gif"
								alt="6개월"
							/></a>
						</span> <input
							id="history_start_date"
							name="startDate"
							class="fText"
							size="10"
							value=""
							type="text"
						/> ~ <input
							id="history_end_date"
							name="endDate"
							class="fText"
							size="10"
							value=""
							type="text"
						/>
						<button>
							<img
								alt="조회"
								src="//img.echosting.cafe24.com/skin/admin_ko_KR/myshop/btn_search.gif"
							>
						</button>
					</fieldset>
					<ul>
						<li>기본적으로 전체 주문내역이 조회되며, 기간 검색시 특정 기간의 주문내역을 조회하실 수 있습니다.</li>
						<li>주문번호를 클릭하시면 해당 주문에 대한 상세내역을 확인하실 수 있습니다.</li>
					</ul>
				</div>
				<!-- ????????????????????????????????????? -->
				<!-- 	<input
					id="mode"
					name="mode"
					value=""
					type="hidden"
				/> <input
					id="term"
					name="term"
					value=""
					type="hidden"
				/> -->
				<!-- ????????????????????????????????????? -->
			</form>
			<!-- 검색 필터 END -->
			<div class="xans-element- xans-myshop xans-myshop-orderhistorylistitem ec-base-table typeList">
				<div class="title">
					<h3>주문 상품 정보</h3>
				</div>
				<table
					border="1"
					summary=""
				>
					<caption>주문 상품 정보</caption>
					<colgroup>
						<col style="width: 135px;" />
						<col style="width: 93px;" />
						<col style="width: auto;" />
						<col style="width: 61px;" />
						<col style="width: 111px;" />
						<col style="width: 111px;" />
						<col style="width: 111px;" />
					</colgroup>
					<thead>
						<tr class="kor">
							<th scope="col">이미지</th>
							<th scope="col">상품정보</th>
							<th scope="col">주문일자 [주문번호]</th>
							<th scope="col">수량</th>
							<th scope="col">상품구매금액</th>
							<th scope="col">주문처리상태</th>
							<th scope="col">취소/교환/반품</th>
						</tr>
					</thead>
					<c:if test="${list != null}">
						<tbody>
							<c:forEach
								items="${list}"
								var="VO"
							>
								<tr>
									<td>${VO.fileName }</td>
									<td>${VO.productVO.productTitle}</td>
									<td>${VO.orderlistVO.orderNum}</td>
									<td>${VO.purchaseVO.productCount}</td>
									<td>${VO.orderlistVO.spPrice}</td>
									<td><c:choose>
											<c:when test="${VO.orderlistVO.orderState == 1}">
											주문완료
										</c:when>
											<c:when test="${VO.orderlistVO.orderState == 2}">
											배송중
										</c:when>
											<c:when test="${VO.orderlistVO.orderState == 3}">
											배송완료
										</c:when>
											<c:when test="${VO.orderlistVO.orderState == 4}">
											취소
										</c:when>
										</c:choose></td>
									<td><c:if test="${VO.orderlistVO.orderState != 4}">
											<a
												href="#"
												class="orderCancle"
												data-orderNum='${VO.orderlistVO.orderNum}'
											><img
												src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_order_cancel.gif"
												alt="주문취소"
											/></a>
										</c:if></td>
								</tr>
							</c:forEach>
						</tbody>
					</c:if>
					<c:if test="${list == null}">
						<tbody>
							<tr>
								<td colspan="7" class="message">
									주문 내역이 없습니다.
								</td>
							</tr>
						</tbody>
					</c:if>
				</table>
			</div>
			<!-- pager START -->
			<div class="xans-element- xans-myshop xans-myshop-orderhistorypaging ec-base-paginate">
				<a
					href="#"
					class="first"
				>&lt;</a> <a href="#">PREV</a>
				<ol>
					<li class="xans-record-"><a
						href="#"
						class="this"
					>1</a></li>
				</ol>
				<a href="#">NEXT</a> <a
					href="#"
					class="last"
				>&gt;</a>
			</div>
			<!-- pager END -->
		</div>
	</div>
	<!-- contents END -->

	<!-- footer START -->
	<c:import url="/WEB-INF/views/templates/footer.jsp"></c:import>
	<!-- footer END -->

	<!-- External JS -->

	<!-- Custom JS -->
	<script
		type="text/javascript"
		src="/js/member/memberPage/orderList.js"
	></script>
	<script
		type="text/javascript"
		src='${pageContext.request.contextPath}/js/order/orderCancle.js'
	></script>
</body>
</html>