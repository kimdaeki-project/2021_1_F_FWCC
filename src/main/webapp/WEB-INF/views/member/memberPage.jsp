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
	href="/css/member/memberPage.css"
>
<style type="text/css">
	h3 a {
		margin-top: 20px;
	}
</style>
<meta charset="UTF-8">
<title>FWCC-myPage</title>
</head>
<body>
	<!-- header START -->
	<c:import url="/WEB-INF/views/templates/navbar.jsp"></c:import>
	<!-- header END -->

	<!-- contents START -->
	<div class="container">
		<div id="contents">
			<div class="titleArea">
				<h2>MY PAGE</h2>
			</div>

			<div class="xans-element- xans-layout xans-layout-logincheck ">
				<!--
    $url = /member/login.html
-->
			</div>


			<div class="xans-element- xans-myshop xans-myshop-asyncbankbook ec-base-box gHalf ">
				<ul>
					<li><strong class="title">mileage</strong> <strong class="data"><span
							id="xans_myshop_bankbook_total_mileage"
						>${mileage} 원</span></strong></li>
					<li class=""><strong class="title">coupon</strong> <strong class="data"><span
							id="xans_myshop_bankbook_coupon_cnt"
						></span><span>${couponCount}개</span></strong> <a
						href="#"
						class="button"
					>view</a></li>
				</ul>
			</div>

			<div
				id="myshopMain"
				class="xans-element- xans-myshop xans-myshop-main"
			>
				<div class="shopMain order">
					<h3>
						<a href="#"><strong>order</strong>주문내역 조회</a>
					</h3>
				</div>
				<div class="shopMain profile">
					<h3>
						<a href="#"><strong>profile</strong>회원 정보</a>
					</h3>
				</div>
				<div class="shopMain wishlist">
					<h3>
						<a href="#"><strong>wishlist</strong>관심 상품</a>
					</h3>
				</div>
				<div class="shopMain recent_view col2">
					<h3>
						<a href="#"><strong>today view</strong>오늘 본 상품</a>
					</h3>
				</div>
				<div class="shopMain mileage ">
					<h3 class="txtTitle16B">
						<a href="#"><strong>mileage</strong>적립금</a>
					</h3>
				</div>
				<div class="shopMain coupon ">
					<h3>
						<a href="#"><strong>coupon</strong>쿠폰</a>
					</h3>
				</div>
				<div class="shopMain board">
					<h3>
						<a href="#"><strong>board</strong>게시물 관리</a>
					</h3>
				</div>
				<div class="shopMain address col2">
					<h3>
						<a href="#"><strong>address</strong>배송 주소록 관리</a>
					</h3>
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

</body>
</html>