<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="udao" class="woodong.user.UserDAO" scope="session"></jsp:useBean>
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


int uidx=udao.findUserIdxByUserId(userid);


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/woodong/product/css/productUploadLayout.css">
<script>
function imgUploadPop(){
	window.open('productImgUpload.jsp','imgUpload','width=400px,height=360px');
}
</script>
</head>
<body>
<%@include file="/header.jsp" %>
<section id="bodysection">
<div id="div">
	<article>
		<h2>판매 등록</h2>
	</article>
	<article id="productUpload_list">
		<form name="productUploadDateForm" action="productUpload_ok.jsp">
			<input type="hidden" name="user_idx" value="<%=uidx%>">
			<input type="hidden" name="product_img">
			<ul>
				<li>
					<select name="product_category" onload="findSelected()">
						<option value="카테고리" selected disabled="disabled">카테고리</option>
						<option value="의류">의류</option>
						<option value="디지털 / 가전">디지털 / 가전</option>
						<option value="스포츠 / 레저">스포츠 / 레저</option>
						<option value="잡화">잡화</option>
						<option value="식품">식품</option>
						<option value="문구 / 도서">문구 / 도서</option>
						<option value="완구 / 취미">완구 / 취미</option>
						<option value="반려동물 용품">반려동물 용품</option>
					</select>
				</li>
				<li>
					<input type="text" name="product_tel" class="productUpload_tfPrice" placeholder="연락처">
				</li>
				<li>
					<input type="text" name="product_price" class="productUpload_tfPrice" placeholder="가격" required><span>&nbsp;원</span>
				</li>
				<li>
					<input type="text" name="product_subject" id="productUpload_tfSubject" placeholder="제목" required>
				</li>
				<li>
					<textarea rows="15" cols="61" placeholder="상품 내용" name="product_content" id="productUpload_list_ta"></textarea>
				</li>
			</ul>
			<fieldset>
				<legend>이미지 선택</legend>
				<img src="/woodong/product/img/productImg/imgnone.jpg" alt="이미지 미리보기" id="imgThumb">
				<input type="button" value="이미지 올리기" onclick="imgUploadPop();">
			</fieldset>
			<div id="productUpload_buttons">
				<input type="submit" value="판매등록" class="button_size">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="reset" value="다시쓰기" class="button_size">
			</div>
		</form>
	</article>
</div>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>