<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="woodong.bbs.*" %>
<%@ page import="woodong.heart.*" %>
<jsp:useBean id="bdao" class="woodong.bbs.BbsDAO" scope="session"></jsp:useBean>
<jsp:useBean id="hdto" class="woodong.heart.HeartDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="hdto"/>
<jsp:useBean id="hdao" class="woodong.heart.HeartDAO" scope="session"></jsp:useBean>
<%
String getListsize = request.getParameter("getListsize");
String selectVal=request.getParameter("selectVal");
String searchVal=request.getParameter("searchVal");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function goWrite(){
	location.href='locationbbswrite.jsp';
}
const selectA = () => {
   	let getListsize = document.getElementById("getListsize");
       for(var i=0; i<getListsize.length; i++){
           if(getListsize[i].value=='<%=getListsize%>'){
        	   getListsize[i].selected = true;
           }
       }
   }
const listsize = () => {
    const getListsize = document.getElementById('getListsize').value;
    
	
    if(getListsize==5){
    	location.href = 'bbsList.jsp?getListsize='+getListsize;
    }else if(getListsize==10){
        location.href = 'bbsList.jsp?getListsize='+getListsize;
    }else if(getListsize==15){
        location.href = 'bbsList.jsp?getListsize='+getListsize;
    }else if(getListsize==20){
        location.href = 'bbsList.jsp?getListsize='+getListsize;
    }
	
}
</script>
<style>
body{
	width: 1350px;
	margin-left: 350px;
	padding-top: 200px;
}
h2{
	text-align: center;
}
#leftside{
	float: left;
}
nav{
	border-top:1px solid #ff0000;
	border-bottom:1px solid #ff0000;
	background-color: #ff0000;
	border-radius: 5px;
}
nav li{
	list-style-type: none;
	display: inline;
	text-align: center;
	margin-left: 10px;
	color: white;
}
#mainTable{
	width: 1000px;
	border-spacing: 0px;
	border-radius: 5px;
}
#wbutton{
	float: right;
	background-color: #ff0000;
	border-radius:5px;
	width: 80px;
	height: 40px;
	color: white;
	border: none;
	cursor: pointer;
}
#view{
	float: right;
}
#foottable{
	margin: auto;
}
#tfoot{
	margin: auto;
}
.pageList{
	border: 1px solid #DCDCDC;
	margin-left:20px;
	text-align: center;
	width: 40px;
	height: 40px;
	font-size: 18px;
	color: gray;
	background-color: white;
}
.cp{
	border: 1px solid #DCDCDC;
	margin-left:20px;
	text-align: center;
	width: 40px;
	height: 40px;
	background-color: #ff0000;
	color: white;
	font-size: 18px;
}
.pageList a{
	text-decoration: none;
	color: gray;
}
.cp a{
	text-decoration: none;
	color: white;
}
#pagingTable{
	margin: 0px auto;
}
#wd{
	width: 50px;
}
.bbsInfo{
	border-bottom:1px solid black;
}
#mainTable td{
        
            padding: 10px;
            vertical-align: top;
            border-bottom: 1px solid #ccc;   
        }
.subtr{
	border-bottom:1px solid red;
}
</style>
</head>
<%
if(getListsize==null){
	getListsize = "15";
}
int get_listsize = Integer.parseInt(getListsize);

int totalCnt=bdao.localgetTotalCnt();//총 게시물수
int listSize=get_listsize;//보여줄 리스트수
int pageSize=5;//보여줄 페이지수
String s_cp=request.getParameter("cp");
if(s_cp==null||s_cp.equals("")){
	s_cp="1";
}
int cp=Integer.parseInt(s_cp);

int totalPage=(totalCnt/listSize)+1;
if(totalCnt%listSize==0)totalPage--;

int userGroup=cp/pageSize;
if(cp%pageSize==0)userGroup--;
%>
<body>
<%@include file="/header.jsp" %>
<%@include file="/subview.jsp" %>
<section>
	<article id="leftside">
		<h2><a href="bbsList.jsp" style="text-decoration: none; color: black">자유게시판</a></h2>
				<select id="getListsize" onchange="listsize()">
	                <option value="5">5개씩 보기</option>
	                <option value="10">10개씩 보기</option>
	                <option value="15">15개씩 보기</option>
	                <option value="20">20개씩 보기</option>
	            </select>
			<br>
		<table id="mainTable">
		</table>		
		<table id="mainTable">
		<thead id="mainTable" style="background-color:#ff0000">
				<tr class="subtr">
					<td>&nbsp;</td>
					<td style="text-align:center;">제목</td>
					<td>글쓴이</td>
					<td style="text-align:center;">작성일</td>
					<td style="text-align:center;">조회수</td>
					<td style="text-align:center;">추천</td>
				</tr>
		</thead>
			<tbody style="width: 1000px">
			<%
			ArrayList<BbsDTO> arr=bdao.localbbsList(cp,listSize,selectVal,searchVal);
			if(arr==null||arr.size()==0){
				%>
				<tr class="tr">
				 <td colspan="5" align="center">
				 등록된 게시글이 없습니다.
				</tr>
				<%
			}else{
				for(int i=0;i<arr.size();i++){
					int bbs_idx = arr.get(i).getBbs_idx();
					int heartcount = hdao.heartCount(bbs_idx);
					%>
					<tr > 
						<td><%=arr.get(i).getBbs_idx() %></td>
						<td>
						<%
						for(int z=1;z<=arr.get(i).getBbs_lev();z++){
							out.println("&nbsp;&nbsp;");
						}
						%>
						<a style="text-decoration: none; color:black;" href="locationbbscontent.jsp?bbs_idx=<%=arr.get(i).getBbs_idx() %>&bbs_readnum=<%=arr.get(i).getBbs_readnum()%>">
						<%=arr.get(i).getBbs_subject() %></a></td>
						<td>임시</td>
						<td style="width:100px" id="wd"><%=arr.get(i).getBbs_writedate() %></td>
						<td style="text-align:center;"><%=arr.get(i).getBbs_readnum() %></td>
						<td style="text-align:center;"><%=heartcount %></td>
					</tr>
					<%
				}
			}
			%>
			</tbody>
		</table>
		<table id="pagingTable">
    <tr>
					<%
if(userGroup!=0){
	%>
	<td class="pageList"><a href="bbsList.jsp?cp=<%=(userGroup-1)*pageSize+pageSize %>">&lt;&lt;</a></td>
	<%
}
%>

<%
for(int i=(userGroup*pageSize+1);
		i<=(userGroup*pageSize+pageSize);i++){
	if(i==cp){
		%><td class="cp"><a href="bbsList.jsp?cp=<%=i%>"><%=i%></a></td><%
	}else {
		%><td class="pageList"><a href="bbsList.jsp?cp=<%=i%>"><%=i%></a></td><%
	}
	if(i==totalPage)break;
}
%>

<%
if(userGroup!=(totalPage/pageSize-(totalPage%pageSize==0?1:0))){
	%>
	<td class="pageList"><a href="bbsList.jsp?cp=<%=(userGroup+1)*pageSize+1 %>">&gt;&gt;</a></td>
	<%
}
%>
</tr>
</table>
		<br>
		<form>
		<table id="foottable">
			<tr>
				<td><select id="selectVal" name="selectsub">
				<option value="user_id">아이디</option>
				<option value="user_nickname">닉네임</option>
				</select></td>
				<td><input type="text" name="searchVal"></td>
				<td><input type="submit" value="검색" style="background-color: #ff0000;color:white; border: none;border-radius: 5px; width:50px; height: 25px;"></td>
			</tr>
		</table>
		</form>
			<input type="button" value="글쓰기" id="wbutton" onclick="goWrite()">
	</article>
</section>
</body>
</html>