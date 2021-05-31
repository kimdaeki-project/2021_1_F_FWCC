<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<c:import url="/WEB-INF/views/templates/headStatics.jsp"></c:import>

<title>FWCC-index</title>
</head>
<body id="main">
	<!-- 뭔지몰라서 안건듬 START -->
	<div id="skipNavigation">
		<p>
			<a href="#category">전체상품목록 바로가기</a>
		</p>
		<p>
			<a href="#contents">본문 바로가기</a>
		</p>
	</div>
	<!-- 뭔지몰라서 안건듬 END -->
	
	<div id="wrap">
		<!-- header START -->
		<c:import url="/WEB-INF/views/templates/header.jsp"></c:import>
		<!-- header END -->
		
		<!-- contents START -->
		<div id="container">
			<div id="contents">
				<!-- 여기부터  -->
				<div id="mainslider-wraper">
					<ul id="mainslider">
						<li class="banner"><a href="#" target=""><img src="/images/main1_20210528.jpg" alt="" /></a></li>
						<li class="banner"><a href="#" target=""><img src="/images/main2_20210528.jpg" alt="" /></a></li>
						<li class="banner"><a href="#" target=""><img src="/images/main3_20210528.jpg" alt="" /></a></li>
						<li class="banner"><a href="#" target=""><img src="/images/main4_20210528.jpg" alt="" /></a></li>
					</ul>
				</div>
				<script>
					;
					(function($) {
						//$(document).ready(function(){
						$('#mainslider').slick({
							autoplay : true,
							pauseOnHover : false,
							dots : true,
							arrows : true,
							fade : true,
							autoplaySpeed : 4000, //머무르는 시간
							speed : 1700
						//효과속도
						});
						//});
					})(jQuery);
				</script>
				<!-- // 메인플래시 수정시 [파일열기] -->

				<!-- 추천상품 -->
				<!-- //추천상품 -->

				<!-- 신상품 -->
				<!-- //신상품 -->

				<!-- 추가카테고리1 -->
				<!-- //추가카테고리1 -->

				<!-- 추가카테고리2 -->
				<!-- //추가카테고리2 -->

				<!-- 추가분류관리(진열순서1) -->
				<!-- //추가분류관리(진열순서1) -->

				<!-- 추가분류관리(진열순서2) -->
				<!-- 추가분류관리(진열순서2) -->

				<!-- 추가분류관리(진열순서3) -->
				<!-- //추가분류관리(진열순서3) -->
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

	<!-- 참고: 결제를 위한 필수 영역 -->
	<div id="progressPaybar" style="display: none;">
		<div id="progressPaybarBackground" class="layerProgress"></div>
		<div id="progressPaybarView">
			<div class="box">
				<p class="graph">
					<span><img src="//img.echosting.cafe24.com/skin/base_ko_KR/layout/txt_progress.gif" alt="현재 결제가 진행중입니다." /></span> <span><img
						src="//img.echosting.cafe24.com/skin/base/layout/img_loading.gif" alt=""
					/></span>
				</p>
				<p class="txt">
					본 결제 창은 결제완료 후 자동으로 닫히며,결제 진행 중에 본 결제 창을 닫으시면<br /> 주문이 되지 않으니 결제 완료 될 때 까지 닫지 마시기 바랍니다.
				</p>
			</div>
		</div>
	</div>
	<!-- //참고 -->
<c:import url="/WEB-INF/views/templates/bodyStatics.jsp"></c:import>
</body>
</html>