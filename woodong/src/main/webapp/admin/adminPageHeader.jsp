<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
</head>
<header>
	 <div class="header">
	       <div>
	           <span class="header-msg">관리자 페이지</span> |
	           <span class="header-msg"><a href="/woodong/user/logout.jsp" style="text-decoration: none; color: black;">로그아웃</a></span>
	       </div>
	 </div>
	 <nav>
		<ul>
			<li><a href="/woodong/admin/adminPage.jsp" class="li_click">Home</a></li>
			<li><a href="/woodong/admin/admin_page_member.jsp" class="li_click">회원 관리</a></li>
			<li><a href="/woodong/admin/admin_page_product_bbs.jsp" class="li_click">게시글 관리</a></li>
		</ul>
	</nav>
</header>
</html>