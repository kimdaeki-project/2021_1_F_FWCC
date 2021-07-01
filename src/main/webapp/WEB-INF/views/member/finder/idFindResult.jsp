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
	href="/css/member/finder/idFindResult.css"
>
<meta charset="UTF-8">
<title>FWCC-idFindResult</title>
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
				<h2>FIND ID</h2>
			</div>

			<div class="xans-element- xans-member xans-member-findidresult">
				<div class="findId">
					<p class="info">고객님 아이디 찾기가 완료 되었습니다.</p>
					<div class="ec-base-box typeMember gMessage">
						<p class="message">저희 쇼핑몰를 이용해주셔서 감사합니다.</p>
						<div class="information">

							<div class="description">
								<ul class="ec-base-desc gSmall">
									<li><strong class="term">이름</strong><strong class="desc"> : <span
											title="${VO.name}"
											class="encrypted_name"
										></span></strong></li>
									<c:if test="${not empty VO.email}">
										<li><strong class="term">이메일</strong><span class="desc"> : <span
												title="${VO.email}"
												class="encrypted_searchInfo"
											></span></span></li>
									</c:if>
									<c:if test="${not empty VO.phone}">										
										<li><strong class="term">전화번호</strong><span class="desc"> : <span
												title="${VO.phone}"
												class="encrypted_searchInfo"
											></span></span></li>
									</c:if>
									<li><strong class="term">ID</strong><strong class="desc"> : <span
											title="${VO.username}"
											class="encrypted_username"
										></span></strong> <br /></li>
									<li>고객님 즐거운 쇼핑 하세요!</li>
								</ul>
							</div>
						</div>
					</div>
					<p class="copy">
						고객님의 아이디 찾기가 성공적으로 이루어졌습니다. 항상 고객님의 <br /> 즐겁고 편리한 쇼핑을 위해 최선의 노력을 다하는 쇼핑몰이 되도록 하겠습니다.
					</p>
					<p class="ec-base-button">
						<a
							href="${pageContext.request.contextPath }/member/memberLogin"
							class=""
						><img
							src="//img.echosting.cafe24.com/skin/base_ko_KR/member/btn_find_login.gif"
							alt="로그인"
						/></a> <a
							href=""
							class=""
						><img
							src="//img.echosting.cafe24.com/skin/base_ko_KR/member/btn_find_pw.gif"
							alt="비밀번호 찾기"
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
	<script
		type="text/javascript"
		src="/js/member/finder/idFindResult.js"
	></script>
</body>
</html>