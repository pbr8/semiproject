<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="/woodong/css/header.css">
<script type="text/javascript">
	function openlogin() {
		window.open('/woodong/user/login.jsp','login','width=500px,height=320px')
	}	
</script>
<%
String sname=(String)session.getAttribute("sname");
String sid=(String)session.getAttribute("sid");
%>
<header>
	<section>
			<article>
				<%
				if(sname==null){
					%>
					<div class="login_join">
					<a href="javascript:openlogin()"><span>로그인</span></a> | <a href="/woodong/user/userJoin.jsp"><span>회원가입</span></a>
					</div>
					<%
				}else{
					%>
					<div class="login_join">
					<span><%=sname %>님 로그인 중</span> | <a href="/woodong/user/logout.jsp"><span>로그아웃</span></a>
					</div>
					<%
				}%>
				
			</article>
			<article>
			<table>
				<tr>
					<td colspan="2"><ul>
							<li><img src="/woodong/img/menu_bar_img.jpg"
								style="width: 30px;">
								<ul>
									<li><a href="/woodong/product/productList.jsp?pCategory=전체">전체</a></li>
									<li><a
										href="/woodong/product/productList.jsp?pCategory=의류">의류</a></li>
									<li><a
										href="/woodong/product/productList.jsp?pCategory=디지털 / 가전">디지털
											/ 가전</a></li>
									<li><a
										href="/woodong/product/productList.jsp?pCategory=스포츠 / 레저">스포츠
											/ 레저</a></li>
									<li><a
										href="/woodong/product/productList.jsp?pCategory=잡화">잡화</a></li>
									<li><a
										href="/woodong/product/productList.jsp?pCategory=식품">식품</a></li>
									<li><a
										href="/woodong/product/productList.jsp?pCategory=문구 / 도서">문구
											/ 도서</a></li>
									<li><a
										href="/woodong/product/productList.jsp?pCategory=완구 / 취미">완구
											/ 취미</a></li>
									<li><a
										href="/woodong/product/productList.jsp?pCategory=반려동물 용품">반려동물
											용품</a></li>
								</ul></li>
						</ul></td>
					<td>&nbsp;</td>
					<td colspan="2"><a href="/woodong/index.jsp"><img
							src="/woodong/img/logo_title.png" style="width: 200px;"></a>
					</td>
					<td>
						<form name="search_form" action="/woodong/product/productList.jsp">
							<input type="text" placeholder="상품명을 검색해보세요!"
								class="search_text_bar" name="search_text">
							<button type="submit"
								style="background-color: white; border: 0px;">
								<img src="/woodong/img/Search.jpg" style="width: 30px;">
							</button>
						</form>
					</td>
					<td id="s_hover"><a href="/woodong/product/productUpload.jsp"><span>판매하기</span></a></td>
					<td id="s_hover"><a href="/woodong/locationbbs/bbsList.jsp"><span>자유게시판</span></a></td>
					<td id="s_hover"><a href="/woodong/mypage/mypage.jsp"><span>마이페이지</span></a></td>
				</tr>
			</table>
		</article>
	</section>
	<hr>
</header>
