<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="loginCheck.jsp" %>    
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="nhn.cistory.vo.WrongNote" %>
<%@ page import="nhn.cistory.vo.Obquestion" %>
<%@ page import="nhn.cistory.util.PageNavigator" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>wrongNote</title>
<script src="//code.jquery.com/jquery-1.10.0.min.js"></script>

<style>
body{

 background-image:url('images/wrongnotepaperpic1.png'); background-size: 100% 750px;
 background-repeat : repeat;
 min-height : 1020px; 
}

/* #wrapper {
background-color: #c3d9d6;
} */

#wrapper{ overflow : hidden; height : 100%;}
.memberviewtextsize{
font-size: 70px;

}

#content {
width: 800px;
/* margin : 0 auto; */
margin-left: 88px;
background-color : rgba(153, 230, 227, 0.5);
}

#giculexampic1{
 height : 338px;
}
</style>


<script>
function goWrongNotePage(test_num){
	location.href="wrongNotePage.cis?test_num=" + test_num;
}
</script>

</head>
<body>

<div id="wrapper">

<div id="header">
<%@ include file="memberViewmenu.jsp" %>
</div>

<div id="content">
<ul class="nav nav-tabs" id="myTab">
  <li class="active"><a href="#" style="font-weight : bold; font-size : 150%;">기출 오답 노트</a></li>
  <li><a href="thmWrongNote.cis?grade=&q_type=&age=" style="font-weight : bold; font-size : 150%;">테마 오답 노트</a></li>
</ul>

<%
	ArrayList<HashMap<String, Object>> wrongNoteList = (ArrayList<HashMap<String, Object>>) request.getAttribute("wrongNoteList");
	PageNavigator navi =(PageNavigator) request.getAttribute("navi");
  	int curPage = navi.getCurrentPage();
  	int fakeNum=(navi.getTotalRecordsCount()-((curPage-1)*(navi.getPagePerGroup())));
%>
<table class="table table-striped">
	<tr>
		<td style="font-weight : bold;">번호</td>
		<td style="font-weight : bold;">등급</td>
		<td style="font-weight : bold;">점수</td>
		<td style="font-weight : bold;">시험일</td>
		<td style="font-weight : bold;">풀이문항</td>
		<td style="font-weight : bold;">오답노트</td>
	</tr>
<%	for(int i=0; i<wrongNoteList.size(); i++){ %>	
	<tr>
		<td><%= fakeNum-- %></td>
		<td><%= wrongNoteList.get(i).get("grade") %></td>
		<td><%= wrongNoteList.get(i).get("score") %></td>
		<td><%= wrongNoteList.get(i).get("testDate") %></td>
		<td><%= wrongNoteList.get(i).get("pageCnt") %></td>
		<td><button type="button" class="btn btn-success btn-sm" onclick="goWrongNotePage(<%= wrongNoteList.get(i).get("test_num") %>)">확인</button></td>
	</tr>
<%	} %>
</table>
<div align="center" class="pagination">		
	<ul class="pagination">
        <li><a href="wrongNote.cis?page=<%=curPage - navi.getPagePerGroup()%>">«</a></li>
		<% for (int i=navi.getStartPageGroup() ; i<=navi.getEndPageGroup();i++){ 
				if(i==curPage) {%>
						 <li class="active"><a href="#"><%=i %></a></li>
				<%} else{%>
				        <li><a href="wrongNote.cis?page=<%=i%>"><%=i %></a></li>
				<%} %>
		<%} %>
        <li><a href="wrongNote.cis?page=<%=curPage + navi.getPagePerGroup()%>">»</a></li>
    </ul>
</div>
</div>
</div>
</body>
</html>