<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>insert</h1>
	<div class="container">
		<h2>${board}form</h2>
		<form id="frm" action="./${board}Insert" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label for="writer">Writer:</label> <input type="text"
					readonly="readonly" value="${member.id}"
					class="form-control myCheck" id="writer" name="writer">
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
		
			
			<div id="files" title="0"></div>
			
			<input type="button" id="btn" value="WRITE" class="btn btn-primary">
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


	<script type="text/javascript" src="../resources/js/board/boardInsert.js"></script>
	<script type="text/javascript" src="../resources/js/board/fileAdd.js"></script>
	<script type="text/javascript" src="../resources/js/board/summerFile.js"></script>
	
</body>
</html>