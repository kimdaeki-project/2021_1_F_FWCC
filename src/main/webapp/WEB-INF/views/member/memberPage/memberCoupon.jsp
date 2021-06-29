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
	href="/css/common/common.css"
>
<link
	rel="stylesheet"
	href="/css/member/memberPage/memberCoupon.css"
>
<meta charset="UTF-8">
<title>FWCC-memberCoupon</title>
</head>
<body>
	<!-- header START -->
	<c:import url="/WEB-INF/views/templates/navbar.jsp"></c:import>
	<!-- header END -->

	<!-- contents START -->
	<div class="container">
		<div id="contents">
			<div class="titleArea">
				<h2>MY COUPON</h2>
			</div>

			<form
				id="frmCouponlist"
				name="frmCouponlist"
				action=""
				method="POST"
			>
				<div class="xans-element- xans-myshop xans-myshop-couponlist">
					<div class="title">
						<h3>마이 쿠폰 목록</h3>
						<p>사용가능 쿠폰 : ${couponCount}장</p>
					</div>
					<div class="ec-base-table typeList">
						<table
							border="1"
							summary=""
						>
							<caption>마이 쿠폰 목록</caption>
							<colgroup>
								<col style="width: auto" />
								<col style="width: 100px" />
								<col style="width: 100px" />
								<col style="width: 100px" />
								<col style="width: 200px" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col">쿠폰명</th>
									<th scope="col">쿠폰적용 상품</th>
									<th scope="col">결제수단</th>
									<th scope="col">쿠폰 혜택</th>
									<th scope="col">사용가능 기간</th>
								</tr>
							</thead>
							<c:if test="${list != null}">
								<tbody class=" center">
									<c:forEach items="${list}" var="VO">
										<tr class="xans-record-">
											<td class="left"><strong>${VO.couponspVO.cuName}</strong></td>
											<td class="left">전체상품</td>
											<td class="left">제한없음</td>
											<td class="left">${VO.couponspVO.disRate} % 할인</td>
											<td class="left">${VO.pubDate} ~ ${VO.exDate}</td>
										</tr>
									</c:forEach>
								</tbody>
							</c:if>
							<c:if test="${list == null}">
								<tbody class="">
									<tr>
										<td
											colspan="7"
											class="message"
										>보유하고 계신 쿠폰 내역이 없습니다</td>
									</tr>
								</tbody>
							</c:if>
						</table>
					</div>
				</div>
			</form>

			<!-- pager START -->
			<div class="xans-element- xans-myshop xans-myshop-couponlistpaging ec-base-paginate">
				<a
					href="/myshop/coupon/coupon.html?page=1"
					class="first"
				>&lt;&lt;</a> <a href="/myshop/coupon/coupon.html?page=1">&lt;</a>
				<ol>
					<li class="xans-record-"><a
						href="?page=1"
						class="this"
					>1</a></li>
				</ol>
				<a href="/myshop/coupon/coupon.html?page=1">&gt;</a> <a
					href="/myshop/coupon/coupon.html?page=1"
					class="last"
				>&gt;&gt;</a>
			</div>
			<!-- pager END -->

			<!-- coupon insert START -->
			<%-- <form
				id="frmSerialCoupon"
				name=""
				action="/exec/front/myshop/couponSerial"
				method="post"
				target="_self"
				enctype="multipart/form-data"
			>
				<div class="xans-element- xans-myshop xans-myshop-couponserial ">
					<div class="title">
						<h3>쿠폰인증번호 등록하기</h3>
					</div>
					<div class="ec-base-box typeThinBg couponSerial">
						<fieldset>
							<legend>쿠폰번호 등록</legend>
							<input
								id="coupon_code"
								name="coupon_code"
								fw-filter=""
								fw-label="쿠폰인증번호"
								fw-msg=""
								class="inputTypeText"
								placeholder=""
								maxlength="35"
								value=""
								type="text"
							/> <a
								href="#none"
								onclick="coupon_code_submit();"
							><img
								src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_coupon_serial.gif"
								alt="쿠폰번호 인증"
							/></a>
							<p>반드시 쇼핑몰에서 발행한 쿠폰번호만 입력해주세요. (10~35자 일련번호 "-" 제외)</p>
						</fieldset>
					</div>
				</div>
			</form> --%>
			<!-- coupon insert END -->

			<div class="ec-base-help">
				<h3>쿠폰 이용 안내</h3>
				<div class="inner">
					<ol>
						<li class="item1">쿠폰은 주문 시 1회에 한해 적용되며, 1회 사용 시 재 사용이 불가능합니다.</li>
						<li class="item2">쿠폰은 적용 가능한 상품이 따로 적용되어 있는 경우 해당 상품 구매 시에만 사용이 가능합니다.</li>
					</ol>
				</div>
			</div>

		</div>
	</div>
	<!-- contents END -->

	<!-- footer START -->
	<c:import url="/WEB-INF/views/templates/footer.jsp"></c:import>
	<!-- footer END -->

	<!-- External JS -->

	<!-- Custom JS -->
	<!-- <script
	type="text/javascript"
	src="/js/member/memberPage/memberCoupon.js"
></script> -->
</body>
</html>