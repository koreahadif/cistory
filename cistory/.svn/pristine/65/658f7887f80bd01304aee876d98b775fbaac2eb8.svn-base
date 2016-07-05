<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="nhn.cistory.vo.Member" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QUIZ</title>
<script src="//code.jquery.com/jquery-1.10.2.min.js"></script>

<style>
body{
font-family: 'NanumGothic';
/* background-color: #c3d9d6; */
background-image:url('images/green-blank-blackboard.jpg'); background-size: 100% 100%;
	   background-repeat : no-repeat; 
	   
}

#wrapper {
/* background-color: #c3d9d6; */ 

	height : 935px;
}

#container { margin-left:100px;}

</style>

<script type="text/javascript">
var id;
<%if(((Member)session.getAttribute("member"))!=null){%>
id = "<%=((Member)session.getAttribute("member")).getId()%>";
<%}%>
var i = 1;
var hNum;
var sol;
function nextQuiz(){
	if(i>10){
		alert('모든 문제를 다 풀으셨습니다.');
		return;
	}
	$('#quiz-solution').attr('class','hide');
	var param = {num:i};
	$.post("getQuiz.cis",param,quizData,"json");
 	i++;
}
function quizData(strText){
	hNum = strText.hNum;
	sol = strText.solution;
	$('#quizsub').html(strText.quiz);
	$('.descLabel').html('해설:'+strText.desc);
	$('.keywordLabel').html('연관 키워드:<a href="#footermodal" role="button" class="btn btn-large" data-toggle="modal">'+strText.keyword+'</a>');
	var param = {keyword : strText.keyword};
	$.post("searchCtg.cis", param, react, "json");
}
function react(strText){
	var url = strText.url;
	var keyword = strText.keyword;
	var desc = strText.desc;
	$('#mkeyword').html('<h2>'+keyword+'</h2>');
	if(id!=undefined){
		$('#mbutton').html('<a class="btn btn-info" href="javascript:addMyNote()">노트에 추가</a>');
	}
	$('#mdesc').html(desc);
	$('#murl').html('<img src="h_img/'+url+'">');
}
function temp(text){
	if(sol==text)
		$('.solutionLabel').html('<h1 style="color:yellow">정답입니다</h1>');
	else
		$('.solutionLabel').html('<h1>오답입니다</h1>');
	$('#quiz-solution').attr('class','non-hide');
}
function addMyNote(){
	var str='<textarea id="myNote" rows="3" placeholder="나만의노트입력"></textarea>';
		str+='<button class="btn" data-dismiss="modal" aria-hidden="true" onClick="reset()">취소</button>';
		str+='<button class="btn btn-primary" id="saveNote" onClick="submitMyNote()">노트 저장</button>';
	$('#expand').html(str);
	$('.footer').css("height","auto");
}
function reset(){
	$('#myNote').val('');
	$('#expand').html('');
	$('.footer').css("height","auto");	
}
function submitMyNote(){
	var param = {htrNum:hNum, myMemo:$('#myNote').val(), id:id};
	$.post("addMyNote.cis",param,nonAction);
	$('#saveNote').attr("aria-hidden",true);
	$('#saveNote').attr("data-dismiss","modal");
	$('#myNote').val('');
	$('#expand').html('');
}
function nonAction(str){
	alert('나만의 노트에 추가되었습니다.');
}
</script>
</head>
<body>
<div id="wrapper">
		<div id="header">
			<%@ include file="memberViewmenu.jsp"%>
		</div>
		<div id="container">
			<div id="quizmain">
				<div id="quizsub"></div>
				<div class="quizox">
				<img src="images/O.png" onClick="javascript:temp('o')"><span>&nbsp;</span><img src="images/X.png" onClick="javascript:temp('x')">	
				</div>
			</div>
			<table>
				<tr>
					<td width=700 height=300>
						<div id="quiz-solution" class="hide" style="margin-top:0;">
							<div class="solutionLabel"></div>
							<div class="descLabel"></div>
							<div class="keywordLabel"></div>
						</div>
					<td width=400 height=270 valign="bottom" align="right">
						<div class="next">
							<button class="btn btn-info btn-large" type="button" onClick='location.href="myNote.cis"'>역사노트로</button>
							<button class="btn btn-info btn-large" type="button" onClick="nextQuiz()">다음문제</button>
						</div>
				</tr>
			</table>
			
		</div>
	<div id="footermodal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="footer-quiz" style="color:white">
	  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<div id="mkeyword"></div>
			<div id="mbutton"></div>
			<div id="mdesc"></div>
			<div id="murl"></div>
			<div id="expand"></div>
		</div>
	</div>
</div>

<script type="text/javascript">nextQuiz();</script>
</body>
</html>