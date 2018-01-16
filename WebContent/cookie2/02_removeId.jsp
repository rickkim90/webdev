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
	cookie.setMaxAge(0);
	response.addCookie(cookie);
%>
<h3> 아이디 쿠키가 삭제되었습니다.</h3>

<a href="01_cookie_status.jsp">
삭제를 확인하려면 클릭하세요</a>

</body>
</html>