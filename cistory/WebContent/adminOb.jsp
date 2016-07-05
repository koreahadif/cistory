<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="nhn.cistory.vo.Obquestion" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="//code.jquery.com/jquery-1.10.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="./bootstrap/css/bootstrap.css">

<style>
#wrapper {overflow : hidden}
#container { width : 850px; margin : 0 auto;}

</style>


<script type="text/javascript">
var obQ_numAry = new Array();
var obQuestionAry = new Array();
var ob_descAry = new Array();
var cho1Ary = new Array();
var cho2Ary = new Array();
var cho3Ary = new Array();
var cho4Ary = new Array();
var cho5Ary = new Array();
var ob_solAry = new Array();
var obQ_expAry = new Array();
var obPointAry = new Array();
var obAgeAry = new Array();
var obGradeAry = new Array();
var i = 0;

<% for(int i=0; i<obList.size(); i++){ %>
	obQ_numAry[i] = '<%= obList.get(i).getQ_num() %>';
	obQuestionAry[i] = '<%= obList.get(i).getQuestion() %>';
	ob_descAry[i] = '<%= obList.get(i).getOb_desc() %>';
	cho1Ary[i] = '<%= obList.get(i).getCho1() %>';
	cho2Ary[i] = '<%= obList.get(i).getCho2() %>';
	cho3Ary[i] = '<%= obList.get(i).getCho3() %>';
	cho4Ary[i] = '<%= obList.get(i).getCho4() %>';
	cho5Ary[i] = '<%= obList.get(i).getCho5() %>';
	ob_solAry[i] = '<%= obList.get(i).getOb_sol() %>';
	obQ_expAry[i] = '';
	<%	
		if(obList.get(i).getQ_exp().contains("\n")){ 
			String q_expAry[] = 	obList.get(i).getQ_exp().split("\n");
			for(int j=0; j<q_expAry.length; j++){
	%>
				obQ_expAry[i] += "<%= q_expAry[j] %>"+"\n";
	<%		}
		}else{ 
	%>		
			obQ_expAry[i] = "<%= obList.get(i).getQ_exp() %>";
	<%	} %>		
	obPointAry[i] = '<%= obList.get(i).getPoint() %>';
	obAgeAry[i] = '<%= obList.get(i).getAge() %>';
	obGradeAry[i] = '<%= obList.get(i).getGrade() %>';
	i++;
<% } %>
function getOb(index){
	$('#obQ_num').val(obQ_numAry[index]);
	$('#obQuestion').val(obQuestionAry[index]);
	$('#ob_desc').removeAttr('class');
	$('#ob_desc').html(ob_descAry[index]);
	$('#ob_desc').val(ob_descAry[index]);
	$('#ob_descImg').attr('src','q_img/'+ob_descAry[index]);
	$('#ob_descImgIn').val("");
	
	$('#cho1ImgIn').val("");
	$('#cho2ImgIn').val("");
	$('#cho3ImgIn').val("");
	$('#cho4ImgIn').val("");
	$('#cho5ImgIn').val("");
	
	var imgChk = cho1Ary[index].indexOf('png');
	if(imgChk != -1){
		/* var cho1Str = "<img src=\"q_img/"+cho1Ary[index]+"\" id=\"cho1Img\" width=200>";
		cho1Str += "<div id=cho1>"+cho1Ary[index]+"</div>";
		cho1Str += "<input type='file' id=\"cho1ImgIn\" name=\"cho1ImgIn\" onchange=\"readChoURL(this,1)\"/>"; */
		$('#cho1Img').attr('src','q_img/'+cho1Ary[index]);
		$('#cho1').html(cho1Ary[index]);
		$('#cho1').val(cho1Ary[index]);
		$('#cho1Img').removeAttr('class');
		$('#cho1').removeAttr('class');
		$('#cho1ImgIn').removeAttr('class');
		$('#cho1Text').attr('class','hide');
		$('#cho1In').val('');

		$('#cho2Img').attr('src','q_img/'+cho2Ary[index]);
		$('#cho2').html(cho2Ary[index]);
		$('#cho2').val(cho2Ary[index]);
		$('#cho2Img').removeAttr('class');
		$('#cho2').removeAttr('class');
		$('#cho2ImgIn').removeAttr('class');
		$('#cho2Text').attr('class','hide');
		$('#cho2In').val('');
		
		$('#cho3Img').attr('src','q_img/'+cho3Ary[index]);
		$('#cho3').html(cho3Ary[index]);
		$('#cho3').val(cho3Ary[index]);
		$('#cho3Img').removeAttr('class');
		$('#cho3').removeAttr('class');
		$('#cho3ImgIn').removeAttr('class');
		$('#cho3Text').attr('class','hide');
		$('#cho3In').val('');
		
		$('#cho4Img').attr('src','q_img/'+cho4Ary[index]);
		$('#cho4').html(cho4Ary[index]);
		$('#cho4').val(cho4Ary[index]);
		$('#cho4Img').removeAttr('class');
		$('#cho4').removeAttr('class');
		$('#cho4ImgIn').removeAttr('class');
		$('#cho4Text').attr('class','hide');
		$('#cho4In').val('');
		
		$('#cho5Img').attr('src','q_img/'+cho5Ary[index]);
		$('#cho5').html(cho5Ary[index]);
		$('#cho5').val(cho5Ary[index]);
		$('#cho5Img').removeAttr('class');
		$('#cho5').removeAttr('class');
		$('#cho5ImgIn').removeAttr('class');
		$('#cho5Text').attr('class','hide');
		$('#cho5In').val('');
		/* var cho2Str = "<img src=\"q_img/"+cho2Ary[index]+"\" id=\"cho2Img\" width=200>";
		cho2Str += "<div id=cho2>"+cho2Ary[index]+"</div>";
		cho2Str += "<input type='file' id=\"cho2ImgIn\" name=\"cho2ImgIn\" onchange=\"readChoURL(this,2)\"/>";
		
		var cho3Str = "<img src=\"q_img/"+cho3Ary[index]+"\" id=\"cho3Img\" width=200>";
		cho3Str += "<div id=cho3>"+cho3Ary[index]+"</div>";
		cho3Str += "<input type='file' id=\"cho3ImgIn\" name=\"cho3ImgIn\" onchange=\"readChoURL(this,3)\"/>";
		
		var cho4Str = "<img src=\"q_img/"+cho4Ary[index]+"\" id=\"cho4Img\" width=200>";
		cho4Str += "<div id=cho4>"+cho4Ary[index]+"</div>";
		cho4Str += "<input type='file' id=\"cho4ImgIn\" name=\"cho4ImgIn\" onchange=\"readChoURL(this,4)\"/>";
		
		var cho5Str = "<img src=\"q_img/"+cho5Ary[index]+"\" id=\"cho5Img\" width=200>";
		cho5Str += "<div id=cho5>"+cho5Ary[index]+"</div>";
		cho5Str += "<input type='file' id=\"cho5ImgIn\" name=\"cho5ImgIn\" onchange=\"readChoURL(this,5)\"/>";
		
		//$('#cho1').html(cho1Str);
		$('#cho2').html(cho2Str);
		$('#cho3').html(cho3Str);
		$('#cho4').html(cho4Str);
		$('#cho5').html(cho5Str); */
	}else{
		for(var i=1; i<6; i++){
			$('#cho'+i+'Img').attr('src','#');
			$('#cho'+i+'ImgIn').val('');
			$('#cho'+i).attr('class', 'hide');
			$('#cho'+i+'Img').attr('class', 'hide');
			$('#cho'+i+'ImgIn').attr('class', 'hide');
			$('#cho'+i+'Text').removeAttr('class');
		}
		$('#cho1In').val(cho1Ary[index]);
		$('#cho2In').val(cho2Ary[index]);
		$('#cho3In').val(cho3Ary[index]);
		$('#cho4In').val(cho4Ary[index]);
		$('#cho5In').val(cho5Ary[index]);
		
		
		/* $('#cho1').html('<input type="text" id="cho1In" name="cho1In" value="'+cho1Ary[index]+'">');
		$('#cho2').html('<input type="text" id="cho2In" name="cho2In" value="'+cho2Ary[index]+'">');
		$('#cho3').html('<input type="text" id="cho3In" name="cho3In" value="'+cho3Ary[index]+'">');
		$('#cho4').html('<input type="text" id="cho4In" name="cho4In" value="'+cho4Ary[index]+'">');
		$('#cho5').html('<input type="text" id="cho5In" name="cho5In" value="'+cho5Ary[index]+'">'); */
	}	
	$('#ob_sol').val(ob_solAry[index]);
	$('#obQ_exp').val(obQ_expAry[index]);
	
	var obPoint = document.getElementById('obPoint');
	if(obPointAry[index] == '1'){
		obPoint[0].selected = true;
	}else if(obPointAry[index] == '2'){
		obPoint[1].selected = true;
	}else if(obPointAry[index] == '3'){
		obPoint[2].selected = true;
	}
	
	var obGrade = document.getElementById('obGrade');
	if(obGradeAry[index] == '중급'){
		obGrade[0].selected = true;
	}else if(obGradeAry[index] == '고급'){
		obGrade[1].selected = true;
	}
	
	var obAge = document.getElementById('obAge');
	if(obAgeAry[index] == '선사시대'){
		obAge[0].selected = true;
	}else if(obAgeAry[index] == '삼국시대'){
		obAge[1].selected = true;
	}else if(obAgeAry[index] == '통일신라'){
		obAge[2].selected = true;
	}else if(obAgeAry[index] == '고려'){
		obAge[3].selected = true;
	}else if(obAgeAry[index] == '조선'){
		obAge[4].selected = true;
	}else if(obAgeAry[index] == '근대'){
		obAge[5].selected = true;
	}
	
	$('#obForm').attr('action','modifyOb.cis');
	$('#obForm').attr('onsubmit','return modifyOb()');
	$('#modifyObBtn').attr('value',"수정");
	$('#deleteObBtn').attr('value','삭제');
	$('#deleteObBtn').attr('onclick','javascript:deleteOb()');
	$('#deleteObBtn').attr('type','button');
}
function insertOb(){
	$('#obQuestion').val('');
	$('#ob_desc').attr('class','hide');
	$('#ob_desc').val('');
	$('#ob_descImg').attr('src','#');
	$('#ob_descImgIn').val("");
	
	for(var i=1; i<6; i++){
		$('#cho'+i+'Img').removeAttr('class');
		$('#cho'+i+'Img').attr('src','#');
		$('#cho'+i).attr('class','hide');
		$('#cho'+i+'ImgIn').removeAttr('class');
		$('#cho'+i+'ImgIn').val('');
		$('#cho'+i+'Text').removeAttr('class');
		$('#cho'+i+'In').val('');
	}
	
	//$('#cho1').html('<input type="text" name="cho1In" id="cho1In"><input type="file" id="cho1ImgIn" name="cho1ImgIn" onchange="readChoURL(this,1)"/>');
	//$('#cho2').html('<input type="text" name="cho2In" id="cho2In"><input type="file" id="cho2ImgIn" name="cho2ImgIn" onchange="readChoURL(this,2)"/>');
	//$('#cho3').html('<input type="text" name="cho3In" id="cho3In"><input type="file" id="cho3ImgIn" name="cho3ImgIn" onchange="readChoURL(this,3)"/>');
	//$('#cho4').html('<input type="text" name="cho4In" id="cho4In"><input type="file" id="cho4ImgIn" name="cho4ImgIn" onchange="readChoURL(this,4)"/>');
	//$('#cho5').html('<input type="text" name="cho5In" id="cho5In"><input type="file" id="cho5ImgIn" name="cho5ImgIn" onchange="readChoURL(this,5)"/>');
	$('#ob_sol').val('');
	$('#obQ_exp').val('');
	
	$('#obForm').attr('action','insertOb.cis');
	$('#obForm').attr('onsubmit','return obFormCheck()');
	$('#modifyObBtn').attr('value',"입력");
	$('#deleteObBtn').attr('value','다시입력');
	$('#deleteObBtn').removeAttr('onclick');
	$('#deleteObBtn').attr('type','reset');
	
	var obPoint = document.getElementById('obPoint');
	obPoint[0].selected = true;
	
	var obGrade = document.getElementById('obGrade');
	obGrade[0].selected = true;

	var obAge = document.getElementById('obAge');
	obAge[0].selected = true;
}
function modifyOb(){
	if(obFormCheck()){
		if(confirm('정말 수정하시겠습니까?')){
			return true;
		}
	}
	return false;
}
function deleteOb(){
	var q_num = $('#obQ_num').val();
	var ob_desc = $('#ob_descImg').attr('src');
	var cho1 = $('#cho1Img').attr('src');
	var cho2 = $('#cho2Img').attr('src');
	var cho3 = $('#cho3Img').attr('src');
	var cho4 = $('#cho4Img').attr('src');
	var cho5 = $('#cho5Img').attr('src');
	
	alert(cho1);
	alert(cho2);
	alert(cho3);
	alert(cho4);
	alert(cho5);
	
	if(confirm('정말 삭제하시겠습니까?')){
		location.href="deleteQuestion.cis?q_num="+q_num+"&desc="+ob_desc
				+"&cho1="+cho1+"&cho2="+cho2+"&cho3="+cho3+"&cho4="+cho4+"&cho5="+cho5;	
	}
}
function obFormCheck(){
	var imgRegExp = /.png$/;
	var ob_solRegExp = /^[1-5]{1}$/;
	
	if($('#obQuestion').val().length < 1){
		alert('문제를 입력하세요.');
		return false;
	}
	if(!imgRegExp.test($('#ob_descImgIn').val()) && !imgRegExp.test($('#ob_desc').val())){
		alert('문제예시에 들어갈 이미지의 확장자는 png이어야 합니다.');
		return false;
	}
	if(($('#cho1In').val().length<1 && $('#cho1ImgIn').val().length<1) || ($('#cho2In').val().length<1 && $('#cho2ImgIn').val().length<1) ||
			($('#cho3In').val().length<1 && $('#cho3ImgIn').val().length<1) || ($('#cho4In').val().length<1 && $('#cho4ImgIn').val().length<1)
			|| ($('#cho5In').val().length<1 && $('#cho5ImgIn').val().length<1)){
		alert('보기를 입력하세요.');
		return false;
	}
	if(($('#cho1In').val().length>0 && $('#cho1ImgIn').val().length>0) || ($('#cho2In').val().length>0 && $('#cho2ImgIn').val().length>0) ||
			($('#cho3In').val().length>0 && $('#cho3ImgIn').val().length>0) || ($('#cho4In').val().length>0 && $('#cho4ImgIn').val().length>0)
			|| ($('#cho5In').val().length>0 && $('#cho5ImgIn').val().length>0)){
		alert('보기는 문자 또는 이미지 중 하나만 입력하세요.');
		return false;
	}
	if($('#cho1In').val().length>0){
		if($('#cho2ImgIn').val().length>0 || $('#cho3ImgIn').val().length>0 || $('#cho4ImgIn').val().length>0 || $('#cho5ImgIn').val().length>0){
			alert('보기는 문자 또는 이미지 중 하나만 입력하세요.');
			return false;
		}
	}
	if($('#cho1ImgIn').val().length>0){
		if($('#cho2In').val().length>0 || $('#cho3In').val().length>0 || $('#cho4In').val().length>0|| $('#cho5In').val().length>0){
			alert('보기는 문자 또는 이미지 중 하나만 입력하세요.');
			return false;
		}
	}
	if(($('#cho1In').val().length<1 && !imgRegExp.test($('#cho1ImgIn').val())) || ($('#cho2In').val().length<1 && !imgRegExp.test($('#cho2ImgIn').val())) ||
			($('#cho3In').val().length<1 && !imgRegExp.test($('#cho3ImgIn').val())) || ($('#cho4In').val().length<1 && !imgRegExp.test($('#cho4ImgIn').val()))
			|| ($('#cho5In').val().length<1 && !imgRegExp.test($('#cho5ImgIn').val()))){
		alert('문제예시에 들어갈 이미지의 확장자는 png이어야 합니다.');
		return false;
	}
	if(!ob_solRegExp.test($('#ob_sol').val())){
		alert('정답은 1~5의 정수이어야 합니다.');
		return false;
	}
	if($('#obQ_exp').val().length < 1){
		alert('해설을 입력하세요.');
		return false;
	}
	
	return true;
}
function readObURL(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function (e) {
		    $('#ob_descImg').attr('src', e.target.result);
		    $('#ob_desc').attr('class','hide');
		    $('#ob_desc').val('');
		}
		reader.readAsDataURL(input.files[0]);
	}
}
function readChoURL(input, num) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function (e) {
			if(num == 1){
				$('#cho1Img').attr('src', e.target.result);
				$('#cho1').attr('class','hide');
			}else if(num == 2){
				$('#cho2Img').attr('src', e.target.result);
				$('#cho2').attr('class','hide');
			}else if(num == 3){
				$('#cho3Img').attr('src', e.target.result);
				$('#cho3').attr('class','hide');
			}else if(num == 4){
				$('#cho4Img').attr('src', e.target.result);
				$('#cho4').attr('class','hide');
			}else if(num == 5){
				$('#cho5Img').attr('src', e.target.result);
				$('#cho5').attr('class','hide');
			}	    
		}
		reader.readAsDataURL(input.files[0]);
	}
}
</script>
</head>
<body>

<div id="wrapper">
	<div id="container">

<div > 
<a data-toggle="modal" href="#obInfo" class="btn btn-danger pull-right" onclick="javascript:insertOb()">문제 생성</a>
</div>

<%	Obquestion ob = null; %>


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
	for(int i=0; i<obList.size(); i++){ 
		ob = obList.get(i);
%>
	<tr>
		<td><%= obFakeNum-- %>
		<td><%= ob.getQuestion() %>
		<td><%= ob.getAge() %>
		<td><%= ob.getGrade() %>
		<td><%= ob.getWrong_count() %>
		<td><a data-toggle="modal" href="#obInfo" class="btn btn-danger" onclick="javascript:getOb(<%= i %>)">?</a>
	</tr>
<%	} %>   
   </tbody>
   	<tr>
   		<td colspan="6" class="pagination" align="center">
		   	<ul class="pagination">
		        <li><a href="adminQuestion.cis?obPage=<%=obCurPage - obNavi.getPagePerGroup()%>">«</a></li>
				<% for (int i=obNavi.getStartPageGroup() ; i<=obNavi.getEndPageGroup();i++){ 
						if(i==obCurPage) {%>
								 <li class="active"><a href="#"><%=i %></a></li>
						<%} else{%>
						        <li><a href="adminQuestion.cis?obPage=<%=i%>"><%=i %></a></li>
						<%} %>
				<%} %>
		        <li><a href="adminQuestion.cis?obPage=<%=obCurPage + obNavi.getPagePerGroup()%>">»</a></li>
		    </ul>
	    </td>
   </tr>
</table>

<div class="modal hide fade" id="obInfo" aria-hidden="true" aria-labelledby="obLabel">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="obLabel">객관식 문제 정보</h4>
      </div>
      <form method="post" id="obForm" action="modifyOb.cis" onsubmit="javascript:modifyOb()"
			 enctype="multipart/form-data" runat="server">
      <input type="hidden" id="obQ_num" name="obQ_num">
      <div class="modal-body">
      	<table class="table">
      		<tr>
      			<td>문제
      			<td><input type="text" id="obQuestion" name="obQuestion">
      		</tr>
      		<tr>
      			<td>문제예시
      			<td>
      				<img id="ob_descImg" src="#" width="200" height="50"/>
      				<div id="ob_desc"></div>
					<input type='file' id="ob_descImgIn" name="ob_descImgIn" onchange="readObURL(this)"/> 
      		</tr>
      		<tr>
      			<td>보기1
      			<td><img src="#" id="cho1Img" width=200>
					<div id=cho1></div>
					<input type='file' id="cho1ImgIn" name="cho1ImgIn" onchange="readChoURL(this,1)"/>
					<div id="cho1Text"><input type="text" id="cho1In" name="cho1In"></div>
      		</tr>
      		<tr>
      			<td>보기2
      			<td><img src="#" id="cho2Img" width=200>
					<div id=cho2></div>
					<input type='file' id="cho2ImgIn" name="cho2ImgIn" onchange="readChoURL(this,2)"/>
					<div id="cho2Text"><input type="text" id="cho2In" name="cho2In"></div>
      		</tr>
      		<tr>
      			<td>보기3
      			<td><img src="#" id="cho3Img" width=200>
					<div id=cho3></div>
					<input type='file' id="cho3ImgIn" name="cho3ImgIn" onchange="readChoURL(this,3)"/>
					<div id="cho3Text"><input type="text" id="cho3In" name="cho3In"></div>
      		</tr>
      		<tr>
      			<td>보기4
      			<td><img src="#" id="cho4Img" width=200>
					<div id=cho4></div>
					<input type='file' id="cho4ImgIn" name="cho4ImgIn" onchange="readChoURL(this,4)"/>
					<div id="cho4Text"><input type="text" id="cho4In" name="cho4In"></div>
      		</tr>
      		<tr>
      			<td>보기5
      			<td><img src="#" id="cho5Img" width=200>
					<div id=cho5></div>
					<input type='file' id="cho5ImgIn" name="cho5ImgIn" onchange="readChoURL(this,5)"/>
					<div id="cho5Text"><input type="text" id="cho5In" name="cho5In"></div>
      		</tr>
      		<tr>
      			<td>정답
      			<td><input type="text" id="ob_sol" name="ob_sol">
      		</tr>
      		<tr>
      			<td>해설
      			<td><!-- <input type="text" id="obQ_exp" name="obQ_exp"> -->
      				<textarea rows="7" cols="40" id="obQ_exp" name="obQ_exp"></textarea>
      		</tr>
      		<tr>
      			<td>점수
      			<td><select id="obPoint" name="obPoint">
   						<option>1
   						<option>2
   						<option>3
   					</select>
      		</tr>
      		<tr>
      			<td>등급
      			<td><select id="obGrade" name="obGrade">
      					<option>중급
      					<option>고급
      				</select>
      		</tr>
      		<tr>
      			<td>시대
      			<td><select id="obAge" name="obAge">
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
		<input type="submit" id="modifyObBtn" class="btn btn-danger" value="수정">
		<input type="button" id="deleteObBtn" class="btn btn-danger" onclick="javascript:deleteOb()" value="삭제">
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