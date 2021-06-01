<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="/WEB-INF/views/templates/head.jsp"></c:import>
<style type="text/css">
.selBtn {
	padding-left: 50px;
	padding-right: 50px;
}
</style>
<title>${name}</title>
</head>
<body>
<c:import url="/WEB-INF/views/templates/navbar.jsp">
	<c:param name="isCommon" value="true"></c:param>
</c:import>
	<div id="wrap" style="padding: 68px 34px 0px 34px;">
			<h1 style="text-align: center;">${name}name</h1>

			<span><a class="selBtn"
				href="${pageContext.request.contextPath }/product/list?collab=none&productType=${name}-long&name=${name}">long</a><a
				class="selBtn"
				href="${pageContext.request.contextPath }/product/list?collab=none&productType=${name}-short&name=${name}">short</a></span>

			<c:forEach items="${productList}" var="product">

				<h2>${product.productNum}</h2>
				<h3 style="color: green;">${product.productTitle}</h3>
				<p style="color: blue;">${product.productPrice}</p>
				<p style="color: blue;">${product.productDisRate}%</p>

			</c:forEach>
			<ul class="prdList grid4">
				<li id="anchorBoxId_2567" class="xans-record-"><span
					class="chk"><input type="checkbox"
						class="ProductCompareClass xECPCNO_2567 displaynone" /></span>
					<div class="thumbnail">
						<a
							href="/product/mild-stripe-tee-ivory/2567/category/52/display/1/"
							name="anchorBoxName_2567"><img
							src="//www.frizm.co.kr/web/product/medium/202105/12b29e44d28b89afcc7a28772558d802.jpg"
							id="eListPrdImage2567_1" alt="Mild stripe tee _ ivory" /></a> <span
							class="wish"></span>
					</div>
					<div class="description">
						<strong class="name"><a
							href="/product/mild-stripe-tee-ivory/2567/category/52/display/1/"
							class=""><span class="title displaynone"><span
									style="font-size: 11px; color: #838383;">상품명</span> :</span> <span
								style="font-size: 11px; color: #838383;">Mild stripe tee
									_ ivory</span></a></strong>
						<ul class="xans-element- xans-product xans-product-listitem spec">
							<li class=" xans-record-"><strong class="title displaynone"><span
									style="font-size: 12px; color: #000000;">판매가</span> :</strong> <span
								style="font-size: 12px; color: #000000;">KRW 45,000</span><span
								id="span_product_tax_type_text" style=""> </span></li>
						</ul>
						<div class="icon">
							<div class="promotion">
								<span class="ico_soldout displaynone">SOLD OUT</span>
							</div>
							<div class="button">
								<div class="likeButton displaynone">
									<button type="button">
										<strong></strong>
									</button>
								</div>
								<div class="option"></div>
							</div>
						</div>
					</div></li>

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
</body>
</html>