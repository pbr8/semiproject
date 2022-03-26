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

        .content {
            margin-top: 60px;
            display: flex;
            flex-direction: row;
            justify-content: center;
            text-align: center;
        }
        
        .div{
            margin-right: 150px;
        }

        .textimg{
            width: 135px;
        }

        .font{
            font-size: 22px;
        }

        .adminimg{
            margin-top: 80px;
            display: flex;
            justify-content: center;
        }

        #adminimg{
            margin-top: 18px;
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

        .scale {
        transform: scale(1);
        -webkit-transform: scale(1);
        -moz-transform: scale(1);
        -ms-transform: scale(1);
        -o-transform: scale(1);
        transition: all 0.3s ease-in-out;   /* 부드러운 모션을 위해 추가*/
        }
        .scale:hover {
        transform: scale(1.2);
        -webkit-transform: scale(1.2);
        -moz-transform: scale(1.2);
        -ms-transform: scale(1.2);
        -o-transform: scale(1.2);
        }

        .text{
            margin-top: 100px;
        }

    </style>
</head>
<body>
<%@ include file="adminPageHeader.jsp" %>
    <div>
        <div class="adminimg">
            <div><img src="adminIMG/관리자이미지.svg" id="adminimg"></div>
            <div><h1> 관리자님 안녕하세요!</h1></div>
        </div>

        <div class="content">
            <div class="div"> 
                <div class="imgWidth">
                    <div class="textimg scale">
                    <a href="admin_page_member.jsp"><img src="adminIMG/content-icon.svg" ></a>
                    <h3 class="font" class="text">회원관리</h3>
                    </div>
                </div>
            </div>

            <div>
                <div class="textimg scale">
                    <a href="admin_page_product_bbs.jsp"><img src="adminIMG/content-icon.svg"></a>
                    <h3 class="font" class="text">게시글 관리</h3>
                </div>
            </div>
        </div>

    </div>
</body>
</html>