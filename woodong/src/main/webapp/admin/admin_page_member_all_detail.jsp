<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="woodong.user.*" %>
    
<jsp:useBean id="user_dao" class="woodong.user.UserDAO" scope="session"></jsp:useBean>
<%
String scp = request.getParameter("scp");
if(scp==null||scp.equals("")){
	scp="";
}
String nickname = request.getParameter("nickname");

UserDTO dto = user_dao.user_nickname_search(nickname);
if(dto==null){
%>
	<script>
		alert('등록된 회원이 없습니다.');
		location.href = 'admin_page_member.jsp';
	</script>
<%
	return;
}
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

        .header {
            width: 680px;
            display: flex;
            flex-direction: row-reverse;
            border-bottom: 1px solid gray;
            padding: 0.5em;
        }
        .header-msg {
            font-size: 0.1em;
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

        #table td {
            width: 500px;
            padding: 10px;
            vertical-align: top;
            border-bottom: 1px solid #ccc;  
            font-size: 11px;  
        }
        #div_b_back{
       		 text-align: center;
        }
        .b_css{
			border: 1px solid darkgray;
			background-color: rgb(0,0,0,0);
			color: gray;
			padding: 5px;
		}
    </style>
</head>
<body>
<%@ include file="adminPageHeader.jsp" %>
    <div id="title">
        <h2><%=dto.getUser_name() %> 회원의 상세 정보</h2>
    </div>

    <div id="div_table">
        <table id="table">
            <tr>
                <th>회원 번호</th>
                <td><%=dto.getUser_idx() %></td>
            </tr>
            <tr>
                <th>아이디</th>
                <td><%=dto.getUser_id() %></td>
            </tr>
            <tr>
                <th>닉네임</th>
                <td><%=dto.getUser_nickname() %></td>
            </tr>
            <tr>
                <th>비밀번호</th>
                <td><%=dto.getUser_pwd() %></td>
            </tr>
            <tr>
                <th>이름</th>
                <td><%=dto.getUser_name() %></td>
            </tr>
            <tr>
                <th>주민번호</th>
                <td><%=dto.getUser_resident_num() %></td>
            </tr>
            <tr>
                <th>주소</th>
                <td><%=dto.getUser_addr() %></td>
            </tr>
            <tr>
                <th>이메일</th>
                <td><%=dto.getUser_email() %></td>
            </tr>
            <tr>
                <th>가입 날짜</th>
                <td><%=dto.getUser_joindate() %></td>
            </tr>
        </table>
    </div>
    <div id="div_b_back">
    	<input type="button" value="목록" onclick="location.href ='admin_page_member_all.jsp?cp=<%=scp %>'" class="b_css">
    </div>
</body>
</html>










