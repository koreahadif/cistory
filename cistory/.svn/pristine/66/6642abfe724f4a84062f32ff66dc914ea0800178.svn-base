<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.ArrayList" %>
<%@ page import = "nhn.cistory.vo.Qobtr" %>
<%@ page import = "nhn.cistory.vo.Member" %>
<%@ page import = "nhn.cistory.vo.Test" %>
<%@ include file="loginCheck.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="//code.jquery.com/jquery-1.10.0.min.js"></script>
<% ArrayList<Qobtr> list = (ArrayList<Qobtr>)request.getAttribute("list");
if(list==null)
	return;
%>

<style>
#backgroundcolor { background-image:url('images/testresultbackground.png'); background-size: 100% 100%;
	   background-repeat : no-repeat;}
</style>



<script type="text/javascript">
var count=0;
function selectWrongNote(num){
	$('#number').attr('value',$('#rutNum'+num).val());
	$('#wrongExp').html($('#exp'+num).val());
	$('#wrongQ').html($('#pull'+num).children().eq(0).text());
	$('#pull'+num).attr('tabindex', -1).focus();
	$('#pull'+num).removeAttr('tabindex');
	
}
function wrongNote(){
	if(count==0){
		alert('오답노트를 추가하지 않았습니다 :(');
	}
	else{
		location.href='wrongNotePage.cis?test_num=<%=((Test)request.getAttribute("test")).getTestNum()%>';
	}
}
function end(strText){
	$('.wr_no_memo').val('');
	if(strText==1){alert('오답노트가 등록되었습니다 :)');count++;}
	else{alert('이미 등록된 문제입니다 :(');}
}
function submit(){
	var text = {rutNum:$('#number').val(),wr_no_memo:$('.wr_no_memo').val(),id:'<%=((Member)session.getAttribute("member")).getId()%>'};
	$.post("insertWR.cis",text,end);
}
</script>
<style type="text/css">
.wr_no_memo {width : 95%; margin : 0 auto;}
</style>
</head>
<body>
<div class="wrapper">
	<div id="header">
		<%@ include file="memberViewmenu.jsp"%>
	</div>
	<div class="alert jumbotron testresultcolor">
	당신의 점수는<h1><%=((Test)request.getAttribute("test")).getScore()%></h1> 입니다.<br>
	</div>
	<div class="row" id="backgroundcolor">
		<div class="span10">
<%for(int i = 0 ; i < list.size() ; i++){
	Qobtr qobtr = list.get(i);
	int trsltNum = qobtr.getTest_rslt_num();
	String exp = qobtr.getQ_exp();
	int tmpNum = qobtr.getTest_tmp_num();
	int obSol = qobtr.getOb_sol();
	int userSol = qobtr.getUser_sol();
	int setC = qobtr.getSet_count();
	int wrongC = qobtr.getWrong_count();
	String desc = qobtr.getOb_desc();
	String question = qobtr.getQuestion();
	int point = qobtr.getPoint();
	String q1 = qobtr.getCho1(), q2 = qobtr.getCho2(),q3 = qobtr.getCho3(), q4 = qobtr.getCho4(),q5 = qobtr.getCho5();
	if(q1.endsWith("png")|| q1.endsWith("PNG")){
		q1 = "<img style='max-width:125px;max-height:160px' src='q_img/"+q1+"'>";
		q2 = "<img style='max-width:125px;max-height:160px'src='q_img/"+q2+"'>";
		q3 = "<img style='max-width:125px;max-height:160px' src='q_img/"+q3+"'>";
		q4 = "<img style='max-width:125px;max-height:160px' src='q_img/"+q4+"'>";
		q5 = "<img style='max-width:125px;max-height:160px' src='q_img/"+q5+"'>";
	}
	double per = (double)wrongC/(double)setC*100;%>
	<input type="hidden" id="exp<%=i %>" value="<%=exp %>">
	<input type="hidden" name="rutNum" id="rutNum<%=i %>" value="<%=trsltNum %>">
  		<div class="metro">
			<a class="tile qudro text grade wrongnote" href="javascript:selectWrongNote('<%=i %>')">
				<div class="test-add"><blockquote class="pull-right" id="pull<%=i %>"><p><%=tmpNum%>번. <%= question %></p><small><%=point%>점</small></blockquote></div>
				<div class="result"><%if(obSol!=userSol){%> <span class="label label-warning">오답</span> <%}else{ %> <span class="label label-success">정답</span> <%}%></div>
				<div class="img-add-wrongnote<%=i%>"><img style="max-height:300px"src="q_img/<%=desc%>"></div>
<%if(!q1.startsWith("<")){  %>
				<ol>
					<br>
					<li><%= q1 %></li>
					<li><%= q2 %></li>
					<li><%= q3%></li>
					<li><%= q4 %></li>
					<li><%= q5 %></li>
				</ol>
<%} else{ %><span>1.<%=q1 %></span><span>2.<%=q2 %></span><span>3.<%=q3 %></span><span>4.<%=q4 %></span><span>5.<%=q5 %></span><br><%}%>
			정답:<%=obSol %>내가쓴답: <%=userSol %>오답률:<%=Math.round(per)%>%
			</a>
		</div>
	<%} %>		
	</div>
	<div class="span2 bs-docs-sidebar">
		<div class="nav nav-list testreside affix">
			<table class="table table-bordered">
				<tr>
					<td style="background-color:#FAE3FC; font-weight : bold;">번호 선택</td>
				</tr>
				<tr>
					<td><%for(int i = 0 ; i < list.size(); i ++){
							if(list.get(i).getUser_sol()!=list.get(i).getOb_sol()){%><a href="javascript:selectWrongNote('<%=i %>')"class="badge" style="background-color:red;"><%=i+1%></a>
						<%}else{ %><a href="javascript:selectWrongNote('<%=i %>')"class="badge" ><%=i+1%></a><%} %>
						<%} %>
					</td>
				</tr>
				<tr>
					<td style="background-color:#E3FBFC; font-weight : bold;">문제<!--  ***배경색 -->
				</tr>
				<tr>
					<td><div id="wrongQ"></div>
				</tr>
				<tr>
					<td style="background-color:#E7FCE3; font-weight : bold;">해설<!--  ***배경색 -->
				</tr>
				<tr>
					<td><div id="wrongExp"></div>
				</tr>
				<tr>
					<td style="background-color:#fcf8e3; font-weight : bold;">나의 메모<!--  ***배경색 -->
				</tr>
				<tr>
					<td><div id="wrongMemo" style="width : 95%;"><textarea class="wr_no_memo" placeholder="메모를 입력하세요"></textarea><input type="hidden" id="number"></div>
				</tr>
				<tr>
					<td style="text-align : center; "><input type="button" id="submitw" class="btn btn-success" value="오답노트 등록" onClick="submit()">&nbsp;&nbsp;<input type='button' id='wrongNote' class='btn btn-info' value="오답노트 보기" onClick='wrongNote()'></td>
				</tr>
			</table>
		</div>		
	</div>
</div>
 </div>

</body>
 
</html>