<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="woodong.user.*" %>

<jsp:useBean id="user_dao" class="woodong.user.UserDAO" scope="session"></jsp:useBean>
 
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
        .a_click:link{
            color: black;
            font-size: 20px;
            text-decoration: none;      
        }
        .a_click:visited{
            color: black;
            font-size: 20px;
            text-decoration: none;
        }
        .a_click:hover{
            color: crimson;
            font-size: 22px;
            text-decoration: none;
        }
        #searchName{
            margin-left: 190px;
      }
        .b_css{
         border: 1px solid darkgray;
         background-color: rgb(0,0,0,0);
         color: gray;
         padding: 5px;
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
                for(let i=0;i<document.member_delete.ck.length;i++){
                    document.member_delete.ck[i].checked = true;
               }
            }else{
               for(let i=0;i<document.member_delete.ck.length;i++){
                    document.member_delete.ck[i].checked = false;
               }
            }
        }
        
       
    </script>
</head>
<%
   int totalcnt = user_dao.getTotalCnt();    //총 게시물 수
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
<body>
<%@ include file="adminPageHeader.jsp" %>
    <div id="title">
        <h2>전체 회원</h2>
    </div>

    <div id="div_table">
        <form name="member_delete" action="member_delete_ok.jsp" onsubmit="return realDelete()"> 
            <table id="table">
               <thead>
                   <tr>
                       <th id="ck_th"><input type="checkbox" id="ck_all" onclick="allClick()"></th>
                       <th>회원 번호</th>
                       <th>닉네임</th>
                       <th>이름</th>
                       <th>가입 날짜</th>
                       <th>상세 정보</th>
                   </tr>
                </thead>
                <tbody>
                   <%
                   String select_value = request.getParameter("select_value");
                   String searchVal = request.getParameter("searchVal");
                   
                   List<UserDTO> dtos = user_dao.userList(cp, listsize, select_value, searchVal);
                   if(dtos==null||dtos.size()==0){
                   %>
                   <tr>
                       <td><input type="checkbox"></td>
                       <td colspan="5" align="center">등록된 회원이 없습니다.</td>
                   </tr>
                   <%   
                   }else{
                	   if(searchVal != null){
                		   totalcnt = dtos.size();
                		   totalpage = (totalcnt / listsize) + 1;
                	   }
                      for(UserDTO dto : dtos){
                    %>
                         <tr>
                            <td><input type="checkbox" name="ck" value="<%=dto.getUser_nickname() %>"></td>
                            <td><%=dto.getUser_idx() %></td>
                            <td><%=dto.getUser_nickname() %></td>
                            <td><%=dto.getUser_name() %></td>
                            <td><%=dto.getUser_joindate() %></td>
                            <td><a href="admin_page_member_all_detail.jsp?nickname=<%=dto.getUser_nickname() %>&scp=<%=s_cp %>" id="click" class="a_click">click</a></td>
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
                     if(usergroup != 0){
                     %>
                        <a href="admin_page_member_all.jsp?cp=<%=(usergroup - 1) * pagesize+pagesize %>">&lt;&lt;</a>
                     <%   
                     }
                     for(int i = (usergroup * pagesize + 1);i <= (usergroup * pagesize + pagesize); i++){
                     %>
                        &nbsp;&nbsp;<a href="admin_page_member_all.jsp?cp=<%=i %>"><%=i %></a>&nbsp;&nbsp;
                     <%      
                           if(i == totalpage) break;
                        }
                     if(usergroup != (totalpage/pagesize-(totalpage % pagesize == 0 ? 1 : 0))){
                     %>
                           <a href="admin_page_member_all.jsp?cp=<%= (usergroup + 1) * pagesize + 1 %>">&gt;&gt;</a>
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
                    <select name="select_value">
                        <option value="user_idx">회원 번호</option>
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