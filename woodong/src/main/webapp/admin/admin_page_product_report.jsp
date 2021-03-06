<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="woodong.product.report.*" %>

<%
   String select = request.getParameter("select");
%>

<jsp:useBean id="product_report_dao" class="woodong.product.report.ProductReportDAO" scope="session"></jsp:useBean>
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
        #ck_td{
            width: 50px;
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
         let answer = confirm('?????? ?????????????????????????');
            if(answer){
               return true;
            }else{
               return false;
            }
      }
       const allClick = () => {
           if(document.getElementById('ck_all').checked){
               for(let i=0;i<document.admin_page_product_report_delete.ck.length;i++){
                   document.admin_page_product_report_delete.ck[i].checked = true;
              }
           }else{
              for(let i=0;i<document.admin_page_product_report_delete.ck.length;i++){
                   document.admin_page_product_report_delete.ck[i].checked = false;
              }
           }
       }

        const bbsList = () => {
            const select_result = document.getElementById('bbss').value;
            if(select_result=='??????'){
                location.href = 'admin_page_product_bbs.jsp';
            }else if(select_result=='?????????'){
                location.href = 'admin_page_bbs.jsp';
            }else if(select_result=='?????? ??????'){
                location.href = 'admin_page_product_report.jsp';
            }else if(select_result=='????????? ??????'){
                location.href = 'admin_page_bbs_report.jsp';
            }
        }
    </script>
</head>
<%	String selectVal = request.getParameter("selectVal");
	String searchVal = request.getParameter("searchVal");
   
   int totalcnt = product_report_dao.getTotalCnt(selectVal, searchVal);    //??? ????????? ???
   int listsize = 10;    //????????? ????????? ???
   int pagesize = 5;   //????????? ????????? ???
   
   String s_cp = request.getParameter("cp");      //???????????? 1??? ??? ?????? ???????????? ????????? ?????? ???
   if(s_cp==null||s_cp.equals("")){
      s_cp = "1";
   }
   int cp = Integer.parseInt(s_cp);      //?????? ???????????? ?????? ????????? 
   
   int totalpage = (totalcnt / listsize) + 1;   //??? ????????? ???
   if(totalcnt%listsize == 0) totalpage--;      //??? ????????? ?????? ???????????? ?????? -1??? ??????
   
   //???????????? ?????? ??????
   int usergroup = (cp / pagesize);
   if(cp%pagesize == 0) usergroup--;            //???????????? ??? ??? ???????????? ????????? ?????? ???????????? 1??? ??? ?????? ????????? ????????? ????????? ?????? ???

%>
<body onload="selectA()">
<%@ include file="adminPageHeader.jsp" %>
    <div id="title">
        <h2>?????? ??????</h2>
    </div>

    <div id="div_table">
        <div>
           <span>
               <select id="bbss" onchange="bbsList()">
                   <option value="??????">??????</option>
                   <option value="?????????">?????????</option>
                   <option value="?????? ??????" selected>?????? ??????</option>
                   <option value="????????? ??????">????????? ??????</option>
               </select>
            </span>
        </div>
        <form name="admin_page_product_report_delete" action="admin_page_product_report_delete_ok.jsp" onsubmit="return realDelete()">
            <table id="table">
               <thead>
                   <tr>
                       <th><input type="checkbox" id="ck_all" onclick="allClick()"></th>
                       <th>??????</th>
                       <th>?????? ??????</th>
                       <th>?????? ??????</th>
                       <th>?????????</th>
                       <th>?????? ??????</th>
                       <th>?????? ?????? ??????</th>
                   </tr>
                </thead>
                <tbody>
                     <%
                   List<ProductReportDTO> dtos = product_report_dao.productReportList(cp, listsize, selectVal, searchVal);
                   if(dtos==null||dtos.size()==0){
                   %>
                   <tr>
                       <td id="ck_td"><input type="checkbox"></td>
                       <td colspan="6">????????? ???????????? ????????????.</td>
                   </tr>
                   <%   
                   }else{
                        for(ProductReportDTO dto : dtos){
                    %>
                            <tr>
                             <td><input type="checkbox" name="ck" value="<%=dto.getP_report_idx()%>"></td>
                             <td><%=dto.getP_report_idx()%></td>
                             <td><%=dto.getProduct_idx()%></td>
                             <td><a href="admin_page_product_bbs_detail.jsp?product_idx=<%=dto.getProduct_idx()%>" class="click"><%=dto.getProduct_subject()%></a></td>
                             <td><%=dto.getUser_name()%></td>
                             <td><%=dto.getProduct_report_reportdate()%></td>
                             <td>
                             <a href="admin_page_product_report_detail.jsp?subject=<%=dto.getProduct_subject() %>&name=<%=dto.getUser_name()%>&date=<%=dto.getProduct_report_reportdate()%>&content=<%=dto.getProduct_report_content()%>" class="click">click</a>
                             </td>
                           </tr>
                   <%         
                      }
                   }
                   %>
                </tbody>
                <tfoot>
                   <tr>
                      <td colspan="7" align="center">
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
                        <a href="admin_page_product_report.jsp?cp=<%=(usergroup - 1) * pagesize+pagesize %><%=selectQueryParam %><%=searchQueryParam %>">&lt;&lt;</a>
                     <%   
                     }
                     %>
                     
                     <%
                        for(int i = (usergroup * pagesize + 1);i <= (usergroup * pagesize + pagesize); i++){
                     %>
                        &nbsp;&nbsp;<a href="admin_page_product_report.jsp?cp=<%=i %><%=selectQueryParam %><%=searchQueryParam %>"><%=i %></a>&nbsp;&nbsp;
                     <%      
                           if(i == totalpage) break;
                        }
                     %>
                     
                     <%
                        if(usergroup != (totalpage/pagesize-(totalpage % pagesize == 0 ? 1 : 0))){
                     %>
                           <a href="admin_page_product_report.jsp?cp=<%= (usergroup + 1) * pagesize + 1 %><%=selectQueryParam %><%=searchQueryParam %>">&gt;&gt;</a>
                     <%       
                        }
                     %>
                      </td>
                   </tr>
                </tfoot>
            </table>
            <span>
                <input type="submit" value="??????" class="b_css">
            </span>
        </form>
        <form>
            <div id="searchName">
                <span id="searchName">
                    <select name="selectVal">
                        <option value="product_idx">?????? ??????</option>
                        <option value="user_name">?????????</option>
                    </select>
                    <input type="text" name="searchVal" required="required">
                    <input type="submit" value="??????" class="b_css">
                </span>
            </div>
        </form>
    </div>
</body>
</html>