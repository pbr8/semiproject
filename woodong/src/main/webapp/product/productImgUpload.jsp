<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8"); 

String userid=(String)session.getAttribute("sid");
if(userid==null||userid.equals("")){
	%>
	<script>
	alert('로그인 후 이용 가능합니다.');
	location.href='/woodong';
	</script>
	<%
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

<style>
body {
	margin: 0px auto;
	text-align: center;
}

fieldset {
	border: 2px solid black;
}

body img {
	width: 50px;
}

div input {
	width: 150px;
	height: 30px;
	background-color: white;
	transition: 0.2s;
}

.sm:hover {
	background-color: black;
	color: white;
	transform: scale(1.0);
}
</style>
<script>
function imgFormatCheck(){
	
	var imgPath=document.imgUploadForm.imgUpload.value;
	var lIndex=imgPath.lastIndexOf('.');
	var imgFormat=imgPath.substring(lIndex);
	
	if(imgFormat!='.jpg'&&imgFormat!='.png'){
		window.alert('jpg 나 png 확장자의 이미지 파일만 업로드 가능합니다.');
		document.imgUploadForm.imgUpload.value=null;
		
	}
}
</script>
</head>
<body>
<h2>이미지 업로드</h2>
	<form name="imgUploadForm" action="productImgUpload_ok.jsp" method="post" enctype="multipart/form-data"
	 onsubmit="imgFormatCheck();">
		<fieldset>
			<legend>
				<img src="/woodong/img/logo.png">
			</legend>
			<br> 이미지를 선택해 주세요.<br> <br>
			<br> <input type="file" name="imgUpload" id="img_input">
			<br> <br>
			<div>
				<input type="submit" value="확인" class="sm">
				<input type="button" value="닫기" class="sm" onclick="javascript:self.close();">
			</div>
			<br>
		</fieldset>
	</form>
</body>
</html>