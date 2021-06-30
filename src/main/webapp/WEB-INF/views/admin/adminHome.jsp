<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html style="height:100%; overflow: auto;">
<head>
<c:import url='${pageContext.request.contextPath}/WEB-INF/views/templates/head.jsp'>
	<c:param name="title" value="-ADMIN"></c:param>
</c:import>
<meta charset="UTF-8">
</head>
<body style="width: 100%; height:100%; display: grid; grid-template-columns: 15% 85%; grid-template-rows:11% auto;">
<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/adminHeader.jsp"></c:import>
<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/adminNav.jsp"></c:import>
<div style="text-align: center;">
	<h1 style="padding: 8% 3% 3% 3%;">Admin HomePage</h1>
	<div style="width:100%; list-style: none; padding-left: 0; margin-top:2%; display: flex; justify-content: space-around;">
		<div style="width:22%; padding:3%; margin:0 5% 0 7%; border-radius: 1rem; border: 5px solid #607d8b;">
			<h2>상품관리</h2>
			<ul style="list-style: none; padding-left:0; font-size:1.2rem;">
				<li style="padding:5%; margin-top:18%;">
					<a href="./productInsert">상품등록</a>
				</li>
				<li style="padding:5%;">
					<a href="./productDivInsert">상품분류등록</a>
				</li>
				<li style="padding:5%;">
					<a href="./adminAllList">상품정보수정</a>
				</li>
				<li style="padding:5%;">
					<a href="./orderlistUpdate">배송상태수정</a>
				</li>
			</ul>
		</div>
		<div style="width:22%; padding:3%; margin:0 5%; border-radius: 1rem; border: 5px solid #607d8b;">
			<h2>판매현황</h2>
			<ul style="list-style: none; padding-left:0; font-size:1.2rem;">
				<li style="padding:5%; margin-top:18%;">
					<a href="./saleDay">일간판매현황</a>
				</li>
				<li style="padding:5%;">
					<a href="./saleWeek">주간판매현황</a>
				</li>
				<li style="padding:5%;">
					<a href="./saleMonth">월간판매현황</a>
				</li>
			</ul>
		</div>
		<div style="width:22%; padding:3%; margin:0 5%; border-radius: 1rem; border: 5px solid #607d8b;">
			<h2 style="font-size:1.7rem;">쿠폰 &amp;<br> 마일리지</h2>
			<ul style="list-style: none; padding-left:0; font-size:1.2rem;">
				<li style="padding:5%; margin-top:5%;">
					<a href="./transmitCoupon">쿠폰전송</a>
				</li>
				<li style="padding:5%;">
					<a href="./setCouponsp">쿠폰등록</a>
				</li>
				<li style="padding:5%;">
					<a href="${pageContext.request.contextPath}/admin/transmitMile">마일리지전송</a>
				</li>
			</ul>
		</div>
	</div>
	<div style="padding:10% 2% 2% 2%;">
		<span>COPYRIGHT © FrizmWORKS. ALL RIGHTS RESERVED. Site by suhonstudio</span>
	</div>
</div>
<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/adminFooter.jsp"></c:import>
</body>
</html>