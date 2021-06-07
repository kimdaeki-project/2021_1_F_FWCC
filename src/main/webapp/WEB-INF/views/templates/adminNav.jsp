<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<ul style="display:block; position:absolute; left:0; height:100%; width:15%; background-color: rgba(128,128,128,0.6); float: left; list-style: none; padding:0; text-align: center;">
	<li style="padding:11%;">
		<img alt="" src="${pageContext.request.contextPath}/images/logo_b.png" style="margin:1.5% 3%;">
	</li>
	<li style="padding:10%; font-size: 1.7em;">상품관리
		<ul style="list-style: none; padding:0; font-size:1.2rem; margin-top: 10%;">
			<li><a href="${pageContext.request.contextPath}/admin/productInsert">상품등록</a></li>
			<li style="margin-top:5%;"><a href="${pageContext.request.contextPath}/admin/productStock">상품재고정리</a></li>
			<li style="margin-top:5%;"><a href="${pageContext.request.contextPath}/admin/productUpdate">상품정보수정</a></li>
		</ul>
	</li>
	<li style="padding:10%; font-size: 1.7rem;">판매량확인
		<ul style="list-style: none; padding:0; font-size:1.2rem; margin-top: 8%;">
			<li><a href="${pageContext.request.contextPath}/admin/saleDay">일간 판매 연황</a></li>
			<li style="margin-top:5%;"><a href="${pageContext.request.contextPath}/admin/saleWeek">주간 판매 현황</a></li>
			<li style="margin-top:5%;"><a href="${pageContext.request.contextPath}/admin/saleMonth">월간 판매 현황</a></li>
		</ul>
	</li>
	<li style="padding:10%; font-size: 1.7rem;">쿠폰관리
		<ul style="list-style: none; padding:0; font-size:1.2rem; margin-top: 8%;">
			<li><a href="${pageContext.request.contextPath}/admin/setCouponsp">쿠폰등록</a></li>
			<li style="margin-top:5%;"><a href="${pageContext.request.contextPath}/admin/transmitCoupon">쿠폰전송</a></li>
		</ul>
	</li>
</ul>