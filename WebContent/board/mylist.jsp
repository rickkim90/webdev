<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="board.model.BoardVO"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	long pg = 1;
	try{
		pg = Long.parseLong(request.getParameter("pg"));		
	}catch(Exception e){}
	
	
	Connection cn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	String sql_totalcount = "select count(*) as cnt from tb_board";
	
	StringBuffer sql = new StringBuffer();
	sql.append(" select B.*");
	sql.append(" from(select rownum AS rnum, A.*");
	sql.append(" from(select  no , title, name, regdate, viewcount");
	sql.append(" from tb_board");
	sql.append(" order by no desc) A)B");
	sql.append(" where rnum between ? and ?");
	
	int pageSize = 10;
	long startnum = (pg-1) * pageSize+1;
	long endnum = pg * pageSize;
	long totalCount = 0;   // 전체 게시물 수
	long pageCount = 0;
	long nowpageSize = 10;
	
	List<BoardVO> list = new ArrayList<BoardVO>();
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		cn = DriverManager.getConnection(
				"jdbc:oracle:thin:@localhost:1521:xe","bigdata","bigdata");
		ps = cn.prepareStatement(sql_totalcount);
		rs = ps.executeQuery();

		if(rs.next()){
			totalCount = rs.getLong("cnt");			
		}
			pageCount = totalCount / pageSize; // 전체 페이지수
		if ( totalCount % pageCount!= 0){
			pageCount ++;			
		}
		
		
		
		ps = cn.prepareStatement(sql.toString());
		ps.setLong(1, startnum);
		ps.setLong(2, endnum);
				
		rs = ps.executeQuery();
						
		while(rs.next()){
			BoardVO boardVO = new BoardVO();
			boardVO.setNo(rs.getLong("no"));
			boardVO.setName(rs.getString("name"));
			boardVO.setTitle(rs.getString("title"));
			boardVO.setRegdate(rs.getDate("regdate"));
			boardVO.setViewcount(rs.getInt("viewcount"));
			list.add(boardVO);
		}
	}catch(Exception e){
		
	}finally{
		if(rs!=null)try{rs.close();} catch(Exception e){}
		if(ps!=null)try{ps.close();} catch(Exception e){}
		if(cn!=null)try{cn.close();} catch(Exception e){}
		
	}
%>


<!DOCTYPE html>

<html>
<style>
table.type08 {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
    border-left: 1px solid #ccc;
    margin: 20px 10px;
}

table.type08 thead th {
    padding: 10px;
    font-weight: bold;
    border-top: 1px solid #ccc;
    border-right: 1px solid #ccc;
    border-bottom: 2px solid #c00;
    background: #dcdcd1;
}
table.type08 tbody th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
    background: #ececec;
}
table.type08 td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
}
</style>
<head>
<meta charset="UTF-8">
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
<% 
	long controlp=0;
	try{
	controlp = Long.parseLong(request.getParameter("controlp"));
	
	}catch(Exception e){}
	nowpageSize =nowpageSize+controlp;
%>
<%=nowpageSize %>
<table class="type08">
	<caption>게시물 리스트</caption>
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
	<td scope='row'><a href="content.jsp?no=<%=boardVO.getNo() %>"><%=boardVO.getTitle() %></a></td>
	<td scope='row'><%=boardVO.getRegdate() %></td>
	<td scope='row'><%=boardVO.getViewcount() %></td>
</tr>
<%} %>

<tr>

	<td colspan ="5" align="center">
	<a onclick="func_controlp(-10)" style="cursor:pointer;"> < </a>
	<a href="list.jsp?pg=1">[처음으로]</a>
		<a>&nbsp;</a>
	<%
	for(long p=1+controlp; p <= pageSize+controlp; p++){%>
		<a href="list.jsp?pg=<%=p %>"><%=p %></a>
	<%}%>
	<a>...</a>
	<a href="list.jsp?pg=<%=pageCount%>"> <%=pageCount%></a>
	<a onclick="func_controlp(10)" style="cursor:pointer;"> > </a>
	</td>
</tr>
	
	

</tbody>

</table><br/>
<a href="insert.jsp">글쓰기</a><br/>
</form>
</body>
</html>