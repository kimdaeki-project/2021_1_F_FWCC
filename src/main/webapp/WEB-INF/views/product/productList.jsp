<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="/WEB-INF/views/templates/headStatics.jsp"></c:import>
<style type="text/css">
.selBtn{
padding-left:50px;
padding-right:50px;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<div id="wrap" style="padding: 68px 34px 0px 34px;">
		<c:import url="/WEB-INF/views/templates/header.jsp"></c:import>
		<div class="container" style="text-align: center;">
			<h1 style="text-align: center;">productList</h1>
			
			<span ><a class="selBtn" href="${pageContext.request.contextPath }/product/list?collab=none&productType=top-long" >long</a><a class="selBtn" href="${pageContext.request.contextPath }/product/list?collab=none&productType=top-short" >short</a></span>
			
			<c:forEach items="${productList}" var="product">

				<h2>${product.productNum}</h2>
				<h3 style="color: green;">${product.productTitle}</h3>
				<p style="color: blue;">${product.productPrice}</p>
				<p style="color: blue;">${product.productDisRate}%</p>

			</c:forEach>


		</div>
	</div>

	<script>
		(function($) {
			//$(document).ready(function(){
			$('#mainslider').slick({
				autoplay : true,
				pauseOnHover : false,
				dots : true,
				arrows : true,
				fade : true,
				autoplaySpeed : 4000, //머무르는 시간
				speed : 1700
			//효과속도
			});
			//});
		})(jQuery);
	</script>
	<c:import url="/WEB-INF/views/templates/footer.jsp"></c:import>
	<c:import url="/WEB-INF/views/templates/bodyStatics.jsp"></c:import>

</body>
</html>