<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="nhn.cistory.vo.Quiz" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style>
#wrapper {overflow : hidden}
#container { width : 850px; margin : 0 auto;}
</style>

<script src="//code.jquery.com/jquery-1.10.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="./bootstrap/css/bootstrap.css">
<script type="text/javascript" src="./bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">

var quiz_numAry = new Array();
var htr_keyrdAry = new Array();
var htr_ageAry = new Array();
var quizAry = new Array();
var quiz_solAry = new Array();
var quiz_descAry = new Array();
var i = 0;

<% for(int i=0; i<quizList.size(); i++){ %>
	quiz_numAry[i] = '<%= quizList.get(i).getQuiz_num() %>';
	htr_keyrdAry[i] = '<%= quizList.get(i).getHtr_keyrd() %>';
	htr_ageAry[i] = '<%= quizList.get(i).getHtr_age() %>';
	quizAry[i] = '<%= quizList.get(i).getQuiz() %>';
	quiz_solAry[i] = '<%= quizList.get(i).getQuiz_sol() %>';
	quiz_descAry[i] = '<%= quizList.get(i).getQuiz_desc() %>';
	i++;
<% } %>
function getQuiz(index){
	$('#quiz_num').html('<input type="hidden" id="quiz_numIn" name="quiz_num" value="'+quiz_numAry[index]+'">');
	$('#htr_tr').removeAttr('class');
	$('#htr_keyrd').html(htr_keyrdAry[index]);
	$('#htr_keyrd').removeAttr('class');
	$('#htr_keyrdIn').attr('class','hide');
	$('#htr_age').html(htr_ageAry[index]);
	$('#quiz').html('<input type="text" id="quizIn" name="quizIn" value="'+quizAry[index]+'">');
	$('#quiz_desc').html('<input type="text" id="quiz_descIn" name="quiz_descIn" value="'+quiz_descAry[index]+'">');
		
	var quiz_sol = document.getElementById('quiz_sol');
	if(quiz_solAry[index] == 'T'){
		quiz_sol[0].selected = true;
	}else if(quiz_solAry[index] == 'F'){
		quiz_sol[1].selected = true;
	}
	
	$('#quizForm').attr('action','modifyQuiz.cis');
	$('#quizForm').attr('onsubmit','return modifyQuiz()');
	$('#modifyQuizBtn').attr('value',"수정");
	$('#deleteQuizBtn').attr('value','삭제');
	$('#deleteQuizBtn').attr('onclick','javascript:deleteQuiz()');
	$('#deleteQuizBtn').attr('type','button');
}
function insertQuiz(){
	$('#quiz').html('<input type="text" name="quizIn" id="quizIn">');
	$('#quiz_desc').html('<input type="text" name="quiz_descIn" id="quiz_descIn">');
	$('#htr_tr').attr('class','hide');
	$('#htr_keyrd').attr('class','hide');
	$('#htr_keyrdIn').removeAttr('class');
	
	$('#quizForm').attr('action','insertQuiz.cis');
	$('#quizForm').attr('onsubmit','return quizFormCheck()');
	$('#modifyQuizBtn').attr('value',"입력");
	$('#deleteQuizBtn').attr('value','다시입력');
	$('#deleteQuizBtn').removeAttr('onclick');
	$('#deleteQuizBtn').attr('type','reset');
	
	var quiz_sol = document.getElementById('quiz_sol');
	quiz_sol[0].selected = true;
}
function modifyQuiz(){
	if(quizFormCheck()){
		if(confirm('정말 수정하시겠습니까?')){
			return true;
		}
	}
	return false;
}
function deleteQuiz(){
	var quiz_num = $('#quiz_numIn').val();
	
	if(confirm('정말 삭제하시겠습니까?')){
		location.href="deleteQuiz.cis?quiz_num="+quiz_num;	
	}
}
function quizFormCheck(){
	if($('#quizIn').val().length < 1){
		alert('문제를 입력하세요.');
		return false;
	}
	if($('#quiz_descIn').val().length < 1){
		alert('해설을 입력하세요.');
		return false;
	}
	
	return true;
}
</script>
</head>
<body>

<div id="wrapper">
	<div id="container">

<a data-toggle="modal" href="#quizInfo" class="btn btn-success pull-right" onclick="javascript:insertQuiz()">문제 생성</a>
<%
	Quiz quiz = null; 
	int i = 0;
%>

<table class="table table-striped">
   <thead>
   <tr>
      <th>번호
      <th>키워드
      <th>시대
      <th>문제
      <th>정답
      <th>
   </tr>
   </thead>
   <tbody>
<%
	for(i=0; i<quizList.size(); i++){ 
		quiz = quizList.get(i);
%>
	<tr>
		<td><%= quizFakeNum-- %>
		<td><%= quiz.getHtr_keyrd() %>
		<td><%= quiz.getHtr_age() %>
		<td><%= quiz.getQuiz() %>
		<td><%= quiz.getQuiz_sol() %>
		<td><a data-toggle="modal" href="#quizInfo" class="btn btn-success" onclick="javascript:getQuiz(<%= i %>)">?</a>
	</tr>
<%	} %>   
   </tbody>
   <tr>
   		<td colspan="6" class="pagination" align="center">
		   	<ul class="pagination">
		        <li><a href="adminQuestion.cis?quizPage=<%=quizCurPage - quizNavi.getPagePerGroup()%>">«</a></li>
				<% for (int k=quizNavi.getStartPageGroup() ; k<=quizNavi.getEndPageGroup();k++){ 
						if(k==quizCurPage) {%>
								 <li class="active"><a href="#"><%=k %></a></li>
						<%} else{%>
						        <li><a href="adminQuestion.cis?quizPage=<%=k%>"><%=k %></a></li>
						<%} %>
				<%} %>
		        <li><a href="adminQuestion.cis?quizPage=<%=quizCurPage + quizNavi.getPagePerGroup()%>">»</a></li>
		    </ul>
	    </td>
   </tr>
</table>

<div class="modal hide fade" id="quizInfo" aria-hidden="true" aria-labelledby="quizLabel">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="quizLabel">퀴즈 정보</h4>
      </div>
      <form method="post" id="quizForm" action="modifyQuiz.cis" onsubmit="javascript:modifyQuiz()">
      <input type="hidden" id="quiz_num">
      <div class="modal-body">
      	<table class="table">
      		<tr>
      			<td>키워드
      			<td><div id="htr_keyrd"></div>
      				<select id="htr_keyrdIn" name="htr_keyrdIn">
      				<%	for(i=0; i<htrList.size(); i++){ %>
      					<option value="<%=htrList.get(i).getHtr_num() %>"><%= htrList.get(i).getHtr_keyrd() %>
      				<%	} %>
      				</select>
      		</tr>
      		<tr id="htr_tr">
      			<td>시대
      			<td id="htr_age">
      		</tr>
      		<tr>
      			<td>문제
      			<td id="quiz">
      		</tr>
      		<tr>
      			<td>정답
      			<td><select id="quiz_sol" name="quiz_sol">
      					<option>T
      					<option>F
      				</select>
      		</tr>
      		<tr>
      			<td>해설
      			<td id="quiz_desc">
      		</tr>
      	</table>
      </div>
      <div class="modal-footer">
		<input type="submit" id="modifyQuizBtn" class="btn btn-success" value="수정">
		<input type="button" id="deleteQuizBtn" class="btn btn-success" onclick="javascript:deleteQuiz()" value="삭제">
		<a href="#" class="btn" data-dismiss="modal">취소</a>
      </div>
      </form>
    </div>
  </div>
</div>

</div>
</div>

</body>
</html>