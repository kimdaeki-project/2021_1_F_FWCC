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
	<c:import url="/WEB-INF/views/templates/navbar.jsp"></c:import>
	<!-- header END -->

	<!-- contents START -->
	<div class="container">
		<div id="contents">
			<div class="titleArea">
				<h2>MY POST</h2>
			</div>
			<div class="xans-element- xans-myshop xans-myshop-boardpackage ">
				<div class="xans-element- xans-myshop xans-myshop-boardlisthead ">
					<p>
						분류 선택 <select
							id="board_sort"
							name="board_sort"
							onchange="BOARD.change_sort('boardSearchForm', this);"
						>
							<option value="D">작성 일자별</option>
							<option value="C">분류별</option>
						</select>
					</p>
				</div>
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
						<tbody class="center">
							<tr class="">
								<td></td>
								<td><a
									href=""
									class="txtEm"
								></a></td>
								<td class="left subject"><a href=""></a></td>
								<td></td>
								<td><span class="txtNum"></span></td>
								<td><span class="txtNum"></span></td>
							</tr>
						</tbody>
						<tbody class="displaynone">
							<tr>
								<td
									colspan="6"
									class="message"
								>게시물이 없습니다.</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>


			<form
				id="boardSearchForm"
				name=""
				action="/myshop/board_list.html"
				method="get"
				target=""
				enctype="multipart/form-data"
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
				<!-- pager & search START -->
				<div class="xans-element- xans-myshop xans-myshop-boardlistsearch ">
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
								fw-filter=""
								fw-label=""
								fw-msg=""
								class="inputTypeText"
								placeholder=""
								value=""
								type="text"
							/> <a
								href="#none"
								onclick="BOARD.form_submit('boardSearchForm');"
								class="btnFind"
							>find</a>
						</p>
					</fieldset>
				</div>
				<!-- pager & search END -->
			</form>
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
	src="/js/member/memberPage/memberBoard.js"
></script> -->

</body>
</html>