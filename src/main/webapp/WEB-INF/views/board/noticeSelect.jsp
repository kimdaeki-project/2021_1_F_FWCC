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
<body>
<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/navbar.jsp">
		<c:param name="isCommon" value="true"></c:param>
	</c:import>
	<div id="container">
	<div style="padding: 68px 34px 0;">
	<div class="title" style="margin: 60px 0 40px; text-align:center;">
			<p>Notice</p>
	</div>	
	<div>
	<table class="table" style="border-collapse: separate;
	  border-spacing: 1px;
	  text-align: left;
	  line-height: 1.5;
	  margin : 20px 10px;">
	<tbody>
	<tr>
		<th scope="row" style="width: 100px;
		  padding: 10px;
		  font-weight: bold;
		  vertical-align: top;
		  ">SUBJECT
		</th>
  
		<td style="width: 350px;
		  padding: 10px;
		  vertical-align: top;
		  ">${vo.title}
		</td>
		<th scope="row" style="width: 100px;
		  padding: 10px;
		  font-weight: bold;
		  vertical-align: top;">
		</th>
  
		<td style="width: 350px;
		  padding: 10px;
		  vertical-align: top;">
		</td>
	</tr>
	<tr>
		<th scope="row" style="width: 100px;
		  padding: 10px;
		  font-weight: bold;
		  vertical-align: top;">WRITER
		</th>
  
		<td style="width: 350px;
		  padding: 10px;
		  vertical-align: top;">${vo.writer}
		</td>
		<th scope="row" style="width: 100px;
		  padding: 10px;
		  font-weight: bold;
		  vertical-align: top;">
		</th>
  
		<td style="width: 350px;
		  padding: 10px;
		  vertical-align: top;">
		</td>
	</tr>
	<tr>
		<th scope="row" style="width: 100px;
		  padding: 10px;
		  font-weight: bold;
		  vertical-align: top;
		  border-bottom: 1px solid #ccc;">DATE
		</th>
  
		<td style="width: 100px;
		  padding: 10px;
		  vertical-align: top;
		  border-bottom: 1px solid #ccc;">${vo.regDate}
		</td>
		<th scope="row" style="width: 100px;
		  padding: 10px;
		  font-weight: bold;
		  vertical-align: top;
		  border-bottom: 1px solid #ccc;">HIT
		</th>
  
		<td style="width: 1000px;
		  padding: 10px;
		  vertical-align: top;
		  border-bottom: 1px solid #ccc;">${vo.hit}
		</td>
	</tr>
	</tbody>
	</table>
	<div style="text-align:center;">${vo.contents}</div>
	<c:forEach items="${vo.files}" var="fileVO" >
	<a href="fileDown?fileName=${fileVO.fileName}&oriName=${fileVO.oriName}">${fileVO.oriName}</a>
	</c:forEach>
	</div>
	</div>
	</div>
	<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/footer.jsp"></c:import>
</body>
</html>