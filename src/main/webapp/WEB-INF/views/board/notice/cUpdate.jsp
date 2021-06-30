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
		<h2>댓글수정</h2>
		<form id="frm" action="./commentUpdate" method="post">
					<div class="form-group">
						<input type="hidden"
							class="form-control myCheck" id="commentNum" name="commentNum" value="${cvo.commentNum}" >
					</div>

					<div class="form-group" style="margin: auto;">
						<label for="contents">Contents"</label>
						<textarea class="form-control myCheck" id="contents"
							name="contents">${cvo.contents}</textarea>
					</div>

					<div style="text-align: right; padding: 10px;">
					<input type="button" id="btn" value="확인" class="btn" style="background: gray;
						color:white;
                    width:100px;
                    height:30px;
                    font-size:14px;">
				</div>
				</form>
	</div>


	<script type="text/javascript" src="/js/board/fileAdd.js"></script>


</body>
</html>