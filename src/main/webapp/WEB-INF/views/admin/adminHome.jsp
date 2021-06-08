<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<c:import url='${pageContext.request.contextPath}/WEB-INF/views/templates/head.jsp'></c:import>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:import url='${pageContext.request.contextPath}/WEB-INF/views/templates/adminNav.jsp'></c:import>
<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/adminHeader.jsp"></c:import>

<div style="margin:7% 5% 4% 23%; text-align: center;">
	<h1 style="margin-top: 13%; padding:3%; padding-top:5%;">Admin HomePage</h1>
	<ul style="width:100%; list-style: none; padding-left: 0; margin-top:2%;">
		<li style="width:22%; float: left; padding:3%; margin:0 5% 0 7%; display:block; border-radius: 1rem;  background-color: #607d8b; box-shadow: 1rem 1rem black;">
			<h2>상품관리</h2>
			<ul style="list-style: none; padding-left:0; font-size:1.2rem;">
				<li style="padding:5%; margin-top:10%;">
					<a href="./productInsert">상품등록</a>
				</li>
				<li style="padding:5%;">
					<a href="./productUpdate">상품정보수정</a>
				</li>
				<li style="padding:5%;">
					<a href="./productStock">상품재고정리</a>
				</li>
			</ul>
		</li>
		<li style="width:22%; float: left; padding:3%; margin:0 5%; display:block; border-radius: 1rem;  background-color: #607d8b; box-shadow: 1rem 1rem black;">
			<h2>판매현황</h2>
			<ul style="list-style: none; padding-left:0; font-size:1.2rem;">
				<li style="padding:5%; margin-top:10%;">
					<a href="./saleDay">일간판매현황</a>
				</li>
				<li style="padding:5%;">
					<a href="./saleWeek">주간판매현황</a>
				</li>
				<li style="padding:5%;">
					<a href="./saleMonth">월간판매현황</a>
				</li>
			</ul>
		</li>
		<li style="width:22%; float: left; padding:3%; margin:0 5%; display:block; border-radius: 1rem; background-color: #607d8b; box-shadow: 1rem 1rem black;">
			<h2>쿠폰관리</h2>
			<ul style="list-style: none; padding-left:0; font-size:1.2rem;">
				<li style="padding:5%; margin-top:10%;">
					<a href="./setCouponsp">쿠폰등록</a>
				</li>
				<li style="padding:5%;">
					<a href="./transmitCoupon">쿠폰전송</a>
				</li>
			</ul>
		</li>
	</ul>
	<div style="clear:both; padding:2%; padding-top:5%;">
		<span>COPYRIGHT © FrizmWORKS. ALL RIGHTS RESERVED. Site by suhonstudio</span>
	</div>
</div>
<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/adminFooter.jsp"></c:import>
</body>
</html>