<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
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

<div class="modal-body">
<button class="close" type="button" data-dismiss="modal" aria-label="Close">
        <span aria-hidden="true">×</span>
    </button>

    <img alt="ss" style="width: 450px; " src="../upload/lookbook/${md.fileName}">
		
		<div class="row">
    	<div class="col"> <a href="./modal?lookbookFileNum=${md.lookbookFileNum - 1}" data-toggle="modal" data-target="#myModal">prev</a></div>
        <div class="col" style="text-align: right"> <a href="./modal?lookbookFileNum=${md.lookbookFileNum + 1}" data-toggle="modal" data-target="#myModal">next</a></div>
        </div>
    </div>


</body>
</html>