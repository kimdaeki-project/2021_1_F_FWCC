<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="/WEB-INF/views/templates/head.jsp"></c:import>
<!-- summernote -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<!------------>
<style type="text/css">
#sample {
	display: none;
}
</style>

</head>
<body>
<c:import url="/WEB-INF/views/templates/navbar.jsp"><c:param name="isCommon" value="true"></c:param></c:import>

<div id="container">
<div style="padding: 68px 34px 0;">
	<div class="container">
		<h2>qnaInsert</h2>
		<form id="frm" action="./insert" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<input type="hidden"
					class="form-control myCheck" id="writer" name="writer" value="<sec:authentication property="principal.username"/>">
			</div>

			<div class="form-group">
				<label for="title">Title:</label> <input type="text"
					class="form-control myCheck" id="title" name="title">
			</div>

			<div class="form-group">
				<label for="contents">Contents"</label>
				<textarea class="form-control myCheck" rows="5" id="contents"
					name="contents"></textarea>
			</div>
			<div class="form-group">
				<input type="file" name="files">
			</div>

			<div style="text-align: right">
  		<input type="button" id="btn" value="WRITE" class="btn" style="border:1px solid gray;
                    width:100px;
                    height:30px;
                    font-size:14px;">
  		</div>
		</form>
	</div>

</div>
</div>
<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/footer.jsp"></c:import>

	<script type="text/javascript" src="/js/board/boardInsert.js"></script>
	<script type="text/javascript" src="/js/board/fileAdd.js"></script>
	<script type="text/javascript" src="/js/board/summerFile.js"></script>

</body>
</html>