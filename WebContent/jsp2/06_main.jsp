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
<jsp:include page="06_header.jsp"/>
메인화면입니다.<br>
<a href="06_sub.jsp">서브 페이지로 이동</a>
<jsp:include page="06_footer.jsp"/>
<%--  <%@ include file="02_footer.jsp" %> --%>


<!-- 액션태그 include와 include file 방식과의 차이 -->
<!-- include file방식 : 하나의 파일에 header와 footer를 포함하여 생성(파일 커짐). 변수 공유가 가능함. 다음 페이지에서 header,footer호출 시 해당 파일에 다시 포함하여 생성-->
<!-- 액션태크 include : 완전 모듈화/ header와 footer 각각의 파일을 생성 , 추후 다른 페이지에서 호출 시 기존 생성된 header와 footer를 불러옴. -->






</body>
</html>