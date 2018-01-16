<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url(../jsp/03_want.css);
</style>
</head>
<body>
<div id="want"><img src="../img/want.png" width="60%" /></div>
<div class="say"><h3>자네 <%=request.getParameter("want") %> 해 볼 생각없나?
</h3></div>
</body>
</html>