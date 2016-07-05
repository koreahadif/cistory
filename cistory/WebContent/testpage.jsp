<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="loginCheck.jsp" %>    
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "nhn.cistory.vo.Member" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>기출 시험</title>
<!-- JS -->
<script src="//code.jquery.com/jquery-1.10.0.js"></script>
<script type="text/javascript" src="./js/turn.min.js"></script>
<script type="text/javascript" src="./js/turn.js"></script>
<script type="text/javascript" src="./js/map.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
body{
	background:#ccc;
	background-image:url('images/testpagebackground.png'); background-size: 100% 100%;
	   background-repeat : no-repeat; 
}
#testPage{
	width:970px;
	height:675px;
}
#testPage .turn-page{
	background-color:white;
}
#testPage .cover{
	background: #333 url(http://mekonta.co.uk/img/core/irongrip.png) repeat;
}

}
#testPage .cover h1{
	color:white;
	text-align:center;
	font-size:75px;
	line-height:675px;
	margin:0px;
}
#testPage .loader{
	width:24px;
	height:24px;
	display:block;
	position:absolute;
	top:238px;
	left:188px;
}
#testPage .odd{
	background-image:-webkit-linear-gradient(right, #FFF 95%, #ddd 100%);
	background-image:-moz-linear-gradient(right, #FFF 95%, #ddd 100%);
	background-image:-o-linear-gradient(right, #FFF 95%, #ddd 100%);
	background-image:-ms-linear-gradient(right, #FFF 95%, #ddd 100%);
}
#testPage .even{
	background-image:-webkit-linear-gradient(right, #FFF 95%, #ddd 100%);
	background-image:-moz-linear-gradient(right, #FFF 95%, #ddd 100%);
	background-image:-o-linear-gradient(right, #FFF 95%, #ddd 100%);
	background-image:-ms-linear-gradient(right, #FFF 95%, #ddd 100%);
}
.quesImg{
	text-align:center;

	top:400px;
}
.quesImg img{
	max-width:150px;
}
</style>
<%
int num=0;
ArrayList<Integer> list = (ArrayList<Integer>)request.getAttribute("numList");
if(list==null || list.size()==0){
	response.sendRedirect("index.jsp");
}
%>
<script>
var stime = new Date();
var now;
var tmp= setInterval(function(){now = new Date();},1000);

var id = '<%=((Member)session.getAttribute("member")).getId()%>';
if(typeof id== "undefined" || id==null){
	alert('로그인안됨');
}
</script>
</head>
<body>
<div id="wrapper">
		<div id="header">
			<%@ include file="memberViewmenu.jsp"%>
		</div>

	<div class="container">
		<div class="row">
			<div class="span 10 affix">
				<div id="testTimer">
					<%@include file="testtimer.html" %>
				</div>
				<span id="testansweralert"></span>
				<div id="testPage">
					<div class="cover">
						<h1>한국사 능력 검정 시험</h1>
						<h2>시험 시작</h2>
					</div>
				</div>
			<div id="controls">
				<label for="page-number">Page:</label> <input type="text" size="3" id="page-number"> of <span id="number-pages"></span>
			</div>
		</div>     
		<div class="span2 answer">
				<%@include file="answer.jsp" %>
		</div>
	</div>
</div>

<script type="text/javascript">
	var numberOfPages = 51;
	var question;var q1; var q2; var q3; var q4; var q5; var desc; var point;
	var foo = new Array();
	var map = new Map();
	function preState(){
	var i = 0;
	foo[0] = 0;
	<%
	System.out.print(list.size());
	for(int i = 0 ; i< list.size() ; i ++){%>
	foo[i]=<%=list.get(i)%>;
	i++;
	<%}%>
	}
	function checkAnswer(pagenum,num){
		map.put(foo[pagenum-1],num);
		$('#sol_'+pagenum).html(pagenum+' -<small style="margin-right:10px;color:gray;float:right">'+$("input:radio[name=question"+($('#page-number').val()-1)+"]:checked").val()+'</small>');
		$('#testPage').turn('next');
	}
	function temporary(){}

	function parseData(strText){
		q1 = strText.q1;
		q2 = strText.q2;
		q3 = strText.q3;
		q4 = strText.q4;
		q5 = strText.q5;
		question = strText.question;
		desc = strText.desc;
		point = strText.point;
	};
	
	function addPage(page, testPage) {
		if (!testPage.turn('hasPage', page)) {
			var element = $('<div />', {'class': 'page even', 'id': 'page-'+page, }).html('<i class="loader"></i>');
			testPage.turn('addPage', element, page);
			setTimeout(function(){
				var param = {num:foo[page-2]};
				$.post("getQuestion.cis",param,parseData,"json")
				.done(function(data){
					var str='';
					if(typeof q1 != 'undefined' && q1.indexOf('<')!=0){
						str = '<div class="test-add"><blockquote class="pull-right"><p>'+(page-1)+'번. '+question+'</p><small>'+point+'점</small></blockquote></div>';
						str += '<div class="void">  </div>';
						str += '<div class="img-add"><img src="q_img/'+desc+'"></div>';
						str += '<ul class="unstyled"><li><input type="radio" name="question'+(page-1)+'" value="1" onClick="javascript:checkAnswer('+(page-1)+',1)">'+q1+'</li>';
						str += '<li><input type="radio" name="question'+(page-1)+'" value="2" onClick="javascript:checkAnswer('+(page-1)+',2)">'+q2+'</li>';
						str += '<li><input type="radio" name="question'+(page-1)+'" value="3" onClick="javascript:checkAnswer('+(page-1)+',3)">'+q3+'</li>';
						str += '<li><input type="radio" name="question'+(page-1)+'" value="4" onClick="javascript:checkAnswer('+(page-1)+',4)">'+q4+'</li>';
						str += '<li><input type="radio" name="question'+(page-1)+'" value="5" onClick="javascript:checkAnswer('+(page-1)+',5)">'+q5+'</li></ul>';
					}else{
						str = '<div class="test-add"><blockquote class="pull-right"><p>'+(page-1)+'번. '+question+'</p><small>'+point+'점</small></blockquote></div>';
						str += '<div class="void">  </div>';
						str += '<div class="img-add"><img src="q_img/'+desc+'"></div>';
						str += '<div class="quesImg">';
						str += '<input type="radio" name="question'+(page-1)+'" value="1" onClick="javascript:checkAnswer('+(page-1)+',1)">'+q1;
						str += '<input type="radio" name="question'+(page-1)+'" value="2" onClick="javascript:checkAnswer('+(page-1)+',2)">'+q2;
						str += '<input type="radio" name="question'+(page-1)+'" value="3" onClick="javascript:checkAnswer('+(page-1)+',3)">'+q3;
						str += '<input type="radio" name="question'+(page-1)+'" value="4" onClick="javascript:checkAnswer('+(page-1)+',4)">'+q4;
						str += '<input type="radio" name="question'+(page-1)+'" value="5" onClick="javascript:checkAnswer('+(page-1)+',5)">'+q5;
						str += '</div>';
					}
						element.html('<div class="data">'+str+'</div>');					
				});
			}, 1000);
		}
	}
	$(window).ready(function(){
		preState();
		$('#testPage').turn({acceleration: true,
							display: 'single',
							pages: numberOfPages,
							elevation: 50,
							gradients: !$.isTouch,
							when: {
								turning: function(e, page, view) {
									var range = $(this).turn('range', page);
									for (page = range[0]; page<=range[1]; page++){
										addPage(page, $(this));
									}
								},

								turned: function(e, page) {
									$('#page-number').val(page);
									$('.ui-selected').attr('class','ui-widget-content ui-selectee');
									$('#sol_'+(page-1)).attr('class','ui-widget-content ui-selectee ui-selected');
								}
							}
						});

		$('#number-pages').html(numberOfPages);

		$('#page-number').keydown(function(e){
			if (e.keyCode==13)
				$('#testPage').turn('page', $('#page-number').val());
		});
	});

	$(window).bind('keydown', function(e){
		if (e.target && e.target.tagName.toLowerCase()!='input')
			if (e.keyCode==37)
				$('#testPage').turn('previous');
			else if (e.keyCode==39)
				$('#testPage').turn('next');
			else if (e.keyCode==49){
				$("input:radio[name=question"+($('#page-number').val()-1)+"]").filter('[value=1]').prop('checked',true);
				checkAnswer($('#page-number').val()-1,1);
			}
			else if (e.keyCode==50){
				$("input:radio[name=question"+($('#page-number').val()-1)+"]").filter('[value=2]').prop('checked',true);
				checkAnswer($('#page-number').val()-1,2);
			}
			else if (e.keyCode==51){
				$("input:radio[name=question"+($('#page-number').val()-1)+"]").filter('[value=3]').prop('checked',true);
				checkAnswer($('#page-number').val()-1,3);
			}
			else if (e.keyCode==52){
				$("input:radio[name=question"+($('#page-number').val()-1)+"]").filter('[value=4]').prop('checked',true);
				checkAnswer($('#page-number').val()-1,4);
			}
			else if (e.keyCode==53){
				$("input:radio[name=question"+($('#page-number').val()-1)+"]").filter('[value=5]').prop('checked',true);
				checkAnswer($('#page-number').val()-1,5);
			}
			else if (e.keyCode==116)
				return false;
	});
</script>
</div>
</body>
</html>
