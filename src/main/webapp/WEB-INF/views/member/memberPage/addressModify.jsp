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
	href="/css/member/memberPage/addressInsert.css"
>
<meta charset="UTF-8">
<title>FWCC-addressModify</title>
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
			<form
				id="frmAddr"
				action="./addressModify"
				method="POST"
			>
				<div class="xans-element- xans-myshop xans-myshop-addrregister ">
					<div class="ec-base-table typeWrite">
						<table
							border="1"
							summary=""
						>
							<caption>배송 주소록 입력</caption>
							<colgroup>
								<col style="width: 120px" />
								<col style="width: auto" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">배송지명 <img
										src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif"
										alt="필수"
									/></th>
									<td>
										<input hidden="" name="addrNum" value="${VO.addrNum}"/>
									<input
										id="addrNameT"
										name="addrName"
										class="inputTypeText"
										placeholder=""
										value="${VO.addrName}"
										type="text"
									/></td>
								</tr>
								<tr>
									<th scope="row">수령인 <img
										src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif"
										alt="필수"
									/></th>
									<td><input
										id="recipientT"
										name="recipient"
										class="ec-member-name"
										placeholder=""
										value="${VO.recipient}"
										type="text"
									/></td>
								</tr>
								<tr class="">
									<th scope="row">주소 <img
										src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif"
										class=""
										alt="필수"
									/></th>
									<td><input
										id="zipCodeT"
										name="zipCode"
										class="inputTypeText"
										placeholder=""
										readonly="readonly"
										maxlength="14"
										value="${VO.zipCode}"
										size="10"
										type="text"
									/> <a
										href="#"
										onclick="execDaumPostcode()"
										id="postBtn"
									><img
											src="//img.echosting.cafe24.com/skin/base_ko_KR/member/btn_zipcode.gif"
											alt="우편번호"
										/></a><br /> <input
										id="basicAddrT"
										name="basicAddr"
										class="inputTypeText"
										placeholder=""
										readonly="readonly"
										value="${VO.basicAddr}"
										size="50"
										type="text"
									/> 기본주소<br /> <span
										id="guide"
										style="color: #999; display: none"
									></span> <input
										id="detailAddrT"
										name="detailAddr"
										class="inputTypeText"
										placeholder=""
										value="${VO.detailAddr}"
										size="50"
										type="text"
									/> 나머지주소</td>
								</tr>
								<tr class="">
									<th scope="row">휴대전화 <img
										src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif"
										class=""
										alt="필수"
									/></th>
									<td><select
										id="phone0"
										name="addrPhone1"
										class="eraser"
										title="${VO.addrPhone1}"
									>
											<option
												value="010"
												id="010"
												label="010"
												selected="selected"
											/>
											<option
												value="011"
												id="011"
												label="011"
											/>
											<option
												value="016"
												id="016"
												label="016"
											/>
											<option
												value="017"
												id="017"
												label="017"
											/>
											<option
												value="018"
												id="018"
												label="018"
											/>
											<option
												value="019"
												id="019"
												label="019"
											/>
									</select>-<input
										id="phone1"
										name="addrPhone2"
										class="eraser"
										maxlength="4"
										value="${VO.addrPhone2}"
										type="text"
									/>-<input
										id="phone2"
										name="addrPhone3"
										class="eraser"
										maxlength="4"
										value="${VO.addrPhone3}"
										type="text"
									/></td>
								</tr>
								<!-- <tr class="right">
									<td colspan="2"><input
										id="ma_main_flag0"
										name="ma_main_flag"
										value="T"
										type="checkbox"
									/><label for="ma_main_flag0">기본 배송지로 저장</label></td>
								</tr> -->
							</tbody>
						</table>
					</div>
					<div class="ec-base-button">
						<span class="gRight"> <button
						><img
								src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_address_modify2.gif"
								alt="수정"
							/></button> <a href="./memberAddress"><img
								src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_address_cancel.gif"
								alt="취소"
							/></a>
						</span>
					</div>
				</div>
			</form>
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
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- Custom JS -->
	<script
		type="text/javascript"
		src="/js/member/memberPage/addressModify.js"
	></script>

</body>
</html>