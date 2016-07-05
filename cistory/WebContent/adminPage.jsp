<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>adminPage</title>
<script src="//code.jquery.com/jquery-1.10.0.min.js"></script>
<script type="text/javascript" src="./bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="./bootstrap/css/bootstrap-responsive.js"></script>
<!-- <link rel="stylesheet" type="text/css" href="./assets/css/bootmetro.css">
<link rel="stylesheet" type="text/css" href="./bootstrap/css/bootstrap.css">
<script type="text/javascript" src="./bootstrap/js/bootstrap.min.js"></script>

</head>
<body>

<div class="metro">
	<a class="tile qudro text grade" 
		href="adminQuestion.cis">
		<h1>문제관리(기출/테마/퀴즈)</h1>
	</a>
</div>
<div class="metro">
	<a class="tile qudro text grade" 
		href="adminHistory.cis">
		<h1>역사정보관리</h1>
	</a>
</div>
<div class="metro">
	<a class="tile qudro text grade" 
		href="adminMember.cis">
		<h1>회원관리</h1>
	</a>
</div> 

<script src="//code.jquery.com/jquery-1.10.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="./css/JH.css">
<script type="text/javascript" src="./bootstrap/css/bootstrap.js"></script>
-->
<link rel="stylesheet" type="text/css" href="./bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="./bootstrap/css/bootstrap-responsive.css">

<style>
body{

 background-image:url('images/adminbackground.png'); background-size: 100% 100%;
	   background-repeat : no-repeat; 
}

/* #wrapper {
background-color: #c3d9d6;
} */

#wrapper{ overflow : hidden; height : 950px;}
.memberviewtextsize{
font-size: 70px;

}

#giculexampic1{
 height : 338px;
}
</style>

</head>
<body>

<div id="wrapper">

<div id="header">
<%@ include file="adminViewmenu.jsp" %>
</div> 
<div id="space">
</div>
<br><br><br><br><br>

	<div class="container">
	      <div class="row">
	      	<!-- <div class="row menuviewmargin-right"> -->
	         <div class="metro-memberviewmetro spanaaa3" >
	            <div class="metro-sections" >
	                <div class="metro-section" id="section1">
	   					<a href="adminQuestion.cis">                
	                        <img src="images/adminquestioncontroll.png" id="giculexampic1">                       
	                     </a>
	                     
	                     
	   				</div>
	   			</div>
	   		</div>		
	   			
	   		<div class="metro-memberviewmetro spanaaa3" >
	           	 <div class="metro-sections" >
	               	 <div class="metro-section" id="section1">	
	   					<a href="adminHistory.cis">
	                         <img src="images/adminhistorycontroll.png" id="giculexampic1">                       
	                    </a>
	                    
	   				</div>
	   			</div>
	   		</div>			
	   			
	   		<div class="metro-memberviewmetro spanaaa3" >
	           	 <div class="metro-sections" >
	               	 <div class="metro-section" id="section1">		
	   					<a href="adminMember.cis">
	                         <img src="images/adminmembercontroll.png" id="giculexampic1">                       
	                    </a>
	                    
	   				 </div>
	   			</div>
	   		</div>		
	   					
	   				
	   	</div>
	 </div>
</div>


</body>
</html>