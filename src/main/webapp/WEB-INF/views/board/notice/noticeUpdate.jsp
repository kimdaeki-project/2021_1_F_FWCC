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
		<h2>noticeform</h2>
		<form id="frm" action="./update" method="post" enctype="multipart/form-data">
  			<input type="hidden" name="num" value="${vo.num}">

			<div class="form-group">
				<label for="title">Title:</label> <input type="text"
					class="form-control myCheck" id="title" name="title" value="${vo.title}">
			</div>

			<div class="form-group">
				<label for="contents">Contents"</label>
				<textarea class="form-control myCheck" rows="5" id="contents"
					name="contents" >${vo.contents}</textarea>
			</div>
			<div class="form-group">
				<input type="file" name="files">
				<input type="file" name="files">
			</div>
			
			<div id="files" title="0"></div>

			
			
			<div style="text-align: right; padding-bottom: 50px">
			<input type="submit" id="btn" value="UPDATE" class="btn" style="background: gray;
					color: white;
                    width:100px;
                    height:30px;
                    font-size:14px;">
                    </div>
		</form>
	</div>

	<div id="sample">
		<div class="input-group">
			<div class="custom-file">
				<input type="file"  id="inputGroupFile04"
					class="form-control-file border" name="files">
			</div>
			<div class="input-group-append delete">
				<input class="btn btn-outline-secondary" type="button"
					id="inputGroupFileAddon04" value="Delete">
			</div>
		</div>


	</div>

</div>
</div>

<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/footer.jsp"></c:import>
	<script type="text/javascript" src="/js/board/fileAdd.js"></script>
	<script type="text/javascript" src="/js/board/summerFile.js"></script>

</body>
</html>