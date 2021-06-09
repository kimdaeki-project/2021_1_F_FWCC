<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html style="height:100%;">
<head>
<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/head.jsp"></c:import>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/billboard.js/3.0.3/billboard.min.css">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/billboard.js/3.0.3/billboard.pkgd.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="width: 100%; height:100%; display: grid; grid-template-columns: 15% 85%; grid-template-rows:11% auto;">
<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/adminHeader.jsp"></c:import>	
<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/adminNav.jsp"></c:import>	
<div style="display:flex; place-content:center;">
	<div id="chart">
	
	</div>
</div>
<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/adminFooter.jsp"></c:import>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/admin/saleDay.js"></script>
</body>
</html>