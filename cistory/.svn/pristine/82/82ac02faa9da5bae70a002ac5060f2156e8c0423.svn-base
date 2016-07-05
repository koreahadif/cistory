<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>    
<%@ page import="nhn.cistory.vo.Obquestion" %>
<%@ page import="nhn.cistory.vo.Subquestion" %>
<%@ page import="nhn.cistory.vo.Quiz" %>
<%@ page import="nhn.cistory.vo.History" %>
<%@ page import="nhn.cistory.util.PageNavigator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>adminQuestion</title>
<script src="//code.jquery.com/jquery-1.10.0.min.js"></script>
<!-- <script type="text/javascript" src="./assets/js/bootmetro-pivot.js"></script> -->
<!-- <link rel="stylesheet" type="text/css" href="./assets/css/bootmetro.css"> -->
<!-- <link rel="stylesheet" type="text/css" href="./assets/css/bootmetro-responsive.css">
<link rel="stylesheet" type="text/css" href="./assets/css/bootmetro-icons.css">
<link rel="stylesheet" type="text/css" href="./assets/css/bootmetro-ui-light.css">
<link rel="stylesheet" type="text/css" href="./assets/css/datepicker.css"> -->
<link rel="stylesheet" type="text/css" href="./bootstrap/css/bootstrap.css">


<script type="text/javascript" src="./assets/js/min/bootstrap.min.js"></script>
<!-- <script type="text/javascript" src="./assets/js/bootmetro-panorama.js"></script> -->
<script type="text/javascript" src="./assets/js/bootmetro-pivot.js"></script>

<style>
#pivotheaders {width : 325px; margin: 0 auto; }
.adminquestioncolor { font-color : white;  }


#content {
	 width : 850px; margin :0 auto;
}

#adminquestionalign {width : 850px; margin :0 auto;}

</style>

</head>



<body style="background-color : rgba(36, 170, 165, 0.19);">

<%
	ArrayList<Obquestion> obList = (ArrayList<Obquestion>) request.getAttribute("obList");
	PageNavigator obNavi =(PageNavigator) request.getAttribute("obNavi");
	int obCurPage = obNavi.getCurrentPage();
 	int obFakeNum=(obNavi.getTotalRecordsCount()-((obCurPage-1)*(obNavi.getPagePerGroup())));
 	
	ArrayList<Subquestion> subList = (ArrayList<Subquestion>) request.getAttribute("subList");
	PageNavigator subNavi =(PageNavigator) request.getAttribute("subNavi");
	int subCurPage = subNavi.getCurrentPage();
 	int subFakeNum=(subNavi.getTotalRecordsCount()-((subCurPage-1)*(subNavi.getPagePerGroup())));
 	
	ArrayList<Quiz> quizList = (ArrayList<Quiz>) request.getAttribute("quizList");
	PageNavigator quizNavi =(PageNavigator) request.getAttribute("quizNavi");
	int quizCurPage = quizNavi.getCurrentPage();
 	int quizFakeNum=(quizNavi.getTotalRecordsCount()-((quizCurPage-1)*(quizNavi.getPagePerGroup())));
 	
	ArrayList<History> htrList = (ArrayList<History>) request.getAttribute("htrList");
%>


<div id="header">
<%@ include file="adminViewmenu.jsp" %>
</div>



<div id="pivot" class="pivot slide">
<div class="pivot-headers" id="pivotheaders">
   <a href="#pivot" data-pivot-index="0" class="btn btn-danger btn-lg" onfocus="test()">객관식</a>
   <a href="#pivot" data-pivot-index="1" class="btn btn-info btn-lg">주관식</a>
   <a href="#pivot" data-pivot-index="2" class="btn btn-success btn-lg">퀴즈</a>
</div>



<div class="pivot-items">

   <div id="pivot-item-1" class="pivot-item active">
      <br><%@ include file="adminOb.jsp" %>
   </div>

   <div id="pivot-item-2" class="pivot-item">
      <br><%@ include file="adminSub.jsp" %>
   </div>

  
   <div id="pivot-item-3" class="pivot-item">
      <br><%@ include file="adminQuiz.jsp" %>
   </div>

</div>
</div>

</body>
</html>