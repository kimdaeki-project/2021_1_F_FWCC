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
	href="/css/member/finder/tempPwResult.css"
>
<meta charset="UTF-8">
<title>FWCC-tempPwResult</title>
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
			<div class="xans-element- xans-member xans-member-findpasswdresult">
				<div class="findPw">
					<div class="ec-base-box typeMember gMessage ">
						<strong class="message">저희 쇼핑몰를 이용해주셔서 감사합니다.</strong>
						<div class="information">
							<p class="description">
								<strong class="txtEm">${VO.username}</strong> 회원님, 임시 비밀번호를<br />
								<strong class="txtEm">${VO.email}</strong> 으로
								보내드렸습니다.<br />고객님 즐거운 쇼핑 하세요!
							</p>
						</div>
					</div>
					<p class="copy">
						고객님의 비밀번호가 성공적으로 발송되었습니다. 항상 고객님의 <br /> 즐겁고 편리한 쇼핑을 위해 최선의 노력을 다하는 쇼핑몰이 되도록 하겠습니다.
					</p>
					<p class="ec-base-button">
						<a href="${pageContext.request.contextPath}/member/memberLogin"><img
							src="//img.echosting.cafe24.com/skin/base_ko_KR/member/btn_find_login.gif"
							alt="로그인"
						/></a>
					</p>
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
		src="/js/member/finder/pwFindResult.js"
	></script> -->

</body>
</html>