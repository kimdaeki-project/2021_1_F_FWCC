<%@ page
	language="java"
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ taglib
	prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"
%>
<!DOCTYPE html>
<html>
<head>
<c:import url="/WEB-INF/views/templates/head.jsp"></c:import>
<link
	rel="stylesheet"
	href="/css/common/common.css"
>
<meta charset="UTF-8">
<title>FWCC-memberJoin</title>
</head>
<body>
	<!-- header START -->
	<c:import url="/WEB-INF/views/templates/navbar.jsp"></c:import>
	<!-- header END -->

	<!-- contents START -->
	<div class="container">
		<div class="titleArea">
			<h2>JOIN US</h2>
		</div>
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
			border="0"
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
					<td><input
						id="username"
						name="username"
						class="inputTypeText"
						placeholder=""
						value=""
						type="text"
					/> <span id="usernameMsg"></span> (영문소문자/숫자, 4~16자)</td>
				</tr>
				<tr>
					<th scope="row">비밀번호 <img
						src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif"
						alt="필수"
					/></th>
					<td><input
						id="password"
						name="password"
						autocomplete="off"
						minlength="4"
						maxlength="16"
						value=""
						type="password"
					/> (영문 대소문자/숫자 4자~16자)</td>
				</tr>
				<tr>
					<th scope="row">비밀번호 확인 <img
						src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif"
						alt="필수"
					/></th>
					<td><input
						id="passwordCheck"
						name="passwordCheck"
						autocomplete="off"
						minlength="4"
						maxlength="16"
						value=""
						type="password"
					/> <span id="passwordCheckMsg"></span></td>
				</tr>
				<tr>
					<th
						scope="row"
						id="nameTitle"
					>이름 <img
						src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif"
						alt="필수"
					/></th>
					<td><span id="nameContents"><input
							id="name"
							name="name"
							class="ec-member-name"
							placeholder=""
							maxlength="30"
							value=""
							type="text"
						/></span> <span
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
					<td><input
						id="zipCode"
						name="zipCode"
						class="inputTypeText"
						placeholder=""
						readonly="readonly"
						maxlength="14"
						value=""
						size="10"
						type="text"
					/> <a
						href="#"
						id="postBtn"
					><img
							src="//img.echosting.cafe24.com/skin/base_ko_KR/member/btn_zipcode.gif"
							alt="우편번호"
						/></a><br /> <input
						id="basicAddr"
						name="basicAddr"
						class="inputTypeText"
						placeholder=""
						readonly="readonly"
						value=""
						size="50"
						type="text"
					/> 기본주소<br /> <input
						id="detailAddr"
						name="detailAddr"
						class="inputTypeText"
						placeholder=""
						value=""
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
						name="phone[]"
					>
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
					</select>-<input
						id="phone1"
						name="phone[]"
						maxlength="4"
						value=""
						type="text"
					/>-<input
						id="phone2"
						name="phone[]"
						maxlength="4"
						value=""
						type="text"
					/></td>
				</tr>
				<tr>
					<th scope="row">이메일 <img
						src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif"
						alt="필수"
					/></th>
					<td><input
						id="email"
						name="email"
						value=""
						type="text"
					/> <span id="emailMsg"></span></td>
				</tr>
			</tbody>
		</table>
	</div>
	<!-- footer START -->
	<c:import url="/WEB-INF/views/templates/footer.jsp"></c:import>
	<!-- footer END -->
</body>
</html>