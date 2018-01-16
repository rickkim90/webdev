<%@page import="sun.util.locale.ParseStatus"%>
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
	Cookie[] cookies = request.getCookies();
	String id = "";
	if(cookies != null){
		for(int i=0; i<cookies.length; i++){
			if(cookies[i].getName().trim().equals("user_id")){
				id = cookies[i].getValue();
				
			}
		}
	}

%>


<form action="01_login_action.jsp" method="post">
<table>
	<caption>로그인</caption>

<tr>
	<th> 아이디 </th>
	<td><input type="text" name="user_id" value="<%=id %>"/></td>
</tr>
<tr>
	<th> 비밀번호 </th>
	<td><input type="password" name="user_pw"/></td>    
</tr>
<tr>
	<td></td>
	<td><input type="checkbox" name="save_id" value="check"/>아이디 저장</td>
</tr>

<tr>
	<td colspan="2" align="center">
		<input type="submit" value="완료"/>
	</td>
</tr>
</table>
</form>

</body>
</html>