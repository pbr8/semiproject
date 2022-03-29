<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="woodong.product.*" %>

<jsp:useBean id="product_dao" class="woodong.product.ProductDAO" scope="session"></jsp:useBean>
<%
   String select = request.getParameter("select");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="stylesheet" type="text/css" href="/woodong/css/adminPageHeader.css">
<style>
       body{
           margin: 0 auto;
           width: 680px;
       }
       #title{
           text-align: center;
           margin-top: 50px;
       }
       #div_table{
           margin: 0 auto;
       }

       #table{
           border-collapse: separate;
           border-spacing: 1px;
           text-align: left;
           border-top: 1px solid #ccc;
       }

       #table th {
           width: 150px;
           font-weight: bold;
           vertical-align: top;
           border-bottom: 1px solid #ccc;
           background: whitesmoke;
           font-size: 13px;

           }
       #ck_th{ 
           height: 10px;
       }

       #table td {
           width: 500px;
           padding: 10px;
           vertical-align: top;
           border-bottom: 1px solid #ccc;  
           font-size: 11px;  
       }
       #click{
           font-size: 9px;
       }
       .click:link{
           color: black;
           font-size: 10px;
           text-decoration: none;      
       }
       .click:visited{
           color: black;
           font-size: 10px;
           text-decoration: none;
       }
       .click:hover{
           color: crimson;
           font-size: 10px;
           text-decoration: none;
       }
       #searchName{
           text-align: center;
       }
       .b_css{
      border: 1px solid darkgray;
      background-color: rgb(0,0,0,0);
      color: gray;
      padding: 5px;
   }
   #select_num{
      margin-left: 30em; 
   }
</style>
<script>
	const realDelete = () => {
	    let answer = confirm('정말 삭제하시겠습니까?');
	       if(answer){
	          return true;
	       }else{
	          return false;
	       }
	 }

    const allClick = () => {
        if(document.getElementById('ck_all').checked){
            for(let i=0;i<document.admin_page_product_bbs_delete.ck.length;i++){
                document.admin_page_product_bbs_delete.ck[i].checked = true;
           }
        }else{
           for(let i=0;i<document.admin_page_product_bbs_delete.ck.length;i++){
                document.admin_page_product_bbs_delete.ck[i].checked = false;
           }
        }
    }

       const bbsList = () => {
           const select_result = document.getElementById('bbss').value;
           if(select_result=='물품'){
               location.href = 'admin_page_product_bbs.jsp';
           }else if(select_result=='게시글'){
               location.href = 'admin_page_bbs.jsp';
           }else if(select_result=='물품 신고'){
               location.href = 'admin_page_product_report.jsp';
           }else if(select_result=='게시글 신고'){
               location.href = 'admin_page_bbs_report.jsp';
           }
       }
       

</script>
</head>
<% 	String selectVal = request.getParameter("selectVal");
	String searchVal = request.getParameter("searchVal");
   
   int totalcnt = product_dao.getTotalCnt(selectVal, searchVal);    //총 게시물 수
   int listsize = 10;    //보여줄 리스트 수
   int pagesize = 5;   //보여줄 페이지 수
   
   String s_cp = request.getParameter("cp");      //페이지가 1일 땐 값이 없으므로 조건을 줘야 함
   if(s_cp==null||s_cp.equals("")){
      s_cp = "1";
   }
   int cp = Integer.parseInt(s_cp);      //현재 사용자가 있는 페이지 
   
   int totalpage = (totalcnt / listsize) + 1;   //총 페이지 수
   if(totalcnt%listsize == 0) totalpage--;      //딱 떨어질 때를 조건으로 줘서 -1을 해줌
   //사용자의 현재 그룹
   int usergroup = (cp / pagesize);
   if(cp%pagesize == 0) usergroup--;            //그룹화할 때 딱 떨어지는 애들은 같은 그룹보다 1씩 더 많기 때문에 이렇게 조건을 줘야 함
   
%>
<body onload="selectA()">
<%@ include file="adminPageHeader.jsp" %>
    <div id="title">
        <h2>물품 게시글</h2>
    </div>

    <div id="div_table">
        <div>
           <span>
               <select id="bbss" onchange="bbsList()">
                   <option value="물품" selected>물품</option>
                   <option value="게시글">게시글</option>
                   <option value="물품 신고">물품 신고</option>
                   <option value="게시글 신고">게시글 신고</option>
               </select>
            </span>
        </div>
        <form name="admin_page_product_bbs_delete" action="admin_page_product_bbs_delete_ok.jsp" onsubmit="return realDelete()">
           <table id="table">
                 <thead>
                   <tr>
                       <th><input type="checkbox" id="ck_all" onclick="allClick()"></th>
                       <th>번호</th>
                       <th>제목</th>
                       <th>닉네임</th>
                       <th>지역</th>
                       <th>작성 날짜</th>
                   </tr>
           		</thead>
            	<tbody>
                     <%
                   List<ProductDTO> dtos = product_dao.productList(cp, listsize, selectVal, searchVal);
                   if(dtos==null||dtos.size()==0){
                   %>
                   <tr>
                       <td id="ck_td"><input type="checkbox"></td>
                       <td colspan="5">등록된 물품이 없습니다.</td>
                   </tr>
                   <%   
                   }else{
                      for(ProductDTO dto : dtos){
                    %>
                            <tr>
                             <td><input type="checkbox" name="ck" value="<%=dto.getProduct_idx()%>"></td>
                             <td><%=dto.getProduct_idx()%></td>
                             <td><a href="admin_page_product_bbs_detail.jsp?product_idx=<%=dto.getProduct_idx()%>" class="click"><%=dto.getProduct_subject()%></a></td>
                             <td><%=dto.getUser_nickname()%></td>
                             <td><%=dto.getUser_addr()%></td>
                             <td><%=dto.getProduct_writedate()%></td>
                           </tr>
                   <%         
                      }
                   }
                   %>
                </tbody>
            <tfoot>
                   <tr>
                      <td colspan="6" align="center">
                     <%
	                    String selectQueryParam = "";
	                  	String searchQueryParam = "";
	                   	if(selectVal != null) {
	                   		selectQueryParam = "&selectVal=" + selectVal;
	                   	}
	                   	if(searchVal != null) {
	                   		searchQueryParam = "&searchVal=" + searchVal;
	                   	}
                     if(usergroup != 0){
                     %>
                        <a href="admin_page_product_bbs.jsp?cp=<%=(usergroup - 1) * pagesize+pagesize %><%=selectQueryParam %><%=searchQueryParam %>">&lt;&lt;</a>
                     <%   
                     }
                     for(int i = (usergroup * pagesize + 1);i <= (usergroup * pagesize + pagesize); i++){
                     %>
                        &nbsp;&nbsp;<a href="admin_page_product_bbs.jsp?cp=<%=i %><%=selectQueryParam %><%=searchQueryParam %>"><%=i %></a>&nbsp;&nbsp;
                     <%      
                           if(i == totalpage) break;
                     }
                     if(usergroup != (totalpage/pagesize-(totalpage % pagesize == 0 ? 1 : 0))){
                     %>
                           <a href="admin_page_product_bbs.jsp?cp=<%= (usergroup + 1) * pagesize + 1 %><%=selectQueryParam %><%=searchQueryParam %>">&gt;&gt;</a>
                     <%       
                        }
                     %>
                      </td>
                   </tr>
                </tfoot>
            </table>
            <span>
                <input type="submit" value="삭제" class="b_css">
            </span>
        </form>
        <form>
            <div id="searchName">
                <span>
                    <select name="selectVal">
                        <option value="product_idx">상품 번호</option>
                        <option value="user_nickname">닉네임</option>
                    </select>
                    <input type="text" name="searchVal" required="required">
                    <input type="submit" value="검색" class="b_css">
                </span>
            </div>
        </form>
    </div>
</body>
</html>