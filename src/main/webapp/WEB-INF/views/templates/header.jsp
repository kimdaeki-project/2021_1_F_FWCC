<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<div id="header">
			<div class="inner">
				<div class="fl-left">
					<h1>
						<a href="${pageContext.request.contextPath }/"><span class="logo_bk"><img src="/images/logo_b.png" alt="" /></span><span class="logo_w"><img
								src="/images/logo_w.png" alt=""
							/></span></a>
					</h1>
					<div id="category">
						<div class="xans-element- xans-layout xans-layout-category position">
							<ul class="logbar hovermenu">
								<li class="xans-record-"><a href="#">All (New arrival)</a></li>
								<!-- <li class="xans-record-"><a href="/product/list.html?cate_no=24">Outer</a></li> -->
								<li class="xans-record-"><a href="#">Top</a>
									<div class="sub sub-top">
										<ul>
											<li><a href="#">TOP (long)</a></li>
											<li><a href="#">TOP (short)</a></li>
										</ul>
									</div>
								</li>
								<li class="xans-record-"><a href="#">Bottom</a>
									<div class="sub sub-bottom">
										<ul>
											<li><a href="#">BOTTOM (long)</a></li>
											<li><a href="#">BOTTOM (short)</a></li>
										</ul>
									</div>
								</li>
								<!-- <li class="xans-record-"><a href="/product/list.html?cate_no=4">Acc</a></li> -->
								<li class="xans-record-"><a href="#">Sale</a></li>
								<li class="xans-record-"><a href="#">Collaboration</a>
									<div class="sub sub-collab">
										<ul>
											<li><a href="#">10th Anniversary Collection</a></li>
											<li><a href="#">TAW&TOE X FrizmWORKS</a></li>
											<li><a href="#">Penfield X FrizmWORKS</a></li>
											<li><a href="#">SLOWBOY X FrizmWORKS</a></li>
											<li><a href="#">Targetto X FrizmWORKS</a></li>
											<li><a href="#">Thorogood X FrizmWORKS</a></li>
											<li><a href="#">mazi untitled X FrizmWORKS</a></li>
											<li><a href="#">Hugplus X FrizmWORKS</a></li>
											<li><a href="#">Webzen X FrizmWORKS</a></li>
											<li><a href="#">Hummel X FrizmWORKS</a></li>
											<li><a href="#">The Knitted X FrizmWORKS</a></li>
											<li><a href="#">Amon movement X FrizmWORKS</a></li>
											<li><a href="#">USS2 X FrizmWORKS</a></li>
										</ul>
									</div>
								</li>
								<!-- <li class="xans-record-"><a href="/product/list.html?cate_no=37">Original Garments®</a></li> -->
								<li class="xans-record-"><a href="#">Lookbook</a></li>
							</ul>
						</div>
					</div>
				</div>	

				<div class="fl-right">
					<ul class="logbar hovermenu">
						<li><a href="#">Community</a>
							<div class="sub">
								<ul class="xans-element- xans-layout xans-layout-boardinfo">
									<li class="xans-record-"><a href="#">Notice</a></li>
									<li><a href="#">Stockist</a></li>
									<li class="xans-record-"><a href="#">Q&A</a></li>
									<li class="xans-record-"><a href="#">Review</a></li>
								</ul>
							</div></li>
						<li class="xans-element- xans-layout xans-layout-statelogoff "><a href="#">Login</a> / <a href="#">Join</a></li>
						<li><a href="#">My Account</a>
							<div class="sub">
								<ul>
									<li><a href="#">ORDER LIST</a></li>
									<li><a href="#">PROFILE</a></li>
									<li><a href="#">WISHLIST</a></li>
									<li><a href="#">TODAY VIEW</a></li>
									<li><a href="#">MILEAGE</a></li>
									<li><a href="#">COUPON</a></li>
									<li><a href="#">MY BOARD</a></li>
								</ul>
							</div></li>
						<li class="mSearch"><a href="#">Search <img src="/images/header_ico_search.png" alt="검색" /></a></li>
						<li id="ec_async_basket_layer_hover" class="xans-element- xans-layout xans-layout-orderbasketcount mCart "><a href="#">Cart <span class="count">0</span></a> <!-- 비동기 레이어를 담기위한 컨테이너 -->
							<div id="ec_async_basket_layer_container" style="display: none;" class="xans-element- xans-layout xans-layout-orderasyncbasketlayer "></div></li>
						<li>
							<div class="xans-element- xans-layout xans-layout-multishoplist list ">
								<button type="button" class="toggle">
									<span><img src="//img.cafe24.com/img/common/global/ko_KR_18x12.png" alt="" /> 한국어</span>
								</button>
								<ul class="xans-element- xans-layout xans-layout-multishoplistitem">
									<li class="selected xans-record-"><a href="#"> <img src="//img.cafe24.com/img/common/global/ko_KR_32x24.png" alt="" /> <span class="name">한국어</span> <span class="unit">KRW</span>
									</a></li>
									<li class=" xans-record-"><a href="#"> <img src="//img.cafe24.com/img/common/global/en_US_32x24.png" alt="" /> <span class="name">English</span> <span class="unit">USD</span>
									</a></li>
								</ul>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>