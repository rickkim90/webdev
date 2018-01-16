<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
%>
<%!public String commentAge(int age){
		if (70 <= age) {return "종심";
		} else if (60 <= age) {return"이순";
		} else if (50 <= age) {return"지천명";
		} else if (40 <= age) {return"불혹";
		} else if (30 <= age) {return"이립";
		} else if (20 <= age) {return"약관";
		} else {return"묘령";
		}
	}%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset=" UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>그래, 난<%=name%>.<br /> 포기를 모르는 남자지.</h1>
	<h1>나이 : <%=age %> (<%=commentAge(age)%>)<br /></h1>

</body>
</html>