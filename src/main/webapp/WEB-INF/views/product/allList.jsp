<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="/WEB-INF/views/templates/head.jsp"></c:import>
<title>Insert title here</title>
</head>
<body>
	<h1>all List</h1>

	<table>
		<thead>
			<tr>
				<td>product number</td>
				<td>title</td>
				<td>price</td>
				<td>discount rate</td>
				<td>final price</td>
				<td>saleable</td>
				<td>division number</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${allList}" var="product">
				<tr>
					<td>${product.productNum}</td>
					<td><a href="update?productNum=${product.productNum}">${product.productTitle}</a></td>
					<td>${product.productPrice}</td>
					<td>${product.productDisRate}</td>
					<td>${product.finalPrice}</td>
					<td>${product.productSaleable}</td>
					<td>${product.productDivNum}</td>



				</tr>
			</c:forEach>


		</tbody>
	</table>

</body>
</html>