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
<div style="padding:1%; text-align: center;">
	<h1 style="margin-top:5%;">쿠폰 전송</h1>
	<table style="width:80%; margin: 3% 5%; text-align: center;">
		<thead>
			<tr>
				<th style="padding:1%;">쿠폰 번호</th>
				<th style="padding:1%;">쿠폰 이름</th>
				<th style="padding:1%;">할인률</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${cuspList}" var="item">
				<tr>
					<td style="padding:1%;">
						<a href="./selectedCoupon?cuSpNum=${item.cuSpNum}"><c:out value='${item.cuSpNum}'></c:out></a>
					</td>
					<td style="padding:1%;">
						<a href="./selectedCoupon?cuSpNum=${item.cuSpNum}"><c:out value='${item.cuName}'></c:out></a>
					</td>
					<td style="padding:1%;">
						<a href="./selectedCoupon?cuSpNum=${item.cuSpNum}"><c:out value='${item.disRate}'></c:out></a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/adminFooter.jsp"></c:import>
</body>
</html>