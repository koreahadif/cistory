<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="nhn.cistory.vo.WrongNote" %>
<%@ page import="nhn.cistory.vo.Obquestion" %>     
<%@ include file="loginCheck.jsp" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>wrongNotePage</title>
<!-- <link href="./css/bootstrap.css" rel="stylesheet"> -->
<!-- <link rel="stylesheet" type="text/css" href="./assets/css/bootmetro.css"> -->
<script src="//code.jquery.com/jquery-1.10.0.min.js"></script>

<%
	ArrayList<WrongNote> wrongNotePage = (ArrayList<WrongNote>) request.getAttribute("wrongNotePage");
	ArrayList<Obquestion> obList = (ArrayList<Obquestion>) request.getAttribute("obList");
	WrongNote note = null;
	Obquestion question = null;
%>

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
/* .memberviewtextsize{
font-size: 70px;

} */

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


<script type="text/javascript">
function selectNote(num, exp, memo, q_num, age, ob_sol, user_sol){
	var numDiv = document.getElementById("wrongNum");
	var solDiv = document.getElementById("solCompare");
	var expDiv = document.getElementById("wrongExp");
	var memoDiv = document.getElementById("wrongMemo");
	
	var numStr = '<input type="hidden" name="wr_no_num" id="wr_no_num" value="' + num + '">';
	var solStr = '정답 : '+ob_sol+'<br>나의 답 : '+user_sol;
	var expStr = exp;
	var memoStr = '<textarea rows="5" cols="15" name="wr_no_memo" id="wr_no_memo">' + memo + '</textarea>';
	
	numDiv.innerHTML = numStr;
	solDiv.innerHTML = solStr;
	expDiv.innerHTML = expStr;
	memoDiv.innerHTML = memoStr;
	
	$('#q_num').attr('value', q_num);
	$('#age').attr('value', age);
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
		location.href='deleteWrongNote.cis&wr_no_num='+wr_no_num+'&test_num='+<%= wrongNotePage.get(0).getTestNum() %>;
	}
}
function sizeReset(){
	for(var i= 0 ; i < <%=wrongNotePage.size()%>; i++){
		var t = $('.img-add-wrongnote'+i).children().css("height");
		var tmp = t.substring(0,3);
		var tmp2 = tmp>300?'300px':'auto';
		$('.img-add-wrongnote'+i).children().css("height",tmp2);
	}
}
function questionData(){
	var q_num = $('#q_num').attr('value');
	var age = $('#age').attr('value');
	
	for(var i=1; i<5; i++){
		$('#rec'+i).attr('class','hide');
	}
	
	if(q_num != null && age != null){
		var param = {q_num : q_num, age : age};
		$.post('getRecQuestion.cis', param, getRecQuestion, "json");
	}
}
function getRecQuestion(objRes){
	var str = '';

	for(var i=0; i<objRes.recList.length; i++){
		str = '';
		var rec = objRes.recList[i];

		str += '<table><tr><td colspan=2>Q. '+rec.question+'</tr>';
		str += '<tr><td rowspan=5>'+rec.ob_desc+'<td>1.'+rec.cho1+'</tr>';
		str += '<tr><td>2.'+rec.cho2+'</tr><tr><td>3.'+rec.cho3+'</tr><tr><td>4.'+rec.cho4+'</tr><tr><td>5.'+rec.cho5+'</tr>';
		str += '<tr><td colspan=2><a data-toggle="collapse" href="#sol'+(i+1)+'">정답 보기</a></tr></table>';//+rec.ob_sol+'</tr><tr><td colspan=2>'+rec.q_exp+'</tr></table><br><br>';
		str += '<div class="accordion-group" style="width: 500px; margin-left: 5px">';
		str += '<div class="accordion-heading"><div id="sol'+(i+1)+'" class="accordion-body collapse">';
		str += '<div class="accordion=inner">정답 : '+rec.ob_sol+'<br>&nbsp;'+rec.q_exp+'</div></div></div></div>';
		
		$('#rec'+(i+1)).html(str);
		$('#rec'+(i+1)).removeAttr('class');
	}
	if(objRes.recList.length == 0){
		str = '<h1>추천 문제가 존재하지 않습니다.</h1>';
		$('#rec1').html(str);
		$('#rec1').removeAttr('class');
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
  <li class="active"><a href="#">기출 오답 노트</a></li>
  <li><a href="thmWrongNote.cis?grade=&q_type=&age=">테마 오답 노트</a></li>
</ul>

<div class="row">
	<div class="span9">
	<%	for(int i=0; i<wrongNotePage.size(); i++){ 
			note = wrongNotePage.get(i);
			question = obList.get(i);
	%>
  		<div class="metro">
			<a class="tile qudro text grade question" 
				href="javascript:selectNote(<%=note.getWr_no_num()%>, '<%=question.getQ_exp()%>', '<%=note.getWr_no_memo()%>'
					, <%=question.getQ_num()%>, '<%=question.getAge()%>', '<%=question.getOb_sol()%>', <%=note.getUser_sol()%>)">
				<div class="test-add">
					<blockquote class="pull-right">
						<p><%= note.getTest_tmp_num() %>번. <%= question.getQuestion() %></p>
						<small><%= question.getGrade() %> / <%= question.getAge() %></small>
						<small><%= question.getPoint() %>점</small>
					</blockquote>
				</div>
				<div class="img-add-wrongnote<%=i %>"><img src="q_img/<%= question.getOb_desc() %>"></div>
					<%if(!question.getCho1().endsWith("png")){ %>
				<ol>
					<br>
					<li><%= question.getCho1() %></li>
					<li><%= question.getCho2() %></li>
					<li><%= question.getCho3() %></li>
					<li><%= question.getCho4() %></li>
					<li><%= question.getCho5() %></li>
				</ol>
				<%}else{ %>
					<span>1.<img style="max-width:120px" src="q_img/<%= question.getCho1() %>"></span>
					<span>2.<img style="max-width:120px" src="q_img/<%= question.getCho2() %>"></span>
					<span>3.<img style="max-width:120px" src="q_img/<%= question.getCho3() %>"></span>
					<span>4.<img style="max-width:120px" src="q_img/<%= question.getCho4() %>"></span>
					<span>5.<img style="max-width:120px" src="q_img/<%= question.getCho5() %>"></span>
				<%} %>
			</a>
		</div>
	<%	} %>		
	</div>
	<div class="span3 bs-docs-sidebar">
		<div class="nav nav-list bs-docs-sidenav affix">
		<form method="post" action="modifyWrongNote.cis" name="modifyForm" onsubmit="modifyNote()">
			<input type="hidden" name="test_num" value="<%= wrongNotePage.get(0).getTestNum() %>">
			<input type="hidden" id="q_num">
			<input type="hidden" id="age">
		<div id="wrongNum"><input type="hidden" name="wr_no_num" id="wr_no_num" value="<%= wrongNotePage.get(0).getWr_no_num() %>"></div>
			<table class="table table-wrongnotepage">
				<tr>
					<td style="font-weight : bold; color : white; background-color : black;">정답 VS 내가 선택한 답<!--  ***배경색 -->
				</tr>
				<tr>
					<td><div id=solCompare>정답 :<br>나의 답 : </div>
				</tr>
				<tr>
					<td style="font-weight : bold; color : white; background-color : black;">해설 보기<!--  ***배경색 -->
				</tr>
				<tr>
					<td><div id="wrongExp"><%= obList.get(0).getQ_exp() %></div>
				</tr>
				<tr>
					<td style="font-weight : bold; color : white; background-color : black;">나의 메모<!--  ***배경색 -->
				</tr>
				<tr>
					<td><div id="wrongMemo" ><textarea rows="5" cols="15" name="wr_no_memo" id="wr_no_memo" style="width : 95%;"><%= wrongNotePage.get(0).getWr_no_memo() %></textarea></div>
				</tr>
				<tr>
					<td style="text-align : center; "><button type="submit" class="btn btn-warning">메모수정</button>
						<button type="button" class="btn btn-info" onclick="javascript:deleteNote()">오답노트 삭제</button> 
						<a data-toggle="modal" href="#recQuestion" class="btn btn-success" onclick="javascript:questionData()">추천 문제</a>
				</tr>
			</table></form>
		</div>		
	</div>
	<div id="space"></div>
</div>
</div>
<div class="modal hide fade" id="recQuestion" aria-hidden="true" aria-labelledby="recQuestionLabel">
  <div class="modal-dialog">
    <div class="modal-content">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
      <div class="modal-body">
 			<div id="rec1"></div>
 			<div id="rec2"></div>
 			<div id="rec3"></div>
 			<div id="rec4"></div>
      </div>
    </div>
  </div>
</div>

</body>
</html>