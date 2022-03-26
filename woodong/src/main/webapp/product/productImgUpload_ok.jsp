<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
MultipartRequest mr=null;
String savepath="D:\\ezen\\spwoodong\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\woodong\\product\\img\\productImg";
int maxsize=1024*1024*10;
try{
	mr=new MultipartRequest(request,savepath,maxsize,"utf-8",new DefaultFileRenamePolicy());
}catch(Exception e){
	e.printStackTrace();
	out.println("업로드 예외 발생!\n고객센터로 연락 바랍니다.\ntel: 02-393-4321");
}
if(mr.getFilesystemName("imgUpload")==null||mr.getFilesystemName("imgUpload").equals("")){
	%>
	<script>
	opener.document.getElementById('imgThumb').src='/woodong/product/img/productImg/imgnone.jpg';
	opener.document.productUploadDateForm.product_img.value='<%=mr.getFilesystemName("imgUpload")%>';
	self.close();
	</script>
	<%
}else{
	%>
	<script>
	opener.document.getElementById('imgThumb').src='/woodong/product/img/productImg/<%=mr.getFilesystemName("imgUpload")%>';
	opener.document.productUploadDateForm.product_img.value='<%=mr.getFilesystemName("imgUpload")%>';
	self.close();
	</script>
	<%
}
%>
