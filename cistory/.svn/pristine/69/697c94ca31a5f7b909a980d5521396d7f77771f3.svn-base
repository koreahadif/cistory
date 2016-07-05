<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="loginCheck.jsp" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>테마 시험</title>
<!-- 스타일 -->
<style>
body{

 background-image:url('images/backgroundimagesumukhwa.jpg'); background-size: 100% 100%; min-height : 1020px;
	   background-repeat : no-repeat; 
}

	#wrapper{ overflow : hidden;  min-height : 1030px; }
	#container {width : 1000px; margin : 0 auto; margin-top : 100px;}
</style>		

<!-- JS -->
<script src="//code.jquery.com/jquery-1.10.0.min.js"></script>
<!--[if IE 7]>
   <script type="text/javascript" src="scripts/bootmetro-icons-ie7.js">
   <![endif]-->
<script type="text/javascript">

function checkConst1(str){
	$('.select1').html(str);
	
	$("#gradeBtn").html(str + ' <span class="caret"></span>');
	if(str == '혼합형'){
		str = '';
	}
	$('#grade').attr('value',str);	
}
function checkConst2(str){
	$('.select2').html(str);
	
	$("#typeBtn").html(str + ' <span class="caret"></span>');
	if(str == '혼합형'){
		str = '';
	}
	$('#q_type').attr('value',str);
}
function checkConst3(str){
	$('.select3').html(str);
	
	$("#ageBtn").html(str + ' <span class="caret"></span>');
	if(str == '혼합형'){
		str = '';
	}
	$('#age').attr('value',str);
}
</script>

</head>
<body>
<div id="wrapper">

<div id="header">
<%@ include file="memberViewmenu.jsp" %>
</div>

<div id="container">
	<div class="panel panel-info themeselectalign">
        <div class="panel-heading">
          <h1 class="panel-title" style="text-align : center;">등급을 선택해 주세요<br>

	<div class="btn-toolbar pull-left">
		<div class="btn-group">
			<button class="btn btn-danger dropdown-toggle" data-toggle="dropdown" id="gradeBtn">
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
			<button class="btn btn-warning dropdown-toggle"	data-toggle="dropdown" id="typeBtn">
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
			<button class="btn btn-success dropdown-toggle" data-toggle="dropdown" id="ageBtn">
				시대구분 <span class="caret"></span>
			</button>
			<ul class="dropdown-menu">
				<li><a href="javascript:checkConst3('선사시대')">선사시대</a></li>
				<li><a href="javascript:checkConst3('삼국시대')">삼국시대</a></li>
				<li><a href="javascript:checkConst3('통일신라')">통일신라</a></li>
				<li><a href="javascript:checkConst3('고려')">고려</a></li>
				<li><a href="javascript:checkConst3('조선')">조선</a></li>
				<li><a href="javascript:checkConst3('근대')">근대</a></li>
				<li class="divider"></li>
				<li><a href="javascript:checkConst3('혼합형')">혼합형</a></li>
			</ul>
		</div>
		<!-- /btn-group -->
	</div>
	
	</h1>
        </div>

	<div class="metro panorama">
	<div class="panorama-sections">
		<div class="panorama-section">
			<h2 style="font-weight: bold; color: rgb(38, 175, 170); margin-left: 190px;">테마시험</h2>
				<div class="tile-column-span-8">
					<form class="tile hexa text grade bg-color-gray" action="theme.cis" method="post" onClick="submit()">
					<input type="hidden" id="grade" name="grade">
					<input type="hidden" id="q_type" name="q_type">
					<input type="hidden" id="age" name="age">
						<!-- <div class="column-text"> -->
							<!-- <ul class="unstyled">
		                        <li class="select1 select1-1"></li>
		                        <li class="divider"></li>
		                        <li class="select2 select2-1"></li>
	                        	<li class="divider"></li>
	                        	<li class="select3 select3-1"></li>
	                        </ul> -->
	                        <table class="unstyled" align="center" style="margin-left:100px; margin-top:30px" width="400">
	                        	<tr>
	                        		<td width="120"><div class="select1 select1-1">난이도</div>
	                        		<td colspan=2>	                        		
	                        	</tr>
	                        	<tr>
	                        		<td>
	                        		<td width="170"><div class="select2 select2-1">문제유형</div>
	                        		<td>
	                        	</tr>
	                        	<tr>
	                        		<td colspan=2>
	                        		<td width="185"><div class="select3 select3-1">시대구분</div>
	                        	</tr>
	                        </table>
                        <!-- </div> -->
						<div class="textover-wrapper bg-color-greenDark">
							<br><div class="text4" style="font-size:30px;">Test START!</div>
						</div>
					</form>
				</div>
		</div>
	</div>
</div>
</div>
</div>
</div>
</body>
</html>