<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import
	url="${pageContext.request.contextPath}/WEB-INF/views/templates/head.jsp"></c:import>
</head>
<body>
	<div>
		<form id="frm" action="./commentUpdate" method="post">
			<input type="hidden" name="num" value="${cvo.commentNum}">

			<div class="form-group" style="margin: auto;">
				<label for="contents">Contents"</label>
				<textarea class="form-control myCheck" id="contents"
					name="contents">${cvo.contents}</textarea>
			</div>

			<input type="button" id="btn" value="update" class="btn btn-primary">
		</form>
	</div>
	
			
</body>
</html>