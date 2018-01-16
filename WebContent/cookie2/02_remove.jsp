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
    String[] names =request.getParameterValues("name");
    for(String name : names){

	Cookie cookie = new Cookie(name,"");
	cookie.setMaxAge(0);
	response.addCookie(cookie);
	out.println(name+" 쿠키가 삭제되었습니다.<br>");
    }
%>


<a href="01_cookie_status.jsp">
삭제를 확인하려면 클릭하세요</a>

</body>
</html>