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
	href="/css/member/memberPage/memberProfile.css"
>
<meta charset="UTF-8">
<title>FWCC-memberProfile</title>
</head>
<body>
	<!-- header START -->
	<c:import url="/WEB-INF/views/templates/navbar.jsp">
		<c:param name="isCommon" value="true"></c:param>
	</c:import>
	<!-- header END -->

	<!-- contents START -->
	<div class="container">
		<div id="contents">
			<div class="titleArea">
				<h2>MY INFO</h2>
			</div>
			<div class="ec-base-table typeWrite">
				<form action="#">
					<table border="1">
						<tbody>
							<tr>
								<th scope="row">아이디 <img
									src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif"
									alt="필수"
								/></th>
								<td><input
									id="usernameT"
									name="username"
									class="inputTypeText eraser"
									placeholder=""
									type="text"
									value="${VO.username }"
									readonly="readonly"
									onfocus="inputInit()"
									onblur="inputEssentials()"
								/>(영문소문자/숫자, 4~16자)</td>
							</tr>
							<tr>
								<th scope="row">현재 비밀번호 <img
									src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif"
									class=""
									alt="필수"
								/></th>
								<td><input
									id="passwordT"
									name="password"
									class="eraser"
									autocomplete="off"
									minlength="4"
									maxlength="16"
									value="${VO.password }"
									type="password"
								/></td>
							</tr>
							<tr>
								<th scope="row">현재 비밀번호 확인<img
									src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif"
									class=""
									alt="필수"
								/></th>
								<td><input
									id="passwordCheckT"
									name="passwordCheck"
									class="eraser"
									autocomplete="off"
									minlength="4"
									maxlength="16"
									value=""
									type="password"
								/></td>
							</tr>
							<tr class="">
								<th scope="row">새 비밀번호</th>
								<td><input
									id="newPasswordT"
									name="newPassword"
									minlength="4"
									maxlength="16"
									value=""
									type="password"
								/> (영문 대소문자/숫자/특수기호 4자~16자)<br><br>
									새 비밀번호 미입력시 비밀번호 변경은 안됩니다.
								</td>
							</tr>
							<tr class="">
								<th scope="row">새 비밀번호 확인</th>
								<td><input
									id="newPasswordCheckT"
									name="newPasswordCheckT"
									minlength="4"
									maxlength="16"
									value=""
									type="password"
								/> <span id="new_pwConfirmMsg"></span></td>
							</tr>
							<tr style="display: 1">
								<th
									scope="row"
									id=""
								>이름 <img
									src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif"
									alt="필수"
								/></th>
								<td><input
									id="nameT"
									name="name"
									class="ec-member-name eraser"
									placeholder=""
									maxlength="30"
									readonly="readonly"
									value="${VO.name }"
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
									value="${addressVO.zipCode }"
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
									value="${addressVO.basicAddr }"
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
									value="${addressVO.detailAddr }"
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
									title="${VO.phone0 }"
								>
										<option
											value="010"
											id="010"
											label="010"
										/>
										<option
											value="011"
											id="011"
											label="011"
											selected="selected"
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
									name="phone1"
									class="eraser"
									maxlength="4"
									value="${VO.phone1 }"
									type="text"
								/>-<input
									id="phone2"
									name="phone2"
									class="eraser"
									maxlength="4"
									value="${VO.phone2 }"
									type="text"
								/></td>
							</tr>
							<tr class="">
								<th scope="row">SMS 수신여부 <img
									src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif"
									alt="필수"
								/></th>
								<td><input
									id="is_sms0"
									name="smsAgree"
									value="1"
									type="radio"
								/><label for="is_sms0">수신함</label> <input
									id="is_sms1"
									name="smsAgree"
									value="0"
									type="radio"
									checked="checked"
								/><label for="is_sms1">수신안함</label>
									<p>쇼핑몰에서 제공하는 유익한 이벤트 소식을 SMS로 받으실 수 있습니다.</p></td>
							</tr>
							<tr>
								<th scope="row">이메일 <img
									src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif"
									alt="필수"
								/></th>
								<td><input
									id="emailT"
									name="email"
									class="eraser"
									value="${VO.email }"
									type="text"
									size="30"
								/> <span id="emailMsg"></span></td>
							</tr>
							<tr class="">
								<th scope="row">이메일 수신여부 <img
									src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif"
									alt="필수"
								/></th>
								<td><input
									id="is_news_mail0"
									name="emailAgree"
									value="1"
									type="radio"
									checked="checked"
								/><label for="is_news_mail0">수신함</label> <input
									id="is_news_mail1"
									name="emailAgree"
									value="0"
									type="radio"
								/><label for="is_news_mail1">수신안함</label>
									<p>쇼핑몰에서 제공하는 유익한 이벤트 소식을 이메일로 받으실 수 있습니다.</p></td>
							</tr>
						</tbody>
					</table>
					<div class="ec-base-button justify txtBtn">
						<a
							href="#"
							id="updateBtn"
							class="black"
						>SAVE</a> <a href="${pageContext.request.contextPath }/">CANCEL</a> <span class="gRight"> <a
							href="#"
							class="mini"
						>회원탈퇴</a>
						</span>
					</div>
				</form>
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
	src="/js/member/memberPage/memberProfile.js"
></script>
</body>
</html>