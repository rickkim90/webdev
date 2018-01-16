<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%!int global_count=0;%>
<!DOCTYPE html>

<html>
<head>
<script type="text/javascript" src="jquery-3.2.1.js"></script>
<meta charset=" UTF-8">
<title>Insert title here</title>

<style> 
body {
    background: url('giphy-downsized-large.gif') no-repeat center center fixed;

   -webkit-background-size: cover;

   -moz-background-size: cover;

   -o-background-size: cover;

   background-size: cover;

}
</style>

</head>
<body>
<!--<img src ="../img/giphy-downsized.gif" onload="scaleToFullScreen()"/><br/>  -->

<%
global_count++;
if(global_count%2==1){
	out.println("당신의 아이피는 "+request.getRemoteAddr()+" 입니다.");
}else{

	out.println("당신의 pc는 감염되었습니다.");
	
}
%>

</body>
</html>