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
					<th>NOTICE</th>
				</tr>
			</thead>
	<tbody>
	<tr>
		<th scope="row">SUBJECT</th>
		<td>${vo.title}</td>
	</tr>
	
	<tr>
		<th scope="row">WRITER</th>
		<td>${vo.writer}</td>
	</tr>
	
	<tr>
		<th scope="row">DATE</th>
		<td>${vo.regDate}</td>
	</tr>
	
	<tr>
		<th scope="row">HIT</th>
		<td>${vo.hit}</td>
	</tr>
	</tbody>
	</table>
	
	</div>
</body>
</html>