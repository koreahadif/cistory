<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="nhn.cistory.vo.Member" %>    
<%@ page import="nhn.cistory.vo.Board" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="loginCheck.jsp" %>
<%@ include file="memberViewmenu.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글쓰기</title>
</head>

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
	if(WriteForm.brd_title.value == '' ){
		alert("제목입력");
		return false;
	}
	
	var f = document.WriteForm;
	oEditors[0].exec("UPDATE_CONTENTS_FIELD",[]);
	f.contents.value = document.getElementById("content").value;
	f.submit();
}
function tagOpen(){
 	window.open("tag.jsp?typeFrom=write", "tagwin", "top=200,left=400,width=400,height=300,resizable=yes");
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
	border: 1px solid #FF5300;
	height: 30px;
}

tr.alt td {
	color: #000000;
	background-color: #EAF2D3;
}




#title  { margin:0 auto; background-color:#FF8200; width:200px; 
	border-radius:0px; margin-top:30px;	height:30px;margin-bottom:30px;
}
	h2 { color:white; text-align:center;   }

</style> 
</head>


<body>
<div id="space"></div>
<div id="wrapper">
	<div id="title">
		<h2>게시판 글쓰기</h2> 
	</div>
	<form name="WriteForm" action="write.cis" method="post" onSubmit="return onSubmit();">
	<!-- <form name="writeForm" action="Write.jsp" method="post" onsubmit="return onSubmit();"> -->
	<input type="hidden" name="action" value="write">
<input type="hidden" name="id" value="<%=((Member) session.getAttribute("member")).getId()%>">
<input type="hidden" name="nickname" value="<%=((Member) session.getAttribute("member")).getNickName()%>">
<input type="hidden" name="grade" value="<%=((Member) session.getAttribute("member")).getGrade()%>">
	
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
				<input type="text" name="brd_title"	size="70">
			</tr>
			<tr>
				<td colspan="3"><textarea name="content" id="content" rows="10"
						cols="100" style="width: 766px; height: 412px; display: none;"></textarea>
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