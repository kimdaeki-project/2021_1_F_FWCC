  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- spring security에 관련된 태그   -->
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>            
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
	outline: none;
	font-size:12px;
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
			<p>Q&A</p>
	</div>		
		<table class="table" style="border-collapse: separate;
	  border-spacing: 1px;
	  text-align: left;
	  line-height: 1.5;
	  margin : 20px 10px;">
			<thead >
				<tr>
					<th style="width: 100px;">NO</th>
					<th style="width: 500px;">SUBJECT</th>
					<th style="width: 100px; text-align:center;">WRITER</th>
					<th style="width: 100px; text-align:center;">DATE</th>
					<th style="width: 100px; text-align:center;">HIT</th>
				</tr>
			</thead>
			
			<tbody>
			<c:forEach items="${Qlist}" var="Qdto" >
				<tr>
					<td>${Qdto.num}</td>
					<td><a style="color:black;" href="./select?num=${Qdto.num}">
					
					<c:catch>
					<c:forEach begin="1" end="${Qdto.depth}">--</c:forEach>
					</c:catch>
					${Qdto.title}
					</a></td>
					<td style="text-align:center;">${Qdto.writer}</td>
					<td style="text-align:center;">${Qdto.regDate}</td>
					<td style="text-align:center;">${Qdto.hit}</td>
				</tr>
			</c:forEach>
			</tbody>
		
		</table>
	</div>
	
		<sec:authorize access="isAuthenticated()">

	<div style="text-align: right">
  		<a href="./insert" class="btn " role="button" style="border:1px solid gray;
                    width:100px;
                    height:30px;
                    font-size:14px;">글쓰기</a>
  		</div>


	</sec:authorize>
	
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
	  <select id="search_key" name="search_key" fw-filter="" fw-label="" fw-msg="">
<option value="subject">제목</option>
<option value="contents">내용</option>
<option value="writer">글쓴이</option>
</select>
<input id="search" name="search" fw-filter="" fw-label="" fw-msg="" class="inputTypeText" placeholder="" value="${pager.search}" type="text">
	  </div>
	  
	  <button type="submit" class="btn btn-link" ><font color="black">find</font></button>
	 </form> 
	</div> 
  


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