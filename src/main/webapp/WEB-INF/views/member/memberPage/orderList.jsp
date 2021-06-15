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
							href="#none"
							class="btnNormal"
							days="00"
						><img
								src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date1.gif"
								alt="오늘"
							/></a> <a
							href="#none"
							class="btnNormal"
							days="07"
						><img
								src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date2.gif"
								alt="1주일"
							/></a> <a
							href="#none"
							class="btnNormal"
							days="30"
						><img
								src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date3.gif"
								alt="1개월"
							/></a> <a
							href="#none"
							class="btnNormal"
							days="90"
						><img
								src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date4.gif"
								alt="3개월"
							/></a> <a
							href="#none"
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
						<li>기본적으로 최근 3개월간의 자료가 조회되며, 기간 검색시 지난 주문내역을 조회하실 수 있습니다.</li>
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
					<tbody class="center displaynone">
						<tr class="">
						<!-- 주문일자 [주문번호] START -->
							<td class="number displaynone">
								<p>
									<a
										href="detail.html"
										class="line"
									>[]</a>
								</p> <a
								href="#none"
								class="displaynone"
								onclick=""
							><img
									src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_order_cancel.gif"
									alt="주문취소"
								/></a> <a
								href="cancel.html"
								class="displaynone button"
							><img
									src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_order_cancel2.gif"
									alt="취소신청"
								/></a> <a
								href="exchange.html"
								class="displaynone button"
							><img
									src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_order_exchange.gif"
									alt="교환신청"
								/></a> <a
								href="return.html"
								class="displaynone button"
							><img
									src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_order_return.gif"
									alt="반품신청"
								/></a>
							</td>
						<!-- 주문일자 [주문번호] END -->
							
						<!-- 썸네일 START -->
							<td class="thumb"><a href="/product/detail.html"><img
									src=""
									onerror="this.src='//img.echosting.cafe24.com/thumb/img_product_small.gif';"
									alt=""
								/></a></td>
						<!-- 썸네일 END -->
							<td class="product left top"><a href="/product/detail.html"><strong></strong></a>
								<div class="option displaynone"></div>
								<ul class="xans-element- xans-myshop xans-myshop-optionset option">
									<li class=""><strong></strong> (개)</li>
								</ul>
								<p class="gBlank5 displaynone">무이자할부 상품</p></td>
							<td></td>
							<td class="right"><strong></strong>
							<div class="displaynone"></div></td>
						<!-- 주문처리상태 START -->
							<td class="state">
								<p class="txtEm"></p>
								<p class="displaynone">
									<a
										href=""
										target=""
									></a>
								</p>
								<p class="displaynone">
									<a
										href="#none"
										class="line"
										onclick=""
									>[]</a>
								</p> <a
								href="/board/product/write.html"
								class="displaynone"
							><img
									src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_order_comment.gif"
									alt="구매후기"
								/></a> <a
								href="#none"
								class="displaynone"
								onclick=""
							><img
									src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_order_retract.gif"
									alt="취소철회"
								/></a> <a
								href="#none"
								class="displaynone"
								onclick=""
							><img
									src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_order_retract2.gif"
									alt="교환철회"
								/></a> <a
								href="#none"
								class="displaynone"
								onclick=""
							><img
									src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_order_retract3.gif"
									alt="반품철회"
								/></a>
							</td>
						<!-- 주문처리상태 END -->
						<!-- 취소/교환/반품 START -->
							<td>
								<p class="displaynone">
									<a
										href="#none"
										class="line"
										onclick=""
									>[상세정보]</a>
								</p>
								<p class="displaynone">-</p>
							</td>
						<!-- 취소/교환/반품 START -->
						</tr>
					</tbody>
				</table>
				<p class="message ">주문 내역이 없습니다.</p>
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