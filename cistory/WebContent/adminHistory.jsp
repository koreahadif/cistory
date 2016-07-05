<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="nhn.cistory.vo.History" %>  
<%@ page import="nhn.cistory.util.PageNavigator" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	final int TAG_MAX = 6;
	ArrayList<History> htrList = (ArrayList<History>) request.getAttribute("htrList");
	PageNavigator navi =(PageNavigator) request.getAttribute("navi");
 	int curPage = navi.getCurrentPage();
 	int fakeNum=(navi.getTotalRecordsCount()-((curPage-1)*(navi.getPagePerGroup())));
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>adminHistory</title>

<style>
#wrapper {overflow : hidden}
#container { width : 850px; margin : 0 auto;}
td {text-align: center;}



</style>

<script src="//code.jquery.com/jquery-1.10.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="./bootstrap/css/bootstrap.css">
<script type="text/javascript" src="./bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
var TAG_MAX = 6; 
var htr_numAry = new Array();
var htr_keyrdAry = new Array();
var htr_imgAry = new Array();
var htr_descAry = new Array();
var htr_tagAry = new Array();
var htr_typeAry = new Array();
var htr_ageAry = new Array();
var htr_dateAry = new Array();
var i = 0;

<% 
	for(int i=0; i<htrList.size(); i++){ 
%>
	htr_numAry[i] = '<%= htrList.get(i).getHtr_num() %>';
	htr_keyrdAry[i] = '<%= htrList.get(i).getHtr_keyrd() %>';
	htr_imgAry[i] = '<%= htrList.get(i).getHtr_imguri() %>';
	htr_descAry[i] = '';
<%	
	if(htrList.get(i).getHtr_desc().contains("\n")){ 
		String descAry[] = 	htrList.get(i).getHtr_desc().split("\n");
		for(int j=0; j<descAry.length; j++){
%>
			htr_descAry[i] += "<%= descAry[j] %>"+"\n";
<%		}
	}else{ 
%>		
		htr_descAry[i] = "<%= htrList.get(i).getHtr_desc() %>";
<%	} %>
	htr_tagAry[i] = '<%= htrList.get(i).getHtr_tag() %>';
	htr_typeAry[i] = '<%= htrList.get(i).getHtr_type() %>';
	htr_ageAry[i] = '<%= htrList.get(i).getHtr_age() %>';
	htr_dateAry[i] = '<%= htrList.get(i).getHtr_date() %>';
	i++;
<% } %>

function getHistory(index){
	$('#htr_num').attr('value', htr_numAry[index]);
	$('#htr_keyrd').val(htr_keyrdAry[index]);
	$('#htr_imguri').removeAttr('class');
	$('#htr_imguri').html(htr_imgAry[index]);
	$('#htr_imguri').val(htr_imgAry[index]);
	$('#htr_img').attr('src','h_img/'+htr_imgAry[index]);
	$('#htr_imgIn').val("");
	$('#htr_desc').html(htr_descAry[index]);
	
	var tags = new Array();
	var i = 0;
	tags = htr_tagAry[index].split('/');
	for(i=0; i<TAG_MAX; i++){
		if(i<tags.length){
			$('#htr_tag'+i).val(tags[i]);
			$('#tag'+i).removeAttr('class');
		}else{
			$('#htr_tag'+i).val('');
			$('#tag'+i).attr('class', 'hide');
		}
	}
	$('#htr_date').val(htr_dateAry[index]);

	var htr_type = document.getElementById('htr_type');
	if(htr_typeAry[index] == '인물'){
		htr_type[0].selected = true;
	}else if(htr_typeAry[index] == '사건'){
		htr_type[1].selected = true;
	}else if(htr_typeAry[index] == '문화재'){
		htr_type[2].selected = true;
	}
	
	var htr_age = document.getElementById('htr_age');
	if(htr_ageAry[index] == '선사시대'){
		htr_age[0].selected = true;
	}else if(htr_ageAry[index] == '삼국시대'){
		htr_age[1].selected = true;
	}else if(htr_ageAry[index] == '통일신라'){
		htr_age[2].selected = true;
	}else if(htr_ageAry[index] == '고려'){
		htr_age[3].selected = true;
	}else if(htr_ageAry[index] == '조선'){
		htr_age[4].selected = true;
	}else if(htr_ageAry[index] == '근대'){
		htr_age[5].selected = true;
	}
	
	$('#htrForm').attr('action','modifyHistory.cis');
	//$('#htrForm').attr('onsubmit','return htrFormCheck()');
	$('#htrForm').attr('onsubmit','return modifyHistory()');
	$('#modifyHistoryBtn').attr('value',"수정");
	$('#deleteHistoryBtn').attr('value','삭제');
	$('#deleteHistoryBtn').attr('onclick', 'javascript:deleteHistory()');
	$('#deleteHistoryBtn').attr('type','button');
}
function insertHistory(){
	//$('#htr_num').attr('value', htr_numAry[index]);
	$('#htr_keyrd').val('');
	$('#htr_imguri').attr('class', 'hide');
	$('#htr_img').attr('src','#');
	$('#htr_imgIn').val("");
	$('#htr_desc').html('');
	
	for(var i=0; i<TAG_MAX; i++){
		if(i<1){
			$('#htr_tag'+i).val('');
			$('#tag'+i).removeAttr('class');
		}else{
			$('#htr_tag'+i).val('');
			$('#tag'+i).attr('class', 'hide');
		}
	}
	$('#htr_date').val('');
	//$('#htr_date').attr('value','');
	var htr_type = document.getElementById('htr_type');
	htr_type[0].selected = true;
	
	var htr_age = document.getElementById('htr_age');
	htr_age[0].selected = true;
	
	$('#htrForm').attr('action','insertHistory.cis');
	$('#htrForm').attr('onsubmit','return htrFormCheck()');
	$('#modifyHistoryBtn').attr('value',"입력");
	$('#deleteHistoryBtn').attr('value','다시입력');
	$('#deleteHistoryBtn').removeAttr('onclick');
	$('#deleteHistoryBtn').attr('type','reset');
}
function modifyHistory(){
	if(htrFormCheck()){
		if(confirm('정말 수정하시겠습니까?')){
			return true;	
		}	
	}
	return false;
}
function deleteHistory(){
	var htr_num = $('#htr_num').val();
	var htr_img = $('#htr_img').attr('src');
	
	if(confirm('정말 삭제하시겠습니까?')){
		location.href="deleteHistory.cis?htr_num="+htr_num+"&htr_img="+htr_img;
	}
}
function readHistoryURL(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function (e) {
		    $('#htr_img').attr('src', e.target.result);
		    $('#htr_imguri').attr('class','hide');
		    $('#htr_imguri').val('');
		}
		reader.readAsDataURL(input.files[0]);
	}
}
function minus(index){
	var j = 0;
	for(var i=0; i<TAG_MAX; i++){
		if(i != index){
			$('#htr_tag'+i).val($('#htr_tag'+j).val());
			if($('#htr_tag'+i).val() == ''){
				$('#tag'+i).attr('class', 'hide');
			}
		}else{
			$('#htr_tag'+i).val($('#htr_tag'+(j+1)).val());
			j++;
		}
		j++;
	}
}
function plus(){
	for(var i=0; i<TAG_MAX; i++){
		if($('#htr_tag'+i).val() == ''){
			$('#tag'+i).removeAttr('class');
			return;
		}
	}
}
function htrFormCheck(){
	var imgRegExp = /.png$/;
	var dateRegExp = /^\d{4}-\d{2}-\d{2}$/;

	if($('#htr_keyrd').val().length < 1){
		alert('이름을 입력하세요.');
		return false;
	}
	if(!imgRegExp.test($('#htr_imgIn').val()) && !imgRegExp.test($('#htr_imguri').val())){
		alert('역사 사진의 확장자는 png이어야 합니다.');
		return false;
	}
	if($('#htr_desc').val().length < 1){
		alert('설명을 입력하세요.');
		return false;
	}
	if(!dateRegExp.test($('#htr_date').val())){
		alert('분류연도의 양식은 ####-##-##과 같아야 합니다.');
		return false;
	}
	return true;
}
</script>

</head>
<body style="background-color : rgba(36, 148, 63, 0.16);">
<!-- <script type="text/javascript">
	alert('가\r나');
</script> -->

<div id="header">
<%@ include file="adminViewmenu.jsp" %>
</div>

<div id="wrapper">
	<div id="container">

<a data-toggle="modal" href="#htrInfo" class="btn btn-primary btn-large pull-right" onclick="javascript:insertHistory()">역사 정보 생성</a>
<br>
<%
	History history = null;
%>
<table class="table table-striped" align="center">
   <thead>
   <tr>
      <th>번호
      <th>이름
      <th>분류
      <th>시대
      <th>태그
      <th>
   </tr>
   </thead>
   <tbody>
<%
	for(int i=0; i<htrList.size(); i++){ 
		history = htrList.get(i);
%>
	
	<tr>
		<td><%=fakeNum--%>
		<td><%= history.getHtr_keyrd() %>
		<td><%= history.getHtr_type() %>
		<td><%= history.getHtr_age() %>
		<td><%= history.getHtr_tag() %>
		<td><a data-toggle="modal" href="#htrInfo" class="btn btn-primary" onclick="javascript:getHistory(<%= i %>)">?</a>
	</tr>
<%	} %>   
   </tbody>
     <tr>
   <td colspan="6" class="pagination" align="center">
   	<ul class="pagination">
        <li><a href="adminHistory.cis?page=<%=curPage - navi.getPagePerGroup()%>">«</a></li>
		<% for (int i=navi.getStartPageGroup() ; i<=navi.getEndPageGroup();i++){ 
				if(i==curPage) {%>
						 <li class="active"><a href="#"><%=i %></a></li>
				<%} else{%>
				        <li><a href="adminHistory.cis?page=<%=i%>"><%=i %></a></li>
				<%} %>
		<%} %>
        <li><a href="adminHistory.cis?page=<%=curPage + navi.getPagePerGroup()%>">»</a></li>
    </ul>
    </td>
   </tr>
</table>

<div class="modal hide fade" id="htrInfo" aria-hidden="true" aria-labelledby="htrLabel">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="htrLabel">역사 정보</h4>
      </div>
      <form method="post" id="htrForm" action="modifyHistory.cis" onsubmit="return modifyHistory()"
			 enctype="multipart/form-data" runat="server">
      <input type="hidden" id="htr_num" name="htr_num">
      <div class="modal-body">
      	<table class="table">
      		<tr>
      			<td>이름
      			<td><input type="text" id="htr_keyrd" name="htr_keyrd">
      		</tr>
      		<tr>
      			<td>사진
      			<td>
      				<img id="htr_img" src="#" width="200" height="50"/>
      				<div id="htr_imguri"></div>
					<input type='file' id="htr_imgIn" name="htr_imgIn" onchange="readHistoryURL(this)"/> 
      		</tr>
      		<tr>
      			<td>설명
      			<td><textarea rows="7" cols="40" id="htr_desc" name="htr_desc"></textarea>
      		</tr>
      		<tr>
      			<td>태그
      			<td><%	for(int i=0; i<TAG_MAX; i++){ %>
      				<div id="tag<%= i %>">
      					<input type="text" id="htr_tag<%= i %>" name="htr_tag<%= i %>" size=10>
      					<a href="javascript:minus(<%= i %>)" class="btn btn-default btn-mini" id="minusBtn<%= i %>">-</a>
      				</div>
      				<%	} %>
      				<a href="javascript:plus()" class="btn btn-primary btn-mini" id="plusBtn">+</a>
      		</tr>
      		<tr>
      			<td>분류
      			<td><select id="htr_type" name="htr_type">
						<option>인물
						<option>사건
						<option>문화재
					</select>
      		</tr>
      		<tr>
      			<td>시대
      			<td><select id="htr_age" name="htr_age">
						<option>선사시대
						<option>삼국시대
						<option>통일신라
						<option>고려
						<option>조선
						<option>근대
					</select>
      		</tr>
      		<tr>
      			<td>분류연도
      			<td><input type="text" id="htr_date" name="htr_date" size=10>
      		</tr>
      	</table>
      </div>
      <div class="modal-footer">
		<input type="submit" id="modifyHistoryBtn" class="btn btn-primary" value="수정">
		<input type="button" id="deleteHistoryBtn" class="btn btn-primary" onclick="javascript:deleteHistory()" value="삭제">
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