<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html style="height:100%; overflow:auto;">
<head>
<c:import url='${pageContext.request.contextPath}/WEB-INF/views/templates/head.jsp'>
	<c:param name="title" value="-ADMIN"></c:param>
</c:import>
<meta charset="UTF-8">
</head>
<body style="width: 100%; height:100%; display: grid; grid-template-columns: 15% 85%; grid-template-rows:11% auto;">
<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/adminHeader.jsp"></c:import>
<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/adminNav.jsp"></c:import>
<div style="padding:5% 10%; overflow: auto;">
	<select id="updateCheck">
		<option value="1" selected="selected">주문완료 목록 조회</option>
		<option value="2">배송중 목록 조회</option>
		<option value="3">선택항목조회</option>
	</select>
	<button id="selectCheck">선택</button>
	<div id="orderlistTable">
		<table style="width:100%;">
			<thead>
				<tr>
					<th style="padding:1%;"><input type="checkbox" id="allCheck"></th>
					<th style="padding:1%;">주문번호</th>
					<th style="padding:1%;">주문이름</th>
					<th style="padding:1%;">주문현황</th>
				</tr>
			</thead>
			<tbody id="orderlists">
				
			</tbody>
		</table>
		<button id="stateChangeButton">update</button>
	</div>
	<div id="selectedlist" style="display:none;">
		<input type="text" id="typedorderNum">
		<button id="typebutton">조회하기</button>
		<div id="vieworderlist">
			<div id="orderlistchange" style="display:hidden;">
				<input type="number" min="1" max="4" id="selectedOrderState">
				<button id="fixorderbutton">수정하기</button>
			</div>
		</div>
	</div>
</div>
<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/adminFooter.jsp"></c:import>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>s
<script type="text/javascript" src="${pageContext.request.contextPath}/js/admin/orderlistUpdate.js"></script>
</body>
</html>