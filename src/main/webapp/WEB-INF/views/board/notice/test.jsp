<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form>
    <input type="text" name="txtName"><br>
    <input type="file" name="upload"><br>
     <input type="file" name="upload"><br>
    <input type="button" value=삭제 onclick="fileReset(this.form);">
    <input type="button" value=확인 onclick="alert(this.form.upload.value);">
</form>

 

<script language="JavaScript">

    function fileReset( form )
    {
    	var files = document.getElementsByName("upload");


    	files[0].select();

    	document.selection.empty;

    }

</script>
</body>
</html>