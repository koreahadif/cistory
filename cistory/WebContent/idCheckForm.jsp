<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="nhn.cistory.vo.Member" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>idCheckForm</title>

<style type="text/css">
body{
font-family: 'NanumGothic';
background-color: #c3d9d6;
/* background-image:url('images/memverviewbackground.png'); background-size: 100% 100%;
	   background-repeat : no-repeat; */
}

#wrapper {
background-color: #c3d9d6;
}

</style>


<script type="text/javascript">
function idCheck(){
	var idRegExp = /^[a-z0-9]{4,10}$/;
	
	if(!idRegExp.test(document.idCheckForm.id.value)){
		alert('아이디는 4~10자의 영문, 숫자 조합이어야 합니다.');
		return false;
	}
	return true;
}
function selectId(id){
	opener.joinForm.id.value = id;
	opener.idValid = 'yes';
	this.close();
}
</script>

</head>
<body>

<div id="idcheckform" align="center">
<h2>[ ID 중복확인 ]</h2>

<form method="post" action="idCheck.cis" name="idCheckForm" onsubmit="return idCheck()">
	<input type="hidden" name="onCheckForm" value="yes">
<%
	String overlap = request.getParameter("overlap");
	String id = request.getParameter("id");

	if(overlap.equals("yes")){
%>
		<%= id %> : 이미 사용중인 아이디입니다.<br><br>
<%
	}else{
%>
		<%= id %> : 사용할 수 있는 ID입니다.<br>
		<input type="button" value="아이디 사용하기" onclick="selectId('<%=id%>')"><br><br>
<%	} %>

	다른 아이디 입력 <input type="text" name="id" size=20>
	<input type="submit" value="중복확인">
</form>
</div>
</body>
</html>