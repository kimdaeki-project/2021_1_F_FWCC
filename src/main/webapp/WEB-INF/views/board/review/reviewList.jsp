  
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
			<p>Review</p>
	</div>		
	
	
	

	<div class="row">
			<c:forEach items="${Rlist}" var="Rdto" >
				<div class="col-sm-4">
				<div class="card" style="width: 22rem; height: 22rem;">
				  
				  <div class="card-body">
				    <p class="card-text">
				   <a style="color:black;" href="./select?num=${Rdto.num}">
					<c:catch>
					<c:forEach begin="1" end="${Rdto.depth}">--</c:forEach>
					</c:catch>

					<img style="width: 310px; height: 260px;" src="https://frizm.co.kr/file_data/frizm/gallery/2021/06/26/5efc7d63b2c45b234d44e5392a4dc40c.jpg">

					</a>
					<div>${Rdto.title}</div>
					<div>${Rdto.writer} ${Rdto.regDate}</div>
					
					
					</p>
				  </div>
				</div>
				</div>
			</c:forEach>
			</div>
			<c:forEach items="${Rvo.files}" var="fileVO">
			<p>${fileVO.fileName}</p>
					<img class="card-img-top" src="../upload/review/${fileVO.fileName}" alt="Card image cap">
					</c:forEach>
	</div>
	
	<div>
	<sec:authorize access="isAuthenticated()">

	<div style="text-align: right">
  		<a href="./insert" class="btn " role="button" style="border:1px solid gray;
                    width:100px;
                    height:30px;
                    font-size:14px;">글쓰기</a>
  		</div>


	</sec:authorize>
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