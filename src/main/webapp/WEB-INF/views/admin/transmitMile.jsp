<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html style="height:100%; overflow: auto;">
<head>
<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/head.jsp"></c:import>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="width: 100%; height:100%; display: grid; grid-template-columns: 15% 85%; grid-template-rows:11% auto;">
<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/adminHeader.jsp"></c:import>
<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/adminNav.jsp"></c:import>
<div style="padding:5% 8%;">
	<div>
		<input id="sendmileage" type="number" min="0" max="1000000" value="1000">
		<input type="text" id="mileContents" placeholder="보낼 메세지 입력">
		<button id="toggleselectusers">선택 전송</button>
		<button id="allmiletrans">모두에게 전송</button>
		<div id="selectusers" style="display:none;">
			<div id="adduser">
				<div>
					<input type="text" class="usernames">
					<button class="deleteuser">제거</button>
				</div>
			</div>
			<div>
				<button id="addinput">추가하기</button>
				<button id="selecttransmile">해당 인원들에게 전송하기</button>
			</div>
		</div>
	</div>
</div>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/adminFooter.jsp"></c:import>
</body>
</html>