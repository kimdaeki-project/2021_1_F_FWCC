<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<script src="${pageContext.request.contextPath}/js/board/summernote-ko-KR.js"></script>
<title>글쓰기</title>

<script>
$(document).ready(function() {
	  $('#summernote').summernote({
 	    	placeholder: 'content',
	        minHeight: 370,
	        maxHeight: null,
	        focus: true, 
	        lang : 'ko-KR'
	  });
	});
</script>
</head>
<body>

<div class="container">
		<h2>${board}form</h2>
		<form id="frm" action="./insert" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label for="writer">Writer:</label> <input type="text"
					class="form-control myCheck" id="writer" name="writer">
			</div>

			<div class="form-group">
				<label for="title">Title:</label> <input type="text"
					class="form-control myCheck" id="title" name="title">
			</div>

			<div class="form-group" style="margin: auto;">
				<label for="contents">Contents"</label>
				<textarea class="form-control myCheck" id="contents" name="contents"></textarea>
			</div>
			
			
			<div>
					<input type="file" name="files">
					<input type="file" name="files">
				</div>
			
			<input type="button" id="btn" value="WRITE" class="btn btn-primary">
		</form>
	</div>

	<div id="sample">
		<div class="input-group">
			
			<div class="input-group-append delete">
				<input class="btn btn-outline-secondary" type="button"
					id="inputGroupFileAddon04" value="Delete">
			</div>
		</div>


	</div>


	<script type="text/javascript" src="${pageContext.request.contextPath}/js/board/boardInsert.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/board/fileAdd.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/board/summerFile.js"></script>
	

</body>
</html>