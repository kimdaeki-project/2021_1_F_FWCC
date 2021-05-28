<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="/WEB-INF/views/templates/headStatics.jsp"></c:import>
<title>Insert title here</title>
</head>
<body>
	<div id="wrap">
		<!-- header START -->
		<c:import url="/WEB-INF/views/templates/header.jsp"></c:import>
		<!-- header END -->

		<!-- contents START -->
		<div id="container">
			<div id="contents">
				<div class="titleArea">
					<h2>MEMBER LOGIN</h2>
				</div>
				<form id="member_form_6161924421" name="" action="/exec/front/Member/login/" method="post" target="_self" enctype="multipart/form-data">
					<input id="returnUrl" name="returnUrl" value="/index.html" type="hidden" /> <input id="forbidIpUrl" name="forbidIpUrl" value="/index.html" type="hidden" /> <input id="certificationUrl"
						name="certificationUrl" value="/intro/adult_certification.html" type="hidden"
					/> <input id="sIsSnsCheckid" name="sIsSnsCheckid" value="" type="hidden" /> <input id="sProvider" name="sProvider" value="" type="hidden" />
					<div class="xans-element- xans-member xans-member-login ">
						<!--
					        $defaultReturnUrl = /index.html
					        $forbidIpUrl = member/adminFail.html
					    -->
						<div class="login">
							<fieldset>
								<legend>회원로그인</legend>
								<label class="id ePlaceholder" title="ID"><input id="member_id" name="member_id" fw-filter="isFill" fw-label="아이디" fw-msg="" class="inputTypeText" placeholder="" value="" type="text" /></label>
								<label class="password ePlaceholder" title="PASSWORD"><input id="member_passwd" name="member_passwd" fw-filter="isFill&isMin[4]&isMax[16]" fw-label="패스워드" fw-msg="" autocomplete="off"
									value="" type="password"
								/></label>
								<p class="security">
									<img src="//img.echosting.cafe24.com/design/skin/default/member/ico_access.gif" alt="보안접속" /> 보안접속
								</p>
								<a href="#none" onclick="MemberAction.login('member_form_6161924421'); return false;" class="btnLogin">LOGIN</a>
								<ul>
									<li><a href="/member/id/find_id.html">아이디찾기</a></li>
									<li>/</li>
									<li><a href="/member/passwd/find_passwd_info.html">비밀번호찾기</a></li>
								</ul>
								<ul class="snsArea">
									<li class="displaynone"><a href="#none" onclick=""><img src="//img.echosting.cafe24.com/skin/base_ko_KR/member/btn_naver_login.gif" alt="네이버 로그인" /></a></li>
									<li class="displaynone"><a href="#none" onclick=""><img src="//img.echosting.cafe24.com/skin/base_ko_KR/member/btn_facebook_login.gif" alt="페이스북 로그인" /></a></li>
									<li class="displaynone"><a href="#none" onclick=""><img src="//img.echosting.cafe24.com/skin/base_ko_KR/member/btn_google_login.gif" alt="구글 로그인" /></a></li>
									<li class="displaynone"><a href="#none" onclick=""><img src="//img.echosting.cafe24.com/skin/base_ko_KR/member/btn_kakao_login.gif" alt="카카오계정 로그인" /></a></li>
								</ul>
								<p class="link">
									회원가입을 하시면 다양하고 특별한<br />혜택이 준비되어 있습니다. <a href="/member/join.html" class="black">JOIN US</a>
								</p>
								<p class="link displaynone" id="noMemberWrap">
									비회원님도 상품구매가 가능하나 다양한<br />회원혜택에서 제외됩니다. <a href="" onclick="">GUEST ORDER</a>
								</p>
							</fieldset>
						</div>
					</div>
				</form>
			</div>
			<!-- contents END -->

			<!-- footer START -->
			<c:import url="/WEB-INF/views/templates/footer.jsp"></c:import>
			<!-- footer END -->

			<!-- 맨 위로 보내는 버튼 START -->
			<div id="quickmenu">
				<p class="pageTop">
					<a onclick="go_top();"><i class="fa fa-angle-up" aria-hidden="true">top</i></a>
				</p>
			</div>
			<!-- 맨 위로 보내는 버튼 END -->
		</div>
	</div>
	<!-- wrap END -->
</body>
</html>