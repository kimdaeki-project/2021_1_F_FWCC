<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html style="height:100%; overflow:auto;">
<head>
<c:import url='${pageContext.request.contextPath}/WEB-INF/views/templates/head.jsp'>
	<c:param name="title" value="-ADMIN"></c:param>
</c:import>
<meta charset="UTF-8">
</head>
<body style="width: 100%; height:100%; display: grid; grid-template-columns: 15% 85%; grid-template-rows:11% auto;">
<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/adminHeader.jsp"></c:import>
<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/adminNav.jsp"></c:import>
<div style="padding:5% 10%; text-align: center;">
	<h1>all List</h1>
	<table style="width: 100%; margin-top: 2%; border:1px solid black;">
		<thead>
			<tr>
				<td style="border:1px solid black;">product number</td>
				<td style="border:1px solid black;">title</td>
				<td style="border:1px solid black;">price</td>
				<td style="border:1px solid black;">discount rate</td>
				<td style="border:1px solid black;">final price</td>
				<td style="border:1px solid black;">saleable</td>
				<td style="border:1px solid black;">division number</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${allList}" var="product">
				<tr>
					<td style="border:1px solid black;">${product.productNum}</td>
					<td style="border:1px solid black;"><a href="./productUpdate?productNum=${product.productNum}">${product.productTitle}</a></td>
					<td style="border:1px solid black;">${product.productPrice}</td>
					<td style="border:1px solid black;">${product.productDisRate}</td>
					<td style="border:1px solid black;">${product.finalPrice}</td>
					<td style="border:1px solid black;">${product.productSaleable}</td>
					<td style="border:1px solid black;">${product.productDivNum}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/adminFooter.jsp"></c:import>
</body>
</html>