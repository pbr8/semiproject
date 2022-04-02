<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>

<jsp:useBean id="sell_list_dao" class="woodong.product.ProductDAO"></jsp:useBean>
<%@ page import="woodong.product.*"%>
<jsp:useBean id="jjim_list_dto" class="woodong.product.ProductDTO"></jsp:useBean>
<jsp:setProperty property="*" name="jjim_list_dto" />
<jsp:useBean id="jjim_list_dao" class="woodong.product.ProductDAO"></jsp:useBean>

<jsp:useBean id="udao" class="woodong.user.UserDAO"></jsp:useBean>


<%
String userid = (String) session.getAttribute("sid");
if (userid == null || userid.equals("")) {
%><script>
	window.alert('로그인 후 이용가능합니다.');
	location.href = '/woodong';
	</script>
<%
}
int user_int = udao.findUserIdxByUserId(userid);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<script>
	function selectAll(selectAll)  {
		  const checkboxes 
		       = document.getElementsByName('sel');
		  
		  checkboxes.forEach((checkbox) => {
		    checkbox.checked = selectAll.checked;
		  })
		}
</script>
<style>
body {
	margin: 0px auto;
	padding-top: 200px;
}

#c_section{
	text-align: center;
}
body nav hr {
	width: 1000px;
}

#my_center {
	border-collapse: separate; text-align : center; margin-left : auto;
	margin-right : auto; width : 1000px;
	height: 100px;
	transition: 0.9s;
	z-index: 1;
	text-align: center;
	margin-left: auto;
	margin-right: auto;
	width: 1000px;
}

.list_table {
	margin-top: 25px;
	margin-left: auto;
	margin-right: auto;
	width: 1000px;
	text-align: center;
	border-spacing: 0px;
	vertical-align: middle;
	border-top: 3px solid black;
	height: 200px;
	margin-left: auto;
}

.list {
	background-color: #ff0000;
	color: white;
	font-size: 16px;
}

#list:hover {
	background-color: white;
	transform: scale(1.2);
	font-size: 20px;
	color: #ff0000;
	font-weight: bold;
}

section table th {
	border-bottom: 1px solid gray;
	text-align: center;
	margin: 0px auto;
}

nav table td {
	transition: 0.9s;
}

#select_situation {
	background-color: white;
	color: #ff0000;
	font-weight: bold;
	transform: scale(1.2);
	border: 3px solid white;
}

a {
	text-decoration: none;
	color: inherit;
}

#nav_bg {
	background-color:
}

#bt_c {
	background-color: white;
	color: #ff0000;
	border: 1px solid grey;
	margin-left: 30px;
}

#bt_ct {
	text-align: center;
	margin: 0px auto;
}
#dto{
	width: 400px;
}

</style>

<body>
	<%@include file="/header.jsp"%>
	<form action="sell_delete_ok.jsp">
		<article>
			<nav class="list">
				<table id="my_center">
					<!-- 마이 페이지 상단 메뉴바 -->
					<tr>
						<td id="list"><div>
								<a href="myinfo.jsp">내 정보 보기</a> | <a
									href="javascript:openpwdpopup()">수정</a>
							</div> </a></td>
						<td id="list"><a href="jjimlist.jsp"><div>찜 목 록</div></a></td>
						<td id="select_situation"><div>판 매 중</div></td>
						<td id="list"><a href="sellcompletion.jsp"><div>판 매
									완 료</div></a></td>
					<tr>
				</table>

			</nav>
			<nav id="nav_bg">
				<br>
				<hr>
				<div style="width: 1000px; margin: 0px auto;">
					<!-- 전체 선택 체크박스 -->
					<label><input type="checkbox" onclick='selectAll(this)' />
						전체선택</label>
					<!-- 선택 삭제 버튼(SUBMIT) -->
					<input type="submit" value="선택삭제" id="bt_c">
				</div>
				<hr>
			</nav>
		</article>
		<section id="c_section">
			<!-- 자신이 판매하고 있는 상품 목록 출력 코드 -->
			<table class="list_table">
				<tr>
					<th>&nbsp</th>
					<th>상 품 정 보</th>
					<th>지 역</th>
					<th>가 격</th>
				</tr>
				<tr>
					<%
					ProductDTO[] dtos = sell_list_dao.my_Page_Product_List(user_int);
					if (dtos == null || dtos.length == 0) {
					%>
				
				<tr>
					<td colspan="4" align="center">판매중인 물품이 없습니다.</td>
				</tr>
				<%
				} else {
				for (int i = 0; i < dtos.length; i++) {
					ProductDTO dto = dtos[i];
				%>
				<tr>
					<td style="width:100px;"><div id="bt_ct">
							<input type="checkbox" name="sel"
								value="<%=dto.getProduct_idx()%>">
						</div></td>
					<td id="dto"><a href="/woodong/product/productInfo.jsp?pidx=<%=dto.getProduct_idx()%>"><img style="width: 100px; height: 100px;" src="/woodong/product/img/productImg/<%=dto.getProduct_img()%>" alt="상품이미지"></a></td>
					<td id="dto"><%=dto.getUser_addr()%></td>
					<td id="dto"><%=dto.getProduct_price()%></td>
				</tr>
				<%
				}
				}
				%>
			</table>
		</section>
		<%@include file="/footer.jsp"%>
	</form>
</body>
</html>