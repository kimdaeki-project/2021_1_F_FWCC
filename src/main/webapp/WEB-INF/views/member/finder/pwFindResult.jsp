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
	href="/css/member/finder/pwFindResult.css"
>
<meta charset="UTF-8">
<title>FWCC-pwFindResult</title>
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
				id="findPasswdMethod"
				action="#"
				method="POST"
			>
				<div class="xans-element- xans-member xans-member-findpasswdmethod ">
					<div class="inner">
						<h3>
							<img
								src="//img.echosting.cafe24.com/skin/base_ko_KR/member/h3_send_password.gif"
								alt="임시 비밀번호 전송"
							/>
						</h3>
						<fieldset>
							<legend>임시 비밀번호 전송</legend>
							<ul class="ec-base-desc typeBullet gSmall">
								<li><strong class="term">임시 비밀번호</strong><span class="desc"> <c:if
											test="${not empty VO.email}"
										>
											<input
												id="passwd_method_type0"
												name="passwd_method_type"
												value="email"
												type="radio"
												checked="checked"
											/>
											<label for="passwd_method_type0">이메일</label>
										</c:if> <c:if test="${not empty VO.phone}">
											<input
												id="passwd_method_type1"
												name="passwd_method_type"
												value="mobile"
												type="radio"
											/>
											<label for="passwd_method_type1">휴대폰</label>
										</c:if>
								</span></li>
								<c:if test="${not empty VO.email}">
									<li id="passwd_method_email_info"><strong class="term">이메일</strong><span class="desc"><strong
											class="txtEm"
										><span class="authssl_c_email">${VO.email}</span></strong></span></li>
								</c:if>
								<c:if test="${not empty VO.phone}">
									<li id="passwd_method_mobile_info"><strong class="term">휴대폰 번호</strong><span
										class="desc"
									><strong class="txtEm number"><span class="authssl_c_mobile">${VO.phone}</span></strong></span></li>
								</c:if>
							</ul>
							<p class="ec-base-button gBlank20">
								<a href="#"><img
									src="//img.echosting.cafe24.com/skin/base_ko_KR/member/btn_send_password.gif"
									alt="임시 비밀번호 전송"
								/></a> <a href="#"><img
									src="//img.echosting.cafe24.com/skin/base_ko_KR/member/btn_cancel.gif"
									alt="취소"
								/></a>
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
	<!-- <script
		type="text/javascript"
		src="/js/member/finder/pwFindResult.js"
	></script> -->
</body>
</html>