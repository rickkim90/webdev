<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>


<style>
body {
	background:
		url('http://postfiles2.naver.net/20120501_289/kmut92_13358045110886nRWk_GIF/%C7%E6%C5%A9-%C5%C3%B9%E8%BF%D4%B4%D9.gif?type=w1')
		no-repeat center center fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}
</style>
<style>
.fixed {
  position: fixed;
  bottom: 0;
  left: 550px;
  
  width: 100px;
  background-color: white;
  float: left;
}
.fixed2 {
  position: fixed;
  bottom: 0;
  left: 650px;
  
  width: 100px;
  background-color: white;
  float: left;
}
#content {
	background-color: black;
	position: absolute;
	top: 80%;
	bottom: 0;
	left: 20%;
	right: 20%;
	height: 15%;
	margin-right: 100px;
	margin-left: 100px;
	font-size: 30px;
	text-align: center;
	font-family: helvetica;
}
</style>
<meta charset=" UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="../favi.ico" />
</head>
<body>
	

	<div style="z-index: -1000; color: white;" id="content">
		당신의 PC는 감염되었습니다.<br>
		치료를 진행 하시겠습니까?	
	</div>

    <button type="button" class = "fixed" onclick="window.open('test01.jsp','_blank')" >Yes</button> 
    <button type="button" class = "fixed2" onclick="window.open('test01.jsp','_blank')" >No</button> 
	

</body>
</html>