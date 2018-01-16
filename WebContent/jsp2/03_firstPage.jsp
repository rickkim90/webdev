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
	pageContext.setAttribute("name","page man");
	request.setAttribute("name", "request man");
	session.setAttribute("name","session man");
	application.setAttribute("name","application man");
	
	out.println("firstPage.jsp : <br/>");
	out.println("하나의 페이지 속성 : "+pageContext.getAttribute("name")+"<br/>");
	out.println("하나의 요청 속성 : "+request.getAttribute("name")+"<br/>");
	out.println("하나의 세션 속성 : "+session.getAttribute("name")+"<br/>");
	out.println("하나의 어플리케이션 속성 : "+application.getAttribute("name")+"<br/>");
	
	request.getRequestDispatcher("03_secondPage.jsp").forward(request, response);
%>

</body>
</html>