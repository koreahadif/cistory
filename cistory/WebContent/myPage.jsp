<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="loginCheck.jsp" %>    
<%@ page import ="java.util.ArrayList" %>
<%@ page import ="nhn.cistory.vo.Test" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//code.jquery.com/jquery-1.10.0.min.js"></script>
<script type="text/javascript" src="jqplot/jquery.jqplot.min.js"></script>
<script type="text/javascript" src="jqplot/jqplot.barRenderer.min.js"></script>
<script type="text/javascript" src="jqplot/jqplot.highlighter.min.js"></script>
<script type="text/javascript" src="jqplot/jqplot.cursor.min.js"></script>
<script type="text/javascript" src="jqplot/jqplot.pointLabels.min.js"></script>
<script type="text/javascript" src="jqplot/jqplot.categoryAxisRenderer.min.js"></script>
<script type="text/javascript" src="jqplot/jqplot.canvasTextRenderer.min.js"></script>
<script type="text/javascript" src="jqplot/jqplot.canvasAxisTickRenderer.min.js"></script>
<script type="text/javascript" src="jqplot/jqplot.json2.min.js"></script>
<link rel="stylesheet" type="text/css" href="jqplot/jquery.jqplot.min.css" />
<% ArrayList<Test> list = (ArrayList<Test>)request.getAttribute("list");%>
<title>MyPage</title>

<style>
.container { width :1100px; margin : 0 auto; height : 830px;}

body{

 background-image:url('images/green-blank-blackboard.jpg'); background-size: 100% 100%;
	   background-repeat : no-repeat; 
}

</style>



<script type="text/javascript">

var a1=0; var a2=0; var a3=0; var a4=0; var a5=0; var a6=0; var a7=0; var a8=0; var a9=0;
var b1=0; var b2=0; var b3=0; var b4=0; var b5=0; var b6=0; var b7=0; var b8=0; var b9=0;
function animatedChart(){
	$(document).ready(function () {
		$('#chart1').html('');
	    var d1 = [<%for(int i =0 ; i < list.size() ; i ++){%>
	    ['<%=list.get(i).getTestStartTime().substring(0, list.get(i).getTestStartTime().indexOf(":"))%>',<%=list.get(i).getScore()%>]<%if(i!=(list.size()-1)){%>,<%}}%>
		];
	    plot1 = $.jqplot("chart1", [d1], {
	        title:'<strong>기출시험 회차별 점수</strong>',
	        animate: true,
	        animateReplot: true,
	        series:[
	            {
	                pointLabels: {
	                    show: true
	                },
	                showHighlight: false,
	                rendererOptions: {
	                    animation: {
	                        speed: 2500
	                    },
	                    highlightMouseOver: false
	                }
	            }
	        ],
	        axesDefaults: {        
	        	tickRenderer: $.jqplot.CanvasAxisTickRenderer ,
	            tickOptions: {
	            	angle: -30,
	                fontSize: '10pt'
	              }
	        },
	        axes: {
	            xaxis: {
	            	renderer: $.jqplot.CategoryAxisRenderer
	            },
	            yaxis: {
	            	tickOptions: {
                    formatString: "%'d점"
                	},
	                autoscale: true
	            }
	        },
	        highlighter: {
	            show: true, 
	            showLabel: true, 
	            tooltipAxes: 'y',
	            sizeAdjust: 7.5 , tooltipLocation : 'ne'
	        }
	    });
	   
	});
}
function parseData(strText){
	a1 = strText.corrOne; a2 = strText.corrTwo; a3 = strText.corrThree; a4 = strText.corrSunsa; a5 = strText.corrSamguk; a6 = strText.corrSinra; a7 = strText.corrGoryu; a8 = strText.corrChosun; a9 = strText.corrRecent;
	b1 = strText.countOne; b2 = strText.countTwo; b3 = strText.countThree; b4 = strText.countSunsa; b5 = strText.countSamguk; b6 = strText.countSinra; b7 = strText.countGoryu; b8 = strText.countChosun; b9 = strText.countRecent;
}
function barChart(data){
	var param = {testNum:data};
	$.post("getMyPer.cis",param,parseData,"json")
	.done(function(data){
		barChartOne();
		barChartTwo();
	});
}
function barChartOne(){
	$('#chart2').html('');
    $.jqplot.config.enablePlugins = true;
    var d1 = [a4, a5, a6, a7, a8, a9];
    var d2 = [b4, b5, b6, b7, b8, b9];
    var ticks = ['선사시대', '삼국시대', '통일신라', '고려', '조선', '근대'];
     
    plot1 = $.jqplot('chart2', [d1,d2], {
        // Only animate if we're not using excanvas (not in IE 7 or IE 8)..
        animate: !$.jqplot.use_excanvas,
        seriesDefaults:{
            renderer:$.jqplot.BarRenderer,
            pointLabels: { show: true }
        },
        axes: {
            xaxis: {
                renderer: $.jqplot.CategoryAxisRenderer,
                ticks: ticks
            }
        },
        highlighter: { show: false }
    });
}
function barChartTwo(){
	$('#chart3').html('');
    $.jqplot.config.enablePlugins = true;
    var d1 = [a1, a2, a3];
    var d2 = [b1, b2, b3];
    var ticks = ['1점', '2점', '3점'];
     
    plot1 = $.jqplot('chart3', [d1,d2], {
        animate: !$.jqplot.use_excanvas,
        seriesDefaults:{
            renderer:$.jqplot.BarRenderer,
            pointLabels: { show: true }
        },
        axes: {
            xaxis: {
                renderer: $.jqplot.CategoryAxisRenderer,
                ticks: ticks
            }
        },
        highlighter: { show: false }
    });
}
function memberinfoedit(){
	location.href=('modifyMemberForm.cis');
}

function mypage(){
	location.href=('myNote.cis');
}

function wrongnotepage(){
	location.href=('wrongNote.cis');
}

function predict(){
	var data = {id:'<%=request.getParameter("id")%>'};
	$.post("getPrediction.cis",data,predictData,"json");
}
function predictData(strText){
	$('.predictNum').html('<h3>'+strText.pred+'점</h3>');
	if(strText.pred>85){
		$('.predictDesc').css('color','#61DBF0');
		$('.predictDesc').html('<h5>현재 성적을 유지하세요 :)</h5><img style="float:right"src="images/thumbs-up.png">');
	}
	else if(strText.pred>70){
		$('.predictDesc').css('color','#F361A6');
		$('.predictDesc').html('<h5>성적을 조금 더 높여야 합니다 :|</h5><img style="float:right"src="images/thumbs-up.png">');
	}
	else{
		$('.predictDesc').css('color','#F15F5F');
		$('.predictDesc').html('<h5>공부를 더 하시고 시험을 보세요 :(</h5><img style="float:right"src="images/thumbs-down.png">');
	}
}
</script>
</head>
<body>
<div id="header">
<%@ include file="memberViewmenu.jsp" %>
</div>

<div class="container">
	<br><br><br>
	<div class="row">
		<div class="span2">
				<div class="mypagemenulist">
					<!-- <div class="hero-unit-memberinfoedit"> -->
							
							<br><br><br>
							
							<a class="page1" data-toggle="tooltip" data-placement="right" title="회원님의 정보를 수정할 수 있습니다" onMouseOver="javascript:$(this).tooltip('show');" onClick="javascript:memberinfoedit()"> 
							<img src="images/membereditbutton.png"> 
							 </a>
							 
							 <br><br><br>
							 
							 <a class="page2" data-toggle="tooltip" data-placement="right" title="저장된 역사정보를 열람할 수 있습니다" onMouseOver="javascript:$(this).tooltip('show');" onClick="javascript:mypage()"> 
							<img src="images/historynotebutton.png"> 
							 </a>
							 
							 <br><br><br>
							 
							 <a class="page3" data-toggle="tooltip" data-placement="right" title="오답노트를 확인 할 수 있습니다" onMouseOver="javascript:$(this).tooltip('show');" onClick="javascript:wrongnotepage()"> 
							<img src="images/wrongnotebutton.png"> 
							 </a>
				</div>
		</div>
		<div class="span12">
				<div class="btn-group">
					<button type="button" class="btn btn-default dropdown-toggle"
						data-toggle="dropdown">
						회차 <span class="caret"></span>
					</button>
					<ul class="dropdown-menu">
						<%
							for (int i = 0; i < list.size(); i++) {
						%>
						<li><a
							href="javascript:barChart('<%=list.get(i).getTestNum()%>')"><%=(i + 1)%>회차</a></li>
						<%}%>
					</ul>
					<a href="#myModal" class="btn btn-info" data-toggle="modal" onClick="predict()">
						예상점수
					</a>
				</div>
				<div class="userChart">
				<script type="text/javascript">animatedChart();</script>
					<div id="chart1"></div>
					<div id="chart2"></div>
					<div id="chart3"></div>
				</div>
		</div>
	</div>
</div>
<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-hidden="true">×</button>
		<h3 id="myModalLabel">예상점수</h3>
	</div>
	<div class="modal-body">
		<div class="predictNum"></div>
		<div class="predictDesc"></div>
	</div>
</div>

</body>
</html>