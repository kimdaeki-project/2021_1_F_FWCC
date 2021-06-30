<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="/WEB-INF/views/templates/head.jsp"></c:import>
</head>
<body>
<c:import url="/WEB-INF/views/templates/navbar.jsp"><c:param name="isCommon" value="true"></c:param></c:import>
<div id="container">
<div style="padding: 68px 34px 0;">
<div class="container">
<h2>${board}form</h2>
		<form id="frm" action="./insert" method="post" enctype="multipart/form-data">


			<div class="form-group">
				<label for="title">Title:</label> <input type="text"
					class="form-control myCheck" id="title" name="title">
			</div>
			
			<div class="form-group">
				<label for="division">division:</label> <input type="text"
					class="form-control myCheck" id="division" name="division">
			</div>



			<div class="form-group">
				<input type="file" name="files" multiple="multiple">
			</div>

			
			
			
			<input type="button" id="btn" value="WRITE" class="btn btn-primary">
		</form>
	</div>

</div>
</div>
<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/footer.jsp"></c:import>



	<script type="text/javascript" src="/js/board/boardInsert.js"></script>
	<script type="text/javascript" src="/js/board/fileAdd.js"></script>


</body>
</html>