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
<div style="display:flex; place-content:center;">
	<div style="margin:11% 0 13% 0; width:40%; height:50%; border-radius: 1rem;  border: 5px solid #607d8b;">
		<fieldset style="padding:5%;">
			<legend style="padding-top:10%; text-align: center;">쿠폰 등록</legend>
			<form action="./setCouponsp" method="post" style="padding: 3% 10%;" id="setCouponSpForm">
				<label style="display:block;">쿠폰이름
					<input type="text" name="cuName" id="couponNameInput">
				</label>
				<label style="display:block;">할인률
					<input type="number" name="disRate" value="10" min="0" max="100" id="disRateInput">
				</label>
			</form>	
			<div style="padding:0 5%; text-align: right;">
				<button id="setCouponButton">쿠폰 등록</button>
			</div>
		</fieldset>
	</div>
</div>
<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/adminFooter.jsp"></c:import>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/admin/setCouponSp.js"></script>
</body>
</html>