<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import
	url="${pageContext.request.contextPath}/WEB-INF/views/templates/head.jsp"></c:import>
</head>
<body>
<c:import
		url="${pageContext.request.contextPath}/WEB-INF/views/templates/navbar.jsp">
		<c:param name="isCommon" value="true"></c:param>
	</c:import>
	<div id="container">
		<div style="padding: 68px 34px 0;">
			<div class="title" style="margin: 60px 0 40px; text-align: center;">
				<p>Review</p>
			</div>
<div class="row">
			<c:forEach items="${list}" var="dto" >
				<div class="col-sm-6">

				  
				  <div class="card-body">
				    <p class="card-text">
				   <a style="color:black;" href="./select?lookbookNum=${dto.lookbookNum}">
					<c:catch>
					<c:forEach begin="1" end="${dto.depth}">--</c:forEach>
					</c:catch>
					<img class="card-img-top" src="https://frizm.co.kr/web/product/big/202106/7458c8457a4a3cf2f34c7c5411651009.jpg" alt="Card image cap">
					</a>
					${dto.title}
					${dto.division}
					</p>
				  </div>

				</div>
			</c:forEach>
			</div>
			<div style="margin: 40px 0 40px;">
	  <ul class="pagination" style=" justify-content: center;">
	  
	  	
	    <li class="page-item"><a class="page-link p" href="#" title="${pager.startNum-1}">&lt</a></li>
	   
	   
	   <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
	   
	    <li class="page-item"><a class="page-link p" href="#" title="${i}">${i}</a></li>
	   </c:forEach>
	   
	    
	   <li class="page-item"><a class="page-link p" href="#" title="${pager.lastNum}">&gt</a></li>
	    
	  </ul>
	 </div> 
			</div>
			</div>
			
<c:import
		url="${pageContext.request.contextPath}/WEB-INF/views/templates/footer.jsp"></c:import>

</body>
</html>