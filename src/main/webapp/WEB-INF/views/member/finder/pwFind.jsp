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
	href="/css/member/finder/pwFind.css"
>
<meta charset="UTF-8">
<title>FWCC-pwFind</title>
</head>
<body>
	<!-- header START -->
	<c:import url="/WEB-INF/views/templates/navbar.jsp">
		<c:param
			name="isCommon"
			value="true"
		></c:param>
	</c:import>
	<!-- header END -->

	<!-- contents START -->
	<div class="container">
		<div id="contents">
			<div class="titleArea">
				<h2>FIND PASSWORD</h2>
			</div>

			<form
				id="findPasswdForm"
				action="./pwFind"
				method="POST"
			>
				<div class="xans-element- xans-member xans-member-findpasswd ">
					<div class="findPw">
						<fieldset>
							<legend>비밀번호 찾기 1단계 정보 입력</legend>
							<ul class="ec-base-desc typeBullet gMedium">
								<li><strong class="term">회원유형</strong><span class="desc"><span class="gBlank5">
											<input
											id="check_method1"
											class="radioBtn"
											name="check_method"
											value=""
											type="radio"
											checked="checked"
										/><label for="check_method1">이메일</label> <input
											id="check_method2"
											class="radioBtn"
											name="check_method"
											value=""
											type="radio"
										/><label for="check_method2"><span id="search_type_mobile_lable">휴대폰번호</span></label>
									</span></span></li>
								<li class="gBlank20"><strong class="term">아이디</strong><span class="desc"><input
										id="member_id"
										name="username"
										class="lostInput"
										placeholder=""
										value=""
										type="text"
									/></span></li>
								<li
									id="name_view"
									class="name"
								><strong
									class="term"
									id="name_lable"
								>이름</strong><span class="desc"><input
										id="name"
										name="name"
										class="lostInput ec-member-name"
										placeholder=""
										value=""
										type="text"
									/></span></li>
								<li
									id="email_view"
									class="email"
								><strong class="term">이메일로 찾기</strong><span class="desc"><input
										id="email"
										name="email"
										class="lostInput"
										placeholder=""
										value=""
										type="text"
									/></span></li>
								<li
									id="mobile_view"
									class="mobile"
								><strong class="term">휴대폰 번호로 찾기</strong><span class="desc"><select
										id="phone0"
										name="phone0"
										class="eraser"
										title=""
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
										name="phone1"
										class="eraser"
										maxlength="4"
										value=""
										size="4"
										type="text"
									/>-<input
										id="phone2"
										name="phone2"
										class="eraser"
										maxlength="4"
										value=""
										size="4"
										type="text"
									/></span></li>
							</ul>
							<p class="ec-base-button gBlank20">
								<button>
									<img
										src="//img.echosting.cafe24.com/skin/base_ko_KR/member/btn_submit.gif"
										alt="확인"
									/>
								</button>
							</p>
						</fieldset>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- contents END -->

	<!-- footer START -->
	<c:import url="/WEB-INF/views/templates/footer.jsp"></c:import>
	<!-- footer END -->

	<!-- External JS -->

	<!-- Custom JS -->
	<script
		type="text/javascript"
		src="/js/member/finder/pwFind.js"
	></script>
</body>
</html>