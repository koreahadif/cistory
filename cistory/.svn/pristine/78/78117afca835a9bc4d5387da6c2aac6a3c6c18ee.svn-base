<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="nhn.cistory.vo.Member" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cistory</title>

<script src="//code.jquery.com/jquery-1.10.0.js"></script>
<script type="text/javascript" src="assets/js/jquery.scrollTo-min.js"></script>
<script type="text/javascript" src="./bootstrap/js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css" href="./bootstrap/css/bootstrap.css">


<style>
.wf-active h2 {
    font-family: 'NanumGothicBold';
    font-size: 30px;
   }
  </style>

<style>
.wf-active body {
 font-family: 'NanumGothic';
 font-size: 16px;
}

body { width : 100%; height : 100%; margin: 0 auto;
		background-image:url('images/loginbackground.png'); background-size: 100% 100%;
		background-repeat : no-repeat;}
	#header{ width : 100%;	height : 150px;}	
	#aside{ width : 55%;   float : left;}
	#section{ width : 45%; float : left;}
	#wrap{ overflow : hidden; height : 600px;}
	#space{ width : 100%; height : 100px;}
	#footer{ width : 100%; height : 20px; text-align : center;}
	#tutorial { overflow : hidden; height : 50%; margin :0 auto; margin-top: 50px;}
	#wrap2{ overflow : hidden; height : 200px; margin :0 auto;  }
	#wrap3{ overflow : hidden; height : 200px; margin :0 auto; background-color: rgba(51, 189, 178, 0.18); 
			margin-top: 20px; margin-bottom: 20px;}
	#wrap4{ overflow : hidden; height : 200px; margin :0 auto; }
	#start { overflow : hidden; height : 50%; margin :0 auto;}
	
</style>

<script language="javascript">
function joinform(){
	location.href=('joinForm.cis');
}
</script>

<script type="text/javascript">
function scrollTab() {
  $.scrollTo($('#tutorial'), 800);
}
 
</script>


<script src="http://www.google.com/jsapi"></script>
<script>
 google.load( "webfont", "1" );
 google.setOnLoadCallback(function() {
  WebFont.load({ custom: {
   families: [ "NanumGothic" ],
   urls: [ "http://fontface.kr/NanumGothic/css" ]
  }});
 });
</script>

<script src="http://www.google.com/jsapi"></script>
<script>
 google.load( "webfont", "1" );
 google.setOnLoadCallback(function() {
  WebFont.load({ custom: {
   families: [ "NanumGothicBold" ],
   urls: [ "http://fontface.kr/NanumGothicBold/css" ]
  }});
 });
</script>

</head>
<body>
<div id="header"></div>

<div id="start">
	<div id="wrap">
	<br><br><br><br><br>
		<div id="aside"> 
			<img src="images/loginpic.png" align="right">
		</div>
	
		<div class="section">
		<br><br><br><br>
			<table id="logintable" cellspacing="10"	cellpadding="5" align="left">
			<form method="post" action="login.cis" name="loginForm" >
				<tr>
					<td align="left"><img src="images/Cistorylogofinal.png" width="50%" height="50%"></td>
				</tr>
		<%if(session.getAttribute("member")==null){ %>		
				<tr>
					 <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="id" size=20 placeholder="User ID"></td>
				</tr>
				<tr>
						<td align="left">&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" name="password" size=20 placeholder="Password"><td>
				</tr>
				
				<tr>
						<td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="submit" class="btn btn-info">로그인</button>
						<!-- <input type="submit" value="로그인"> -->
						&nbsp;&nbsp;
						<button type="button" class="btn btn-warning" onclick="javascript:joinform()">회원가입</button>
						
				</tr>
				
				
			</form>
		<%}else{ %>
				<tr>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<strong><%=((Member)session.getAttribute("member")).getNickName()%></strong>님 환영합니다.</td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="button" class="btn btn-warning" onClick="location.href='login.cis'">들어가기</button>
					<button type="button" class="btn btn-warning" onClick="location.href='logout.cis'">로그아웃</button></td>
				</tr>
		<%}%>
			</table>
		</div>
	</div>
</div>
<div id="space">
</div>


<div id="footer">
<a href="javascript:scrollTab()">&gt;더알아보기</a>
</div>

<div id="space">
</div>
<div id="space">
</div>
<div id="space">
</div>


<div id="tutorial" style="margin : 0 auto;">
	<div class="space"></div>
	<div class="container" align="center">
	   	   					<a href="guest.cis"><img src="images/oxquizpic.png" style="max-width : 300px;"></a>
	   					<a href="guest.cis"><img src="images/keywordpic.png" style="max-width : 300px;"></a>
	   					<a href="guest.cis"><img src="images/timelinepic.png" style="max-width : 300px;"></a>
	   
	   </div>
	   
	  
	   <div id="wrap3" align="center">
					<img src="./images/indexlogo.png" />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<img src="./images/indexex.png">
			</div>
	   
	   
	   	<div class="container" align="center">
	   					<a href="login.cis"><img src="images/giculpic.png" style="max-width : 300px;"></a>
	   					<a href="login.cis"><img src="images/themepic.png" style="max-width : 300px;"></a>
	   					<a href="login.cis"><img src="images/wrongnotepic.png" style="max-width : 300px;"></a>
	   <div id="space"></div>
</div>







</body>
</html>