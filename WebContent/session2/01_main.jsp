<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset=" UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon"href="../favi.ico"/>
<%	
	if(session.getAttribute("user_id")==null||session.getAttribute("user_id")==""){%>
	<script type="text/javascript">
	alert('먼저 로그인을 하세요');
	location.href='01_session_form.jsp';
	</script>
	<%
		return;         // 이후 아래 문장은 실행하지 않도록 return
	} %>
</head>
<body>

<h1>세션테스트 중입니다.......</h1>

현재 
<%=session.getAttribute("user_id") %>
(<%=session.getAttribute("user_name") %>,
<%=session.getAttribute("user_level") %>)
회원님이 접속중입니다.<br/>

<a href="01_session.invalidate.jsp">로그아웃</a>

</body>
</html>