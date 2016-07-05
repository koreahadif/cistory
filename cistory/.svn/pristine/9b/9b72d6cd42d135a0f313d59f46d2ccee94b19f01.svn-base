<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="loginCheck.jsp" %>    
<%@ page import="java.util.*" %>
<%@ page import="nhn.cistory.vo.ThmWrongNote" %>
<%@ page import="nhn.cistory.vo.Question" %>
<%@ page import="nhn.cistory.vo.Obquestion" %>
<%@ page import="nhn.cistory.vo.Subquestion" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>테마오답노트</title>
<!-- <link rel="stylesheet" type="text/css" href="./assets/css/bootmetro.css">
<link rel="stylesheet" type="text/css" href="./assets/css/bootmetro-icons.css"> -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.css">

<script src="//code.jquery.com/jquery-1.10.0.min.js"></script>

<style>
body{

background-image:url('images/wrongnotepaperpic1.png'); background-size: 100% 750px;
 background-repeat : repeat;
 min-height : 1020px; 
}

/* #wrapper {
background-color: #c3d9d6;
} */

#wrapper{ overflow : hidden; }
.memberviewtextsize{
font-size: 70px;

}

#content {
width: 500px;
margin: 0 auto;
background-color : rgba(226, 230, 153, 0.34);
}

#giculexampic1{
 height : 338px;
}

.table-wrongnotepage {
background-color: rgba(236, 193, 193, 0.32);
}

#myTab {
background-color: rgb(61, 35, 26);
width: 1225px;
}

</style>


<!-- <script type="text/javascript" src="./bootstrap/js/bootstrap.js"></script> -->
<!-- <script type="text/javascript" src="./assets/js/bootmetro-panorama.js"></script>
<script type="text/javascript" src="./assets/js/bootmetro-pivot.js"></script> -->

<%
ArrayList<HashMap<String,Object>> thmWrongNotePage = (ArrayList<HashMap<String,Object>>) request.getAttribute("thmWrongNotePage");
%>

<script type="text/javascript">
$('.panorama').panorama({
	showscrollbuttons : true,
	keyboard : true,
	parallax : true
});

$('#pivot').pivot();

function checkConst1(str){
	
	$("#gradeBtn").html(str + ' <span class="caret"></span>');
	if(str == '혼합형'){
		str = '';
	}
	$("#gradeBtn").attr("value",str);
	
}
function checkConst2(str){
	
	$("#typeBtn").html(str + ' <span class="caret"></span>');
	if(str == '혼합형'){
		str = '';
	}
	$("#typeBtn").attr("value",str);
}
function checkConst3(str){
	
	$("#ageBtn").html(str + ' <span class="caret"></span>');
	if(str == '혼합형'){
		str = '';
	}
	$("#ageBtn").attr("value",str);
}
function checkCategory(){
	var grade = $("#gradeBtn").attr("value");
	var type = $("#typeBtn").attr("value");
	var age = $("#ageBtn").attr("value");
	
	var str = "thmWrongNote.cis?grade="+escape(encodeURIComponent(grade));
	str += "&q_type="+escape(encodeURIComponent(type));
	str += "&age="+escape(encodeURIComponent(age));
	//var str = "thmWrongNote.cis?grade="+grade+"&q_type="+type+"&age="+age;
	location.href=str;
}
function selectNote(num, exp, memo, type, user_sol, sol){
	var numDiv = document.getElementById("wrongNum");
	var solDiv = document.getElementById("solCompare");
	var expDiv = document.getElementById("wrongExp");
	var memoDiv = document.getElementById("wrongMemo");
	
	var numStr = '<input type="hidden" name="wr_no_num" id="wr_no_num" value="' + num + '">';
	var solStr;
	if(type == '객관식'){
		solStr = '정답 : '+sol+'<br>나의 답 : '+user_sol;
	}else{
		solStr = '정답 : '+sol+'<br>나의 답 : '+user_sol;
	}
	var expStr = exp;
	var memoStr = '<textarea rows="5" cols="15" name="wr_no_memo" id="wr_no_memo">' + memo + '</textarea>';
	
	numDiv.innerHTML = numStr;
	solDiv.innerHTML = solStr;
	expDiv.innerHTML = expStr;
	memoDiv.innerHTML = memoStr;
}
function modifyNote(){
	//var wr_no_num = document.getElementById('wr_no_num').value;
	//var wr_no_memo = document.getElementById('wrongMemo').firstChild.firstChild.nodeValue;
	//var wr_no_memo = document.modifyForm.wr_no_memo.value;

	if(confirm('수정하시겠습니까?')){
		/* location.href='member.cistory?action=modifyWrongNote&wr_no_num='+wr_no_num+'&wr_no_memo='+wr_no_memo; */
		return true;
	}
	
	return false;
}
function deleteNote(){
	var wr_no_num = document.getElementById('wr_no_num').value;

	if(confirm('삭제하시겠습니까?')){
		location.href='deleteThmWrongNote.cis?wr_no_num='+wr_no_num;
	}
}
function sizeReset(){
	for(var i= 0 ; i < <%= thmWrongNotePage.size() %>; i++){
		var t = $('.img-add-wrongnote'+i).children().css("height");
		var tmp = t.substring(0,3);
		var tmp2 = tmp>300?'300px':'auto';
		$('.img-add-wrongnote'+i).children().css("height",tmp2);
	}
}
</script>
</head>
<body onLoad="sizeReset()">

<div id="wrapper">

<div id="header">
<%@ include file="memberViewmenu.jsp" %>
</div>

<ul class="nav nav-tabs" id="myTab">
  <li><a href="wrongNote.cis">기출 오답 노트</a></li>
  <li class="active"><a href="#">테마 오답 노트</a></li>
</ul>

<%
	if(thmWrongNotePage.size() < 1){
%>
	<script type="text/javascript">
		alert('테마 오답 노트가 존재하지 않습니다.');
		location.href="thmWrongNote.cis?grade=&q_type=&age=";
	</script>
<%		
		return;
	}
	ThmWrongNote note = null;
	Obquestion obQuestion = null;
	Subquestion subQuestion = null;
	String currNoteType = ((ThmWrongNote) thmWrongNotePage.get(0).get("thmWrongNote")).getQ_type();
%>
	
	<div class="btn-toolbar">
		<div class="btn-group">
			<button class="btn btn-danger dropdown-toggle" data-toggle="dropdown" id="gradeBtn" value="">
				난이도 <span class="caret"></span>
			</button>
			<ul class="dropdown-menu">
				<li><a href="javascript:checkConst1('중급')">중급</a></li>
				<li><a href="javascript:checkConst1('고급')">고급</a></li>
				<li class="divider"></li>
				<li><a href="javascript:checkConst1('혼합형')">혼합형</a></li>
			</ul>
		</div>
		<!-- /btn-group -->
		<div class="btn-group">
			<button class="btn btn-warning dropdown-toggle"	data-toggle="dropdown" id="typeBtn" value="">
				문제유형 <span class="caret"></span>
			</button>
			<ul class="dropdown-menu">
				<li><a href="javascript:checkConst2('주관식')">주관식</a></li>
				<li><a href="javascript:checkConst2('객관식')">객관식</a></li>
				<li class="divider"></li>
				<li><a href="javascript:checkConst2('혼합형')">혼합형</a></li>
			</ul>
		</div>
		<!-- /btn-group -->
		<div class="btn-group">
			<button class="btn btn-success dropdown-toggle" data-toggle="dropdown" id="ageBtn" value="">
				시대구분 <span class="caret"></span>
			</button>
			<ul class="dropdown-menu">
				<li><a href="javascript:checkConst3('선사시대')">선사시대</a></li>
				<li><a href="javascript:checkConst3('삼국시대')">삼국시대</a></li>
				<li><a href="javascript:checkConst3('통일신라시대')">통일신라시대</a></li>
				<li><a href="javascript:checkConst3('고려')">고려</a></li>
				<li><a href="javascript:checkConst3('조선')">조선</a></li>
				<li><a href="javascript:checkConst3('근대')">근대</a></li>
				<li class="divider"></li>
				<li><a href="javascript:checkConst3('혼합형')">혼합형</a></li>
			</ul>
		</div>
		<button class="btn btn-info" onclick="javacript:checkCategory()">보기</button>
		<!-- /btn-group -->
	</div>

	<!-- <div class="metro panorama">
	<div class="panorama-sections">
		<div class="panorama-section">
			<h2>Theme Test</h2>
				<div class="tile-column-span-8">
					<form class="tile hexa text grade bg-color-gray" action="member.cistory" method="post" onClick="submit()">
					<input type="hidden" name="action" value="thmWrongNote">
					<input type="hidden" id="grade" name="grade">
					<input type="hidden" id="q_type" name="q_type">
					<input type="hidden" id="age" name="age">
						<div class="column-text">
							<ul class="unstyled">
		                        <li class="select1"></li>
		                        <li class="divider"></li>
		                        <li class="select2"></li>
	                        	<li class="divider"></li>
	                        	<li class="select3"></li>
	                        </ul>
                        </div>
						<div class="textover-wrapper bg-color-greenDark">
							<div class="text4">Test START!</div>
						</div>
					</form>
				</div>
		</div>
	</div> -->
	<div class="row">
	<div class="span9">
	<%	for(int i=0; i<thmWrongNotePage.size(); i++){ 
			note = (ThmWrongNote) thmWrongNotePage.get(i).get("thmWrongNote");
			if(note.getQ_type().equals("객관식")){
				obQuestion = (Obquestion) thmWrongNotePage.get(i).get("question");
	%>
  		<div class="metro">
			<a class="tile qudro text grade question" 
				href="javascript:selectNote(<%= note.getWr_no_num() %>, '<%= obQuestion.getQ_exp() %>', '<%= note.getWr_no_memo() %>'
						, '<%= obQuestion.getQ_type() %>', '<%= note.getUser_sol() %>', '<%= obQuestion.getOb_sol() %>')">
				<div class="test-add">
					<blockquote class="pull-right">
						<p><%= i+1 %>번. <%= obQuestion.getQuestion() %></p>
						<small><%= obQuestion.getGrade() %> / <%= obQuestion.getAge() %></small>
						<small><%= obQuestion.getPoint() %>점</small>
					</blockquote>
				</div>
				<div class="img-add-wrongnote<%=i%>"><img src="q_img/<%= obQuestion.getOb_desc() %>"></div>
				<ol>
					<br>
					<li><%= obQuestion.getCho1() %></li>
					<li><%= obQuestion.getCho2() %></li>
					<li><%= obQuestion.getCho3() %></li>
					<li><%= obQuestion.getCho4() %></li>
					<li><%= obQuestion.getCho5() %></li>
				</ol>
			</a>
		</div>
	<%		}else{ 
				subQuestion = (Subquestion) thmWrongNotePage.get(i).get("question");
	%>
		<div class="metro">
			<a class="tile qudro text grade question" 
				href="javascript:selectNote(<%= note.getWr_no_num() %>, '<%= subQuestion.getQ_exp() %>', '<%= note.getWr_no_memo() %>'
						, '<%= subQuestion.getQ_type() %>', '<%= note.getUser_sol() %>', '<%= subQuestion.getSub_sol()%>')">
				<div class="test-add">
					<blockquote class="pull-right">
						<p><%= i+1 %>번. <%= subQuestion.getQuestion() %></p>
						<small><%= subQuestion.getGrade() %> - <%= subQuestion.getAge() %></small>
						<small><%= subQuestion.getPoint() %>점</small>
					</blockquote>
				</div>
				<div class="img-add-wrongnote<%=i%>"><img src="q_img/<%= subQuestion.getSub_desc() %>"></div>
			</a>
		</div>
	<%		}
		}%>		
	</div>
	<div class="span3 bs-docs-sidebar">
		<div class="nav nav-list bs-docs-sidenav affix">
		<form method="post" action="modifyThmWrongNote.cis" name="modifyForm" onsubmit="modifyNote()">
		<div id="wrongNum"><input type="hidden" name="wr_no_num" id="wr_no_num" value="<%= ((ThmWrongNote) thmWrongNotePage.get(0).get("thmWrongNote")).getWr_no_num() %>"></div>
			<table class="table table-wrongnotepage">
				<tr>
					<td style="font-weight : bold; color : white; background-color : black;">정답 VS 내가 선택한 답<!--  ***배경색 -->
				</tr>			
				<tr>
					<td><div id="solCompare">
							정답 :<br>
							나의 답 :  
							
				<%-- <%	if(((Question) thmWrongNotePage.get(0).get("question")).getQ_type().equals("객관식")){ %>
						1 : 오답률<br>
						2 : 오답률<br>
						3 : 오답률(정답)<br>
						4 : 오답률<br>
						5 : 오답률(내가 선택한 답)<br>
						<!-- (td로 나눠서 색칠해주는 것도 좋을 듯..) -->
				<%	}else{ %>
						나의 답 : 임시시<br>정답 : 시시임
				<%	} %> --%>
						</div>
				</tr>
				<tr>
					<td style="font-weight : bold; color : white; background-color : black;">해설 보기<!--  ***배경색 -->
				</tr>
				<tr>
					<td><div id="wrongExp"><%= ((Question) thmWrongNotePage.get(0).get("question")).getQ_exp() %></div>
				</tr>
				<tr>
					<td style="font-weight : bold; color : white; background-color : black;">나의 메모<!--  ***배경색 -->
				</tr>
				<tr>
					<td><div id="wrongMemo"><textarea rows="5" cols="15" name="wr_no_memo" id="wr_no_memo" style="width : 95%"><%= ((ThmWrongNote) thmWrongNotePage.get(0).get("thmWrongNote")).getWr_no_memo() %></textarea></div>
				</tr>
				<tr style="text-align : center">
					<td><button class="btn btn-warning" type="submit" >메모수정</button>
						<button class="btn btn-info" type="button" onclick="javascript:deleteNote()">오답노트 삭제</button>
				</tr>
			</table></form>
		</div>		
	</div>
</div>
<div id="space"></div>
</div>
</body>
</html>