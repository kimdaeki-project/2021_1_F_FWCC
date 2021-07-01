<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
	<c:if test="${vo.division == 'p'}">
	<p>sd</p>
	<p>${vo.title}</p>
	<p>${vo.division}</p>
		<c:forEach items="${vo.files}" var="fileVO">
		<p>${fileVO.fileName}</p>
					<img alt="ss" src="../upload/lookbook/${fileVO.fileName}">
				</c:forEach>
	</c:if>
	</div>
	
	<div>
	<c:if test="${vo.division == 'v'}">
	<p>sd</p>
	<p>${vo.title}</p>
	<p>${vo.division}</p>
		<c:forEach items="${vo.files}" var="fileVO">
		<c:set var="fileName" value="${fn:split(fileVO.fileName,('.'))}"></c:set>



		<c:if test="${fileName[fn:length(fileName)-1] == 'mp4'}">
		<video src="../upload/lookbook/${fileVO.fileName}" controls="controls"></video>
		</c:if>
	</c:forEach>
	</c:if>
	</div>
</body>
</html>