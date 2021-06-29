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
	href="/css/member/memberPage/memberMileage.css"
>
<meta charset="UTF-8">
<title>FWCC-memberMileage</title>
</head>
<body>
	<!-- header START -->
	<c:import url="/WEB-INF/views/templates/navbar.jsp"></c:import>
	<!-- header END -->

	<!-- contents START -->
	<div class="container">
		<div id="contents">
			<div class="xans-element- xans-myshop xans-myshop-mileagehistorypackage ">
				<div class="xans-element- xans-myshop xans-myshop-head titleArea ">
					<h2>MY MILEAGE</h2>
					<p>고객님의 사용가능 적립금 금액 입니다.</p>
				</div>
				<div class="xans-element- xans-myshop xans-myshop-summary ec-base-box gHalf">
					<ul>
						<li class=""><strong class="title">총 적립금</strong> <span class="data">${mileageVO.usedMile + mileageVO.enabledMile}점<span
								id="xans_myshop_summary_total_mileage"
							></span>&nbsp;</span></li>
						<li class=""><strong class="title">사용가능 적립금</strong> <span class="data">${mileageVO.enabledMile}점<span
								id="xans_myshop_summary_avail_mileage"
							></span>&nbsp;</span></li>
						<li class=""><strong class="title">사용된 적립금</strong> <span class="data">${mileageVO.usedMile}점<span
								id="xans_myshop_summary_used_mileage"
							></span>&nbsp;</span></li>
					</ul>
				</div>
				<div class="ec-base-tab">
					<ul class="menu">
						<li class="selected"><a href="#">적립내역보기</a></li>
						<!-- <li><a href="#">미가용적립내역보기</a></li>
						<li><a href="#">미가용쿠폰/회원등급적립내역</a></li> -->
					</ul>
				</div>
				<div class="xans-element- xans-myshop xans-myshop-historylist">
					<div class="ec-base-table typeList">
						<table
							border="1"
							summary=""
						>
							<caption>적립금 내역</caption>
							<colgroup>
								<col style="width: 15%" />
								<col style="width: 15%" />
								<col style="width: 25%" />
								<col style="width: auto" />
							</colgroup>
							<thead>
								<tr class="kor">
									<th scope="col">주문날짜</th>
									<th scope="col">적립금</th>
									<th scope="col">관련 주문</th>
									<th scope="col">내용</th>
								</tr>
							</thead>
							<tbody class=" center">
								<c:if test="${list != null}">
									<c:forEach items="${list}" var="VO">
										<tr class="xans-record-">
											<td>${VO.orderlistVO.orderDate}</td>
											<td class="right">${VO.changeMile}</td>
											<td><a href="#">${VO.orderNum}</a></td>
											<td class="left">${VO.mileContents}</td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
						<c:if test="${list == null}">
						<p class="message">적립금 내역이 없습니다.</p>
						</c:if>
					</div>
				</div>
			</div>
			
			<!-- pager START -->
			<div class="xans-element- xans-myshop xans-myshop-historypaging ec-base-paginate">
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
			
			<div class="xans-element- xans-myshop xans-myshop-head ec-base-help ">
				<h3>적립금 안내</h3>
				<div class="inner">
					<ol class="xans-element- xans-myshop xans-myshop-historyinfo">
						<li class="item1 ">주문으로 발생한 적립금은 배송완료 후 1일 부터 실제 사용 가능한 적립금으로 전환됩니다.</li>
						<li class="item3 ">사용가능 적립금(총적립금 - 사용된적립금)은 상품구매 시 바로 사용가능합니다.</li>
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
	src="/js/member/memberPage/memberMileage.js"
></script> -->

</body>
</html>