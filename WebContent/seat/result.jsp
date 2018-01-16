<%@page import="java.sql.DriverManager"%>
<%@page import="board.model.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Connection cn = null;
    PreparedStatement ps  = null;
    ResultSet rs = null;
    
    StringBuffer sql = new StringBuffer();
    sql.append(" select count(*) co");
    sql.append(" from multi501");
    sql.append(" where seat = 'Y'");
  
    
    int co = 0;
    
    try{
    	Class.forName("oracle.jdbc.OracleDriver");
		cn = DriverManager.getConnection("jdbc:oracle:thin:@70.12.50.50:1521:xe","dream20","catcher");
		ps = cn.prepareStatement(sql.toString());
		rs = ps.executeQuery();
		out.println("");	
		while(rs.next()){
			co = rs.getInt("co");


	
		}
    }catch(Exception e){
    	e.printStackTrace();
    	
    }finally{
    	
    	if(rs!=null) try{rs.close();} catch(Exception e){}
    	if(ps!=null) try{ps.close();} catch(Exception e){}
    	if(cn!=null) try{cn.close();} catch(Exception e){}
    	    	
    }

    
%>

<%
	Connection cn2 = null;
    PreparedStatement ps2  = null;
    ResultSet rs2 = null;
    
    StringBuffer sql2 = new StringBuffer();
    sql2.append(" select count(*) fi");
    sql2.append(" from multi501");
    sql2.append(" where first = 'A'");
  
    
    int fi = 0;
    
    try{
    	Class.forName("oracle.jdbc.OracleDriver");
		cn2 = DriverManager.getConnection("jdbc:oracle:thin:@70.12.50.50:1521:xe","dream20","catcher");
		ps2 = cn2.prepareStatement(sql2.toString());
		rs2 = ps2.executeQuery();
		out.println("");	
		while(rs2.next()){
			co = rs2.getInt("fi");
		}
    }catch(Exception e){
    	e.printStackTrace();
    	
    }finally{
    	
    	if(rs2!=null) try{rs2.close();} catch(Exception e){}
    	if(ps2!=null) try{ps2.close();} catch(Exception e){}
    	if(cn2!=null) try{cn2.close();} catch(Exception e){}
    	    	
    }

    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset=" UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon"href="../favi.ico"/>
</head>
<body>
<%= co %><br/>
<%= fi %>

</body>
</html>