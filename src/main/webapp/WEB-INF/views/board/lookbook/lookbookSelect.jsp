<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/head.jsp"></c:import>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<c:import
		url="${pageContext.request.contextPath}/WEB-INF/views/templates/navbar.jsp">
		<c:param name="isCommon" value="true"></c:param>
	</c:import>
	<div id="container">
		<div style="padding: 68px 34px 0;">
			<div class="title" style="margin: 60px 0 40px; text-align: center;">
				<p>${vo.title}</p>
			</div>
	<div class="row">
	<c:if test="${vo.division == 'p'}">
		<c:forEach items="${vo.files}" var="fileVO">

		<div class="col-sm-3">

			<div> 
			<a href="./modal?lookbookFileNum=${fileVO.lookbookFileNum}" data-toggle="modal" data-target="#myModal">
			<img alt="ss" style="width: 300px; " src="../upload/lookbook/${fileVO.fileName}">
			</a>
			</div>
		</div>

		</c:forEach>

	</c:if>
	</div>
	
	<div style="text-align: center;">
	<c:if test="${vo.division == 'v'}">

		<c:forEach items="${vo.files}" var="fileVO">
		<c:set var="fileName" value="${fn:split(fileVO.fileName,('.'))}"></c:set>



		<c:if test="${fileName[fn:length(fileName)-1] == 'mp4'}">
		<video src="../upload/lookbook/${fileVO.fileName}" controls="controls" style="width: 800px;"></video>
		</c:if>
	</c:forEach>
	</c:if>
	</div>
	
	<div class="bs-example">
    <!-- Button HTML (to Trigger Modal) -->
    
    
    <!-- Modal HTML -->
    <div id="myModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- Content will be loaded here from "remote.php" file -->
            </div>
        </div>
    </div>
</div>


	</div>
	</div>
	<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/footer.jsp"></c:import>
</body>
</html>