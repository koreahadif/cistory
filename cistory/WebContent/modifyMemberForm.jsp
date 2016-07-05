<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="loginCheck.jsp" %>  
<%@ page import="nhn.cistory.vo.Member" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>modifyMemberForm</title>

<link rel="stylesheet" type="text/css" href="./css/JH.css">
<script src="//code.jquery.com/jquery-1.10.0.js"></script>

<style>
body{
font-family: 'NanumGothic';
/* background-color: #c3d9d6; */
background-image:url('images/memberinfobackground.png'); background-size: 100% 100%;
	   background-repeat : no-repeat; 
	   
}

#wrapper {
/* background-color: #c3d9d6; */ 

	height : 935px;
}

#header {
/* background-color: #c3d9d6; */
}
</style>


<script type="text/javascript">
function formCheck(){
	var f = document.modifyMemberForm;
	var pwRegExp = /^[a-z0-9]{6,15}$/;
	var nameRegExp = /^[가-힣]{2,6}$/;
	var nickNameRegExp = /^[가-힣]{1,5}$/;
	var emailRegExp = /^[a-z0-9]/;
		
	if(!pwRegExp.test(f.password.value) && f.password.value.length != 0){
		alert('비밀번호는 6~15자의 영문, 숫자 조합이어야 합니다.');
		return false;
	}
	if(f.password.value != f.password2.value){
		alert('비밀번호가 일치하지 않습니다.');
		return false;
	}
	if(!nameRegExp.test(f.name.value)){
		alert('이름은 2~6자의 한글이어야 합니다.');
		return false;
	}
	if(!nickNameRegExp.test(f.nickName.value)){
		alert('별명은 1~5자의 한글이어야 합니다.');
		return false;
	}
	if(!emailRegExp.test(f.email1.value) || f.email1.value.length == 0 || f.email2.value == ''){
		alert('이메일을 정확히 입력하세요.');
		return false;
	}
	
	return true;
}
function dropMember(){
	if(confirm('정말 탈퇴하시겠습니까?')){
		alert('그동안 이용해주셔서 감사합니다.');
		location.href="dropMember.cis";
	}
}
</script>

</head>
<body>

<div id="wrapper">
<div id="header">
<%@ include file="memberViewmenu.jsp" %>
</div>

<br><br>


	<br><br>
		<div class="hero-unit-memberinfoeditpage">
			<div id="metro span3"></div>
				<div id="metro span8">		
					<h1><span class="label-joinform label-info">개인정보 수정</span></h1>
					<br>
					
				
					<%
						Member member = (Member)session.getAttribute("member");
						String email[] = member.getEmail().split("@");
					%>
					
					<%-- <c:choose>
						<c:when test="<% email[1].equals("naver.com"); %>"><% defaultSelect="naver.com"; %></c:when>
						<c:when test="<% email[1].equals("hanmail.net"); %>"><% defaultSelect="hanmail.net"; %></c:when>
						<c:when test="<% email[1].equals("yahoo.com"); %>"><% defaultSelect="yahoo.com"; %></c:when>
						<c:when test="<% email[1].equals("google.co.kr"); %>"><% defaultSelect="google.co.kr"; %></c:when>
						<c:when test="<% email[1].equals("nate.com"); %>"><% defaultSelect="nate.com"; %></c:when>
						<c:when test="<% email[1].equals("dreamwiz.com"); %>"><% defaultSelect="dreamwiz.com"; %></c:when>
						<c:when test="<% email[1].equals("empal.com"); %>"><% defaultSelect="empal.com"; %></c:when>
						<c:when test="<% email[1].equals("gmail.com"); %>"><% defaultSelect="gmail.com"; %></c:when>
						<c:when test="<% email[1].equals("korea.com"); %>"><% defaultSelect="korea.com"; %></c:when>
					</c:choose> --%>


				<div class="modifymemberform">
				<form method="post" action="modifyMember.cis" name="modifyMemberForm" onsubmit="return formCheck()">
					<table>
						<tr>
							<td>아이디
							<td><%= member.getId() %>
							<input type="hidden" name="id" value="<%=member.getId() %>">
						</tr>
						<tr>
							<td>비밀번호
							<td><input type="password" name="password" id="password" size=20>
						</tr>
						<tr>
							<td>비밀번호 확인
							<td><input type="password" name="password2" id="password2" size=20>
						</tr>
						<tr>
							<td><td><div id="passwordCheck"></div>
						</tr>
						<tr>
							<td>이름
							<td><input type="text" name="name" value="<%= member.getName() %>" size=20>
						</tr>
						<tr>
							<td>별명
							<td><input type="text" name="nickName" value="<%= member.getNickName() %>" size=20>
						</tr>
						<tr>
							<td>이메일
							<td><input type="text" size="10" name="email1" value="<%= email[0] %>">@
								<select name="email2">
									<option>선택</option>
									<option value='1'>naver.com</option>
									<option value='2'>hanmail.net</option>
									<option value='3'>yahoo.com</option>
									<option value='4'>google.co.kr</option>
									<option value='5'>nate.com</option>
									<option value='6'>dreamwiz.com</option>
									<option value='7'>empal.com</option>
									<option value='8'>gmail.com</option>
									<option value='9'>korea.com</option>
								</select><br>
						</tr>
						<tr>
							<td colspan="3" align="center">
															
	 <br><br>
	  <input class="btn btn-default" type="button" onClick="history.back()" value="뒤로가기">
	  <input class="btn btn-info" type="reset" value="다시작성">
	  <input class="btn btn-success" type="submit" value="수정">
	  <input class="btn btn-danger" type="button" onClick="javascript:dropMember()" value="회원탈퇴">&nbsp;&nbsp;&nbsp;&nbsp;
	  </td>
						</tr>
					</table>
					</form>
				</div>
			</div>
</div>


</body>
</html>