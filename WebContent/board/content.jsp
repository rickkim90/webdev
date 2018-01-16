<%@page import="board.model.BoardDAO"%>
<%@page import="board.model.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	long no = Long.parseLong(request.getParameter("no"));
	BoardDAO boardDAO = BoardDAO.getInstance();
	BoardVO boardVO = boardDAO.getBoard(no);	
	
%>    
<!DOCTYPE html>

<style>
.mono_table {
	font-size :10pt;
    width: 100%;
    border-collapse: separate;
    border-spacing: 2px;
    border: none;
    color: #000;
}

.mono_table th {
    padding: 15px;
    background: url(http://nanati.me/img/monoptn.gif);
    border: none;
    font-weight: bold;
    text-align: center;
    vertical-align: middle;
    text-shadow: 0 1px #FFF;
}
 
.mono_table td {
    padding: 10px;
    border: none;
    border-bottom: 1px solid #000;
    text-align: left;
    vertical-align: baseline;
}
</style>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="/favicon.ico" />
</head>
<body>
<table class = "mono_table">
	<caption>게시물 상세보기</caption>
<tr>
	<th scope="row">글번호</th>
	<td><%=boardVO.getNo() %></td>
</tr>
<tr>
	<th scope="row">작성자</th>
	<td><%=boardVO.getName() %></td>
</tr>
<tr>
	<th scope="row">제목</th>
	<td><%=boardVO.getTitle() %></td>
</tr>
<tr>
	<th scope="row">내용</th>
	<td><%=boardVO.getContent() %></td>
</tr>
<tr>
	<th scope="row">날짜</th>
	<td><%=boardVO.getRegdate() %></td>
</tr>
<tr>
	<th scope="row">조회수</th>
	<td><%=boardVO.getViewcount() %></td>
</tr>
</table><br/>
<a href="list.jsp">리스트</a>
<a href="update.jsp?no=<%=boardVO.getNo()%>">수정</a>
<a href="delete.jsp?no=<%=boardVO.getNo()%>">삭제</a>

</body>
</html>