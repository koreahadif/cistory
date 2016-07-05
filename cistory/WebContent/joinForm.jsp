<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="nhn.cistory.vo.Member" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>joinForm</title>
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


<script>
var xmlHTTP;
var idValid = 'no';

$(document).ready(function(){
	var $kps = $("#password");
	
	$kps.keyup(passwordKeyUp);
});
function passwordKeyUp(e){
	var pwRegExp = /^[a-z0-9]{6,15}$/;
	var pw = document.joinForm.password.value;
	var pwChk = document.getElementById("passwordCheck");

	if(!pwRegExp.test(pw)){
		pwChk.innerHTML = '비밀번호는 6~15자의 영문, 숫자 조합이어야 합니다.';
	}else{
		pwChk.innerHTML = '유효한 비밀번호입니다.';
	}
}

function idChecking(){
	var f = document.joinForm;
	var idRegExp = /^[a-z0-9]{4,10}$/;
	if(!idRegExp.test(f.id.value)){
		alert('아이디는 4~10자의 영문, 숫자 조합이어야 합니다.');
		return false;
	}
	xmlHTTP = new XMLHttpRequest();
	xmlHTTP.onreadystatechange = goIdCheckForm;
	var data = 'id='+ document.joinForm.id.value;
	
	xmlHTTP.open("POST", "idCheck.cis", true);
	xmlHTTP.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xmlHTTP.send(data);
}

function goIdCheckForm(){
	if(xmlHTTP.readyState == 4){
		if(xmlHTTP.status == 200){
			var id = eval("("+xmlHTTP.responseText+")").checkedId;
			var overlap = 'yes';

			if(id == null){
				id = document.joinForm.id.value;
				overlap = 'no';
			}
			
			window.open('idCheckForm.cis?id=' + id + '&overlap=' + overlap + '', "idwin", "top=200, left=400, width=400, height=300, resizable=no");
		}
	}
}

function formCheck(){
	var f = document.joinForm;
	var idRegExp = /^[a-z0-9]{4,10}$/;
	var pwRegExp = /^[a-z0-9]{6,15}$/;
	var nameRegExp = /^[가-힣]{2,6}$/;
	var nickNameRegExp = /^[가-힣]{1,5}$/;
	var emailRegExp = /^[a-z0-9]/;
		
	if(idValid == 'no'){
		alert('아이디 중복확인을 해주세요.');
		return false;
	}
	if(!idRegExp.test(f.id.value)){
		alert('아이디는 4~10자의 영문, 숫자 조합이어야 합니다.');
		return false;
	}
	if(!pwRegExp.test(f.password.value)){
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

function submit(){
	document.joinForm.submit();
}

function reset(){
	document.joinForm.reset();
}
</script>

</head>
<!-- <body style="background-color: #c3d9d6;"> -->
<!-- <br><br><br><br><br><br><br><br><br><br> -->
<div id="wrapper">
	<div id="header">
	<%@ include file="memberViewmenu.jsp" %>
	</div>
	<div class="hero-unit-joinform">
		<div id="metro span3"></div>
		<div id="metro span8">
		 <form method="post" action="join.cis" name="joinForm" onsubmit="return formCheck()">
		  <h1><span class="label-joinform label-info">회원가입</span></h1>
		  <br>
		  <p><input type="text" name="id" id="id" size="10" placeholder="ID">
		  	<button type="button" class="btn btn-warning btn-small" onclick="javascript:idChecking()" name="idcheck">중복확인</button>
	  	  <p><input type="password" name="password" id="password" size=20 placeholder="비밀번호"></p>
		  <p><input type="password" name="password2" id="password2" size=20 placeholder="비밀번호확인"><div id="passwordCheck"></div></p>
		  <p><input type="text" name="name" size=20 placeholder="이름"></p>
		  <p><input type="text" name="nickName" size=20 placeholder="별명"></p>
		  <p><input type="text" size="10" name="email1" placeholder="이메일">@
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
										</select><br></p>
	      <br>
	      <div class="joinformend" align="center">								
		  <p>
		  <input class="btn btn-danger" type="submit" value="가입">
		  <!-- <button type="button" class="btn btn-danger btn-large" onClick="javascript:submit()">가입</button> -->
		  <!-- <input type="submit" value="가입"> -->
		  &nbsp;&nbsp;
		  <!-- <input type="reset" value="다시 작성"></p> -->
		  <input class="btn btn-success" type="reset" value="다시작성">
		  <!-- <button type="button" class="btn btn-success btn-large" onClick="javascript:reset()">다시작성</button> -->
		  </div>
		  </form>
	  </div>
	</div>
</div>
</body>
</html>