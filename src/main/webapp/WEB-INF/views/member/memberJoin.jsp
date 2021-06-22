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
	href="/css/member/memberJoin.css"
>
<style type="text/css">
.error1 {
	color: red;
}
</style>
<meta charset="UTF-8">
<title>FWCC-memberJoin</title>
</head>
<body>
	<!-- header START -->
	<c:import url="/WEB-INF/views/templates/navbar.jsp"></c:import>
	<!-- header END -->

	<!-- contents START -->
	<div class="container">
		<form:form
			modelAttribute="memberVO"
			action="./memberJoin"
			method="POST"
		>
			<div class="titleArea">
				<h2>JOIN US</h2>
			</div>
			<h3 class=" ">기본정보</h3>
			<p class="required ">
				<img
					src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif"
					alt="필수"
				/> 필수입력사항
			</p>
			<div class="ec-base-table typeWrite">
				<table
					border=""
					summary=""
				>
					<caption>회원 기본정보</caption>
					<colgroup>
						<col style="width: 150px;" />
						<col style="width: auto;" />
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">아이디 <img
								src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif"
								alt="필수"
							/></th>
							<td><form:input
									id="usernameT"
									path="username"
									class="inputTypeText eraser"
									placeholder=""
									type="text"
									value="test"
									onfocus="inputInit()"
									onblur="inputEssentials()"
								/> <span
								id="usernameError"
								class="errorUsername error1"
							></span> <span
								id="usernameSuccess"
								class="errorUsername"
							></span> <span id="usernameMsg"></span> (영문소문자/숫자, 4~16자) <a
								role="button"
								style="margin-left: 50px;"
								id="usernameCheck"
								class="btn btn-sm"
							>중복확인</a></td>
						</tr>
						<tr>
							<th scope="row">비밀번호 <img
								src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif"
								alt="필수"
							/></th>
							<td><form:password
									id="passwordT"
									path="password"
									class="eraser"
									autocomplete="off"
									minlength="4"
									maxlength="16"
									value="test"
								/> <span
								id="passwordError"
								class="errorPassword error1"
							></span> (영문 대소문자/숫자/특수기호 4자~16자)</td>
						</tr>
						<tr>
							<th scope="row">비밀번호 확인 <img
								src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif"
								alt="필수"
							/></th>
							<td><form:password
									id="passwordCheckT"
									path="passwordCheck"
									class="eraser"
									autocomplete="off"
									minlength="4"
									maxlength="16"
									value="test"
								/> <span
								id="pwCheckError"
								class="errorPassword error1"
							></span> <span
								id="pwCheckSuccess"
								class="errorPassword"
							></span> <span id="passwordCheckMsg"></span></td>
						</tr>
						<tr>
							<th
								scope="row"
								id="nameTitle"
							>이름 <img
								src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif"
								alt="필수"
							/></th>
							<td><form:input
									id="nameT"
									path="name"
									class="ec-member-name eraser"
									placeholder=""
									maxlength="30"
									value="test"
									type="text"
								/> <span
								id="nameError"
								class="errorName error1"
							></span> <span
								id="under14Msg"
								class="displaynone"
							>14세 미만 사용자는 법정대리인 동의가 필요합니다.</span></td>
						</tr>
						<tr class="">
							<th scope="row">주소 <img
								src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif"
								class=""
								alt="필수"
							/></th>
							<td><form:input
									id="zipCodeT"
									path="zipCode"
									class="inputTypeText"
									placeholder=""
									readonly="readonly"
									maxlength="14"
									value="05670"
									size="10"
									type="text"
								/> <a
								href="#"
								onclick="execDaumPostcode()"
								id="postBtn"
							><img
									src="//img.echosting.cafe24.com/skin/base_ko_KR/member/btn_zipcode.gif"
									alt="우편번호"
								/></a><br /> <form:input
									id="basicAddrT"
									path="basicAddr"
									class="inputTypeText"
									placeholder=""
									readonly="readonly"
									value="서울 송파구 가락로 192 (송파동, 2차한양아파트)"
									size="50"
									type="text"
								/> 기본주소<br /> <span
								id="guide"
								style="color: #999; display: none"
							></span> <form:input
									id="detailAddrT"
									path="detailAddr"
									class="inputTypeText"
									placeholder=""
									value="29동 405호"
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
								name="phone0"
								class="eraser"
							>
									<option
										value="010"
										label="010"
									/>
									<option
										value="011"
										label="011"
									/>
									<option
										value="016"
										label="016"
									/>
									<option
										value="017"
										label="017"
									/>
									<option
										value="018"
										label="018"
									/>
									<option
										value="019"
										label="019"
									/>
							</select>-<input
								id="phone1"
								name="phone1"
								class="eraser"
								maxlength="4"
								value="1111"
								type="text"
							/>-<input
								id="phone2"
								name="phone2"
								class="eraser"
								maxlength="4"
								value="1111"
								type="text"
							/></td>
						</tr>
						<tr>
							<th scope="row">이메일 <img
								src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif"
								alt="필수"
							/></th>
							<td><form:input
									id="emailT"
									path="email"
									class="eraser"
									value="test@gmail.com"
									type="text"
									size="30"
								/> <span id="emailMsg"></span></td>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- 추가정보 -->
			<h3 class=" ">추가정보</h3>
			<div class="ec-base-table typeWrite ">
				<table
					border=""
					summary=""
				>
					<caption>회원 추가정보</caption>
					<colgroup>
						<col style="width: 150px;" />
						<col style="width: auto;" />
					</colgroup>
					<tbody>
						<tr class="">
							<th scope="row">생년월일 <img
								src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif"
								class="displaynone"
								alt="필수"
							/></th>
							<td><input
								id="birth_year"
								name="birth_year"
								class="inputTypeText"
								placeholder=""
								maxlength="4"
								type="text"
							/> 년 <input
								id="birth_month"
								name="birth_month"
								class="inputTypeText"
								placeholder=""
								maxlength="2"
								type="text"
							/> 월 <input
								id="birth_day"
								name="birth_day"
								class="inputTypeText"
								placeholder=""
								maxlength="2"
								type="text"
							/> 일</td>
						</tr>
					</tbody>
				</table>
			</div>
			<!--  추가정보 END -->

			<!-- 전체동의 START -->
			<h3>전체 동의</h3>
			<div class="ec-base-box typeThinBg gStrong">
				<p>
					<span class="ec-base-chk"><input
						type="checkbox"
						id="sAgreeAllChecked"
					><em class="checkbox"></em></span><label for="sAgreeAllChecked"><strong>이용약관 및
							개인정보수집 및 이용, 쇼핑정보 수신(선택)에 모두 동의합니다.</strong></label>
				</p>
			</div>
			<div class="ec-base-box typeThinBg agreeArea">
				<h3>[필수] 이용약관 동의</h3>
				<div class="content">
					<div
						style="overflow: auto; width: 100%; height: 200px;"
						class="fr-view fr-view-mall-agreement"
					>
						<c:import url="./agreement1.jsp"></c:import>
					</div>
				</div>
				<p class="check">
					<span>이용약관에 동의하십니까?</span> <input
						id="agree_service_check0"
						name="agree_service_check[]"
						class="ec-base-chk"
						value="1"
						type="checkbox"
					/><label for="agree_service_check0">동의함</label>
				</p>
			</div>
			<div class="ec-base-box typeThinBg agreeArea">
				<h3>[필수] 개인정보 수집 및 이용 동의</h3>
				<div class="content">
					<div
						style="overflow: auto; width: 100%; height: 200px;"
						class="fr-view fr-view-privacy-required"
					>
						<c:import url="./agreement2.jsp"></c:import>
					</div>
				</div>
				<p class="check">
					<span>개인정보 수집 및 이용에 동의하십니까?</span> <input
						id="agree_privacy_check0"
						name="agree_privacy_check[]"
						class="ec-base-chk"
						value="1"
						type="checkbox"
					/><label for="agree_privacy_check0">동의함</label>
				</p>
			</div>
			<div class="ec-base-box typeThinBg agreeArea ">
				<h3>[선택] 쇼핑정보 수신 동의</h3>
				<div class="content">
					<div
						style="overflow: auto; width: 100%; height: auto;"
						class="fr-view"
					>
						<p>할인쿠폰 및 혜택, 이벤트, 신상품 소식 등 쇼핑몰에서 제공하는 유익한 쇼핑정보를 SMS와 이메일로 받아보실 수 있습니다.</p>
						<p>단, 주문/거래 정보 및 주요 정책과 관련된 내용은 수신동의 여부와 관계없이 발송됩니다.</p>
						<p>선택 약관에 동의하지 않으셔도 회원가입은 가능하며, 회원가입 후 회원정보수정 페이지에서 언제든지 수신여부를 변경하실 수 있습니다.</p>
					</div>
				</div>
				<ul class="">
					<li class="check"><span>SMS 수신을 동의하십니까?</span> <input
						id="is_sms0"
						name="is_sms"
						class="ec-base-chk"
						type="checkbox"
					/><label for=is_sms0>동의함</label></li>
					<li class="check"><span>이메일 수신을 동의하십니까?</span> <input
						id="is_news_mail0"
						name="is_news_mail"
						class="ec-base-chk"
						type="checkbox"
					/><label for=is_news_mail0>동의함</label></li>
				</ul>
			</div>
			<br />
			<br />
			<div class="ec-base-button txtBtn">
				<a
					role="button"
					href="#"
					class="black big joinBtn"
				>JOIN US</a>
			</div>
		</form:form>
	</div>

	<!-- footer START -->
	<c:import url="/WEB-INF/views/templates/footer.jsp"></c:import>
	<!-- footer END -->
	<!-- External JS -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- Custom JS -->
	<script
		type="text/javascript"
		src="/js/member/memberJoin.js"
	></script>
</body>
</html>