<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>productList</h1>
<c:forEach items="${productList}" var="product">

<h3 style="color:green;">${product.productTitle}</h3>
<p style="color:blue;">${product.productPrice}</p>
<p style="color:blue;">${product.productDisRate}%</p>

</c:forEach>


</body>
</html>