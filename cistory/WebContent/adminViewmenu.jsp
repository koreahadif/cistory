<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="nhn.cistory.vo.Member" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="css/JH.css"/>
<link rel="stylesheet" href="assets/css/minsik.css"/>

<!-- 스타일 -->
<style>
body {font-family: 'NanumGothic';   }

</style>

<script type="text/javascript" src="assets/js/custom.js"></script>
<!-- JS -->
<!-- <script type="text/javascript" src="./bootstrap/js/bootstrap.js"></script> -->
<!-- <script type="text/javascript" src="assets/js/bootmetro.js"></script> -->
<script src="http://www.google.com/jsapi"></script>
<script>
 google.load( "webfont", "1" );
 google.setOnLoadCallback(function() {
  WebFont.load({ custom: {
   families: [ "NanumGothic" ],
   urls: [ "http://fontface.kr/NanumGothic/css" ]
  }});
 });
 

	$(document).ready(
			function() {
				$('#jload').ajaxStart(function() {
							$(this).show();
						}).ajaxStop(function() {
							$(this).hide();
						});
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

<script>
$(document).ready(function () {
	$('div.brand').css('padding','0');
});
</script>


</head>
<body>
<div class="navbar navbar-fixed-top">
	<div class="navbar-inner-memberviewmenu"> 
			<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> 
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</a> 
			<div class="brand memberview"><a href="adminPage.cis"><img src="images/Cistorylogofinal.png" width="20%" height="15%" ></a></div>
			<div class="nav-collapse">
				<ul class="nav">
					<li class="divider-vertical"></li>
					<li><a href="adminQuestion.cis">문제관리</a></li>
					<li class="divider-vertical"></li>
					<li><a href="adminHistory.cis">역사정보관리</a></li>
					<li class="divider-vertical"></li>
					<li><a href="adminMember.cis">회원관리</a></li>
				</ul>
			 <%if((Member) session.getAttribute("member")!=null){
				String nick = ((Member) session.getAttribute("member")).getNickName();
				String id = ((Member) session.getAttribute("member")).getId();
				%>
				<ul class="nav pull-right">
					<li class="divider-vertical"></li>
					<li><a href=""><%=nick %> 님</a> </li>
					<li class="divider-vertical"></li>
					<li class="btn-group"> 
						    <a class="btn-header dropdown-toggle" data-toggle="dropdown" href="">
							 <span class="caret"></span> 	
						    </a>					
						<ul class="dropdown-menu">
							<%-- <li><a href="getUserTest.cis?id=<%=id%>">마이페이지홈</a></li> --%>
							<li><a href="./">사용자화면가기</a></li>
							<li><a href="modifyMemberForm.cis">회원정보수정</a></li>
							<li><a href="logout.cis">로그아웃</a></li>
						</ul>
				</li></ul>
			<%} else { %>
				<script type="text/javascript">
					alert('로그인 후 이용해 주십시오.');
					location.href="adminIndex.jsp";
				</script>
			<%} %>				
		</div>	
	</div>
</div>


</body>
</html>