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
	href="/css/member/finder/idFind.css"
>
<meta charset="UTF-8">
<title>FWCC-idFind</title>
</head>
<body>
	<!-- header START -->
	<c:import url="/WEB-INF/views/templates/navbar.jsp"></c:import>
	<!-- header END -->

	<!-- contents START -->
	<div class="container">
		<div id="contents">
			<div class="titleArea">
				<h2>FIND ID</h2>
				<ul>
					<li>가입하신 방법에 따라 아이디 찾기가 가능합니다.</li>
				</ul>
			</div>
			<form
				id="findIdForm"
				action="./idFind"
				method="post"
			>
				<div class="xans-element- xans-member xans-member-findid">
					<div class="findId">
						<fieldset>
							<p class="check">
								<input
									id="check_method1"
									name="check_method"
									value="2"
									type="radio"
									checked="checked"
								/><label for="check_method1">이메일</label> <input
									id="check_method2"
									name="check_method"
									value="3"
									type="radio"
								/><label for="check_method2"><span
									id="search_type_mobile_lable"
								>휴대폰번호</span></label>
							</p>
							<p
								id="name_view"
								class="name"
							>
								<strong id="name_lable">이름</strong> <input
									id="name"
									name="username"
									class="lostInput"
									placeholder=""
									value=""
									type="text"
								/>
							</p>
							<p
								id="email_view"
								class="email"
							>
								<strong>이메일로 찾기</strong> <input
									id="email"
									name="email"
									class="lostInput"
									placeholder=""
									value=""
									type="text"
								/>
							</p>
							<p
								id="mobile_view"
								class="mobile"
								hidden=""
							>
								<strong>휴대폰 번호로 찾기</strong> <select
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
									size="8"
									type="text"
								/>-<input
									id="phone2"
									name="phone2"
									class="eraser"
									maxlength="4"
									value=""
									size="8"
									type="text"
								/>
							</p>
							<p class="ec-base-button ">
								<button
								><img
									src="//img.echosting.cafe24.com/skin/base_ko_KR/member/btn_submit.gif"
									alt="확인"
								/></button>
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