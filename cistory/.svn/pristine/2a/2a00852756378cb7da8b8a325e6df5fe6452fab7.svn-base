<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ include file="loginCheck.jsp" %>    
<%@ page import="nhn.cistory.vo.Reply" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>댓글 수정</title>
</head>
<body>
<h2>[댓글 수정]</h2>
<%
	Reply reply = (Reply) request.getAttribute("reply");
    System.out.println("원래정보 : "+reply);
	if (reply==null){
%>
	<jsp:forward page="replyinfoedit1&rp_num=<%=reply.getRp_num() %>&brd_num=<%=reply.getBrd_num() %>"></jsp:forward>
<%
	return;
	}
%>

<!-- 이곳에 폼을 보여주고 현재 값들을 수정할 수 있게 함 -->

<p style="color:#cc0000;text-align:center;font-size;20px;">[리플 수정]
</p>

<form name="infoeditform" action="replyinfoedit2.cis" method="post">
<input type="hidden" name="action" value="replyinfoedit2">
<input type="hidden" name="rp_num" value="<%=reply.getRp_num() %>">
<input type="hidden" name="brd_num" value="<%=reply.getBrd_num() %>">



<table cellpadding="3" cellspacing="0" border="1" align="center">
	
	<tr>
		    <td >작성자</td>
			<td ><input type="text" name="id" value="<%=reply.getNickname() %>"  readonly >(<input type="text" name="id" value="<%=reply.getId() %>"  readonly >)</td>
	</tr>
	<tr>
			<td>내용</td>
			<td ><input type="text" name="rp_content" value="<%=reply.getRp_content() %>" ></td>
	</tr>
	
</table>


<br>
	<p align="center"><input type="submit" value="수정완료">
	<input type="reset" value="다시입력"></p>
</form>

</body>
</html>