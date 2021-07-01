<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="/WEB-INF/views/templates/head.jsp"></c:import>
</head>
<body>
<c:import url="/WEB-INF/views/templates/navbar.jsp"><c:param name="isCommon" value="true"></c:param></c:import>
<div id="container">
<div style="padding: 68px 34px 0;">
<div class="container">
<h2>lookbookInsert</h2>
		<form id="frm" action="./insert" method="post" enctype="multipart/form-data">


			<div class="form-group">
				<label for="title">Title:</label> <input type="text"
					class="form-control myCheck" id="title" name="title">
			</div>
			
			<h4>파일구분</h4>
			<select name="division" id="division" onchange="handleOnChange(this)">
			<option >종류 선택</option>
			<option value="p">사진</option>
			<option value="v">비디오</option>
			</select>
			<div id='result'></div>

			

			<div class="form-group" id="pic">
			<div>다중이미지 첨부</div>
				<input type="file" name="files" multiple="multiple">
			</div>

			
			<div class="form-group" id="vdo">
				<div>대표이미지 첨부</div>
				<input type="file" name="files">
				<div>비디오 첨부</div>
				<input type="file" name="files">
			</div>
			
			
			<div style="text-align: right">
  		<input type="button" id="btn" value="WRITE" class="btn" style="border:1px solid gray;
                    width:100px;
                    height:30px;
                    font-size:14px;">
  		</div>
		</form>
	</div>

</div>
</div>
<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/footer.jsp"></c:import>

<script type="text/javascript">
$('#pic').hide();
$('#vdo').hide();
function handleOnChange(e) {
	  // 선택된 데이터의 텍스트값 가져오기
	  const text = e.options[e.selectedIndex].text;
	  
	  if(text == '사진'){
	      $('#pic').show();
	      $('#vdo').hide();
	    }else{
	      $('#pic').hide();
	      $('#vdo').show();
	    }
	}
</script> 

	<script type="text/javascript" src="/js/board/boardInsert.js"></script>
	<script type="text/javascript" src="/js/board/fileAdd.js"></script>


</body>
</html>