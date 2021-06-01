<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
	<table class="table">
	<thead class="xans-element">
				<tr>
					<th>SUBJECT</th>
					<th>WRITER</th>
					<th>Date</th>
					<th>Hit</th>
				</tr>
			</thead>
	<tbody>
	<tr>
		<th><h1>${vo.title}</h1></th>
		<th><h5>${vo.regDate}</h5></th>
		<th><h3>${vo.contents}</h3></th>
		<th><h3>${vo.hit}</h3></th>
	</tr>

	</tbody>
	</table>
	
	</div>
</body>
</html>