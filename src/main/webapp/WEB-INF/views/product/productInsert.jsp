<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="/WEB-INF/views/templates/head.jsp"></c:import>
<!-- summernote -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<!------------>
<style type="text/css">
.contents{
padding: 85px 34px 0px;
	min-width: 1252px;
	max-width: 1400px;
	margin: 0 auto;
	min-height: 480px;
}
</style>
<title>Product Insert</title>
</head>
<body>
<c:import url="/WEB-INF/views/templates/navbar.jsp"><c:param name="isCommon" value="true"></c:param></c:import>
<div class="contents">
<form action="insert" method="post" enctype="multipart/form-data">
<h1>productInsert</h1>

<h4>제품 이름</h4>
<input type="text" name="productTitle">
<h4>제품 가격</h4>
<input type="text" name="productPrice">
<h4>콜라보레이션구분</h4>
<select name="collab">
<option>콜라보레이션여부</option>
<option>콜라보레이션 안함</option>
<option>콜라보레이션 이름</option>
</select>
<h4>제품 구분</h4>
<select name="productType">
<option>상의</option>
<option>하의</option>
</select>
<h4>제품 세부 구분</h4>
<select name="productType">
<option>long</option>
<option>short</option>
</select>
<!-- 
<h4>썸네일</h4>
<input type="file" class="form-control-file border">
 -->
<h4>제품 요약</h4>
<textarea  style="resize: none;" id="summary" class="myCheck" name="productContents"></textarea>
<!-- 
<h4>제품 상세 이미지</h4>
<textarea name="contents" style="resize: none;" id="contents" class="myCheck"></textarea>
<h4></h4>
<input type="file" class="form-control-file border">
<input type="file" class="form-control-file border">
 -->
<button>올리기</button>
</form>
</div>
<c:import url="/WEB-INF/views/templates/footer.jsp"></c:import>
<script type="text/javascript">
$("#contents").summernote({
	height:500,
	placeholder:'write here...',
	callbacks :{
		onImageUpload: function(files){
			uploadFile(files);
		},// onImageUpload
		onMediaDelete: function(files){
			deleteFile(files);
		}
	}// callback
});
</script>
</body>
</html>