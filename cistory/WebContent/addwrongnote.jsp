<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" href="assets/css/bootmetro.css">
<link rel="stylesheet" type="text/css" href="assets/css/bootmetro-responsive.css">
<link rel="stylesheet" type="text/css" href="assets/css/bootmetro-icons.css">
<link rel="stylesheet" type="text/css" href="assets/css/bootmetro-ui-light.css">
<link rel="stylesheet" type="text/css" href="assets/css/datepicker.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="assets/js/modernizr-2.6.2.min.js"></script>
<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
<script type="text/javascript">
$('.nav-tabs').button();
function sbtwrn(){
	if(confirm('오답노트로 추가하시겠습니까?')){
		addwrnote.submit();
	}
}
function b(num){
	var addr = document.getElementById("add"+num);
	if(addr.checked)
		addr.checked=false;
	else
		addr.checked=true;
}
</script>
</head>

<body>
<div class="dropdown clearfix">
<ul class="menu" role="menu" aria-labelledby="Menu">
<%
for(int i = 0 ; i < list.size(); i++){ %>
<li><input type="checkbox" id="addwrnote<%=i+1 %>" value="<%=i+1%>" onClick="b(<%=i+1%>)"><%=i+1%>번</li>
<%} %>
</ul>
<input type="button" value="보내기" onClick="sbtwrn()">
</div>
</body>
</html>