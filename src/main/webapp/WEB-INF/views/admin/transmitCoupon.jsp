<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html style="height:100%;">
<head>
<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/head.jsp"></c:import>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="height:100%;">
<div style="width: 100%; height:100%; display: grid; grid-template-columns: 18% 82%; grid-template-rows:11% auto;">
	<div style="z-index:100; background-color: #1C2E36; font-size:1.7rem; color:white;">
		<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/adminHeader.jsp"></c:import>
	</div>
	<div style="grid-row:1/3; background-color: rgba(128,128,128,0.6); text-align: center; z-index:200;">
		<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/adminNav.jsp"></c:import>
	</div>
	<div>
	
	</div>
</div>
<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/adminFooter.jsp"></c:import>
</body>
</html>