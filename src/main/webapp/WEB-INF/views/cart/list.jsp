<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="margin:8% 5%; text-align: center;">
		<h2 style="letter-spacing: 0.15rem; margin-bottom: 10%">CART</h2>
		<div style="text-align: left;">
			<h3>일반상품(<c:out value="0"></c:out>)</h3>
		</div>
		<table>
			<thead>
				<tr>
					<th>
						<input type="checkbox" id="allcheck"/>
					</th>
					<th>
						THUMB
					</th>
					<th>
						PRODUCT
					</th>
					<th>
						PRICE
					</th>
					<th>
						QUANTITY
					</th>
					<th>
						MILEAGE
					</th>
					<th>
						DELIVERY
					</th>
					<th>
						CHARGE
					</th>
					<th>
						TOTAL
					</th>
					<th>
						SELECT
					</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${items}" var="item">
					<tr>
						<td>
							<input type="checkbox" name="checklist">
						</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="10">
						<div style="display: flex; justify-content: space-between; width:100%;">
							<div>
								[기본배송]
							</div>
							<div>
								상품구매금액 <c:out value=""></c:out>+배송비 0 (무료) = 합계: 
								<span>KRW <c:out value=""></c:out></span>
							</div>
						</div>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
</body>
</html>