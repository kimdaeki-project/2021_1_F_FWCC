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

#wrap{
padding: 80px 34px 0px;
	min-width:1252px;
    max-width: 1320.1px;
    margin: 0 auto;
    min-height: 480px;

}
.divTest{

min-height: 480px;
}
.ulTest{
display: table;
    width: 100%;
    margin: 0 auto 50px;
}
.liTest{
display: inline-block;
	width:20%;
    margin: 0 2% 40px;
    vertical-align: top;
}
#cardImg{
width: 100%;
height: 100%;
}
</style>
<c:if test="${division eq ''}">
<title>${name}</title>
</c:if>
<c:if test="${division ne ''}">
<title>${name} (${division})</title>
</c:if>

</head>
<body>
	<c:import url="/WEB-INF/views/templates/navbar.jsp">
		<c:param name="isCommon" value="true"></c:param>
	</c:import>
	<div id="wrap" style="">
	<c:if test="${division ne ''}">
		<h1 style="text-align: center;">${name} (${division})</h1>
	</c:if>
	<c:if test="${division eq ''}">
		<h1 style="text-align: center;">${name}</h1>
	</c:if>

		<c:if test="${name ne 'All'}">
		<div style="text-align:center;">
			<span ><a class="selBtn"
				href="${pageContext.request.contextPath }/product/list?collab=&productType=${name}-long&name=${name}&division=long">long</a><a
				class="selBtn"
				href="${pageContext.request.contextPath }/product/list?collab=&productType=${name}-short&name=${name}&division=short">short</a></span>
		</div>
		</c:if>
			<div class="divTest">
<!-- 
					<ul class="ulTest" >
					 -->
				<c:forEach items="${productList}" var="product">
						<li class="liTest">
						<img id="cardImg" alt="test" src="${pageContext.request.contextPath}/images/product/test/c5.gif">
							<p>${product.productNum}</p>
							<h3 style="color: green;">${product.productTitle}</h3>
							<p style="color: blue;">${product.productPrice}</p>
							<p style="color: blue;">${product.productDisRate}%</p>
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
	<c:import url="/WEB-INF/views/templates/footer.jsp"></c:import>
</body>
</html>