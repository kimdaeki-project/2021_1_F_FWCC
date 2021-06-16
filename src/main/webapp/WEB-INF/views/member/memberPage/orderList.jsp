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
	<c:import url="/WEB-INF/views/templates/navbar.jsp"></c:import>
	<!-- header END -->

	<!-- contents START -->
	<div class="container">
		<div id="contents">
			<div class="titleArea">
				<h2>ORDER LIST</h2>
			</div>

			<div class="xans-element- xans-myshop xans-myshop-orderhistorytab ec-base-tab ">
				<ul class="menu">
					<li class="tab_class"><a href="#">주문내역조회 (<span
							id="xans_myshop_total_orders"
						>0</span>)
					</a></li>
					<li class="tab_class_cs"><a href="#">취소/반품/교환 내역 (<span
							id="xans_myshop_total_orders_cs"
						>0</span>)
					</a></li>
				</ul>
			</div>
			<form
				method="GET"
				id="OrderHistoryForm"
				name="OrderHistoryForm"
			>
<!-- 검색 필터 START -->
				<div class="xans-element- xans-myshop xans-myshop-orderhistoryhead ">
					<fieldset class="ec-base-box">
						<legend>검색기간설정</legend>
						<div class="stateSelect ">
							<select
								id="order_status"
								name="order_status"
								class="fSelect"
							>
								<option value="all">전체 주문처리상태</option>
								<option value="shipped_before">입금전</option>
								<option value="shipped_standby">배송준비중</option>
								<option value="shipped_begin">배송중</option>
								<option value="shipped_complate">배송완료</option>
								<option value="order_cancel">취소</option>
								<option value="order_exchange">교환</option>
								<option value="order_return">반품</option>
							</select>
						</div>
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
							name="history_start_date"
							class="fText"
							readonly="readonly"
							size="10"
							value=""
							type="text"
						/> ~ <input
							id="history_end_date"
							name="history_end_date"
							class="fText"
							readonly="readonly"
							size="10"
							value=""
							type="text"
						/> <input
							alt="조회"
							id="order_search_btn"
							type="image"
							src="//img.echosting.cafe24.com/skin/admin_ko_KR/myshop/btn_search.gif"
						/>
					</fieldset>
					<ul>
						<li>기본적으로 전체 주문내역이 조회되며, 기간 검색시 특정 기간의 주문내역을 조회하실 수 있습니다.</li>
						<li>주문번호를 클릭하시면 해당 주문에 대한 상세내역을 확인하실 수 있습니다.</li>
					</ul>
				</div>
<!-- ????????????????????????????????????? -->
				<input
					id="mode"
					name="mode"
					value=""
					type="hidden"
				/> <input
					id="term"
					name="term"
					value=""
					type="hidden"
				/>
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
							<th scope="col">주문일자 [주문번호]</th>
							<th scope="col">이미지</th>
							<th scope="col">상품정보</th>
							<th scope="col">수량</th>
							<th scope="col">상품구매금액</th>
							<th scope="col">주문처리상태</th>
							<th scope="col">취소/교환/반품</th>
						</tr>
					</thead>
					<c:if test="${list != null}">					
						<tbody>
							<c:forEach items="${list}" var="VO">
								<tr>
									<td>${VO.orderNum}</td>
									<c:forEach items="${VO.productFileVO}" var="file">
										<td>${file.fileName}</td>
										
									</c:forEach>
									<td>수량</td>
									<td>${VO.spPrice}</td>
										<td>${VO.orderState}</td>
									<td><a href="#"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_order_cancel.gif" alt="주문취소"/></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</c:if>
				</table>
				<c:if test="${list == null}">				
					<p class="message ">주문 내역이 없습니다.</p>
				</c:if>
			</div>
<!-- pager START -->
			<div class="xans-element- xans-myshop xans-myshop-orderhistorypaging ec-base-paginate">
				<a
					href="?page=1&history_start_date=2021-03-17&history_end_date=2021-06-15&past_year=2020"
					class="first"
				>&lt;</a> <a
					href="?page=1&history_start_date=2021-03-17&history_end_date=2021-06-15&past_year=2020"
				>PREV</a>
				<ol>
					<li class="xans-record-"><a
						href="?page=1&history_start_date=2021-03-17&history_end_date=2021-06-15&past_year=2020"
						class="this"
					>1</a></li>
				</ol>
				<a href="?page=1&history_start_date=2021-03-17&history_end_date=2021-06-15&past_year=2020">NEXT</a>
				<a
					href="?page=1&history_start_date=2021-03-17&history_end_date=2021-06-15&past_year=2020"
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
<script type="text/javascript" src="/js/member/memberPage/orderList.js"></script>
</body>
</html>