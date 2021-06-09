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
	href="/css/member/memberLogin.css"
>
<link
	rel="stylesheet"
	href="/css/common/common.css"
>
<meta charset="UTF-8">
<title>FWCC-memberLogin</title>
</head>
<body>
	<!-- header START -->
	<c:import url="/WEB-INF/views/templates/navbar.jsp"></c:import>
	<!-- header END -->

	<!-- contents START -->
	<div class="container">
		<div id="contents">
			<div class="titleArea">
				<h2>MEMBER LOGIN</h2>
			</div>
			<form
				id="member_form_3213019162"
				name=""
				action="/exec/front/Member/login/"
				method="post"
				target="_self"
				enctype="multipart/form-data"
			>
				<div class="xans-element- xans-member xans-member-login ">
					<div class="login">
						<fieldset>
							<legend>회원로그인</legend>
							<label
								class="id ePlaceholder"
								title="ID"
							><input
								id="member_id"
								name="member_id"
								class="inputTypeText"
								placeholder=""
								value=""
								type="text"
							/></label> <label
								class="password ePlaceholder"
								title="PASSWORD"
							><input
								id="member_passwd"
								name="member_passwd"
								autocomplete="off"
								value=""
								type="password"
							/></label>
							<a
								href="#"
								class="btnLogin"
							>LOGIN</a>
							<ul>
								<li><a href="/member/id/find_id.html">아이디찾기</a></li>
								<li>/</li>
								<li><a href="/member/passwd/find_passwd_info.html">비밀번호찾기</a></li>
							</ul>
							<ul class="snsArea">
								<li class=""><a
									href="#none"
									onclick=""
								><img
										src="//img.echosting.cafe24.com/skin/base_ko_KR/member/btn_naver_login.gif"
										alt="네이버 로그인"
									/></a></li>
								<li class=""><a
									href="#none"
									onclick=""
								><img
										src="//img.echosting.cafe24.com/skin/base_ko_KR/member/btn_facebook_login.gif"
										alt="페이스북 로그인"
									/></a></li>
								<li class=""><a
									href="#none"
									onclick=""
								><img
										src="//img.echosting.cafe24.com/skin/base_ko_KR/member/btn_google_login.gif"
										alt="구글 로그인"
									/></a></li>
								<li class=""><a
									href="#none"
									onclick=""
								><img
										src="//img.echosting.cafe24.com/skin/base_ko_KR/member/btn_kakao_login.gif"
										alt="카카오계정 로그인"
									/></a></li>
							</ul>
							<p class="link">
								회원가입을 하시면 다양하고 특별한<br />혜택이 준비되어 있습니다. <a
									href="/member/join.html"
									class="black"
								>JOIN US</a>
							</p>
							<p
								class="link displaynone"
								id="noMemberWrap"
							>
								비회원님도 상품구매가 가능하나 다양한<br />회원혜택에서 제외됩니다. <a
									href=""
									onclick=""
								>GUEST ORDER</a>
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

</body>
</html>