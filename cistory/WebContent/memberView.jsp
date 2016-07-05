<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="nhn.cistory.vo.Member" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ include file="loginCheck.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cistory Main</title>
<script src="//code.jquery.com/jquery-1.10.0.min.js"></script>
<style>
body{

 background-image:url('images/backgroundimagesumukhwa.jpg'); background-size: 100% 100%; min-height : 1020px;
	   background-repeat : no-repeat; 
}



#wrapper{ overflow : hidden; height : 1020px}
.memberviewtextsize{
font-size: 70px;

}

#container {width : 1000px; margin : 0 auto;}
#giculexampic1{
 height : 338px;
}
</style>

</head>
<body>

<div id="wrapper">

<div id="header">
<%@ include file="memberViewmenu.jsp" %>
</div>
<div id="space">
</div>
	<br><br>
	<div class="container">
	      <div class="row menuviewmargin-right">
	         <div class="metro-memberviewmetro spanaaa3" >
	            <!-- <div class="metro-sections" >
	                <div class="metro-section" id="section1"> -->
	   					<a href="past.cis">                
	                        <img src="images/giculpic.png" id="giculexampic1">                       
	                     </a>
	                     <a href="listfree.cis">                
	                        <img src="images/listfree.png" id="boardpic1">                       
	                     </a>
	                     
	   				<!-- </div>
	   			</div> -->
	   		</div>		
	   			
	   		<div class="metro-memberviewmetro spanaaa3" >
	           	 <div class="metro-sections" >
	               	 <div class="metro-section" id="section1">	
	   					<a href="pretheme.cis">
	                         <img src="images/themepic.png" id="giculexampic1">                       
	                    </a>
	                    <a href="listsuggest.cis">                
	                        <img src="images/listsuggest.png" id="boardpic1">                       
	                     </a>
	   				</div>
	   			</div>
	   		</div>			
	   			
	   		<div class="metro-memberviewmetro spanaaa3" >
	           	 <div class="metro-sections" >
	               	 <div class="metro-section" id="section1">		
	   					<a href="wrongNote.cis">
	                         <img src="images/wrongnotepic.png" id="giculexampic1">                       
	                    </a>
	                    <a href="listfnq.cis">                
	                        <img src="images/listfnqpng.png" id="boardpic1">                       
	                     </a>
	   				 </div>
	   			</div>
	   		</div>		
	   					
	   				
	   	</div>
	 </div>
</div>
</body>
</html>