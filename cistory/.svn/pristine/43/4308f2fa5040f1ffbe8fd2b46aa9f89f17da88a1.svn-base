<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="nhn.cistory.vo.Member" %>
<%@ include file="loginCheck.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>테마 시험</title>
<script src="//code.jquery.com/jquery-1.10.0.min.js"></script>
<!--[if IE 7]>
   <script type="text/javascript" src="scripts/bootmetro-icons-ie7.js">
   <![endif]-->
   
<style>

body{
background-image:url('images/wrongnotepaper.png'); background-size: 100% 100%;
	   background-repeat : no-repeat;
}

#themetestalign {
margin: 0 auto;
margin-top: 100px;
background-color :rgba(255, 255, 255, 0.35);
width : 500px;
height : 100%;
}

#wrapper{  overflow : hidden; min-height : 1025px;  }

</style>   
   
<script type="text/javascript">
var id = '<%=((Member)session.getAttribute("member")).getId()%>';
var page = 0; var i = 0;
var array = new Array();
var array2 = new Array();
var q1;var q2; var q3; var q4; var q5; var question; var desc; var point;
<%ArrayList<HashMap<String,String>> list = (ArrayList<HashMap<String,String>>)request.getAttribute("list");
  HashMap<String, String> constMap = (HashMap<String, String>) request.getAttribute("constMap"); 
for(int i = 0 ;i <list.size() ; i ++){
	HashMap<String,String> map = list.get(i);%>
	array2[i]='<%=map.get("type")%>';
	array[i]='<%=String.valueOf(map.get("num"))%>';
	i++;
<%}%>
function parseData(strText){
	if(strText!=null){
		if(strText.q1 != undefined){
			q1 = strText.q1;
			q2 = strText.q2;
			q3 = strText.q3;
			q4 = strText.q4;
			q5 = strText.q5;
		}
		question = strText.question;
		desc = strText.desc;
		point = strText.point;
	}else{
		
	}
	page++;
}
function nextQuestion(){
	$('#wrongNote').val('');
	var param = {qNum:array[page], qType:array2[page]};
	$.post("getTQuestion.cis",param,parseData,"json")
	.done(function(data){
		var str='';
		if(array2[page-1] == null){
			alert('마지막 문제입니다.');
			if(confirm('테마시험 선택 화면으로 돌아가시겠습니까?')){
				location.href="pretheme.cis";
			}
		}else if(array2[page-1]=='객관식'){
			str += '<div class="theme"><div class="question"><h3>Q. '+question+'&nbsp;&nbsp;&nbsp;'+point+'점</h3></div>';
			str += '<div class="desc" align="center"><img src="q_img/'+desc+'"></div><br>';
			if(q1.charAt(0) == '<'){
				str += '<div align="center"><input type="radio" name="userSol" value="1">'+q1;
				str += '<input type="radio" name="userSol" value="2">'+q2;
				str += '<input type="radio" name="userSol" value="3">'+q3;
				str += '<input type="radio" name="userSol" value="4">'+q4;
				str += '<input type="radio" name="userSol" value="5">'+q5+'</div></div><br>';
			}else{
				str += '<ul style="width:60%; margin:0 auto;"><li><input type="radio" name="userSol" value="1">'+q1+'</li>';
				str += '<li><input type="radio" name="userSol" value="2">'+q2+'</li>';
				str += '<li><input type="radio" name="userSol" value="3">'+q3+'</li>';
				str += '<li><input type="radio" name="userSol" value="4">'+q4+'</li>';
				str += '<li><input type="radio" name="userSol" value="5">'+q5+'</li></ul></div><br>';
			}
			
			str += '<div class="pull-right">';
			str += '<a href="thmWrongNote.cis?grade=&q_type=&age=" class="btn btn-info" style="margin-bottom:100px">오답노트로 가기</a>';
			str += '<a href="#myModal" role="button" class="btn btn-info" data-toggle="modal" onClick="getAnswer()" style="margin-bottom : 100px">정답확인</a>';
			str += '</div>';
			$('#dynamic').html('<div class="data">'+str+'</div>');
		}
		else{
			str += '<div class="theme"><div class="question"><h3>Q. '+question+'&nbsp;&nbsp;&nbsp;'+point+'점</h3></div>';
			str += '<div class="desc" align="center">'+desc+'</div>';
			str += '<div class="form-search"><input type="text" class="input-medium"></div>';
			str += '<div class="pull-right">';
			str += '<a href="thmWrongNote.cis?grade=&q_type=&age=" class="btn btn-info" style="margin-bottom:100px">오답노트로 가기</a>';
			str += '<a href="#myModal" role="button" class="btn" data-toggle="modal" onClick="getAnswer()">정답확인</a>';
			str += '</div>';
			$('#dynamic').html('<div class="data">'+str+'</div>');
		}
		
	});
}
function answerData(strText){
	if($("input:radio[name=userSol]:checked").val()==strText.solution)
		{	
		     
		
		var str2 = '<div class="alerttheme fade in">';
		str2+='<button type="button" class="close" data-dismiss="alert">×</button>';
		str2+='<strong>정답입니다!</strong> ';
		str2+='</div>';
		$('#themetestalert').html(str2);
		/* alert('정답!!!'); */
		}
	else{
		var str1 = '<div class="alerttheme fade in">';
		str1+='<button type="button" class="close" data-dismiss="alert">×</button>';
		str1+='<strong>오답입니다!</strong> ';
		str1+='</div>';
		$('#themetestalert').html(str1);
		
		
		/* alert('오답...'); */ 
	 
	$('#myModalLabel').html('Q. '+strText.question+'&nbsp;&nbsp;&nbsp;'+strText.point+'점');
	$('#descLabel').html('<img src="q_img/'+strText.desc+'">');
	}
	if(strText.q1!=undefined){
		var str = '<ol class="list-group">';
		str+='<li class="list-group-item">'+strText.q1+'</li>';
		str+='<li class="list-group-item">'+strText.q2+'</li>';
		str+='<li class="list-group-item">'+strText.q3+'</li>';
		str+='<li class="list-group-item">'+strText.q4+'</li>';
		str+='<li class="list-group-item">'+strText.q5+'</li>';
		str+='</ol>';
		$('#selLabel').html(str);
	}
	$('#solutionLabel').html('<strong>정답:</strong>'+strText.solution);
	$('#expLabel').html('<strong>해설:</strong>'+strText.exp);
}
function getAnswer(){
	var param = {qNum:array[page-1], qType:array2[page-1]};	
	$.post("getTAnswer.cis",param,answerData,"json");
}
function checkWrongNo(){
	if($('#wrongNote').val()=='오답노트입력'){
		if(confirm('내용 없이 추가하시겠습니까?')){
			addWrongNote();
			alert('오답노트에 추가되었습니다');
		}
	}
	else{
		addWrongNote();
		alert('오답노트에 추가되었습니다');
	}
	$('#wrongbtn').attr("aria-hidden",true);
	$('#wrongbtn').attr("data-dismiss","modal");
	nextQuestion();
	$('#wrongNote').val('오답노트입력');
}
function addWrongNote(){
	var param = {qNum:array[page-1], wrMemo:$('#wrongNote').val(), id:id, userSol:$(":input:radio[name=userSol]:checked").val()};
	$.post("addWrongNote.cis",param,nonAction,"json");
}
function nonAction(){
}
</script>
</head>
<body>

<div id="wrapper">
		
		<div id="header">
			<%@ include file="memberViewmenu.jsp"%>
		</div>
		<br><br><br>
		
		<div style="width:55%; margin:0 auto;">
			<button class="btn btn-danger"><%= constMap.get("grade") %></button>
			<button class="btn btn-warning"><%= constMap.get("q_type") %></button>
			<button class="btn btn-success"><%= constMap.get("age") %></button>
			<a href="pretheme.cis" class="btn btn-primary">테마시험 선택</a>
		</div>
		<div id="themetestalign" style="width:55%; margin:0 auto;">
		<div id="dynamic"></div></div>
		<!-- <div class="alert fade in">
        	<button type="button" class="close" data-dismiss="alert">×</button>
        	<strong>정답입니다!</strong> 
      	</div> -->
      	
		<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-header">
	  			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	  			<h3 id="myModalLabel"></h3>
			</div>
			<div class="modal-body">
	  			<p id="themetestalert"></p>
	  			<p id="descLabel"></p>
	  			<p id="selLabel"></p>
	  			<p id="solutionLabel"></p>
				<p id="expLabel"></p>
				<p id="texta"><textarea id="wrongNote" rows="3" style="width : 400px" placeholder="오답노트입력"></textarea>
			</div>
			

	<div class="modal-footer">
    <button class="btn btn-success" data-dismiss="modal" aria-hidden="true" onClick="nextQuestion()">다음문제풀기</button>
    <button class="btn btn-primary" id="wrongbtn" onClick="checkWrongNo()">오답노트</button>
  	</div>
</div>


<div class="pull-right">

<script type="text/javascript">
nextQuestion();
</script>

</div>

<div id="space"></div>
</div>

</body>
</html>