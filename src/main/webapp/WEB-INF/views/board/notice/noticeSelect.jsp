<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				<c:forEach items="${vo.files}" var="fileVO">
					<a
						href="fileDown?fileName=${fileVO.fileName}&oriName=${fileVO.oriName}">${fileVO.oriName}</a>
				</c:forEach>
			</div>
			<table class="table"
					style="border-collapse: separate; border-spacing: 1px; text-align: left; line-height: 1.5; ">
					<tbody>
					<c:forEach items="${cm}" var="com" >
					<tr>
					<td><div>${com.commentNum} ${com.writer} ${com.regDate} </div>
						<div>${com.contents}</div>
						<div>
						<a href="./commentUpdate?commentNum=${Rcom.commentNum}&num=${Rcom.num}" class="btn btn-danger">Updatec</a>
						<a href="./commentDelete?commentNum=${Rcom.commentNum}" id="del" class="btn btn-info">Deletec</a>
						</div>
					</td>
						
					</tr>
					</c:forEach>
					</tbody>
			</table>
			<div>
				<form id="frm" action="./RcommentInsert" method="post">
					<div class="form-group">
						<label for="writer">Writer:</label> <input type="text"
							class="form-control myCheck" id="writer" name="writer">
					</div>
					<div class="form-group">
						<label for="num">num:</label> <input type="number"
							class="form-control myCheck" id="num" name="num" value="${Rvo.num}" }>
					</div>

					<div class="form-group" style="margin: auto;">
						<label for="contents">Contents"</label>
						<textarea class="form-control myCheck" id="contents"
							name="contents"></textarea>
					</div>

					<input type="button" id="btn" value="WRITE" class="btn btn-primary">
				</form>
			</div>
			<c:if test="${Rcvo.commentNum >=1}">
				<c:import url="/WEB-INF/views/board/review/rcUpdate.jsp"></c:import>
			</c:if>
			
			<div>
				<a href="./Rupdate?num=${vo.num}" class="btn btn-danger">Update</a>
				<a href="./Rdelete?num=${vo.num}" id="del" class="btn btn-info">Delete</a>
				
			</div>
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