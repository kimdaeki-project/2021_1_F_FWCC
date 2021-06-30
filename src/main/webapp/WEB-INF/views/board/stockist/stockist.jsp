<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/head.jsp"></c:import>
</head>
<body>
<c:import url="/WEB-INF/views/templates/navbar.jsp"><c:param name="isCommon" value="true"></c:param></c:import>
<div id="container">
<div style="padding: 68px 34px 0;">
	<div class="container">
	<div class="title" style="margin: 60px 0 40px; text-align:center;">
			<p>stockist</p>
	</div>	
	<div style="text-align: center;">
	<img alt="zz" style="width: 1000px" src="https://frizm.co.kr/web/upload/image/dealershop_list.jpg">
	</div>
	</div>
	</div>
	</div>
	
<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/footer.jsp"></c:import>
</body>
</html>