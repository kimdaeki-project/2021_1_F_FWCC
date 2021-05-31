<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="/WEB-INF/views/templates/headStatics.jsp"></c:import>
<style type="text/css">
.selBtn {
	padding-left: 50px;
	padding-right: 50px;
}


</style>
<title>${name}</title>
</head>
<body>
	<div id="wrap" style="padding: 68px 34px 0px 34px;">
		<c:import url="/WEB-INF/views/templates/header.jsp"></c:import>
		<div class="container" style="text-align: center;">
			<h1 style="text-align: center;">${name}</h1>

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


				<!-- 삭제 -->
				<li id="anchorBoxId_2566" class="xans-record-"><span
					class="chk"><input type="checkbox"
						class="ProductCompareClass xECPCNO_2566 displaynone" /></span>
					<div class="thumbnail">
						<a
							href="/product/mild-stripe-tee-dark-green/2566/category/52/display/1/"
							name="anchorBoxName_2566"><img
							src="//www.frizm.co.kr/web/product/medium/202105/6bf26df8fb624d753a9d29390b3bf6db.jpg"
							id="eListPrdImage2566_1" alt="Mild stripe tee _ dark green" /></a> <span
							class="wish"></span>
					</div>
					<div class="description">
						<strong class="name"><a
							href="/product/mild-stripe-tee-dark-green/2566/category/52/display/1/"
							class=""><span class="title displaynone"><span
									style="font-size: 11px; color: #838383;">상품명</span> :</span> <span
								style="font-size: 11px; color: #838383;">Mild stripe tee
									_ dark green</span></a></strong>
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
				<li id="anchorBoxId_2565" class="xans-record-"><span
					class="chk"><input type="checkbox"
						class="ProductCompareClass xECPCNO_2565 displaynone" /></span>
					<div class="thumbnail">
						<a
							href="/product/mild-stripe-tee-navy/2565/category/52/display/1/"
							name="anchorBoxName_2565"><img
							src="//www.frizm.co.kr/web/product/medium/202105/083b83f07ec0d4d9a7b896412f26a08b.jpg"
							id="eListPrdImage2565_1" alt="Mild stripe tee _ navy" /></a> <span
							class="wish"></span>
					</div>
					<div class="description">
						<strong class="name"><a
							href="/product/mild-stripe-tee-navy/2565/category/52/display/1/"
							class=""><span class="title displaynone"><span
									style="font-size: 11px; color: #838383;">상품명</span> :</span> <span
								style="font-size: 11px; color: #838383;">Mild stripe tee
									_ navy</span></a></strong>
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
				<li id="anchorBoxId_2564" class="xans-record-"><span
					class="chk"><input type="checkbox"
						class="ProductCompareClass xECPCNO_2564 displaynone" /></span>
					<div class="thumbnail">
						<a
							href="/product/slow-camper-tee-white/2564/category/52/display/1/"
							name="anchorBoxName_2564"><img
							src="//www.frizm.co.kr/web/product/medium/202105/f669a4da7b6f0df0125ffe12ea7f858a.jpg"
							id="eListPrdImage2564_1" alt="Slow camper tee _ white" /></a> <span
							class="wish"></span>
					</div>
					<div class="description">
						<strong class="name"><a
							href="/product/slow-camper-tee-white/2564/category/52/display/1/"
							class=""><span class="title displaynone"><span
									style="font-size: 11px; color: #838383;">상품명</span> :</span> <span
								style="font-size: 11px; color: #838383;">Slow camper tee
									_ white</span></a></strong>
						<ul class="xans-element- xans-product xans-product-listitem spec">
							<li class=" xans-record-"><strong class="title displaynone"><span
									style="font-size: 12px; color: #000000;">판매가</span> :</strong> <span
								style="font-size: 12px; color: #000000;">KRW 32,000</span><span
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
				<!-- 삭제 -->
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