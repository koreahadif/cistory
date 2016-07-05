<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="nhn.cistory.vo.Subquestion" %>
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
var subQ_numAry = new Array();
var subQuestionAry = new Array();
var sub_descAry = new Array();
var sub_solAry = new Array();
var subQ_expAry = new Array();
var subPointAry = new Array();
var subAgeAry = new Array();
var subGradeAry = new Array();
var i = 0;

<% for(int i=0; i<subList.size(); i++){ %>
	subQ_numAry[i] = '<%= subList.get(i).getQ_num() %>';
	subQuestionAry[i] = '<%= subList.get(i).getQuestion() %>';
	sub_descAry[i] = '<%= subList.get(i).getSub_desc() %>';
	sub_solAry[i] = '<%= subList.get(i).getSub_sol() %>';
	subQ_expAry[i] = '<%= subList.get(i).getQ_exp() %>';
	subPointAry[i] = '<%= subList.get(i).getPoint() %>';
	subAgeAry[i] = '<%= subList.get(i).getAge() %>';
	subGradeAry[i] = '<%= subList.get(i).getGrade() %>';
	i++;
<% } %>
function getSub(index){
	
	$('#subQ_num').html('<input type="hidden" id="subQ_numIn" name="subQ_num" value="'+subQ_numAry[index]+'">');
	$('#subQuestion').html('<input type="text" id="subQuestionIn" name="subQuestionIn" value="'+subQuestionAry[index]+'">');
	$('#sub_desc').removeAttr('class');
	$('#sub_desc').html(sub_descAry[index]);
	$('#sub_desc').val(sub_descAry[index]);
	$('#sub_descImg').attr('src','q_img/'+sub_descAry[index]);
	$('#sub_descImgIn').val("");
	$('#sub_sol').html('<input type="text" id="sub_solIn" name="sub_solIn" value="'+sub_solAry[index]+'">');
	$('#subQ_exp').html('<input type="text" id="subQ_expIn" name="subQ_expIn" value="'+subQ_expAry[index]+'">');
	
	var subPoint = document.getElementById('subPoint');
	if(subPointAry[index] == '1'){
		subPoint[0].selected = true;
	}else if(subPointAry[index] == '2'){
		subPoint[1].selected = true;
	}else if(subPointAry[index] == '3'){
		subPoint[2].selected = true;
	}
	
	var subGrade = document.getElementById('subGrade');
	if(subGradeAry[index] == '중급'){
		subGrade[0].selected = true;
	}else if(subGradeAry[index] == '고급'){
		subGrade[1].selected = true;
	}
	
	var subAge = document.getElementById('subAge');
	if(subAgeAry[index] == '선사시대'){
		subAge[0].selected = true;
	}else if(subAgeAry[index] == '삼국시대'){
		subAge[1].selected = true;
	}else if(subAgeAry[index] == '통일신라'){
		subAge[2].selected = true;
	}else if(subAgeAry[index] == '고려'){
		subAge[3].selected = true;
	}else if(subAgeAry[index] == '조선'){
		subAge[4].selected = true;
	}else if(subAgeAry[index] == '근대'){
		subAge[5].selected = true;
	}
	
	$('#subForm').attr('action','modifySub.cis');
	$('#subForm').attr('onsubmit','return modifySub()');
	$('#modifySubBtn').attr('value',"수정");
	$('#deleteSubBtn').attr('value','삭제');
	$('#deleteSubBtn').attr('onclick','javascript:deleteSub()');
	$('#deleteSubBtn').attr('type','button');
}
function insertSub(){
	$('#subQuestion').html('<input type="text" name="subQuestionIn" id="subQuestionIn">');
	$('#sub_desc').attr('class','hide');
	$('#sub_descImg').attr('src','#');
	$('#sub_descImgIn').val("");
	$('#sub_sol').html('<input type="text" name="sub_solIn" id="sub_solIn">');
	$('#subQ_exp').html('<input type="text" name="subQ_expIn" id="subQ_expIn">');
	
	$('#subForm').attr('action','insertSub.cis');
	$('#subForm').attr('onsubmit','return subFormCheck()');
	$('#modifySubBtn').attr('value',"입력");
	$('#deleteSubBtn').attr('value','다시입력');
	$('#deleteSubBtn').removeAttr('onclick');
	$('#deleteSubBtn').attr('type','reset');
	
	var subPoint = document.getElementById('subPoint');
	subPoint[0].selected = true;
	
	var subGrade = document.getElementById('subGrade');
	subGrade[0].selected = true;

	var subAge = document.getElementById('subAge');
	subAge[0].selected = true;
}
function modifySub(){
	if(subFormCheck()){
		if(confirm('정말 수정하시겠습니까?')){
			return true;
		}	
	}
	return false;
}
function deleteSub(){
	var q_num = $('#subQ_numIn').val();
	var sub_desc = $('#sub_descImg').attr('src');
	
	if(confirm('정말 삭제하시겠습니까?')){
		location.href="deleteQuestion.cis?q_num="+q_num+"&desc="+sub_desc;	
	}
}
function subFormCheck(){
	var descRegExp = /.png$/;

	if($('#subQuestionIn').val().length < 1){
		alert('문제를 입력하세요.');
		return false;
	}
	if(!descRegExp.test($('#sub_descImgIn').val()) && !descRegExp.test($('#sub_desc').val())){
		alert('문제예시에 들어갈 이미지의 확장자는 png이어야 합니다.');
		return false;
	}
	if($('#sub_solIn').val().length < 1){
		alert('정답을 입력하세요.');
		return false;
	}
	if($('#subQ_expIn').val().length < 1){
		alert('해설을 입력하세요.');
		return false;
	}
	
	return true;
}
function readSubURL(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function (e) {
		    $('#sub_descImg').attr('src', e.target.result);
		    $('#sub_desc').attr('class','hide');
		    $('#sub_desc').val('');
		}
		reader.readAsDataURL(input.files[0]);
	}
}
</script>
</head>
<body>

<div id="wrapper">
	<div id="container">

<a data-toggle="modal" href="#subInfo" class="btn btn-info pull-right" onclick="javascript:insertSub()">문제 생성</a>
<%	Subquestion sub = null; %>

<table class="table table-striped">
   <thead>
   <tr>
      <th>번호
      <th>문제
      <th>시대
      <th>등급
      <th>오답률
      <th>점수
   </tr>
   </thead>
   <tbody>
<%
	for(int i=0; i<subList.size(); i++){ 
		sub = subList.get(i);
%>
	<tr>
		<td><%= subFakeNum-- %>
		<td><%= sub.getQuestion() %>
		<td><%= sub.getAge() %>
		<td><%= sub.getGrade() %>
		<td><%= sub.getWrong_count() %>
		<td><a data-toggle="modal" href="#subInfo" class="btn btn-info" onclick="javascript:getSub(<%= i %>)">?</a>
	</tr>
<%	} %>   
   </tbody>
   <tr>
   		<td colspan="6" class="pagination" align="center">
		   	<ul class="pagination">
		        <li><a href="adminQuestion.cis?subPage=<%=subCurPage - subNavi.getPagePerGroup()%>">«</a></li>
				<% for (int j=subNavi.getStartPageGroup() ; j<=subNavi.getEndPageGroup();j++){ 
						if(j==subCurPage) {%>
								 <li class="active"><a href="#"><%=j %></a></li>
						<%} else{%>
						        <li><a href="adminQuestion.cis?subPage=<%=j%>"><%=j %></a></li>
						<%} %>
				<%} %>
		        <li><a href="adminQuestion.cis?subPage=<%=subCurPage + subNavi.getPagePerGroup()%>">»</a></li>
		    </ul>
	    </td>
   </tr>
</table>

<div class="modal hide fade" id="subInfo" aria-hidden="true" aria-labelledby="subLabel">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="subLabel">주관식 문제 정보</h4>
      </div>
      <form method="post" id="subForm" action="modifySub.cis" onsubmit="javascript:modifySub()"
      			 enctype="multipart/form-data" runat="server">
      <input type="hidden" id="subQ_num">
      <div class="modal-body">
      	<table class="table">
      		<tr>
      			<td>문제
      			<td id="subQuestion">
      		</tr>
      		<tr>
      			<td>문제예시
      			<td>
      				<img id="sub_descImg" src="#" width="200" height="50"/>
      				<div id="sub_desc"></div>
					<input type='file' id="sub_descImgIn" name="sub_descImgIn" onchange="readSubURL(this)"/> 
      		</tr>
      		<tr>
      			<td>정답
      			<td id="sub_sol">
      		</tr>
      		<tr>
      			<td>해설
      			<td id="subQ_exp">
      		</tr>
      		<tr>
      			<td>점수
      			<td><select id="subPoint" name="subPoint">
   						<option>1
   						<option>2
   						<option>3
   					</select>
      		</tr>
      		<tr>
      			<td>등급
      			<td><select id="subGrade" name="subGrade">
      					<option>중급
      					<option>고급
      				</select>
      		</tr>
      		<tr>
      			<td>시대
      			<td><select id="subAge" name="subAge">
      					<option>선사시대
      					<option>삼국시대
      					<option>통일신라
      					<option>고려
   						<option>조선
   						<option>근대
   					</select>
      		</tr>
      		<tr>
      			<td>오답률
      			<td id="">Not yet
      		</tr>
      	</table>
      </div>
      <div class="modal-footer">
		<input type="submit" id="modifySubBtn" class="btn btn-info" value="수정">
		<input type="button" id="deleteSubBtn" class="btn btn-info" onclick="javascript:deleteSub()" value="삭제">
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