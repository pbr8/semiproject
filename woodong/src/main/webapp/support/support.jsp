<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
body {
	margin: 0px auto;
	text-align: center;
}

section {
	margin: 0px auto;
	text-align: center;
	width: 1000px;
}

#c {
	text-align: center;
	margin-left: auto;
	margin-right: auto;
	font-size: 25px;
	background-color: white;
	border-collapse: separate;
	border-spacing: 0 0px;
}

#img {
	width: 1000px;
	height: 100px;
}

img {
	width: 250px;
}

table td {
	transition: 0.8s;
	background-color: white;
}

table td:hover {
	transform: scale(1.1);
	border-bottom: 6px solid #ff0000;
}
</style>

<body>
	<h1>고 객 센 터</h1>
	<h1>무엇을 도와드릴까요?</h1>
	<hr>
	<section>
		<article>
			<br> <br> <br> <br>
			<table id="c">
				<tr>
					<td><a href="user_sp.jsp"><img src="/woodong/img/user.png"></a><br>계정/인증<br>
						<br></td>
					<td><a href="shopping_sp.jsp"><img src="/woodong/img/shopping.png"></a><br>구매/판매<br>
						<br></td>
					<td><a href="coupon_sp.jsp"><img src="/woodong/img/coupon.png"></a><br>이벤트/초대<br>
						<br></td>
					<td><a href="notification.jsp"><img
							src="/woodong/img/notification.png"></a><br>운영정책/기타<br> <br></td>
				</tr>
			</table>
		</article>
	</section>
</body>
</html>