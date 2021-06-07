<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/head.jsp"></c:import>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/navbar.jsp">
	<c:param name="isCommon" value="true"></c:param>
</c:import>

<div style="margin:10%;">
	<table style="width:100%;">
		<thead>
			<tr>
				<th colspan="2" style="padding:1%;">
					주문이 성공적으로 완료되었습니다. 주문해주셔서 감사합니다.
				</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th>
				
				</th>
				<td>
				
				</td>
			</tr>
		</tbody>
	</table>
</div>

<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/footer.jsp"></c:import>
</body>
</html>