<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/head.jsp"></c:import>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/navbar.jsp">
	<c:param name="isCommon" value="true"></c:param>
</c:import>
	<h1></h1>
	<div style="margin:10% 8% 5% 8%; text-align: center;">
		<h2 style="letter-spacing: 0.15rem; margin-bottom: 5%">ORDER</h2>
		<div style="text-align: left;">
			<strong>일반상품(<c:out value="${orderCount}"></c:out>)</strong>
		</div>
		<table style="width:100%; margin-bottom: 1%;">
			<thead style="border-bottom: 1px gray solid;">
				<tr>
					<th style="width:15%;padding:1%;">
						THUMB
					</th>
					<th>
						PRODUCT
					</th>
					<th style="width:12%;">
						PRICE
					</th>
					<th style="width:8%;">
						QUANTITY
					</th>
					<th style="width:8%;">
						MILEAGE
					</th>
					<th style="width:8%;">
						DELIVERY
					</th>
					<th style="width:8%;">
						CHARGE
					</th>
					<th style="width:14%;">
						TOTAL
					</th>
				</tr>
			</thead>
			<tbody style="text-align: center; border-bottom: 1px gray solid;">
				<c:forEach items="${items}" var="item">
					<tr class="productDataList"
						data-productNum='<c:out value="${item.productNum}"></c:out>'
						data-pInfoNum='<c:out value="${item.PInfoNum}"></c:out>'
						data-finalPrice='<c:out value="${item.finalPrice}"></c:out>'
						data-productCount='<c:out value="${item.productCount}"></c:out>'
						data-cartNum='<c:out value="${item.cartNum}"></c:out>'
						style="border-bottom: 1px rgba(128,128,128,0.5) solid;">
						<td style="padding:1%;">
							<img alt="" src="${pageContext.request.contextPath}/resources/images/product/${item.productVO.productNum}/${item.productFileVO.fileName}"
								width="100px" height="100px">
						</td>
						<td style="text-align: left; padding:1% 3%;">
							<c:out value="${item.productVO.productTitle}"></c:out><br>
							<span>[옵션: <c:out value="${item.productInfoVO.size}"></c:out>]</span>
						</td>
						<td>
							<strong><span>KRW</span> <c:out value="${item.productVO.productPrice}"></c:out></strong><br>
							<span>[할인률 : <c:out value="${item.productVO.productDisRate}"></c:out>%]</span>
						</td>
						<td><!-- 선택 개수를 찍어야 한다. -->
							<c:out value="${item.productCount}"></c:out>
						</td>
						<td><!-- 받을 수 잇는 총 마일리지를 체크해야한다. -->
							<img alt="적립" src="${pageContext.request.contextPath}/images/cartAndOrder/icon_cash.gif">
							<span> <c:out value="${item.productVO.productMileage}"></c:out>원</span>
						</td>
						<td>
							<span>기본배송</span>
						</td>
						<td>
							<span>[무료]</span>
						</td>
						<td>
							<c:if test="${item.productVO.productDisRate eq 0}">
								<span><strong>KRW <c:out value="${item.productCount*item.productVO.productPrice}"></c:out></strong></span>
							</c:if>
							<c:if test="${item.productVO.productDisRate ne 0}">
								<del>KRW <c:out value="${item.productCount*item.productVO.productPrice}"></c:out></del><br>
								<strong>KRW <c:out value="${item.finalPrice}"></c:out></strong>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr style="border-bottom:1px gray solid;">
					<td colspan="8">
						<br>
						<div style="display: flex; justify-content: space-between; width:100%;">
							<div>
								[기본배송]
							</div>
							<div>
								<span>상품구매금액 <strong><c:out value="${totalprice}"></c:out></strong>+배송비 0 (무료) = 합계:</span>
								<strong>KRW <span style="font-size: 1.5em;"><c:out value="${totalprice}"></c:out></span></strong>
							</div>
						</div>
						<br>
					</td>
				</tr>
				<tr style="border-bottom:1px rgba(128,128,128,0.5) solid;">
					<td colspan="8" style="text-align: left;">
						<span>할인 적용 금액은 주문서작성의 결제예정금액에서 확인가능합니다.</span>
					<td>
				</tr>
			</tfoot>
		</table>
		<table style="width:100%;margin-top:7%;">
			<thead>
				<tr style="border-bottom: 1px rgba(128,128,128,0.5) solid;">
					<th style="text-align: left; width:16%;">주문 정보</th>
					<th style="text-align: right;"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif" alt=""> 필수입력사항</th>
				</tr>
			</thead>
			<tbody style="text-align: left;">
				<tr style="border-bottom: 1px rgba(128,128,128,0.5) solid;">
					<td style="padding:1%;">주문하시는 분 <img src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif" alt=""></td>
					<td style="padding:1%;">
						<input type="text" id="buyerName" value='<c:out value="${orderAddr.recipient}"></c:out>' readonly="readonly">
					</td>
				</tr>
				<tr style="border-bottom: 1px rgba(128,128,128,0.5) solid;">
					<td style="padding:1%;">주소 <img src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif" alt=""></td>
					<td style="padding:1%;">
						<input type="text" style="width:8%;" id="buyerZipcode" value='<c:out value="${orderAddr.zipCode}"></c:out>' readonly="readonly"><br>
						<input type="text" style="margin-top:0.5%;" id="buyerBasic" value='<c:out value="${orderAddr.basicAddr}"></c:out>' readonly="readonly"> <span>기본주소</span><br>
						<input type="text" style="margin-top:0.5%;" id="buyerDetail" value='<c:out value="${orderAddr.detailAddr}"></c:out>' readonly="readonly"> <span>나머지주소</span>
					</td>
				</tr>
				<tr style="border-bottom: 1px rgba(128,128,128,0.5) solid;">
					<td style="padding:1%;">전화번호 <img src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif" alt=""></td>
					<td style="padding:1%;">
						<input type="text" id="buyerPhone1" value='<c:out value="${orderAddr.addrPhone1}"></c:out>' readonly="readonly"> 
						- <input type="text" id="buyerPhone2" value='<c:out value="${orderAddr.addrPhone2}"></c:out>' readonly="readonly"> 
						- <input type="text" id="buyerPhone3" value='<c:out value="${orderAddr.addrPhone3}"></c:out>' readonly="readonly">
					</td>
				</tr>
				<tr style="border-bottom: 1px rgba(128,128,128,0.5) solid;">
					<td style="padding:1%;">이메일 <img src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif" alt=""></td>
					<td style="padding:1%;">
						<input type="text" id="buyerEmail1" value='${orderDetail.email1}' readonly="readonly"> 
						@ <input type="text" id="buyerEmail2" value='${orderDetail.email2}' readonly="readonly"> 
						. <input type="text" id="buyerEmail3" value='${orderDetail.email3}' readonly="readonly"> 
						<br><span>- 이메일을 통해 주문처리과정을 보내드립니다.</span>
					</td>
				</tr>
			</tbody>
		</table>

		<table style="width:100%;margin-top:7%;">
			<thead>
				<tr style="border-bottom: 1px rgba(128,128,128,0.5) solid;">
					<th style="text-align: left; width:16%;">배송 정보</th>
					<th style="text-align: right;"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif" alt=""> 필수입력사항</th>
				</tr>
			</thead>
			<tbody style="text-align: left;">
				<tr style="border-bottom: 1px rgba(128,128,128,0.5) solid;">
					<td style="padding:1%;">배송지 선택 <img src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif" alt=""></td>
					<td style="padding:1%;">
						<a id="recSelect" href="#forAddAddress" rel="modal:open">주소록 보기</a>
					</td>
				</tr>
				<tr style="border-bottom: 1px rgba(128,128,128,0.5) solid;">
					<td style="padding:1%;">받으시는 분 <img src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif" alt=""></td>
					<td style="padding:1%;">
						<input type="text" id="recPeople" value='<c:out value="${recentAddr.recipient}"></c:out>' readonly="readonly">
					</td>
				</tr>
				<tr style="border-bottom: 1px rgba(128,128,128,0.5) solid;">
					<td style="padding:1%;">주소 <img src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif" alt=""></td>
					<td style="padding:1%;">
						<input type="text" style="width:8%;" id="recZipcode" value='<c:out value="${recentAddr.zipCode}"></c:out>' readonly="readonly">
						<br><input style="margin-top:0.5%;" type="text" id="recBasic" value='<c:out value="${recentAddr.basicAddr}"></c:out>' readonly="readonly"> 기본주소
						<br><input style="margin-top:0.5%;" type="text" id="recDetail" value='<c:out value="${recentAddr.detailAddr}"></c:out>' readonly="readonly"> 나머지주소
					</td>
				</tr>
				<tr style="border-bottom: 1px rgba(128,128,128,0.5) solid;">
					<td style="padding:1%;">전화번호 <img src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif" alt=""></td>
					<td style="padding:1%;">
						<input type="text" id="reccall1" value='<c:out value="${recentAddr.addrPhone1}"></c:out>' readonly="readonly"> 
						- <input type="text" id="reccall2" value='<c:out value="${recentAddr.addrPhone2}"></c:out>' readonly="readonly"> 
						- <input type="text" id="reccall3" value='<c:out value="${recentAddr.addrPhone3}"></c:out>' readonly="readonly">
					</td>
				</tr>
				<tr style="border-bottom: 1px rgba(128,128,128,0.5) solid;">
					<td style="padding:1%;">배송 메세지</td>
					<td style="padding:1%;">
						<textarea id="orderMessage" rows="2" style="width:100%;"></textarea>
					</td>
				</tr>
			</tbody>
		</table>
		
		<table style="width:100%; margin-top:7%;">
			<thead>
				<tr>
					<th colspan="3" style="text-align: left; padding-bottom:3%;">결제 예정 금액</th>
				</tr>
				<tr style="border-bottom: 1px rgba(128,128,128,0.5) solid;">
					<th style="padding: 1%;">총 주문금액</th>
					<th style="padding: 1%;">총 할인 + 부가결제 금액</th>
					<th style="padding: 1%;">총 결제예정 금액</th>
				</tr>
			</thead>
			<tbody>
				<tr style="border-bottom: 2px rgba(128,128,128,0.5) solid; font-size:1.6rem;">
					<td style="padding: 3%;"><strong>KRW <span><c:out value="${totalprice}"></c:out></span></strong></td>
					<td style="padding: 3%;"><strong>- KRW <span id="onsaleprice"><c:out value='0'></c:out></span></strong></td>
					<td style="padding: 3%;"><strong>= KRW <span id="endprice"><c:out value="${totalprice}"></c:out></span></strong></td>
				</tr>
			</tbody>
		</table>
		<table style="width:100%;">
			<tbody>
				<tr style="border-bottom: 1px rgba(128,128,128,0.5) solid;">
					<td style="width:16%; text-align: left; padding:1%;">총 할인금액</td>
					<td style="text-align: left; padding:1%;">
						<strong>KRW <span><c:out value="${totalprice}"></c:out></span></strong>
					</td>
				</tr>
				<tr style="border-bottom: 1px rgba(128,128,128,0.5) solid;">
					<td style="width:16%; text-align: left; padding:1%;">쿠폰할인</td>
					<td style="text-align: left; padding:1%;">
						<a id="cuSelect" href="#forAddCoupon" rel="modal:open">쿠폰적용</a>
					</td>
				</tr>
				<tr style="border-bottom: 1px rgba(128,128,128,0.5) solid;">
					<td style="width:16%; text-align: left; padding:1%;">총 부가결제금액</td>
					<td style="text-align: left; padding:1%;">
						<strong>KRW <span id="delPriceInsert">0</span></strong>
					</td>
				</tr>
				<tr style="border-bottom: 1px rgba(128,128,128,0.5) solid;">
					<td style="width:16%; text-align: left; padding:1%;">적립금</td>
					<td style="text-align: left; padding:1%;">
						<input type="text" id="useMile" value="0"> 원 (총 사용가능 적립금: <span><c:out value="${orderDetail.mileageVO.enabledMile}"></c:out></span>원)
						<br><button style="margin-top:0.5%;" id="mileAccept">적용</button>
						<p>
							<br>- 적립금은 최소 1000이상일 때 결제가 가능합니다.
							<br>- 1회 구매시 적립금 최대 사용금액은 2000원입니다.
							<br>- 적립금으로만 결제할 경우, 결제금액이 0으로 보여지는 것은 정상이며 [결제하기] 버튼을 누르면 주문이 완료됩니다.
						</p>
					</td>
				</tr>
			</tbody>
		</table>
		<div style="text-align: right; margin-top: 4%;">
			<strong>최종결제 금액</strong>
			<p><strong><span style="font-size:1.8rem;" id="forUserPrice"><c:out value="${totalprice}"></c:out></span></strong></p>
			<input type="checkbox" id="agreepayment">
			<span>결제정보를 확인하였으며, 구매진행에 동의합니다.</span><br>
			<button id="purchasebutton"
				data-name="${name}"
				data-originTotPrice="${totalprice}"
				data-cuSale="0"
				data-mileSp="0"
				data-cuNum="0"
				data-changeMile='<c:out value="${totalMileage}"></c:out>'>
				PAYMENT
			</button>
		</div>
		<div style="text-align: right; margin-top:3%;">
			<table style="float: right;">
				<tbody>
					<tr>
						<th>적립예정금액</th>
						<td>&ensp;<td>
						<td><c:out value="${totalMileage}"></c:out>원</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div style="font-size: 0.75rem; clear: both; text-align: left;">
			<p><strong>이용안내</strong></p>
			<ol style="list-style: none; padding-left: 0;">
				<li>결제가능브라우저 : 크롬,파이어폭스,사파리,오페라 브라우저에서 결제 가능</li>
				<li>(단, window os 사용자에 한하며 리눅스/mac os 사용자는 사용불가)</li>
				<li>최초 결제 시도시에는 플러그인을 추가 설치 후 반드시 브라우저 종료 후 재시작해야만 결제가 가능합니다.</li>
				<li>(무통장, 휴대폰결제 포함)</li>
			</ol>
		</div>
	</div>
	
	<div style="display:none; position: fixed; top:10%; left:15%; max-width:70%; max-height: 75%;" id="forAddAddress" class="modal">
		<div id="addressChapter1" style="margin:2%; width:96%; display:contents;">
			<table style="border: 1px rgba(128,128,128,0.5) solid; width: 100%;">
				<thead style="border-bottom: 1px rgba(128,128,128,0.25) solid;">
					<tr>
						<th style="padding:2%;">
							배송주소록 유의사항
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="padding:3%;">
							<ul style="padding:0; list-style: none;">
								<li>
									 - 배송 주소록은 최대 10개까지 등록할 수 있습니다.
								</li>
							</ul>
						</td>
					</tr>
				</tbody>
			</table>
			<table style="width:100%; border: 1px black solid; margin-top: 2%; height:50%;">
				<thead>
					<tr>
						<th>
							<input type="checkbox" id="addressAllCheck">
						</th>
						<th>
							배송지명
						</th>
						<th>
							수령인
						</th>
						<th>
							전화번호
						</th>
						<th>
							주소
						</th>
						<th>
							배송지 관리
						</th>
					</tr>
				</thead>
				<tbody id="settingAddressList">
					<c:if test="${fn:length(addrList) eq 0}">
						<tr>
							<td colspan="6" style="text-align: center;">
								등록된 주소가 없습니다.
							</td>
						</tr>
					</c:if>
					<c:forEach items='${addrList}' var="item">
						<tr data-addrNum="${item.addrNum}">
							<td>
								<input type="checkbox" class="addressSelect" data-addrNum='<c:out value="${item.addrNum}"></c:out>'>
							</td>
							<td>
								<c:out value="${item.addrName}"></c:out>
							</td>
							<td>
								<c:out value="${item.recipient}"></c:out>
							</td>
							<td>
								<c:out value="${item.addrPhone}"></c:out>
							</td>
							<td>
								<c:out value="${item.fullAddress}"></c:out>
							</td>
							<td>
								<button class="addressAdapt"
										data-addrNum='<c:out value="${item.addrNum}"></c:out>'>적용</button>
								<br><button class="addressRepareForm"
										data-addrNum='<c:out value="${item.addrNum}"></c:out>'>수정</button>
							</td>		
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div style="margin-top:1%; text-align: center;">
				<button id="selectAddressDelete" style="margin-right:1.5%;">선택 주소록 삭제</button>
				<button id="addressAddButton">배송지등록</button>
			</div>
		</div>
		
		<div id="addressChapter2" style="margin:2%; width:96%; display:none;">
			<table style="border: 1px rgba(128,128,128,0.5) solid; width: 100%;">
				<thead style="border-bottom: 1px rgba(128,128,128,0.25) solid;">
					<tr>
						<th style="padding:2%;">
							배송주소록 유의사항
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="padding:3%;">
							<ul style="padding:0; list-style: none;">
								<li>
									 - 배송 주소록은 최대 10개까지 등록할 수 있습니다.
								</li>
							</ul>
						</td>
					</tr>
				</tbody>
			</table>
			<table style="width:100%; border: 1px black solid; margin-top: 2%; height:50%;">
				<colgroup>
					<col width="20%">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<td style="padding:1%;">
							배송지명 <img src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif" alt="">
						</td>
						<td style="padding:1%;">
							<input type="text" id="insertAddressTitle">
						</td>
					</tr>
					<tr>
						<td style="padding:1%;">
							성명 <img src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif" alt="">
						</td>
						<td style="padding:1%;">
							<input type="text" id="insertAddrRecipient">
						</td>
					</tr>
					<tr>
						<td style="padding:1%;">
							주소 <img src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif" alt="">
						</td>
						<td style="padding:1%;">
							<input type="text" readonly="readonly" id="sample2_postcode" placeholder="우편번호" style="width:25%;">
							<input type="button" onclick="sample2_execDaumPostcode()" value="우편번호 찾기"><br>
							<input type="text" readonly="readonly" id="sample2_address" style="width:65%" placeholder="주소"><br>
							<input type="text" id="sample2_detailAddress" style="width:65%" placeholder="상세주소">
							
							<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
							<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
							<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
							</div>
						</td>
					</tr>
					<tr>
						<td style="padding:1%;">
							전화번호 <img src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif" alt="">
						</td>
						<td style="padding:1%;">
							<input type="text" style="width:25%;" id="insertAddrPhone1"> 
							- <input type="text" style="width:25%;" id="insertAddrPhone2"> 
							- <input type="text" style="width:25%;" id="insertAddrPhone3">
						</td>
					</tr>
				</tbody>
			</table>
			<div style="margin-top: 1%; text-align: right;">
				<button id="addThisAddress" data-role="edit" data-addrNum="" style="margin-right:1%;"></button>
				<button id="cancleAddAddress">취소</button>
			</div>
		</div>
	</div>
	
	<div style="display:none; position: fixed; top:15%; left:30%; max-width:45%; max-height: 65%;" id="forAddCoupon" class="modal">
		<div style="margin:2%; width:96%;">
			<table style="width:100%; border: 1px rgba(128,128,128,0.5) solid;">
				<thead>
					<tr>
						<th style="padding:2%; border-bottom:1px rgba(128,128,128,0.25) solid;">쿠폰 사용에 따른 주의사항</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="padding:2%;">
							<ul style="list-style: none; padding:0;">
								<li>- 사용 가능한 쿠폰만 보여지게 됩니다.</li>
								<li>- 쿠폰은 회원등급 할인 이후에 적용되므로,</li>
								<li>&ensp;현재 페이지에서 보여지는 판매가와 실제 적용되는 금액과 다를 수 있습니다.</li>
							</ul>
						</td>
					</tr>
				</tbody>
			</table>
			<table style="width:100%; border: 1px black solid; margin-top: 2%; height:60%;">
				<thead>
					<tr>
						<th style="text-align: center; padding:3%;">
							쿠폰 할인금액
						</th>
					</tr>
					<tr>
						<th style="text-align: center; padding:2%;">
							<span style="font-size: 2rem;">
								KRW <span id="cuSalePrice1" style="font-size: 2.5rem;"><c:out value="0"></c:out></span>
							</span>
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="text-align: center; padding:3%;">
							- <select id="couponSelector">
								<option value="0" data-disRate="0" selected="selected">선택하세요.</option>
								<c:forEach items="${cuList}" var="item">
									<option value="${item.cuNum}" data-disRate="<c:out value='${item.couponspVO.disRate}'></c:out>">
										<c:out value="${item.couponspVO.cuName}"></c:out>
									</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td style="text-align: right; padding:2%; border-top: 1px rgba(128,128,128,0.5) solid;">
							<strong>
								= 총 쿠폰 할인 금액 :&ensp;KRW&ensp;
								<span id="cuSalePrice2" style="font-size: 1.8rem;"><c:out value="0"></c:out></span>
							</strong>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	
	<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/footer.jsp"></c:import>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/order/orderform.js"></script>
	<script type="text/javascript">
		var msg="${msg}";
		
		if(msg!=""){
			swal({
				icon:"info",
				title:"INFO",
				text:msg
			});
		}
	</script>
</body>
</html>