<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<div class="contents">
		<form id="frm" action="insert" method="post"
			enctype="multipart/form-data">
			<h1>productInsert</h1>
			<input hidden="hidden" name=productNum value="${productNum}"
				id="pNum" title="${productNum}">
			<p>${VO.productNum}</p>
			<h4>제품 이름</h4>
			<input type="text" name="productTitle" id="pTitle" value="${VO.productTitle}">
			<h4>제품 가격</h4>
			<input type="number" name="productPrice" id="pPrice" value="${VO.productPrice}">
			<h4>콜라보레이션구분</h4>
			<select name="collab" id="pCollab" value="">
				<option value="default">콜라보레이션여부</option>
				<option value="none">콜라보레이션 안함</option>
				<option value="name1">콜라보레이션 이름</option>
			</select>
			<h4>제품 구분</h4>
			<select name="productType" id="pType1" value="">
				<option value="default">대분류</option>
				<option value="top">상의</option>
				<option value="bottom">하의</option>
			</select>
			<h4>제품 세부 구분</h4>
			<select name="productType" id="pType2" value="">
				<option value="default">소분류</option>
				<option>long</option>
				<option>short</option>
			</select>
			<h4>썸네일</h4>
			<c:forEach items="${VO.files}" var="file">
			<img style="width:300px;" alt="${file.oriName}" src="/resources/images/product/${VO.productNum}/${file.fileName}">
			<p>${VO.productNum}</p>
			<p>resources/images/product/${VO.productNum}/${file.fileName}</p>
			<p>${file.oriName},${file.fileName}</p>
			</c:forEach>
			<div class="image-container">
				<img style="width: 500px;" id="preview-image"> <input
					style="display: block;" type="file" id="input-image"
					name="thumbnail">
			</div>
			<h4>제품 요약</h4>
			<textarea style="resize: none;" id="summary" class="myCheck"
				name="summary" value="">${VO.summary}</textarea>
			<h4>사이즈</h4>
			<input type="checkbox" name="size" value="S" class="size">S <input
				type="checkbox" name="size" value="M" class="size">M <input
				type="checkbox" name="size" value="L" class="size">L <input
				type="checkbox" name="size" value="XL" class="size">XL <input
				type="checkbox" name="size" value="2XL" class="size">2XL
			<h4>상세 내용</h4>
			<textarea name="productContents" style="resize: none;" id="contents" value="">${VO.productContents}</textarea>

		</form>
		<a id="sBtn">올리기</a>
	</div>



</body>
</html>