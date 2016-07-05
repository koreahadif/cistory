<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.10.0.min.js"></script>
<!-- The default timeline stylesheet -->
<link rel="stylesheet" href="assets/css/timeline.css" />
<!-- Our customizations to the theme -->
<link rel="stylesheet" href="assets/css/styles.css" />

<style>
body{
font-family: 'NanumGothic';
/* background-color: #c3d9d6; */
background-image:url('images/filmbackground.png'); background-size: 100% 100%;
	   background-repeat : no-repeat; 
	   background-color : black;

}

#menu { margin-left : 100px}


</style>

</head>
<body>
	<div id="wrapper">
		<div id="header">
			<%@ include file="memberViewmenu.jsp"%>
		</div>
		<div id="space">
			<div id="menu">
			<div class="btn-group">
				<button type="button" class="btn btn-primary btn-lg dropdown-toggle"
					data-toggle="dropdown">
					시대선택 <span class="caret"></span>
				</button>
				<ul class="dropdown-menu">
					<li><a href="javascript:getHistory('선사시대')">선사시대</a></li>
					<li><a href="javascript:getHistory('삼국시대')">삼국시대</a></li>
					<li><a href="javascript:getHistory('통일신라')">통일신라</a></li>
					<li><a href="javascript:getHistory('고려')">고려</a></li>
					<li><a href="javascript:getHistory('조선')">조선</a></li>
					<li><a href="javascript:getHistory('근대')">근대</a></li>
				</ul>
			</div>
			<a href="#footermodal" role="button" class="btn" data-toggle="modal">댓글보기</a>
		</div>
		</div>

		<div id="timeline">
			<!-- Timeline.js will genereate the markup here -->
			<script src="assets/js/timeline.js"></script>
		</div>
<script type="text/javascript">
var currPage = 0;
function set(){
	for(var i=0;i<$('.slider-item').contents().size();i++){
		$('.slider-item').contents().eq(i).attr('id',i);
	}
	var now = $('.slider-container').css('left');
	var tmp = parseInt(now.substring(0,now.indexOf('p')));
	currPage = (-(tmp-130))/1165;
}
function getData(strText){
	var timeline = new VMM.Timeline();
	var text = strText;
	timeline.init(text);
}	
function getHistory(age){
	var param = {age:age};
	$('#timeline').html('<script src="assets/js/timeline.js"></scr'+'ipt>');
	$.post("getTimeline.cis",param,getData,"json");}
</script> 
<!-- Modal -->
	<div id="footermodal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="footer"><%@include file="historyCommet.jsp"%>
			<div class="Comments">
				<div class="fb-comments" data-href="http://cistory.com" data-colorscheme="dark" data-width="470"></div>
			</div>	
		</div>
	</div>
	
</div>

</body>
</html>