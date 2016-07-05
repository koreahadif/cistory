<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ include file="loginCheck.jsp" %>    
<%@ include file="memberViewmenu.jsp" %>
<%@ page import="nhn.cistory.vo.Board" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 수정</title>

<style>
body{
background-image:url('images/Old_Paper_by_TLMedia.jpg'); background-size: 100% 100%;
	   background-repeat : no-repeat;
}

#wrapper { overflow : hidden; width : 650px; margin : 0 auto; height : 870px}

</style>


<script language="javascript" src="./se2/js/HuskyEZCreator.js"	charset="utf-8"></script>

<script type="text/javascript">
function onSubmit() {
	if(infoeditform.brd_title.value == '' ){
		alert("제목입력");
		return false;
	}
	
	var f = document.infoeditorm;
	oEditors[0].exec("UPDATE_CONTENTS_FIELD",[]);
	f.contents.value = document.getElementById("content").value;
	f.submit();
}
function tagOpen(){
	window.open("tag.jsp?typeFrom=edit", "tagwin", "top=200,left=400,width=400,height=300,resizable=yes");
}
</script>


 <style type="text/css">
table {
	width: 600px;
	border-collapse: collapse;
	text-align: center;
	font-family: 'Trebuchet MS';
	margin:0 auto;
}

td,th {
	font-size: 10pt;
	border: 1px solid #0071BC;
	height: 30px;
}

tr.alt td {
	color: #000000;
	background-color: #EAF2D3;
}




#title  { margin:0 auto; background-color:#00AEEF; width:200px; 
	border-radius:0px; margin-top:30px;	height:30px;margin-bottom:30px;
}
	h2 { color:white; text-align:center;   }

</style> 
</head>
<body>
<br><br>
<%
	Board board = (Board)request.getAttribute("board");
    System.out.println("원래정보 : "+board);
	if (board==null){
%>
	<jsp:forward page="infoedit1.cis"></jsp:forward>
<%
	return;
	}
	
	
%>

<div id="space"></div>
<div id="wrapper">
	
	<div id="title">
		<h2>게시판글 수정</h2> 
	</div>


<form name="infoeditform" action="infoedit2.cis" method="post" onSubmit="return onSubmit();">
<input type="hidden" name="action" value="infoedit2">
<input type="hidden" name="brd_num" value="<%=board.getBrd_num()%>">

<table>
			<tr>
			<td colspan="3"style="height:50px;">
			글분류 : <select name="brd_ctg">
				<option>자유게시판</option>
				<option>건의게시판</option>
				<option>질문과답변게시판</option>
				</select>
			</td>
			</tr>
		
			<tr>
				<td colspan="3"style="height:50px;">Title&nbsp;&nbsp; : &nbsp;&nbsp; 
				<input type="text" name="brd_title"	size="70" value="<%=board.getBrd_title()%>">
			</tr>
			<tr>
				<td colspan="3"><textarea name="content" id="content" rows="10"
						cols="100" style="width: 766px; height: 412px; display: none;"><%=board.getBrd_content()%></textarea>
						<script language="javascript">
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "content",
	sSkinURI: "./se2/SmartEditor2Skin.html",
	fCreator: "createSEditor2Skin"
	});
	</script>
				</td>
			</tr>
			<tr>
				<td colspan="3">태그 : <input type="text" name="htr_tag" readonly>
 <button type="button" class="btn btn-warning" onClick="javascript:tagOpen()">태그검색</button>
			</tr>
			<tr>
				<td colspan="3"><button class="btn btn-info" type="submit">저장</button>
								<button class="btn btn-success"	type="reset">다시작성</button>
			</tr>
		</table>
	</form>
</div>
</body>
</html>