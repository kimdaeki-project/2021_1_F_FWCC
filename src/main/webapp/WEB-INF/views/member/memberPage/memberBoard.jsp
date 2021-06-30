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
	href="/css/member/memberPage/memberBoard.css"
>
<meta charset="UTF-8">
<title>FWCC-memberBoard</title>
</head>
<body>
	<!-- header START -->
	<c:import url="/WEB-INF/views/templates/navbar.jsp">
		<c:param name="isCommon" value="true"></c:param>
	</c:import>
	<!-- header END -->

	<!-- contents START -->
	<div class="container">
		<div id="contents">
			<div class="titleArea">
				<h2>MY POST</h2>
			</div>
			<div class="xans-element- xans-myshop xans-myshop-boardpackage ">
				<div
					class="xans-element- xans-myshop xans-myshop-boardlist ec-base-table typeList gBorder gBlank10"
				>
					<table
						border="1"
						summary=""
					>
						<caption>게시물 관리 목록</caption>
						<colgroup
							class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 "
						>
							<col style="width: 70px;" />
							<col style="width: 135px;" />
							<col style="width: auto;" />
							<col style="width: 84px;" />
							<col style="width: 80px;" />
							<col style="width: 55px;" />
						</colgroup>
						<thead>
							<tr>
								<th scope="col">NO.</th>
								<th scope="col">CATEGORY</th>
								<th scope="col">SUBJECT</th>
								<th scope="col">WRITER</th>
								<th scope="col">DATE</th>
								<th scope="col">HIT</th>
							</tr>
						</thead>
						<c:if test="${list != null}">
							<tbody class="center">
								<c:forEach
									items="${list}"
									var="VO"
									varStatus="status"
								>
									<tr class="">
										<td class="left">${status.count}</td>
										<td class="left">
											<c:if test="${VO.typeNum == 2}">
												Q&A
											</c:if>
											<c:if test="${VO.typeNum == 3}">
												Review
											</c:if>
										</td>
										<td hidden="" class="PKNum">
											<c:if test="${VO.typeNum == 2}">
												Q_${VO.num}
											</c:if>
											<c:if test="${VO.typeNum == 3}">
												R_${VO.num}
											</c:if>
										</td>
										<td class="left subject"><a
											class="boardLink"
											href="#"
										>${VO.title}</a></td>
										<td class="left">${VO.writer}</td>
										<td class="left">${VO.regDate}<span class="txtNum"></span></td>
										<td class="left">${VO.hit}<span class="txtNum"></span></td>
									</tr>
								</c:forEach>
							</tbody>
						</c:if>
						<c:if test="${list == null}">
							<tbody class="">
								<tr>
									<td
										colspan="6"
										class="message"
									>게시물이 없습니다.</td>
								</tr>
							</tbody>
						</c:if>
					</table>
				</div>
			</div>

			<!-- pager & search START -->
			<div class="xans-element- xans-myshop xans-myshop-boardlistpaging ec-base-paginate">
				<a href="?page=1">&lt;</a>
				<ol>
					<li class="xans-record-"><a
						href="?page=1"
						class="this"
					>1</a></li>
				</ol>
				<a href="?page=1">&gt;</a>
			</div>

			<form
				id="boardSearchForm"
				name=""
				action="#"
				method="get"
			>
				<input
					id="board_no"
					name="board_no"
					value=""
					type="hidden"
				/> <input
					id="page"
					name="page"
					value="1"
					type="hidden"
				/> <input
					id="board_sort"
					name="board_sort"
					value=""
					type="hidden"
				/>
				<div class="xans-element- xans-myshop xans-myshop-boardlistsearch">
					<fieldset class="boardSearch">
						<legend>게시물 검색</legend>
						<p>
							<select
								id="search_key"
								name="search_key"
							>
								<option value="subject">제목</option>
								<option value="content">내용</option>
								<option value="writer_name">글쓴이</option>
								<option value="member_id">아이디</option>
								<option value="nick_name">별명</option>
							</select> <input
								id="search"
								name="search"
								class="inputTypeText"
								placeholder=""
								value=""
								type="text"
							/> <a
								href="#"
								onclick="BOARD.form_submit('boardSearchForm');"
								class="btnFind"
							>find</a>
						</p>
					</fieldset>
				</div>
			</form>
			<!-- pager & search END -->
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
		src="/js/member/memberPage/memberBoard.js"
	></script>

</body>
</html>