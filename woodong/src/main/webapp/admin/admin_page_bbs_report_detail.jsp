<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String subject = request.getParameter("subject");
	String name = request.getParameter("name");
	String date = request.getParameter("date");
	String content = request.getParameter("content");
	String cp = request.getParameter("cp");
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

        #table td {
            width: 500px;
            padding: 10px;
            vertical-align: top;
            border-bottom: 1px solid #ccc;  
            font-size: 11px;  
        }
        .b_css{
			border: 1px solid darkgray;
			background-color: rgb(0,0,0,0);
			color: gray;
			padding: 5px;
		}
		#b_back{
			text-align: center;
		}
       
    </style>
</head>
<body>
<%@ include file="adminPageHeader.jsp" %>
    <div id="title">
        <h2><%=name %> 님의 신고 내용</h2>
    </div>

    <div id="div_table">
        <table id="table">
            <tr>
                <th>게시글 제목</th>
                <td><%=subject %></td>
            </tr>
            <tr>
                <th>신고자</th>
                <td><%=name %></td>
            </tr>
            <tr>
                <th>신고 날짜</th>
                <td><%=date %></td>
            </tr>
            <tr>
                <th>신고 내용</th>
                <td><%=content %></td>
            </tr>
        </table>
    </div>
    <div id="b_back"><input type="button" value="목록" onclick="location.href='admin_page_bbs_report.jsp?<%=cp %>'" class="b_css"></div>
</body>
</html>