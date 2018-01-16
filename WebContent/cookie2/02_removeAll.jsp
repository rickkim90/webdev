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
	Cookie cookie = new Cookie("user_id","");
	Cookie cookie2 = new Cookie("user_name","");
	Cookie cookie3 = new Cookie("user_level","");
	cookie.setMaxAge(0);
	cookie2.setMaxAge(0);
	cookie3.setMaxAge(0);
	response.addCookie(cookie);
	response.addCookie(cookie2);
	response.addCookie(cookie3);
%>
<h3> 모든 쿠키가 삭제되었습니다.</h3>

<a href="01_cookie_status.jsp">
삭제를 확인하려면 클릭하세요</a>

</body>
</html>