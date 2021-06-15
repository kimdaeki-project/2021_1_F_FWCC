<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<nav id="navbar">
	<div id="navbar-left">
		<ul>
			<li>
				<a href="${pageContext.request.contextPath}/">
					<c:if test='${param.isCommon eq "true"}'>
						<img src="/images/logo_b.png" alt="" />
					</c:if>
					<c:if test='${param.isCommon eq "false"}'>
						<img src="/images/logo_w.png" alt="" />
					</c:if>
				</a>
			</li>
			<li><a href="${pageContext.request.contextPath }/product/list?collab=&productType=&name=All&division=New arrival&sortStandard=&sale=false">All (New arrival)</a></li>
			<li id="navbar-rowlist"><a href="${pageContext.request.contextPath }/product/list?collab=&productType=top&name=TOP&division=&sortStandard=&sale=false">Top</a>
				<ul id="navbar-leftul">
					<li><a href="${pageContext.request.contextPath }/product/list?collab=&productType=top-long&name=TOP&division=long&sortStandard=&sale=false">TOP (long)</a></li>
					<li><a href="${pageContext.request.contextPath }/product/list?collab=&productType=top-short&name=TOP&division=short&sortStandard=&sale=false">TOP (short)</a></li>
				</ul>
			</li>
			<li id="navbar-rowlist"><a href="${pageContext.request.contextPath }/product/list?collab=&productType=bottom&name=BOTTOM&division=&sortStandard=&sale=false">Bottom</a>
				<ul id="navbar-leftul">
					<li><a href="${pageContext.request.contextPath }/product/list?collab=&productType=bottom-long&name=BOTTOM&division=long&sortStandard=&sale=false">BOTTOM (long)</a></li>
					<li><a href="${pageContext.request.contextPath }/product/list?collab=&productType=bottom-short&name=BOTTOM&division=short&sortStandard=&sale=false">BOTTOM (short)</a></li>
				</ul>
			</li>
			<!-- <li class="xans-record-"><a href="/product/list.html?cate_no=4">Acc</a></li> -->
			<li><a href="${pageContext.request.contextPath }/product/list?collab=&productType=&name=sale&division=&sortStandard=&sale=true">Sale</a></li>
			<li id="navbar-columnlist"><a href="#">Collaboration</a>
				<ul id="navbar-colaul">
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
			</li>
			<!-- <li class="xans-record-"><a href="/product/list.html?cate_no=37">Original Garments®</a></li> -->
			<li><a href="#">Lookbook</a></li>
		</ul>
	</div>
	
	<div id="navbar-right">
		<ul>
			<li id="navbar-language">
				<button id="navbar-language">
					<span><img src="//img.cafe24.com/img/common/global/ko_KR_18x12.png" alt="" /> 한국어</span>
				</button>
				<ul id="navbar-language-select">
					<li>
						<a href="#"> 
							<img src="//img.cafe24.com/img/common/global/ko_KR_32x24.png" alt="" /> 
							<span class="name">한국어</span> 
							<span class="unit">KRW</span>
						</a>
					</li>
					<li>
						<a href="#"> 
							<img src="//img.cafe24.com/img/common/global/en_US_32x24.png" alt="" /> 
							<span class="name">English</span> 
							<span class="unit">USD</span>
						</a>
					</li>
				</ul>
			</li>
			<li id="ec_async_basket_layer_hover">
				<a href="${pageContext.request.contextPath}/order/basket">Cart <span id="navbar-cartspan"> 0 </span></a> <!-- 비동기 레이어를 담기위한 컨테이너 -->
				<div></div>
			</li>
			<li><a href="#">Search <img src="/images/header_ico_search.png" alt="검색" /></a></li>
			<li id="navbar-columnlist">
				<a href="${pageContext.request.contextPath }/member/memberPage">My Account</a>
				<ul id="navbar-rightul">
					<li><a href="#">ORDER LIST</a></li>
					<li><a href="#">PROFILE</a></li>
					<li><a href="#">WISHLIST</a></li>
					<li><a href="#">TODAY VIEW</a></li>
					<li><a href="#">MILEAGE</a></li>
					<li><a href="#">COUPON</a></li>
					<li><a href="#">MY BOARD</a></li>
				</ul>
			</li>
			<li>
				<sec:authorize access="!isAuthenticated()">
					<a href="${pageContext.request.contextPath }/member/memberLogin">Login</a> / <a href="${pageContext.request.contextPath }/member/memberJoin">Join</a>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<a href="${pageContext.request.contextPath }/member/memberLogout">Logout</a> / <a href="#">My info</a>
				</sec:authorize>
			</li>
			<li id="navbar-columnlist">
				<a href="#">Community</a>
				<ul id="navbar-rightul">
					<li><a href="${pageContext.request.contextPath}/notice/list">Notice</a></li>
					<li><a href="#">Stockist</a></li>
					<li><a href="#">Q&A</a></li>
					<li><a href="#">Review</a></li>
				</ul>
			</li>
			
			<li>
				<a href="${pageContext.request.contextPath}/admin/adminHome" target="_black">AdminPage</a>
			</li>
			<li>
				<a href="${pageContext.request.contextPath}/product/insert" target="_black">Pinsert</a>
			</li>
			
		</ul>
	</div>
</nav>