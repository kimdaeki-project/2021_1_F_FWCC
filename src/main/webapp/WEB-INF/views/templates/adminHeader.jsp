<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<ul style="padding-left:none; list-style: none;">
	<li style="float: right; padding:1.7%;">
		<strong>Hello! ADMIN&ensp;
			<button id="adminMenu" style="border:0; background-color: transparent; color: white;"><i class="fa fa-cog"></i></button>
		</strong>
		<ul id="adminMenuBar" 
			style="list-style:none; padding-left:0; font-size:1.1rem; text-align: right; padding: 2.4%; 
			margin-top:0.1%; position:absolute; right:1%; display:none; background-color: #1C2E36;">
			<li style="margin-top:7%;"><a href="${pageContext.request.contextPath}/" style="text-decoration: none; color: white;">메인 페이지로 이동</a></li>
			<li style="margin-top:10%;"><a href="${pageContext.request.contextPath}/member/logout" style="text-decoration: none; color: white;">로그아웃</a></li>		
		</ul>
	</li>
	<li style="float:right; padding:2.2%; font-size:1.3rem;">
		<span><c:out value="${date}"></c:out></span>
	</li>
</ul>

