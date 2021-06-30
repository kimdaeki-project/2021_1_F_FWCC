<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- spring security에 관련된 태그   -->
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>     
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
			<div>
				<table class="table"
					style="border-collapse: separate; border-spacing: 1px; text-align: left; line-height: 1.5;">
					<tbody>
						<tr>
							<th scope="row"
								style="width: 100px; padding: 10px; font-weight: bold; vertical-align: top;">SUBJECT
							</th>

							<td style="width: 350px; padding: 10px; vertical-align: top;">${vo.title}
							</td>
							<th scope="row"
								style="width: 100px; padding: 10px; font-weight: bold; vertical-align: top;">
							</th>

							<td style="width: 350px; padding: 10px; vertical-align: top;">
							</td>
						</tr>
						<tr>
							<th scope="row"
								style="width: 100px; padding: 10px; font-weight: bold; vertical-align: top;">WRITER
							</th>

							<td style="width: 350px; padding: 10px; vertical-align: top;">${vo.writer}
							</td>
							<th scope="row"
								style="width: 100px; padding: 10px; font-weight: bold; vertical-align: top;">
							</th>

							<td style="width: 350px; padding: 10px; vertical-align: top;">
							</td>
						</tr>
						<tr>
							<th scope="row"
								style="width: 100px; padding: 10px; font-weight: bold; vertical-align: top; border-bottom: 1px solid #ccc;">DATE
							</th>

							<td
								style="width: 100px; padding: 10px; vertical-align: top; border-bottom: 1px solid #ccc;">${vo.regDate}
							</td>
							<th scope="row"
								style="width: 100px; padding: 10px; font-weight: bold; vertical-align: top; border-bottom: 1px solid #ccc;">HIT
							</th>

							<td
								style="width: 1000px; padding: 10px; vertical-align: top; border-bottom: 1px solid #ccc;">${vo.hit}
							</td>
						</tr>
					</tbody>
				</table>
				<div style="text-align: center;">${vo.contents}</div>
				
			</div>
			<table class="table"
					style="border-collapse: separate; border-spacing: 1px; text-align: left; line-height: 1.5; ">
					<tbody>
					<c:forEach items="${vo.files}" var="fileVO">
					<tr>
					<th scope="row"
								style="width: 100px; padding: 10px; font-weight: bold; vertical-align: top;">File
							</th>
					<td>
					<a style="color:black;"
						href="fileDown?fileName=${fileVO.fileName}&oriName=${fileVO.oriName}">${fileVO.oriName}</a></td></tr>
				</c:forEach>
				<tr>
				<td colspan='2'>
				<a href="./list" class="btn btn-danger">List</a>
				</td>
				</tr>
					<c:forEach items="${cm}" var="com" >
					<tr>
					<td colspan='2'><div>${com.commentNum} ${com.writer} ${com.regDate} <sec:authentication property="principal.username" var="user_id"/>
						<c:if test="${com.writer == user_id }">
						<a href="./commentUpdate?commentNum=${com.commentNum}&num=${com.num}" class="btn btn-danger">Updatec</a>
						<a href="./commentDelete?commentNum=${com.commentNum}" id="del" class="btn btn-info">Deletec</a>
						</c:if></div>
						<div>${com.contents}</div>

					</td>
						
					</tr>
					</c:forEach>
					</tbody>
			</table>
			<c:if test="${cvo.commentNum == Null}">
			<div>
				<form id="frm" action="./commentInsert" method="post">
					<div class="form-group">
						<input type="hidden"
							class="form-control myCheck" id="writer" name="writer" value="<sec:authentication property="principal.username"/>">
					</div>
					<div class="form-group">
						<input type="hidden"
							class="form-control myCheck" id="num" name="num" value="${vo.num}" }>
					</div>

					<div class="form-group" style="margin: auto;">
						<textarea class="form-control myCheck" id="contents"
							name="contents"></textarea>
					</div>

					<input type="button" id="btn" value="WRITE" class="btn btn-primary">
				</form>
			</div>
			</c:if>
			<c:if test="${cvo.commentNum >=1}">
				<c:import url="/WEB-INF/views/board/notice/cUpdate.jsp"></c:import>
			</c:if>
			
			<sec:authentication property="principal.username" var="user_id"/>
			<c:if test="${com.writer == user_id }">
			<div>
				<a href="./update?num=${vo.num}" class="btn btn-danger">Update</a>
				<a href="./delete?num=${vo.num}" id="del" class="btn btn-info">Delete</a>
			</div>
			</c:if>
		</div>
	</div>
	<script type="text/javascript">
	const del = document.getElementById("del");
	const frm = document.getElementById("frm");
	
	del.addEventListener("click", function(){
		let result = confirm("Delete??");
		
		if(result){
			//frm.method="post";
			frm.setAttribute("method", "post");
			frm.submit();
			//location.href="./${board}Delete?num=${dto.num}";
		}
	});
</script>
	<c:import
		url="${pageContext.request.contextPath}/WEB-INF/views/templates/footer.jsp"></c:import>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/board/boardInsert.js"></script>
</body>
</html>