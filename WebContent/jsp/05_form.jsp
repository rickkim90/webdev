<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=" UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="05_process.jsp" method="get">
		이름 : <input type="text" name="name" autofocus="autofocus"/><br/>
		나이 : <input type="number" name="age" value="20"/><br/>
		취미 : <input type="checkbox" name="game"/>게임
		       <input type="checkbox" name="sleep"/>잠자기
		<input type="submit" value="확인" />
	</form>
</body>
</html>