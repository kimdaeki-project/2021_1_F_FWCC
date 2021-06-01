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
</style>
<title>${name}</title>
</head>
<body>
	<c:import url="/WEB-INF/views/templates/navbar.jsp">
		<c:param name="isCommon" value="true"></c:param>
	</c:import>
	<div id="wrap" style="padding: 68px 34px 0px 34px; text-align: center;">
		<h1 style="text-align: center;">${name}${division}</h1>

		<c:if test="${name ne 'All (New arrival)'}">
			<span><a class="selBtn"
				href="${pageContext.request.contextPath }/product/list?collab=&productType=${name}-long&name=${name}&division=(long)">long</a><a
				class="selBtn"
				href="${pageContext.request.contextPath }/product/list?collab=&productType=${name}-short&name=${name}&division=(short)">short</a></span>
		</c:if>

			<div class="row">

						<c:forEach items="${productList}" var="product">
					<div class="col">
					<div style="width:20rem; border:1px solid red;">
							<h2>${product.productNum}</h2>
							<h3 style="color: green;">${product.productTitle}</h3>
							<p style="color: blue;">${product.productPrice}</p>
							<p style="color: blue;">${product.productDisRate}%</p>
					</div>
					</div>
						</c:forEach>

			</div>

		<ul class="pagination justify-content-center">
			<li class="page-item"><a class="page-link p"
				href="${pageContext.request.contextPath }/product/list?collab=&productType=${name}-short&name=${name}&division=${division}&curPage=1"
				title="${pager.startNum-1}"><</a></li>

			<li class="page-item"><a class="page-link p"
				href="${pageContext.request.contextPath }/product/list?collab=&productType=${name}-short&name=${name}&division=${division}&curPage=${pager.startNum-1}">PREV</a></li>

			<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
				<li class="page-item"><a class="page-link p"
					href="${pageContext.request.contextPath }/product/list?collab=&productType=${name}-short&name=${name}&division=${division}&curPage=${i}">${i}</a></li>
			</c:forEach>
			<li class="page-item"><a class="page-link p"
				href="${pageContext.request.contextPath }/product/list?collab=&productType=${name}-short&name=${name}&division=${division}&curPage=${pager.lastNum+1}">NEXT</a></li>
			<li class="page-item"><a class="page-link p"
				href="${pageContext.request.contextPath }/product/list?collab=&productType=${name}-short&name=${name}&division=${division}&curPage=${pager.totalPage}">></a></li>
		</ul>
	</div>
	</div>
	<c:import url="/WEB-INF/views/templates/footer.jsp"></c:import>
	<script type="text/javascript">
		
	</script>
</body>
</html>