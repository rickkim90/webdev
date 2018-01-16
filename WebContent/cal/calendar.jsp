<%@ page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=" UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function func_controldate(mm){
	var f = document.myform;
	f.controldate.value = mm;
	f.submit();
}
</script>
</head>
<body>
<form name="myform">
<input type="hidden" name="controldate" value="0"/>

	<!-- html 주석처리 노출됨 -->
	<%-- 스크립트릿 노출 안됨 --%>
	<%
		//scriptlet
		
		int year = 0;
		int month = 0;
		int controldate = 0;
		Calendar c = Calendar.getInstance();
		try{
			//년, 월 정보가 입력 되었을 때
			
			year = Integer.parseInt(request.getParameter("year"));
			month = Integer.parseInt(request.getParameter("month"));
			controldate = Integer.parseInt(request.getParameter("controldate"));
			c.set(year, month - 1, 1);
			c.add(Calendar.MONTH, controldate);
			year=c.get(Calendar.YEAR);
			month=c.get(Calendar.MONTH)+1;
		}catch(Exception e){
			//년, 월 정보가 없을때(초기 실행 시)
			year=c.get(Calendar.YEAR);
			month=c.get(Calendar.MONTH)+1;
			c.set(year, month - 1, 1);
			
		}

				
		int week = c.get(Calendar.DAY_OF_WEEK);
		int end_day = c.getActualMaximum(Calendar.DATE);
		
	%>
	
	<table style="width:300px;">
	
	<caption>
	 <span onclick="func_controldate(-12)" style="cursor:pointer;"><<</span>
	 <span onclick="func_controldate(-1)" style="cursor: pointer;">&nbsp;<</span>
	  <select name="year" onchange="document.myform.submit()">
	<% for(int y=year-15; y<=year+15; y++){ %>
	<option <%= year == y ? "selected":"" %>><%=y%></option>
	<%} %>	
	</select>년
	<select name="month" onchange="document.myform.submit()">
	<% for(int m=1; m<=12; m++){ %>
	<option <%= month == m ? "selected":"" %>><%=m%></option>
	<%} %>
	</select>월
	 <span onclick="func_controldate(1)" style="cursor:pointer;">>&nbsp;</span>
	 <span onclick="func_controldate(12)" style="cursor:pointer;">>></span>
	</caption>

		<tr>
			<td style="color:rgb(255,0,0);">일</td>
			<td>월</td>
			<td>화</td>
			<td>수</td>
			<td>목</td>
			<td>금</td>
			<td style="color:rgb(0,0,255);">토</td>
		</tr>

		<tr>
			<%
				for (int d = 1; d < week; d++) {
					out.println("<td></td>");
				}
				for (int d = 1, w = week; d <= end_day; d++, w++) {
					if (w % 7 == 0){
						out.println("<td style='color:rgb(0,0,255);'>" + d + "</td>");
						out.println("<tr></tr>");
					}else if(w % 7 ==1){
						out.println("<td style='color:rgb(255,0,0);'>" + d + "</td>");						
					}else{
						out.println("<td>" + d + "</td>");
					}
						
				}
			%>
		</tr>
	</table>
</form>
</body>
</html>