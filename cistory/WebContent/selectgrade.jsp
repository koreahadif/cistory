<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="loginCheck.jsp" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>기출 시험</title>
<script src="//code.jquery.com/jquery-1.10.0.min.js"></script>

<style>
#wrapper{ overflow : hidden; min-height : 1020px }
#container {width : 1000px; margin : 0 auto;}
body{
 background-image:url('images/backgroundimagesumukhwa.jpg'); background-size: 100% 100%; min-height : 1020px;
	   background-repeat : no-repeat; 
}
</style>

</head>
<body>

<div id="wrapper">
<div id="header">
			<%@ include file="memberViewmenu.jsp"%>
		</div>


		
<div id="container">		
	<!-- <div class="panel panel-danger testgradeselectalign"> -->
	<div class="panel panel-danger testgradeselectalign">
        <div class="panel-heading">
          <h1 class="panel-title" style="text-align : center;">등급을 선택해 주세요</h1>
        </div>
	<div style="margin : 0 auto;">
	<a href="startTest.cis?grade=i"><img src="images/middlelevel.png" style="max-width : 350px;"></a>
	<a href="startTest.cis?grade=a"><img src="images/highlevel.png" style="max-width : 350px;"></a>
	</div>
	</div>
</div>
</div>
</body>
</html>