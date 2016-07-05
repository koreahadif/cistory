<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="nhn.cistory.vo.Member" %> 
<%@ page import="nhn.cistory.util.PageNavigator" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>adminMember</title>

<style>
#wrapper {overflow : hidden}
#container { width : 850px; margin : 0 auto;}

</style>

<script src="//code.jquery.com/jquery-1.10.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="./bootstrap/css/bootstrap.css">
<script type="text/javascript" src="./bootstrap/js/bootstrap.min.js"></script>
<script>
function getMember(index){
	$('#id').html($('#id'+index).val());
	$('#name').html($('#name'+index).val());
	$('#nickName').html($('#nickName'+index).val());
	$('#email').html($('#email'+index).val());
	$('#joinDate').html($('#joinDate'+index).val());

	var grade = document.getElementById('grade');

	if($('#grade'+index).val() == '노비'){
		grade[0].selected = true;
	}else if($('#grade'+index).val() == '평민'){
		grade[1].selected = true;
	}else if($('#grade'+index).val() == '유생'){
		grade[2].selected = true;
	}else if($('#grade'+index).val() == '학자'){
		grade[3].selected = true;
	}else if($('#grade'+index).val() == '현자'){
		grade[4].selected = true;
	}
}
function modifyGrade(){
	var id = $('#id').text();
	var grade = $('#grade').val();
	
	if(confirm('정말 수정하시겠습니까?')){
		location.href="modifyMemberGrade.cis?id="+id+"&grade="+escape(encodeURIComponent(grade));	
	}
}
function deleteMember(){
	var id = $('#id').text();
	
	if(confirm('정말 탈퇴시키시겠습니까?')){
		location.href="deleteMember.cis?id="+id;	
	}
}
</script>

</head>
<body style="background-color : rgba(255, 255, 0, 0.22);">

<div id="header">
<%@ include file="adminViewmenu.jsp" %>
</div>

<div id="wrapper">
	<div id="container">

<%
	ArrayList<Member> memberList = (ArrayList<Member>) request.getAttribute("memberList");
	Member member = null;
	PageNavigator navi =(PageNavigator) request.getAttribute("navi");
 	int curPage = navi.getCurrentPage();
 	int fakeNum=(navi.getTotalRecordsCount()-((curPage-1)*(navi.getPagePerGroup())));

%>

<table class="table table-striped">
   <thead>
   <tr>
      <th>번호
      <th>이름
      <th>별명
      <th>등급
      <th>가입일
      <th>
   </tr>
   </thead>
   <tbody>
<%
	for(int i=0; i<memberList.size(); i++){ 
		member = memberList.get(i);
%>
	
	<tr>
		<td><%= fakeNum-- %>
		<td><%= member.getName() %>
		<td><%= member.getNickName() %>
		<td><%= member.getGrade() %>
		<td><%= member.getJoin_date() %>
		<td><a data-toggle="modal" href="#memberInfo" class="btn btn-warning pull-right" onclick="javascript:getMember(<%= i+1 %>)">?</a>
			<input type="hidden" id="id<%= i+1 %>" value="<%= member.getId() %>">
			<input type="hidden" id="name<%= i+1 %>" value="<%= member.getName() %>">
			<input type="hidden" id="nickName<%= i+1 %>" value="<%= member.getNickName() %>">
			<input type="hidden" id="email<%= i+1 %>" value="<%= member.getEmail() %>">
			<input type="hidden" id="joinDate<%= i+1 %>" value="<%= member.getJoin_date() %>">
			<input type="hidden" id="grade<%= i+1 %>" value="<%= member.getGrade() %>">
	</tr>
<%	} %>   
   </tbody>
   <tr>
   <td colspan="6" class="pagination" align="center">
   	<ul class="pagination">
        <li><a href="adminMember.cis?page=<%=curPage - navi.getPagePerGroup()%>">«</a></li>
		<% for (int i=navi.getStartPageGroup() ; i<=navi.getEndPageGroup();i++){ 
				if(i==curPage) {%>
						 <li class="active"><a href="#"><%=i %></a></li>
				<%} else{%>
				        <li><a href="adminMember.cis?page=<%=i%>"><%=i %></a></li>
				<%} %>
		<%} %>
        <li><a href="adminMember.cis?page=<%=curPage + navi.getPagePerGroup()%>">»</a></li>
    </ul>
    </td>
   </tr>
</table>

<div class="modal hide fade" id="memberInfo" aria-hidden="true" aria-labelledby="memberLabel">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="memberLabel">회원 정보</h4>
      </div>
      <div class="modal-body">
      	<table class="table" align="center">
      		<tr>
      			<td>아이디
      			<td id="id">
      		</tr>
      		<tr>
      			<td>이름
      			<td id="name">
      		</tr>
      		<tr>
      			<td>별명
      			<td id="nickName">
      		</tr>
      		<tr>
      			<td>이메일
      			<td id="email">
      		</tr>
      		<tr>
      			<td>가입일
      			<td id="joinDate">
      		</tr>
      		<tr>
      			<td>등급
      			<td><select id="grade">
      							<option>노비
      							<option>평민
      							<option>유생
      							<option>짝퉁
      							<option>킹왕짱
      						</select>
      		</tr>
      	</table>
      </div>
      <div class="modal-footer">
		<a href="#" class="btn btn-warning" onclick="javascript:modifyGrade()">수정</a>
		<a href="#" class="btn btn-warning" onclick="javascript:deleteMember()">탈퇴</a>
		<a href="#" class="btn" data-dismiss="modal">취소</a>
      </div>
    </div>
  </div>
</div>

 </div>
</div>

</body>
</html>