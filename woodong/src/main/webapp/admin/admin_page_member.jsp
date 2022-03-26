<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            display: flex;
            justify-content: center;
        }
        #img_management{
            width: 35px;
            height: 35px;
            margin-top: 21px;
        }
        .all{
            border-top: 0.5px solid ;
            border-bottom: 0.5px solid ;
            text-align: center;
            width: 500px;
            margin: 0 auto;
            margin-top: 20px;
        }
        .search{
            border-top: 0.5px solid ;
            border-bottom: 0.5px solid ;
            text-align: center;
            width: 500px;
            margin: 0 auto;
            margin-top: 100px;
        }
        #line{
            border-bottom: 1px solid red;
            width: 350px;
            margin: 0 auto;
        }
        .search{
            margin-top: 20px;
            margin-bottom: 20px;
        }
        .click:link{
            color: black;
            font-size: 20px;
            text-decoration: none;      
        }
        .click:visited{
            color: black;
            font-size: 20px;
            text-decoration: none;
        }
        .click:hover{
            color: crimson;
            font-size: 22px;
            text-decoration: none;
        }
        #button{
            border: 1px solid red;
            background-color: rgba(0, 0, 0, 0);
            padding: 5px;
            border-radius: 8px;
        }
        #div_nickname{
            margin-top: 10px;
            margin-bottom: 10px;
        }
        .dickname_search{
            display: flex;
            justify-content: center;
        }
        #nickname{
            border: 2px solid red;
            border-radius: 8px;
        }
        #allText{
            margin-left: 34%;
            margin-top: 20px;
            margin-bottom: 20px;
            border: 1px solid red;
            width: 150px;
            height: 50px;
            padding-bottom: 22px;
        }
    	

    </style>
    <script>
        // let nickname = '';

        const getNickname = () => {
            const firstNickname = document.getElementById('nickname').value;
            location.href = 'admin_page_member_all_detail.jsp?nickname='+firstNickname;
            // nickname = firstNickname;

        //     if(document.getElementById("second").style.display=='none'){
        //         document.getElementById("second").style.display = 'block';
        //         document.getElementById("all").style.display = "none";
        //         document.getElementById("search").style.display = "none";
        //     }
        //     document.getElementById("test").innerHTML(nickname);
        }
        
        
    </script>
</head>
<body>
<%@ include file="adminPageHeader.jsp" %>
    <div id="title">
        <div>
            <img src="adminIMG/수정이미지.svg" id="img_management">
        </div>
        <div>
            <h2>회원 관리</h2>
        </div>    
    </div>

    <div class="all">
        <div id="allText">
            <div id="allh2">
            <h2><a href="admin_page_member_all.jsp" class="click">모든 회원 보기</a></h2>
            </div>
        </div>
    </div>

    <div class="search">
        <h2>회원 검색</h2>
        <div id="line"></div>
        <div id="div_nickname">
            <div class="dickname_search">
                <div>
                    <label>닉네임 &nbsp;</label>
                </div>
                <div>
                    <input type="text" id="nickname" required="required">
                </div>
                <div>
                    &nbsp;
                    <img src="adminIMG/돋보기.jpg" onclick="getNickname()">
                </div> 
            </div>
        </div>
    </div>
</body>
</html>