<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=" UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon"href="../favi.ico"/>
</head>
<body>
<%
String id="pinksung";
String pwd="1234";
String name="한솔";
request.setCharacterEncoding("UTF-8");
if(id.equals(request.getParameter("id"))&&
	pwd.equals(request.getParameter("pwd")) ){
	response.sendRedirect("07_main.jsp?name="+URLEncoder.encode(name,"UTF-8"));
}else{
	response.sendRedirect("07_loginForm.jsp");
}

%>

</body>
</html>