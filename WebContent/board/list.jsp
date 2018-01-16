<%@page import="board.model.BoardDAO"%>
<%@page import="java.util.List"%>
<%@page import="board.model.BoardVO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	long pg = 1;
	try{
		pg = Long.parseLong(request.getParameter("pg"));		
	}catch(Exception e){}
	
	int pageSize = 10;
	long startnum = (pg-1) * pageSize+1;
	long endnum = pg * pageSize;
	long totalCount = 0;   // 전체 게시물 수
	long pageCount = 0;
	long blockSize = 10;
	long startPage = (pg-1)/blockSize*blockSize+1;
	long endPage = (pg-1)/blockSize*blockSize+10;
	
	BoardDAO boardDAO = BoardDAO.getInstance();
	totalCount = boardDAO.getTotalCount();
	List<BoardVO> list = boardDAO.getBoardList(startnum,endnum);
	
	
	pageCount = totalCount / pageSize; // 전체 페이지수
	if ( totalCount % pageCount!= 0){pageCount ++;}
	if(endPage>pageCount){endPage = pageCount;}
%>


<!DOCTYPE html>

<html>
<style>
table.type09 {
	font-size :10pt;
    border-collapse: collapse;
    text-align: center;
    line-height: 1.5;

}
table.type09 thead th {
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #369;
    border-bottom: 3px solid #036;
}
table.type09 tbody th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #f3f6f7;
}
table.type09 td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
a{

font-size:10pt;
}

a:link{color:#1f2f49 ; text-decoration:none;}
a:visited{color:#94857c ; text-decoration:none;}
a:hover{color:#4885b5 ; text-decoration:underline;}
</style>
<head>
<meta charset="UTF-8">
<meta name = "viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="shortcut icon" href="/favicon.ico" />

<script type="text/javascript">
    function func_controlp(mm){
	var f = document.myform;
	f.controlp.value = mm;
	alert(mm);
	f.submit();
}
</script>
</head>
<body>
<form name="myform">
<input type="hidden" name="controlp" value="0"/>
<div align=center><img src="https://media.giphy.com/media/8OIhzCW65Szp6/giphy.gif" width = 270px; height = 150px;/>
<img src="https://media.giphy.com/media/8OIhzCW65Szp6/giphy.gif" width = 270px; height = 150px;/>
<img src="https://media.giphy.com/media/8OIhzCW65Szp6/giphy.gif" width = 270px; height = 150px;/>
<img src="https://media.giphy.com/media/8OIhzCW65Szp6/giphy.gif" width = 270px; height = 150px;/></div>
<table class="type09">
	<caption style=font-size:15pt;><b>자유 게시판</b></caption>
<thead>

<tr>
	<th scope='cols'>번호</th>
	<th scope='cols'>작성자</th>
	<th scope='cols'>제목</th>
	<th scope='cols'>작성일</th>
	<th scope='cols'>조회수</th>
</tr>
</thead>
<tbody>
<% for(BoardVO boardVO : list) { %>
<tr>
	<td scope='row'><%=boardVO.getNo() %></td>
	<td scope='row'><%=boardVO.getName() %></td>
	<td scope='row'><a href="content.jsp?no=<%=boardVO.getNo() %>" style="cursor: pointer;"><%=boardVO.getTitle() %></a></td>
	<td scope='row'><%=boardVO.getRegdate() %></td>
	<td scope='row'><%=boardVO.getViewcount() %></td>
</tr>
<%} %>

<tr>

	<td colspan ="5" align="center">
	
	<% if(startPage ==1){%>
	
	<%}else{%>
		<a href="list.jsp?pg=<%=startPage-1%>">[이전10개]</a>
	<%} %>
	 <a> &nbsp;</a>
	 <a href="list.jsp?pg=1" style="font-size:10pt;">첫페이지로</a>
	
	<%for(long p=startPage; p <= endPage; p++){%>
		<%if(p==pg){%>
		<%=p %>
		<%}else { %>
		<a href="list.jsp?pg=<%=p %>"><%=p %></a>
		<%}
	 }%>
	 
	 <a>...</a>
	 <a href="list.jsp?pg=<%=pageCount %>" style="font-size:10pt;">마지막으로</a>
	 <a> &nbsp;</a>

	<% if(endPage == pageCount){%>
		
	<%}else {%>
		<a href="list.jsp?pg=<%=endPage+1%>"> [다음10개]</a>
	<%} %>
	
	</td>
</tr>
	
	

</tbody>

</table><br/>
<a href="insert.jsp">글쓰기</a><br/>
<div align="center">
<img src="https://2.bp.blogspot.com/-NR73p8KyeUQ/Vw0QQwN2SBI/AAAAAAAAnqM/k919HnefgX0wkq5IbJGAEhj-eO5x5ldBwCLcB/s1600/decrypt-petya-Ransomware-tool.png" width = 900px; height = 120px;>
</div>
</form>
</body>
</html>