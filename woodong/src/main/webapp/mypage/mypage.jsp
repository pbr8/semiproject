<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="woodong.product.*"%>
<jsp:useBean id="jjim_list_dto" class="woodong.product.ProductDTO"></jsp:useBean>
<jsp:setProperty property="*" name="jjim_list_dto" />
<jsp:useBean id="jjim_list_dao" class="woodong.product.ProductDAO"></jsp:useBean>

<jsp:useBean id="udao" class="woodong.user.UserDAO"></jsp:useBean>


<%

String userid=(String)session.getAttribute("sid");
if(userid == null || userid.equals("")) {
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
	function yes_no() {
		if (confirm("정말로 선택한 물품을 목록에서 삭제하시겠습니까?")) {
			location.href='jjim_List_Delete_ok.jsp';
		} else {
			
		}
	}
	
	function selectAll(selectAll)  {
		  const checkboxes 
		       = document.getElementsByName('sel');
		  
		  checkboxes.forEach((checkbox) => {
		    checkbox.checked = selectAll.checked;
		  })
		}
	function openpwdpopup() {
		window.open('pwdpopup.jsp','pwdpopup','width=500px,height=300px')
	}
</script>
<style>
body {
	margin: 0px auto;
	padding-top: 200px;
}

label {
	padding-left: 200px;
}

#c_section {
	text-align: center;
}


#my_center {
	border-collapse: separate;
	text-align: center;
	margin-left: auto;
	margin-right: auto;
	width: 1000px;
	height: 100px;
	transition: 0.9s;
	z-index: 1;
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

#list{
	width: 200px;
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
</style>
<body>
	<%@include file="/header.jsp"%>
	<form name=jjim_Del_key action="jjim_List_Delete_ok.jsp" method="post">
		<article>
			<nav class="list">
				<table id="my_center">
					<tr>
						<td id="list"><div><a href="myinfo.jsp">내 정보 보기</a> | <a href="javascript:openpwdpopup()">수정</a></div></a></td>
						<td id="list"><a href="jjimlist.jsp"><div>찜 목 록</div></a></td>
						<td id="list"><a href="selllist.jsp"><div>판 매 중</div></a></td>
						<td id="list"><a href="sellcompletion.jsp"><div>판 매
									완 료</div></a></td>
					<tr>
				</table>
		</article>
		<section id ="c_section">
			<table class="list_table">
				<tr>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>
		</section>
	</form>
</body>
<%@include file="/footer.jsp"%>
</html>