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
<body style="width: 100%; height:100%; display: grid; grid-template-columns: 15% 85%; grid-template-rows:11% auto;">
<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/adminHeader.jsp"></c:import>
<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/adminNav.jsp"></c:import>
<div>
	<div>
		<table>
			<thead>
				<tr>
					<th>쿠폰 번호</th>
					<th>쿠폰 이름</th>
					<th>할인률</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${cuspList}" var="item">
					<tr>
						<td>
							<c:out value='${item.cuSpNum}'></c:out>
						</td>
						<td>
							<c:out value='${item.cuName}'></c:out>
						</td>
						<td>
							<c:out value='${item.disRate}'></c:out>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/adminFooter.jsp"></c:import>
</body>
</html>