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
input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}
</style>
<title>Product Insert</title>
</head>
<body>
<c:import url="/WEB-INF/views/templates/navbar.jsp"><c:param name="isCommon" value="true"></c:param></c:import>
<div class="contents">
<form action="insert" method="post" enctype="multipart/form-data">
<h1>productInsert</h1>
<input hidden="hidden" name=productNum value="${productNum}" id="pNum" title="${productNum}">
<p>${productNum}</p>
<h4>제품 이름</h4>
<input type="text" name="productTitle">
<h4>제품 가격</h4>
<input type="number" name="productPrice">
<h4>콜라보레이션구분</h4>
<select name="collab">
<option value="default">콜라보레이션여부</option>
<option value="none">콜라보레이션 안함</option>
<option value="name1">콜라보레이션 이름</option>
</select>
<h4>제품 구분</h4>
<select name="productType">
<option value="top">상의</option>
<option value="bottom">하의</option>
</select>
<h4>제품 세부 구분</h4>
<select name="productType">
<option>long</option>
<option>short</option>
</select>
<h4>썸네일</h4>
<div class="image-container">
    <img style="width: 500px;" id="preview-image">
    <input style="display: block;" type="file" id="input-image" name="thumbnail">
</div>
<h4>제품 요약</h4>
<textarea  style="resize: none;" id="summary" class="myCheck" name="summary"></textarea>
<h4>사이즈</h4>
<input type="checkbox" name="size" value="S">S
<input type="checkbox" name="size" value="M">M
<input type="checkbox" name="size" value="L">L
<input type="checkbox" name="size" value="XL">XL
<input type="checkbox" name="size" value="2XL">2XL
<h4>상세 내용</h4>
<textarea name="productContents" style="resize: none;" id="contents"></textarea>
 
<button>올리기</button>
</form>
</div>
<c:import url="/WEB-INF/views/templates/footer.jsp"></c:import>
<script type="text/javascript" src="/js/product/summerFile.js">

/* 
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

// input file에 change 이벤트 부여
const inputImage = document.getElementById("input-image")
inputImage.addEventListener("change", e => {
    readImage(e.target)
})
*/
</script>
</body>
</html>