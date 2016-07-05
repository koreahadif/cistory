<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="loginCheck.jsp" %>    
<%@ page import="nhn.cistory.vo.Member" %>    
<%@ page import="nhn.cistory.vo.Board" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ page import="java.util.*" %>
<%@ page import="nhn.cistory.util.PageNavigator" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 글 목록</title>

 <script src="//code.jquery.com/jquery-1.10.0.min.js"></script>

<style>


body{
background-image:url('images/boardbackground.jpg'); background-size: 100% 100%;
	   background-repeat : no-repeat;
}

#wrapper { overflow : hidden; width : 650px; margin : 0 auto; height : 1020px}

#boardtable {text-align : center}
#boardlist {background-color : rgba(152, 185, 19, 0.22);} 
 
</style> 

<script language="javascript">
function pagingFormSubmit(pg){
	pagingForm.page.value = pg;
	pagingForm.submit();
}

function listfree(){
	location.href='listfree.cis';
}

function listsuggest(){
	location.href='listsuggest.cis';
}

function listfnq(){
	location.href='listfnq.cis'; 
	}
	
function writeform(){
	location.href='writeForm.cis';
	}
</script>


</head>
<body>
<br><br><br><br><br><br>
<%PageNavigator navi =(PageNavigator) request.getAttribute("navi"); 
	
	String search =(String) request.getAttribute("search");%>
<%

ArrayList<Integer> replyCountlist = 
(ArrayList<Integer>) request.getAttribute("replyCount");

ArrayList<Board> list = 
(ArrayList<Board>) request.getAttribute("list");

String tbrd_ctg = null;

if(list.get(0).getBrd_ctg().equals("자유게시판")){
	tbrd_ctg = "listfree";
}
else if(list.get(0).getBrd_ctg().equals("건의게시판")){
	tbrd_ctg = "listsuggest";
}
else if(list.get(0).getBrd_ctg().equals("질문과답변게시판")){
	tbrd_ctg = "listfnq";
}

%>

<div id="header">
<%@ include file="memberViewmenu.jsp" %>
</div>

<div id="wrapper">
	
<div id="boardlist">	
	<div id="headertitle">
		<h2 id="headertitletext">[<%=list.get(0).getBrd_ctg() %>]</h2>
	</div>
<br><br>
	<div id="content"> 
			<div class="spannnn12" align="center">
				<button type="button" class="btn btn-primary btn-large" onClick="javascript:listfree()">자유게시판</button>
				<button type="button" class="btn btn-default btn-large" onClick="javascript:listsuggest()">건의게시판</button>
				<button type="button" class="btn btn-danger btn-large" onClick="javascript:listfnq()">질문과답변게시판</button>
	 		</div>



		<p align="right">
		전체게시물 총 <%=navi.getTotalPageCount() %>, 전체 <%=navi.getCurrentPage() %>/<%=navi.getTotalPageCount() %><br>
		</p>


<table table-board id="boardtable" class="table table-striped" cellspacing="10" cellpadding="5"><!-- cellpadding은 여백, cellspacing은 간격? -->
	<tr> 
			<td align="center" >No</td>
			<td align="center">제목</td>
			<td align="center">작성자</td>
			<td align="center">작성일</td>
			<td align="center">조회</td>
	</tr>
	<% int curPage = navi.getCurrentPage(); %>
<%

	//int fakeNum=navi.getTotalRecordsCount()-(navi.getCurrentPage()-1)*navi.getCountPerPage();
	int fakeNum=(navi.getTotalRecordsCount()-((curPage-1)*(navi.getPagePerGroup())));
	//검색 결과가 없는 경우면 종료 (검색전)
	if (list == null) return;
	
	//검색결과가 있으면 화면에 출력
	
	for (int i = 0; i < list.size(); i++) {
		Board board = list.get(i); 
		
%>
 
	<tr>
			<td align="center"><%=fakeNum--%></td>
			
			<td align="center"><a href="read.cis?brd_num=<%=board.getBrd_num() %>&brd_ctg=<%=tbrd_ctg%>"><%=board.getBrd_title()%></a>
					&nbsp; [<%=replyCountlist.get(i)%>]</td>
			<td align="center"><%=board.getNickname()%>(<%=board.getId()%>)</td>
			<td align="center"><%=board.getBrd_post_date()%></td>
			<td align="center"><%=board.getBrd_view_count()%></td>
			
	</tr>
	
<%	
	}
%>

<!-- 페이지 이동부분 시작 -->

	<tr>
		<td colspan="6" align="center">
			<!-- 이전 그룹으로 이동 (현재 페이지 - 그룹당 페이지수) -->
			<!-- <a href="BboardServlet?action=list&page=<%=curPage - navi.getPagePerGroup()%>"> &lt;&lt; </a> &nbsp; -->
			<a href="javascript:pagingFormSubmit(<%=curPage - navi.getPagePerGroup()%>)"> &lt;&lt; </a> &nbsp;
			<!-- 이전 페이지로 이동 (현재 페이지 - 1) -->
			<a href="javascript:pagingFormSubmit(<%=curPage-1%>)"> &lt; </a> &nbsp;
			
			<!-- 반복문으로 페이지 이동 링크 출력 -->
			<% for (int i=navi.getStartPageGroup() ; i<=navi.getEndPageGroup();i++){ 
			
			if(i==curPage) {%>
			<!-- 현재 그룹의 시작페이지부터 마지막 페이지까지 반복 -->
			<b><%=i %></b> &nbsp;
			<%} else{%>
			
			<a href="javascript:pagingFormSubmit(<%=i%>)"><%=i%></a> &nbsp;
			<% 
			           }
			}%>
			<!-- 다음 페이지로 이동 (현재 페이지 + 1) -->
			<a href="javascript:pagingFormSubmit(<%=curPage+1%>)"> &gt; </a> &nbsp;
			<!-- 다음 그룹으로 이동 (현재 페이지 + 그룹당 페이지수) -->
			<a href="javascript:pagingFormSubmit(<%=curPage + navi.getPagePerGroup()%>)"> &gt;&gt; </a> &nbsp;
		</td>
	</tr>
<!-- 페이지 이동부분 끝 -->

<!-- 검색폼 -->
		<tr align="center">
				<td colspan="5">
					<form name="pagingForm" method="post" action="<%=tbrd_ctg+".cis"%>">
						<input type="hidden" name="action" value="<%=tbrd_ctg%>">
						<input type="hidden" name="page" value="">
						<input type="text" name="search" value="<%=search==null? "" : search %>" size="20">
						<button class="btn btn-info" type="submit">제목+내용검색</button></td>
						</tr>
					</form>
				</td>
		</tr>

	</table>

<p align="center"><button class="btn btn-success" onClick="javascript:writeform()">글쓰기</button></p>
</div>
</div>
</div>
</body>
</html>