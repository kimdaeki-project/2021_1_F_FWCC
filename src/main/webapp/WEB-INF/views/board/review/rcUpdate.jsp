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
	<div class="container">
		<h2>noticeform</h2>
		<form id="frm" action="./commentUpdate" method="post">
					<div class="form-group">
						<label for="num">num:</label> <input type="number"
							class="form-control myCheck" id="commentNum" name="commentNum" value="${Rcvo.commentNum}" }>
					</div>

					<div class="form-group" style="margin: auto;">
						<label for="contents">Contents"</label>
						<textarea class="form-control myCheck" id="contents"
							name="contents">${Rcvo.contents}</textarea>
					</div>

					<input type="submit" id="btn" value="WRITE" class="btn btn-primary">
				</form>
	</div>


	<script type="text/javascript" src="/js/board/fileAdd.js"></script>


</body>
</html>