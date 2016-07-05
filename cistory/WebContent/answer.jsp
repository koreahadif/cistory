<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="./css/jquery.ui.all.css">
<script src="js/jquery.ui.core.js"></script>
<script src="js/jquery.ui.widget.js"></script>
<script src="js/jquery.ui.mouse.js"></script>
<script src="js/jquery.ui.selectable.js"></script>
<style>
#feedback { font-size: 1.4em; }
#selectable .ui-selecting { background: #FECA40; }
#selectable .ui-selected { background: #F39814; color: white; }
#selectable { list-style-type: none; margin: 0; padding: 0; width: 60%; }
#selectable li { margin: 3px; padding: 0.4em; font-size: 1.4em; height: 18px; align:center;}
#selectable .user { margin: 0px; padding: 0.4em; font-size: 1.0em; height: 10px; align:center;}
</style>
<script>
$(function() {
	$( "#selectable" ).selectable({
		stop: function() {
			$( ".ui-selected", this ).each(function() {
				var index = $( "#selectable li" ).index( this );
				$('#testPage').turn('page',index+2);
			});
		}
	});
});
function fncAnsSubmit(){
	if(map.size()!=50){
				
		var str = '<div class="alert alert-block alert-error fade in">';
		str+='<button type="button" class="close" data-dismiss="alert">×</button>';
		str+='<p>문제를 모두 풀지 못했습니다. <strong>그래도 제출하시겠습니까?</strong></p> ';
		str+='<p>';
		str+='<a class="btn btn-danger" onClick="javascript:fncSubmit()">제출</a>';
		str+='</p>';
		str+='</div>';
		$('#testansweralert').html(str);
		location.href="#testansweralert";
	}
	else{
			
		var str = '<div class="alert alert-block alert-error fade in">';
		str1+='<button type="button" class="close" data-dismiss="alert">×</button>';
		str1+='<p><strong>제출하시겠습니까?</strong></p> ';
		str1+='<p>';
		str1+='<a class="btn btn-danger" onClick="javascript:fncSubmit()">제출</a>';
		str1+='</p>';
		str1+='</div>';
		$('#testansweralert').html(str1);
		location.href="#testansweralert";
	}
}
function fncSubmit(){
	for(var i = 0 ; i<foo.length;i++){
		if(!map.containsKey(foo[i])){
			map.put(foo[i],0);
		}
	}
	var arrayList = new Array();
	for(var i = 0 ; i<foo.length;i++){
		arrayList[i] = new Array();
		arrayList[i][0]=i+1;
		arrayList[i][1]=foo[i];
		arrayList[i][2]=map.get(foo[i]);
	}
	var param = {list:arrayList.toString(), id:id ,stime:stime.toLocaleString(),etime:now.toLocaleString()};	
	$.post("setTestResult.cis",param,tmpfunc);
}
function tmpfunc(str){
	location.href='testResult.cis?testNum='+str;
}
</script>
</head>
<body>
<p id="testansweralert"></p>
<ul id="selectable">
<%
for(int i = 0;  i < list.size(); i ++){
%>
	<li class="ui-widget-content" id="sol_<%=i+1%>"><%=i+1 %></li>
<%} %>
</ul>
<a onclick="javascript:fncAnsSubmit();" style="cursor: hand;">
<img src="./images/btn_mark.gif"></a>
</body>
</html>