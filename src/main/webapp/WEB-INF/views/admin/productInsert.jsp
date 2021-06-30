<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html style="height: 100%; overflow: auto;">
<head>
<c:import url='${pageContext.request.contextPath}/WEB-INF/views/templates/head.jsp'>
	<c:param name="title" value="-ADMIN"></c:param>
</c:import>
<!-- summernote -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<!------------>
<style type="text/css">
.contents {
	padding: 85px 34px 0px;
	min-width: 1252px;
	max-width: 1400px;
	margin: 0 auto;
	min-height: 480px;
}

input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}
 td{
 border: solid 1px black;
 }
</style>
<meta charset="UTF-8">
</head>
<body style="width: 100%; height: 100%; display: grid; grid-template-columns: 15% 85%; grid-template-rows: 11% auto;">
<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/adminHeader.jsp"></c:import>
<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/adminNav.jsp"></c:import>
<div style="padding:5% 10%;">
	<form id="frm" action="/product/insert" method="post" enctype="multipart/form-data">
		<h1>productInsert</h1>
		<input hidden="hidden" name=productNum value="${productNum}"
			id="pNum" title="${productNum}">
		<table style="width:100%">
			<thead></thead>
				<tbody>
					<tr>
						<td>
							<h4>제품 이름</h4>
						</td>
						<td><input type="text" name="productTitle" id="pTitle">
						</td>
						</tr>
					<tr>
						<td>
							<h4>제품 가격</h4>
						</td>
						<td><input type="number" name="productPrice" id="pPrice">
						</td>
					</tr>
					<tr>
						<td>
							<h4>콜라보레이션구분</h4>
						</td>
						<td><select name="collab" id="pCollab">
								<option value="default">콜라보레이션여부</option>
								<c:forEach items="${divisions}" var="division">
									<option value="${division}">${division}</option>
								</c:forEach>
						</select></td>
						</tr>
					<tr>
						<td>
							<h4>제품 구분</h4>
						</td>
						<td><select name="productType" id="pType1">
								<option value="default">대분류</option>
								<option value="top">상의</option>
								<option value="bottom">하의</option>
						</select><select name="productType" id="pType2">
								<option value="default">소분류</option>
								<option>long</option>
								<option>short</option>
						</select></td>
					</tr>
					<tr>
						<td>
							<h4>썸네일</h4>
						</td>
						<td>
							<div class="image-container">
								<img style="width: 500px;" id="preview-image"> <input
									style="display: block;" type="file" id="input-image"
									name="thumbnail">
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<h4>제품 요약</h4>
						</td>
						<td><textarea
								style="resize: none; width: 100%; height: 150px;" id="summary"
								class="myCheck" name="summary"></textarea></td>
					</tr>
					<tr>
						<td>
							<h4>사이즈</h4>
						</td>
						<td><input type="checkbox" name="size" value="S" class="size">S
							<input type="checkbox" name="size" value="M" class="size">M
							<input type="checkbox" name="size" value="L" class="size">L
							<input type="checkbox" name="size" value="XL" class="size">XL
							<input type="checkbox" name="size" value="2XL" class="size">2XL
						</td>
					</tr>
				<tr>
				<td>
			<h4>상세 내용</h4>
			</td><td>
			<textarea name="productContents" style="resize: none;" id="contents"></textarea>
			</td>
			</tr>
		</tbody>
			</table>
		</form>
		<input type="button" id="sBtn" value="올리기">
	</div>
<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/adminFooter.jsp"></c:import>
<script type="text/javascript" src="/js/product/summerFile.js"></script>
<script type="text/javascript" src="/js/product/productInsert.js"></script>
<script type="text/javascript">
function readImage(input) {

   // 인풋 태그에 파일이 있는 경우
   if(input.files && input.files[0]) {

       // 이미지 파일인지 검사 (생략)

       // FileReader 인스턴스 생성
       const reader = new FileReader()

       // 이미지가 로드가 된 경우
       reader.onload = e => {
           const previewImage = document.getElementById("preview-image")
           previewImage.src = e.target.result
       }

       // reader가 이미지 읽도록 하기
       reader.readAsDataURL(input.files[0])
   }
}

//input file에 change 이벤트 부여
const inputImage = document.getElementById("input-image")
inputImage.addEventListener("change", e => {
   readImage(e.target)
})
</script>
</body>
</html>