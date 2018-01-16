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
<h3> 클라이언트로부터 얻어온 Cookie </h3>
<%
	Cookie[] cookies = request.getCookies();
	for(Cookie c:cookies){
// 		out.println("Domain : "+c.getDomain()+"<br>");
// 		out.println("Path : "+c.getPath()+"<br>");
// 		out.println("Version : "+c.getVersion()+"<br>");
		out.println(c.getName()+" : "+c.getValue()+"<br>");
		out.println(c.getMaxAge());
		out.println("<hr/>");
	}
%>

</body>
</html>