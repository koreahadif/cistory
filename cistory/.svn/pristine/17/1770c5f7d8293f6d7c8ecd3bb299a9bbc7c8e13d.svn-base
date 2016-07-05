<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="loginCheck.jsp" %>    
 <%@ page import="nhn.cistory.vo.History" %>
 <%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>태그 검색</title>

<!-- JS -->
<script src="//code.jquery.com/jquery-1.10.0.js"></script>


<script src="http://www.google.com/jsapi"></script>
<script>
 google.load( "webfont", "1" );
 google.setOnLoadCallback(function() {
  WebFont.load({ custom: {
   families: [ "NanumGothic" ],
   urls: [ "http://fontface.kr/NanumGothic/css" ]
  }});
 });
</script>

<script src="http://www.google.com/jsapi"></script>
<script>
 google.load( "webfont", "1" );
 google.setOnLoadCallback(function() {
  WebFont.load({ custom: {
   families: [ "NanumGothicBold" ],
   urls: [ "http://fontface.kr/NanumGothicBold/css" ]
  }});
 });
</script> 



<script language="javascript">
//폼체크
function formcheck(){
	if (document.form1.text.value== ' ' ){
		return false;
	}
}

//태그선택
function tagSelect(strtag, type){
	alert(type);
	if(type == 'write'){
		if(opener.WriteForm.htr_tag.value != '')
			opener.WriteForm.htr_tag.value += '/';
		opener.WriteForm.htr_tag.value += strtag;
	}
		
	else if(type == 'edit'){
		if(opener.infoeditform.htr_tag.value != '')
			opener.infoeditform.htr_tag.value += '/';
		opener.infoeditform.htr_tag.value += strtag;
	}
		
	this.close();
}
</script>

<style>
body { background-color : rgba(62, 183, 206, 0.31);}
</style>


</head>
<body>

<div id="wrapper" align="center">
<h2>[태그 검색]</h2>

<form name="form1" action="tag.cis" method="post" onSubmit="return formcheck()">
	<input type="hidden" name="action" value="tag">
	<input type="hidden" name="type" value="<%= request.getParameter("typeFrom") %>">
	검색어<input type="text" name="text">
	<button class="btn btn-success" type="submit">검색</button>
</form>

<br><br>

<%
	ArrayList<History> taglist = 
		(ArrayList<History>) request.getAttribute("taglist");
	String type = request.getParameter("type");
//검색 결과가 없는 경우면 종료 (검색전)
	if (taglist == null)  return;
	
	//검색결과가 있으면 화면에 출력
	History tag = null;
	String keyrd = null;
		
	for (int i = 0; i < taglist.size(); i++) {
		tag = taglist.get(i);
		keyrd = tag.getHtr_keyrd();
		%>
		<a href="javascript:tagSelect('<%=keyrd%>', '<%= type %>')"><%=keyrd %></a>
	<%	 if(i!=(taglist.size()-1)){ %>
			&nbsp;/&nbsp;
<%		}
	}
%>

</div>

</body>
</html>