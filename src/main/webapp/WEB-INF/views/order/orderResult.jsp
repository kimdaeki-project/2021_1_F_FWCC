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

<div style="margin:10% 10% 3% 10%;">
	<div style="text-align: center; margin-top:15%;">
			<strong style="font-size:1.8rem;">주문이 성공적으로 완료되었습니다.
					<br>주문해주셔서 감사합니다.</strong>
	</div>
	<table style="width:40%; margin:5% 30%; border:1px gray solid;">
		<tbody style="font-size:1.4rem;">
			<tr style="border-bottom:1px rgba(128,128,128,0.5) solid;">
				<th style="padding:2%; border-right:1px rgba(128,128,128,0.5) solid;">
					주문번호
				</th>
				<td style="padding:2%;">
					<c:out value='${order.orderNum}'></c:out>
				</td>
			</tr>
			<tr style="border-bottom:1px rgba(128,128,128,0.5) solid;">
				<th style="padding:2%; border-right:1px rgba(128,128,128,0.5) solid;">
					주문내역
				</th>
				<td style="padding:2%;">
					<c:out value='${order.orderName}'></c:out>
				</td>
			</tr>
			<tr style="border-bottom:1px rgba(128,128,128,0.5) solid;">
				<th style="padding:2%; border-right:1px rgba(128,128,128,0.5) solid;">
					결제금액
				</th>
				<td style="padding:2%;">
					<c:out value='${order.spPrice}'></c:out> 원
				</td>
			</tr>
			<tr>
				<th style="padding:2%; border-right:1px rgba(128,128,128,0.5) solid;">
					결제날짜
				</th>
				<td style="padding:2%;">
					<c:out value='${order.orderDate}'></c:out>
				</td>
			</tr>
		</tbody>
	</table>
	<div style="text-align: center; margin-top:5%;">
		<a href="${pageContext.request.contextPath}/">홈으로 이동하기</a>
	</div>
</div>

<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/footer.jsp"></c:import>
</body>
</html>