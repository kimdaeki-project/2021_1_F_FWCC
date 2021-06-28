<%@ page
	language="java"
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ taglib
	prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"
%>
<%@ taglib
	prefix="form"
	uri="http://www.springframework.org/tags/form"
%>
<!DOCTYPE html>
<html>
<head>
<c:import url="/WEB-INF/views/templates/head.jsp"></c:import>
<link
	rel="stylesheet"
	href="/css/common/common.css"
>
<link
	rel="stylesheet"
	href="/css/member/memberPage/memberAddress.css"
>
<meta charset="UTF-8">
<title>FWCC-memberAddress</title>
</head>
<body>
	<!-- header START -->
	<c:import url="/WEB-INF/views/templates/navbar.jsp"></c:import>
	<!-- header END -->

	<!-- contents START -->
	<div class="container">
		<div id="contents">
			<div class="titleArea">
				<h2>배송 주소록 관리</h2>
				<p>자주 쓰는 배송지를 등록 관리하실 수 있습니다.</p>
			</div>
			<div class="xans-element- xans-myshop xans-myshop-addrlist">
				<div class="ec-base-table typeList">
					<table
						border="1"
						summary=""
					>
						<caption>배송 주소록 목록</caption>
						<colgroup>
							<col style="width: 27px" />
							<col style="width: 80px" />
							<col style="width: 95px" />
							<col style="width: 120px" />
							<col style="width: 120px" />
							<col style="width: auto" />
							<col style="width: 76px" />
						</colgroup>
						<thead>
							<tr>
								<th scope="col"><span class=""><input
										id="allCheck"
										type="checkbox"
									/></span></th>
								<th scope="col">주소록 고정</th>
								<th scope="col">배송지명</th>
								<th scope="col">수령인</th>
								<th scope="col">휴대전화</th>
								<th scope="col">주소</th>
								<th scope="col">수정</th>
							</tr>
						</thead>
						<c:if test="${list != null}">
							<tbody class=" center">
								<c:forEach items="${list}" var="VO">
									<tr class="xans-record-">
										<td><input
											value=""
											type="checkbox"
										/></td>
										<td><a href="#"><img
												src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_address_fix.gif"
												class=""
												alt="고정"
											/></a></td>
										<td class="left"><img
											src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/ico_addr_default.gif"
											class="displaynone"
											alt="기본"
										/> <span class="">${VO.addrName}</span></td>
										<td class="left"><span class="">${VO.recipient}</span></td>
										<td class="left"><span class="">${VO.addrPhone}</span></td>
										<td class="left">(<span class="">${VO.zipCode}</span>) <span class="">${VO.basicAddr}</span> <span
											class=""
										>${VO.detailAddr}</span></td>
										<td><a href="#"><img
												src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_address_modify.gif"
												class=""
												alt="수정"
											/></a></td>
									</tr>
								</c:forEach>
							</tbody>
						</c:if>
						<c:if test="${list == null}">
							<tbody class="">
								<tr>
									<td
										colspan="8"
										class="message"
									>등록된 주소가 없습니다.</td>
								</tr>
							</tbody>
						</c:if>
					</table>
				</div>
				<div class="ec-base-button">
					<span class="gLeft "> <a href="#"><img
							src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_address_delete.gif"
							alt="선택 주소록 삭제"
						/></a>
					</span> <span class="gRight"> <a href="./addressInsert"><img
							src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_address_register.gif"
							alt="배송지 등록"
						/></a>
					</span>
				</div>
			</div>
			<div class="ec-base-help">
				<h3>배송주소록 유의사항</h3>
				<div class="inner">
					<ol>
						<li class="item1">배송 주소록은 최대 10개까지 등록할 수 있으며, 별도로 등록하지 않을 경우 최근 배송 주소록 기준으로 자동 업데이트 됩니다.</li>
						<li class="item2">자동 업데이트를 원하지 않을 경우 주소록 고정 선택을 선택하시면 선택된 주소록은 업데이트 대상에서 제외됩니다.</li>
						<li class="item3">기본 배송지는 1개만 저장됩니다. 다른 배송지를 기본 배송지로 설정하시면 기본 배송지가 변경됩니다.</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
	<!-- contents END -->

	<!-- footer START -->
	<c:import url="/WEB-INF/views/templates/footer.jsp"></c:import>
	<!-- footer END -->

	<!-- External JS -->

	<!-- Custom JS -->
	<!-- <script
	type="text/javascript"
	src="/js/member/memberPage/memberAddress.js"
></script> -->

</body>
</html>