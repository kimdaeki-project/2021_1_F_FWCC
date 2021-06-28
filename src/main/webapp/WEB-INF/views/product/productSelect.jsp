<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="/WEB-INF/views/templates/head.jsp"></c:import>


<title>Insert title here</title>
</head>
<body>
	<c:import url="/WEB-INF/views/templates/navbar.jsp">
		<c:param name="isCommon" value="true"></c:param>
	</c:import>

	<div class="contents" style="margin-top: 80px; min-width: 1200px;">
		<div
			style="position: fixed; right: 0; width: 390px; padding: 10px 20px; height: 100%;">
			<h2 id="pTitle" title="${VO.productTitle}" data-productNum="${VO.productNum}">${VO.productTitle}</h2>
			<div hidden="hidden" id="finalPrice" title="${VO.finalPrice }"></div>
			<c:if test="${VO.productDisRate eq 0}">
				<span style="font-size: 12px; color: #000000;">KRW
					${VO.productPrice}</span>
			</c:if>
			<c:if test="${VO.productDisRate ne 0}">
				<span
					style="font-size: 12px; color: #000000; text-decoration: line-through;">KRW
					${VO.productPrice} </span>
				<br>
				<span style="font-size: 12px; color: #555555;">할인 금액 :
					${VO.finalPrice}</span>
				<span style="font-size: 12px; color: #ff0000;">
					${VO.productDisRate}% SALE</span>
			</c:if>
			<br> <span style="font-size: 12px; color: #000000;">${VO.productMileage}
				(5%)</span> <br> <span style="font-size: 12px; color: #000000;">${VO.summary}</span>
			<br> <select id="sizes"
				onchange="changed(this.value)">
				<option value="default">사이즈 선택</option>
				<c:forEach items="${VO.infos}" var="info">
					<c:if test="${info.stock eq 0}">
						<option disabled>${info.size}[품절]</option>
					</c:if>
					<c:if test="${info.stock ne 0}">
						<option value="${info.size}">${info.size}</option>
					</c:if>
				</c:forEach>
			</select>
			<div id="showTest">
				<table>
					<thead></thead>
					<tbody>
						<c:forEach items="${VO.infos}" var="info">
							<tr style="display: none;" id="size_${info.size}" title="1">
								<td>${VO.productTitle}-${info.size}</td>
								<td><input type="number" min="1" value="1"
									data-value="${info.size}" class="noProduct"><a
									class="delInfo" data-value="${info.size}" data-infoNum="${info.PInfoNum}">X</a></td>
								<td><span class="finalPrices" id="${info.size}FinalPrice"
									title="${VO.finalPrice}">${VO.finalPrice}</span><br> <span
									style="font-size: 12px; color: #000000;" id="${info.size}Mile"
									title="${VO.productMileage}">(적립 : ${VO.productMileage})</span></td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="3">
								<div id="tPrice" title="0"></div>
								<p id="totalText">Total : KRW 0 (0개)</p>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<button style="width: 100%" id="buynowbutton">BUY NOW</button>
			<button style="width: 100%" id="addcartbutton">ADD CART</button>
		</div>


		<div
			style="min-width: 1000px; text-align: center; padding: 10px 410px 0 0; margin: 0 auto; text-align: center;">
			<img style="width: 1000px;" alt="${VO.file.oriName}"
				src="/resources/images/product/${VO.productNum}/${VO.file.fileName}">
			<div
				style="display: inline-block; padding: 45px 0 60px; width: 950px;">
				${VO.productContents}</div>
		</div>
	</div>



	<script type="text/javascript">
			let tPrice = $("#tPrice").attr("title");
			
			countTotal = function(){
				let finalPrice = $("#finalPrice").attr("title");
				total = tPrice*finalPrice
				$("#totalText").text("Total : KRW "+total+" ("+tPrice+"개)")
			}
			
		function changed(str) {
			if($("#size_" + str).attr("style").length!=0){	
				$("#size_" + str).children("td").children("input.noProduct").val("1")
				$("#size_" + str).attr("style", "");
				
				let count = $("#size_" + str).children("td").children("input.noProduct").val()
				let fPrice = $("#"+str+"FinalPrice").attr("title");
				let mile = $("#"+str+"Mile").attr("title");
				fPrice = count*fPrice;
				mile = count*mile;
				$("#"+str+"FinalPrice").text(fPrice);
				$("#"+str+"Mile").text("(적립 : "+mile+" )")
				tPrice++
				countTotal();
			}

			$("#sizes").val("default");
			
		}

		$(".delInfo").click(function() {
			let str = $(this).attr("data-value")
			$("#size_" + str).attr("style", "display:none;");
			$("")
			tPrice = tPrice - Number($("#size_" + str).attr("title"))
			countTotal();
		})
		
		$(".noProduct").blur(function(){
			let t = 0;
			let count = $(this).val();
			let size = $(this).attr("data-value");
			let fPrice = $("#"+size+"FinalPrice").attr("title");
			let mile = $("#"+size+"Mile").attr("title");
			fPrice = count*fPrice;
			mile = count*mile;
			$("#"+size+"FinalPrice").text(fPrice);
			$("#"+size+"Mile").text("(적립 : "+mile+" )")
			
			$(".noProduct").each(function(){
				if($(this).parent().parent().attr("style").length==0){
				t += Number($(this).val()); 
				}
			})
			$("#size_"+size).attr("title",count);
			tPrice = t;
			countTotal()
		})
	</script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/product/productSelect.js"></script>
</body>
</html>