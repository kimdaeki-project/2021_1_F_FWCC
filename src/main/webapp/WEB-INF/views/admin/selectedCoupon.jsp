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
<div style="padding:5%;">
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
				<tr>
					<td id="cuSpNum">
						<c:out value='${item.cuSpNum}'></c:out>
					</td>
					<td>
						<c:out value='${item.cuName}'></c:out>
					</td>
					<td>
						<c:out value='${item.disRate}'></c:out>
					</td>
				</tr>
			</tbody>
		</table>
		<div>
			<input id="couponperiod" type="number" min="1" max="1000" value="1">
			<button id="selectUser">지정전송</button>
			<button id="allSend">모두에게 전송</button>
		</div>
		<div id="userform" style="display: none;">
			<div id="usernameList">
				<div>
					<input type="text" class="usernames" name="usernames">
					<button class="deleteusername">삭제하기</button>
				</div>
			</div>
			<div>
				<button id="addusername">추가하기</button>
				<button id="selectTransmit">전송하기</button>
			</div>
		</div>
	</div>
</div>
<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/adminFooter.jsp"></c:import>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/admin/selectedCoupon.js"></script>
</body>
</html>