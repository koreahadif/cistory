<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="loginCheck.jsp" %>
<%@ page import="nhn.cistory.vo.Member" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ page import="nhn.cistory.vo.Board" %> 
<%@ page import="nhn.cistory.vo.Reply" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시물 읽기</title>
 <link rel="stylesheet" type="text/css" href="./bootstrap/css/bootstrap.css">
 <link rel="stylesheet" type="text/css" href="./css/JH.css">
<style>
#headertitle { background-color:#00A600;}


body{
background-image:url('images/boardreadbg.png'); background-size: 100% 100%;
	   background-repeat : no-repeat;
}

#wrapper {

}
 
</style> 



<script language="javascript">
function replyFormSubmit(){
	if(replyForm.rp_content.value.length <5){
		alert('리플 내용을 입력하세요.');
		replyForm.rp_content.focus();
		return;
	}
	else{
		alert('리플이 저장되었습니다');
		replyForm.submit();
	}
}
</script>

<script language="javascript">
function replydelete(brd_num, rp_num){
	if(confirm('정말 삭제하시겠습니까?')){
		location.href='replydelete.cis?brd_num='+brd_num+'&rp_num='+rp_num;
	}
}

//리플 수정
function replyEditForm(rp_num, brd_num,rp_content) {
   alert('리플수정');
	var div = document.getElementById("div"+rp_num);
	
	var str = '<form name="editForm' + rp_num + '" action="replyinfoedit2.cis" method="post">';
	str += '<input type="hidden" name="action" value="replyinfoedit2">';
	str += '<input type="hidden" name="rp_num" value="'+rp_num+'">';
	str += '<input type="hidden" name="brd_num" value="'+brd_num+'">';
	str += '&nbsp;';
	str += '<input type="text" name="rp_content" value="' + rp_content + '" size="45">';
	str += '&nbsp;';
	str += '<a href="javascript:replyEdit(document.editForm' + rp_num + ')">[저장]</a>';
	str += '&nbsp;';
	str += '<a href="javascript:replyEditCancle(document.getElementById(\'div' + rp_num + '\'))">[취소]</a>';
	str += '</form>';
	div.innerHTML = str;
}

//리플 수정 취소
function replyEditCancle(div) {
	div.innerHTML = '';
}

//리플 수정 정보 저장
function replyEdit(form) {
	if (confirm('수정된 내용을 저장하시겠습니까?')) {
		form.submit();
	}
}
</script>

</head>
<body>
<br><br>
<%
	Board board = null; 
	board =	(Board) request.getAttribute("board");
	String tbrd_ctg = null;
	String tag[] = new String[3];
	tag = board.getHtr_tag().split("/");
	
	if(board.getBrd_ctg().equals("자유게시판")){
		tbrd_ctg = "listfree";
	}
	else if(board.getBrd_ctg().equals("건의게시판")){
		tbrd_ctg = "listsuggest";
	}
	else if(board.getBrd_ctg().equals("질문과답변게시판")){
		tbrd_ctg = "listfnq";
	}
	
%>
<div id="header">
<%@ include file="memberViewmenu.jsp" %>
</div>


<div id="wrapper">
<div class="panel-boardread panel-primary">
        <div class="panel-heading">
          <h2 class="panel-title"> <%=board.getBrd_ctg() %></h2>
        </div>
       작성자 : &nbsp;<%=board.getNickname()%>(<%=board.getId()%>)
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=board.getBrd_post_date()%>&nbsp;&nbsp;&nbsp;조회&nbsp;<%=board.getBrd_view_count() %><a href="like.cis?brd_num=<%=board.getBrd_num() %>&brd_ctg=<%=tbrd_ctg %>">
					<img src="./images/like.png" alt="좋아요"></a><%=board.getBrd_like_count() %>&nbsp;
					<a href="hate.cis?brd_num=<%=board.getBrd_num() %>&brd_ctg=<%=tbrd_ctg %>">
					<img src="./images/dislike.png" alt="싫어요"></a><%=board.getBrd_hate_count() %>
</div>


<div class="panel-boardread panel-info">
        <div class="panel-heading">
          <h3 class="panel-title"> Title : <%=board.getBrd_title() %></h3>
        </div>
        <%=board.getBrd_content() %>
</div>


<div class="panel-boardread panel-info">
<%	
	for(int i=0; i<tag.length; i++){
		if(tag[i]!=null)	
%>
		     <span class="badge pull-right"><%= tag[i] %></span>
<%	} %>	
</div>

<div class="boardedit">
	
<blockquote-boardread>
		<% if(board.getId().equals(((Member) session.getAttribute("member")).getId())){ %>
		<!-- 본인 글인 경우에만 다음 링크가 보인다 -->
		<a href="delete.cis?brd_num=<%=board.getBrd_num()%>&brd_ctg=<%=tbrd_ctg%>">[삭제]</a>
		<a href="infoedit1.cis?brd_num=<%=board.getBrd_num()%>&brd_ctg=<%=tbrd_ctg%>">[수정]</a>
		<%} %>
		<!-- 모든 사용자에게 보이는 링크 -->
		<a href="<%=tbrd_ctg+".cis"%>">[목록보기]</a>
      
   </blockquote-boardread>


		
</div>
<br><br><br>


<%
	if(((Member)session.getAttribute("member")).getId() !=null){
%>

<form name="replyForm" method="post" action="replywrite.cis">
<input type="hidden" name="action" value="replywrite">
<input type="hidden" name="brd_num" value="<%=board.getBrd_num()%>">
<input type="hidden" name="id" value="<%=((Member)session.getAttribute("member")).getId()%>">
<input type="hidden" name="nickname" value="<%=((Member)session.getAttribute("member")).getNickName()%>">
<input type="hidden" name="grade" value="<%=((Member)session.getAttribute("member")).getGrade()%>">

<div class="panel-boardread panel-danger">
        
        
        <div class="panel-heading">
          <h3 class="panel-title" text-align="center"> 
          리플달기 : <input type="text" name="rp_content" size="50">
          <a href="javascript:replyFormSubmit()"> ☜</a></form>
          </h3>
        </div>
        <!-- 댓글목록 -->
<table class="table table-striped" cellpadding="3" cellspacing="0" >
	<tr> 
			<td >ID</td>
			<td colspan="2">리플내용</td>
<% ArrayList<Reply> llist =null;
	llist = (ArrayList<Reply>) request.getAttribute("list");
	if (llist == null) return;
	
	//검색결과가 있으면 화면에 출력
	
	for (int i = 0; i < llist.size(); i++) {
		Reply rlist = llist.get(i);		
%>			

	</tr>
	
	<tr>
			<td ><%=rlist.getId()%></td>
			<td><div id="div<%=rlist.getRp_num()%>"><%=rlist.getRp_content()%></div></td>
			<!-- 본인 글인 경우에만 다음 링크가 보인다 -->
<% if(rlist.getId().equals(((Member)session.getAttribute("member")).getId())){ %>
			<td>
			
			<a href="javascript:replydelete(<%=rlist.getBrd_num()%>,<%=rlist.getRp_num()%>)">[선택삭제]</a> &nbsp;
			
			<a href="javascript:replyEditForm(<%=rlist.getRp_num()%>, <%=rlist.getBrd_num()%>,' <%=rlist.getRp_content()%>')">[수정]</a>
			</td>
	</tr>
	
<%
		 }
	}
%>


</table>



</div>
<%} %>

<div id="space"></div>
<div id="space"></div>
</div>


</body>
</html>