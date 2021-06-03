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

.page-link {
	border: 0px;
}

.contents {
	margin: 0 auto;
	padding: 0;
}

#wrap {
	padding: 85px 34px 0px;
	min-width: 1252px;
	max-width: 1400.1px;
	margin: 0 auto;
	min-height: 480px;
}

.divTest {
	min-height: 480px;
}

.ulTest {
	display: table;
	width: 100%;
	margin: 0 auto 50px;
}

.liTest {
	display: inline-block;
	width: 22%;
	margin: 0 1% 40px;
	vertical-align: top;
}

#thumb {
	position: relative;
	margin: 0 10px 18px;
	text-align: center;
}

#cardImg {
	width: 100%;
	height: auto;
	box-sizing: border-box;
}

.function {
	line-height: 38px;
}

.prdCount {
	float: left;
	padding: 0 0 0 10px;
	font-size: 11px;
	color: #333;
}

.sort {
	float: right;
}

.sortName {
	font-size: 11px;
	color: #a7a7a7;
}

.sortDiv {
	height: 40px;
}
</style>
<c:if test="${division eq ''}">
	<title>${name}</title>
</c:if>
<c:if test="${division ne ''}">
	<title>${name}(${division})</title>
</c:if>

</head>
<body>
	<c:import url="/WEB-INF/views/templates/navbar.jsp">
		<c:param name="isCommon" value="true"></c:param>
	</c:import>

	<div class="contents">
		<div id="wrap">
			<c:if test="${division ne ''}">
				<h1 style="text-align: center;">${name}(${division})</h1>
			</c:if>
			<c:if test="${division eq ''}">
				<h1 style="text-align: center;">${name}</h1>
			</c:if>

			<c:if test="${name ne 'All'}">
				<div style="text-align: center;">
					<span><a class="selBtn"
						href="${pageContext.request.contextPath }/product/list?collab=&productType=${name}-long&name=${name}&division=long">long</a><a
						class="selBtn"
						href="${pageContext.request.contextPath }/product/list?collab=&productType=${name}-short&name=${name}&division=short">short</a></span>
				</div>
			</c:if>

			<div class="sortDiv">
				<p class="prdCount">
					Total <strong>1276</strong> items.
				</p>
				<div class="sort">
					<span><a class="sortName" href="#">신상품</a></span> <span
						class="sortName"> | </span> <span><a class="sortName"
						href="#">상품명</a></span> <span class="sortName"> | </span> <span><a
						class="sortName" href="#">낮은가격</a></span> <span class="sortName">
						| </span> <span><a class="sortName" href="#">높은가격</a></span>
				</div>
			</div>



			<div class="divTest">
				<!-- 
					<ul class="ulTest" >
					 -->
				<c:forEach items="${productList}" var="product">
					<li class="liTest">
						<div id="thumb">
							<a href="#"><img id="cardImg" alt="test"
								src="${pageContext.request.contextPath}/images/product/test/c4.jpeg"></a>
						</div> <a><span style="font-size: 11px; color: #838383;">${product.productTitle}</span></a>
						<br>
						<c:if test="${product.productDisRate eq 0}">
							<p>KRW ${product.productPrice}</p>
						</c:if> <c:if test="${product.productDisRate ne 0}">
							<span
								style="text-decoration: line-through; font-size: 12px; color: #000000; text-decoration: line-through;">KRW ${product.productPrice}
							</span>
							<br>
							<span style="font-size: 12px; color: #555555;">할인 금액 :
								${product.finalPrice}</span>
							<span style="font-size: 12px; color: #ff0000;">
								${product.productDisRate}% SALE</span>
						</c:if>
					</li>
				</c:forEach>
				<!-- 
					</ul>
 -->
			</div>
			<ul class="pagination justify-content-center">
				<li class="page-item"><a class="page-link p"
					href="${pageContext.request.contextPath }/product/list?collab=&productType=${name}-short&name=${name}&division=${division}&curPage=1"
					title="${pager.startNum-1}"><</a></li>

				<li class="page-item"><a class="page-link p"
					href="${pageContext.request.contextPath }/product/list?collab=&productType=${name}-short&name=${name}&division=${division}&curPage=${pager.startNum-1}">PREV</a></li>

				<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
					<li class="page-item"><a class="page-link p"
						href="${pageContext.request.contextPath }/product/list?collab=&productType=${name}-${division}&name=${name}&division=${division}&curPage=${i}">${i}</a></li>
				</c:forEach>
				<c:if test="${pager.lastNum%5 eq 0}">
					<li class="page-item"><a class="page-link p"
						href="${pageContext.request.contextPath }/product/list?collab=&productType=${name}-${division}&name=${name}&division=${division}&curPage=${pager.lastNum+1}">NEXT</a></li>
					<li class="page-item"><a class="page-link p"
						href="${pageContext.request.contextPath }/product/list?collab=&productType=${name}-${division}&name=${name}&division=${division}&curPage=${pager.totalPage}">></a></li>
				</c:if>
				<c:if test="${pager.lastNum%5 ne 0}">
					<li class="page-item"><a class="page-link p"
						href="${pageContext.request.contextPath }/product/list?collab=&productType=${name}-${division}&name=${name}&division=${division}&curPage=${pager.lastNum}">NEXT</a></li>
					<li class="page-item"><a class="page-link p"
						href="${pageContext.request.contextPath }/product/list?collab=&productType=${name}-${division}&name=${name}&division=${division}&curPage=${pager.totalPage}">></a></li>
				</c:if>
			</ul>
		</div>
	</div>
	<c:import url="/WEB-INF/views/templates/footer.jsp"></c:import>
</body>
</html>