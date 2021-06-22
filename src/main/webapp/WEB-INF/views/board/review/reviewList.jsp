  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/head.jsp"></c:import>
</head>
<style>
a:hover {
  text-decorationd: underline;
}

.pagination a { 
    font-weight:bold; 
    color: black; 
    float: left; 
    padding: 10px 16px; 
    text-decoration: none; 
} 
.pagination a.active {     
    text-decoration:underline ; 
} 
.pagination a:hover:not(.active) { 
    text-decoration:underline ; 
    border-radius:15px; 
} 

</style>
<body>
<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/navbar.jsp">
		<c:param name="isCommon" value="true"></c:param>
	</c:import>
<div id="container">
<div style="padding: 68px 34px 0;">
<div class="container">
	<div class="title" style="margin: 60px 0 40px; text-align:center;">
			<p>Notice</p>
	</div>		
		<table class="table" style="border-collapse: separate;
	  border-spacing: 1px;
	  text-align: left;
	  line-height: 1.5;
	  margin : 20px 10px;">
			<thead >
				<tr>
					<th style="width: 100px;">NO</th>
					<th style="width: 600px;">SUBJECT</th>
					<th style="width: 100px; text-align:center;">WRITER</th>
					<th style="width: 100px; text-align:center;">DATE</th>
					<th style="width: 100px; text-align:center;">HIT</th>
				</tr>
			</thead>
			
			<tbody>
			<c:forEach items="${Rlist}" var="Rdto" >
				<tr>
					<td>${Rdto.num}</td>
					<td><a style="color:black;" href="./select?num=${Rdto.num}">
					
					<c:catch>
					<c:forEach begin="1" end="${Rdto.depth}">--</c:forEach>
					</c:catch>
					${Rdto.title}
					</a></td>
					<td style="text-align:center;">${Rdto.writer}</td>
					<td style="text-align:center;">${Rdto.regDate}</td>
					<td style="text-align:center;">${Rdto.hit}</td>
				</tr>
			</c:forEach>
			</tbody>
		
		</table>
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
	  
	<div class="input-group mt-3 mb-3" style=" justify-content: center;">
	<form id="frm" action="./list" class="form-inline">
		<input type="hidden" name="curPage" value="1" id="curPage">
	  <div class="input-group-prepend">
	   <select class="form-control" name="kind" id="kind" >
	    <option class="sel">Title</option>
	    <option class="sel">Contents</option>
	    <option class="sel">Writer</option>
	  </select>
	  </div>
	  <input type="text" class="form-control" name="search" id="search" value="${pager.search}" placeholder="">
	    <div class="input-group-append">
	    <button class="btn btn-success" type="submit">Search</button>
	  </div>
	 </form> 
	</div> 
  
  <a href="./insert" class="btn  btn-primary" role="button">Write</a>
<script type="text/javascript">
	let kind= '${pager.kind}';
	$(".sel").each(function() {
		let t = $(this).text();
		if(t == kind){
			$(this).prop("selected", true);
		}
	});
	
	$(".p").click(function () {
		let curPage = $(this).attr("title");
		$("#curPage").val(curPage);
		let search= '${pager.search}';
		$("#frm").submit();
	});
</script> 

</div>
</div>
	<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/footer.jsp"></c:import>

</body>
</html>