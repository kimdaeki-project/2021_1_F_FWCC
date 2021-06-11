<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div style="grid-row:1/-1; background-color: rgba(128,128,128,0.6); text-align: center; z-index:200; display:grid; grid-template-rows:11% 1fr 1fr 1fr;position:sticky; top:0;">
	<div style="padding:12%;">
		<a href="${pageContext.request.contextPath}/admin/adminHome">
			<img alt="" src="${pageContext.request.contextPath}/images/logo_b.png" style="margin:1.5% 3%; transform:scale(1.2);">
		</a>
	</div>
	<div style="padding:8%; font-size: 1.7em; margin-top:5%;">상품관리
		<ul style="list-style: none; padding:0; font-size:1.2rem; margin-top: 10%;">
			<li><a href="${pageContext.request.contextPath}/admin/productInsert">상품등록</a></li>
			<li style="margin-top:5%;"><a href="${pageContext.request.contextPath}/admin/productUpdate">상품정보수정</a></li>
			<li style="margin-top:5%;"><a href="${pageContext.request.contextPath}/admin/productStock">상품재고정리</a></li>
		</ul>
	</div>
	<div style="padding:8%; font-size: 1.7rem;">판매현황
		<ul style="list-style: none; padding:0; font-size:1.2rem; margin-top: 8%;">
			<li><a href="${pageContext.request.contextPath}/admin/saleDay">일간판매연황</a></li>
			<li style="margin-top:5%;"><a href="${pageContext.request.contextPath}/admin/saleWeek">주간판매현황</a></li>
			<li style="margin-top:5%;"><a href="${pageContext.request.contextPath}/admin/saleMonth">월간판매현황</a></li>
		</ul>
	</div>
	<div style="padding:8%; font-size: 1.7rem;">쿠폰 &amp; 마일리지
		<ul style="list-style: none; padding:0; font-size:1.2rem; margin-top: 8%;">
			<li><a href="${pageContext.request.contextPath}/admin/transmitCoupon">쿠폰전송</a></li>
			<li style="margin-top:5%;"><a href="${pageContext.request.contextPath}/admin/setCouponsp">쿠폰등록</a></li>
			<li style="margin-top:5%;"><a href="${pageContext.request.contextPath}/admin/transmitMile">마일리지전송</a></li>
		</ul>
	</div>
</div>
