<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ include file="loginCheck.jsp" %>    
<%@ page import="nhn.cistory.vo.Reply" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>��� ����</title>
</head>
<body>
<h2>[��� ����]</h2>
<%
	Reply reply = (Reply) request.getAttribute("reply");
    System.out.println("�������� : "+reply);
	if (reply==null){
%>
	<jsp:forward page="replyinfoedit1&rp_num=<%=reply.getRp_num() %>&brd_num=<%=reply.getBrd_num() %>"></jsp:forward>
<%
	return;
	}
%>

<!-- �̰��� ���� �����ְ� ���� ������ ������ �� �ְ� �� -->

<p style="color:#cc0000;text-align:center;font-size;20px;">[���� ����]
</p>

<form name="infoeditform" action="replyinfoedit2.cis" method="post">
<input type="hidden" name="action" value="replyinfoedit2">
<input type="hidden" name="rp_num" value="<%=reply.getRp_num() %>">
<input type="hidden" name="brd_num" value="<%=reply.getBrd_num() %>">



<table cellpadding="3" cellspacing="0" border="1" align="center">
	
	<tr>
		    <td >�ۼ���</td>
			<td ><input type="text" name="id" value="<%=reply.getNickname() %>"  readonly >(<input type="text" name="id" value="<%=reply.getId() %>"  readonly >)</td>
	</tr>
	<tr>
			<td>����</td>
			<td ><input type="text" name="rp_content" value="<%=reply.getRp_content() %>" ></td>
	</tr>
	
</table>


<br>
	<p align="center"><input type="submit" value="�����Ϸ�">
	<input type="reset" value="�ٽ��Է�"></p>
</form>

</body>
</html>