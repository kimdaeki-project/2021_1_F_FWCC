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
	max-width: 1400px;
	margin: 0 auto;
	min-height: 480px;
}

.divTest {
	border-width: 0px;
	min-height: 480px;
	width:100%;
	padding:0px;
}


.cardList {
vertical-align: top;
	display:inline-block;
	width: 25%;
	padding:0px;
	margin: 0 -2px 40px;
	border:0px;
}

#thumb {
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
	margin-right:10px;
}

.sortName {
	font-size: 11px;
	color: #a7a7a7;
}

.sortDiv {
	height: 40px;
}
#cardContents{
margin:0 10px;
}
.page{
clear:both;
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
						href="${pageContext.request.contextPath }/product/list?collab=&productType=${name}-long&name=${name}&division=long&sortStandard=&sale=${sale}">long</a><a
						class="selBtn"
						href="${pageContext.request.contextPath }/product/list?collab=&productType=${name}-short&name=${name}&division=short&sortStandard=&sale=${sale}">short</a></span>
				</div>
			</c:if>

			<div class="sortDiv">
				<p class="prdCount">
					Total <strong>${totalCount}</strong> items.
				</p>
				<div class="sort">
					<span><a class="sortName" href="${pageContext.request.contextPath }/product/list?collab=&productType=${name}-${division}&name=${name}&division=${division}&sortStandard=new&sale=${sale}">신상품</a></span>
					<span class="sortName"> | </span>
					<span><a class="sortName" href="${pageContext.request.contextPath }/product/list?collab=&productType=${name}-${division}&name=${name}&division=${division}&sortStandard=name&sale=${sale}">상품명</a></span>
					<span class="sortName"> | </span>
					<span><a class="sortName" href="${pageContext.request.contextPath }/product/list?collab=&productType=${name}-${division}&name=${name}&division=${division}&sortStandard=lowPrice&sale=${sale}">낮은가격</a></span>
					<span class="sortName"> | </span>
					<span><a class="sortName" href="${pageContext.request.contextPath }/product/list?collab=&productType=${name}-${division}&name=${name}&division=${division}&sortStandard=highPrice&sale=${sale}">높은가격</a></span>
				</div>
			</div>



			<div class="divTest">
				<!-- 
					<ul class="ulTest" >
					 -->
				<c:forEach items="${productList}" var="product">
					<div class="cardList">
						<div id="thumb">
							<a href="#"><img id="cardImg" alt="test"
								src="${pageContext.request.contextPath}/images/product/test/frizm_278.jpg"></a>
						</div>
						<div id="cardContents">
						<span ><a href="#" style="font-size: 11px; color: #838383;">${product.productTitle}</a></span>
						<br>
						<c:if test="${product.productDisRate eq 0}">
							<span style=" font-size: 12px; color: #000000;">KRW ${product.productPrice}</span>
							
								
						</c:if> <c:if test="${product.productDisRate ne 0}">
							<span
								style="font-size: 12px; color: #000000; text-decoration: line-through;">KRW ${product.productPrice}
							</span>
							<br>
							<span style="font-size: 12px; color: #555555;">할인 금액 :
								${product.finalPrice}</span>
							<span style="font-size: 12px; color: #ff0000;">
								${product.productDisRate}% SALE</span>
						</c:if>
						</div>
					</div>
				</c:forEach>
				<!-- 
					</ul>
 -->
			</div>
			<div class="page">
			<ul class="pagination justify-content-center">
				<li class="page-item"><a class="page-link p"
					href="${pageContext.request.contextPath }/product/list?collab=&productType=${name}-short&name=${name}&division=${division}&curPage=1&sortStandard=${sortStandard}&sale=${sale}"
					title="${pager.startNum-1}"><</a></li>

				<li class="page-item"><a class="page-link p"
					href="${pageContext.request.contextPath }/product/list?collab=&productType=${name}-short&name=${name}&division=${division}&curPage=${pager.startNum-1}&sortStandard=${sortStandard}&sale=${sale}">PREV</a></li>

				<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
					<li class="page-item"><a class="page-link p"
						href="${pageContext.request.contextPath }/product/list?collab=&productType=${name}-${division}&name=${name}&division=${division}&curPage=${i}&sortStandard=${sortStandard}&sale=${sale}">${i}</a></li>
				</c:forEach>
				<c:if test="${pager.lastNum%5 eq 0}">
					<li class="page-item"><a class="page-link p"
						href="${pageContext.request.contextPath }/product/list?collab=&productType=${name}-${division}&name=${name}&division=${division}&curPage=${pager.lastNum+1}&sortStandard=${sortStandard}&sale=${sale}">NEXT</a></li>
					<li class="page-item"><a class="page-link p"
						href="${pageContext.request.contextPath }/product/list?collab=&productType=${name}-${division}&name=${name}&division=${division}&curPage=${pager.totalPage}&sortStandard=${sortStandard}&sale=${sale}">></a></li>
				</c:if>
				<c:if test="${pager.lastNum%5 ne 0}">
					<li class="page-item"><a class="page-link p"
						href="${pageContext.request.contextPath }/product/list?collab=&productType=${name}-${division}&name=${name}&division=${division}&curPage=${pager.lastNum}&sortStandard=${sortStandard}&sale=${sale}">NEXT</a></li>
					<li class="page-item"><a class="page-link p"
						href="${pageContext.request.contextPath }/product/list?collab=&productType=${name}-${division}&name=${name}&division=${division}&curPage=${pager.totalPage}&sortStandard=${sortStandard}&sale=${sale}">></a></li>
				</c:if>
			</ul>
			</div>
		</div>
	</div>
	<c:import url="/WEB-INF/views/templates/footer.jsp"></c:import>
</body>
</html>