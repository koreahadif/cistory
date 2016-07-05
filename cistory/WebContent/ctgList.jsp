<%@page import="nhn.cistory.util.HangulChosungSearch"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
body{background-image:url('images/backgroundimagenomembersumukhwa.png'); background-size: 100% 100%;
   background-repeat : no-repeat;  min-height : 1020px;
	}	
</style>
<script src="//code.jquery.com/jquery-1.10.0.min.js"></script>
<script type="text/javascript">

	function searchList() {
		var keyword = $('.search-query').val();
		if (keyword!=''){
			var param = {keyword : keyword};
			$.post("searchCtgList.cis", param, reactList, "json");			
		}
		else
			alert('빈칸이 없이 입력해주세요 :)');

	}
	function reactList(strText){
		$('#searchResult').html('');
		if(strText!=null||strText!=undefined){
			for(var i = 0;i<strText.list.length;i++){
				$('#searchResult').append('<span><a class="label label-warning" href="javascript:searchForm(\''+ strText.list[i]+'\')">'+strText.list[i]+'</a></span><br><br>');
			}
		}
		else
			alert('검색결과가 없습니다.');
	}
	function searchForm(keyword) {
		if (keyword == null) {
			keyword = $('.search-query').val();
		}
		var param = {keyword : keyword};
		$.post("searchCtg.cis", param, react, "json");
	}
	
	function react(strText) {
		if(strText!=null){
			var age = strText.age;
			var date = strText.date;
			var url = strText.url;
			var keyword = strText.keyword;
			var desc = strText.desc;
			var tag = strText.tag;
			var type = strText.type;
			var result = stringSplit(tag, "/");
	
			$('#keyword').html('<h2>'+keyword+'</h2>');
			$('#desc').html(desc+'<br><br>');
			$('#url').html('<img src="h_img/'+url+'">');
			$('#tag').html('');
			for ( var i = 0; i < result.length; i++) {
				var str = '';
				str+='<span id="tagTo'+(i+1)+'" class="label label-warning">';	
				str+='<a style="color:white; padding:10px;font-size : 150%" href="javascript:searchForm(\''+ result[i]+'\')">'+result[i]+'</span>';
				$('#tag').append(str);
				if(i!=(result.length-1)){$('#tag').append(', ');};
			}
		}
		else
			alert('역사정보가 존재하지 않습니다.');
	}
	function stringSplit(strData, strIndex) {
		var stringList = new Array();
		while (strData.indexOf(strIndex) != -1) {
			stringList[stringList.length] = strData.substring(0, strData
					.indexOf(strIndex));
			strData = strData.substring(strData.indexOf(strIndex)
					+ (strIndex.length), strData.length);
		}
		stringList[stringList.length] = strData;
		return stringList;
	}
</script>
</head>

<body>
<div class="wrapper">
		<div id="header">
			<%@ include file="memberViewmenu.jsp"%>
		</div>
		<br><br>
	<div class="row">
		<div class="span4 bs-docs-sidebar keywordside">
			<ul class="nav nav-tabs nav-stacked keyword">
				<!-- <li class="nav-header">검색</li> -->
				<li class="navbar-inner keywordsearch" style="margin-top:20px">
					<form class="navbar-search pull-left">
						<input type="text" class="search-query" placeholder="Search" style="width : 150px">
							<a class="btn btn-warning btn-xs" href="javascript:searchList()"><strong>검색</strong></a>
					</form>
				</li>

				<!-- <li class="nav-header">키워드로 찾기</li> --> 
				<br>
				<ul class="nav">
					<li><a data-toggle="collapse" href="#ga" style=" margin-left:25px;  font-size : 140%; ">ㄱ</a></li>
					<li><a data-toggle="collapse" href="#na" style=" margin-left:25px;  font-size : 140%; ">ㄴ</a></li>
					<li><a data-toggle="collapse" href="#da" style=" margin-left:25px;  font-size : 140%; ">ㄷ</a></li>
					<li><a data-toggle="collapse" href="#ra" style="margin-left:25px;  font-size : 140%; ">ㄹ</a></li>
					<li><a data-toggle="collapse" href="#ma" style="margin-left:25px;  font-size : 140%; ">ㅁ</a></li>
					<li><a data-toggle="collapse" href="#ba" style="margin-left:25px;  font-size : 140%; ">ㅂ</a></li>
					<li><a data-toggle="collapse" href="#sa" style="margin-left:25px;  font-size : 140%; ">ㅅ</a></li>
					<li><a data-toggle="collapse" href="#aa" style="margin-left:25px;  font-size : 140%; ">ㅇ</a></li>
					<li><a data-toggle="collapse" href="#ja" style="margin-left:25px;  font-size : 140%; ">ㅈ</a></li>
					<li><a data-toggle="collapse" href="#cha" style="margin-left:25px;  font-size : 140%; ">ㅊ</a></li>
					<li><a data-toggle="collapse" href="#ca" style="margin-left:25px;  font-size : 140%; ">ㅋ</a></li>
					<li><a data-toggle="collapse" href="#ta" style="margin-left:25px;  font-size : 140%; ">ㅌ</a></li>
					<li><a data-toggle="collapse" href="#pa" style="margin-left:25px;  font-size : 140%; ">ㅍ</a></li>
					<li><a data-toggle="collapse" href="#ha" style="margin-left:25px;  font-size : 140%; ">ㅎ</a></li>
				</ul>
			</ul>
			<%
				ArrayList<String> list = (ArrayList<String>)request.getAttribute("list");
					if(list==null) return;
			%>
			<div class="accordion-group" style="width: 300px; margin-left: 10px">

				<div class="accordion-heading" style="font-size : 120%; font-weight : bold">

					<div id="ga" class="accordion-body collapse">
							<%
								for(int i = 0 ; i < HangulChosungSearch.searchItem("ㄱ", list).size();i++){
							%>
							<span><a
								href="javascript:searchForm('<%=HangulChosungSearch.searchItem("ㄱ", list).get(i)%>')"><%=HangulChosungSearch.searchItem("ㄱ", list).get(i)%>&nbsp;&nbsp;</a></span>
															
							<%
								}
							%>
					</div>
					<div id="na" class="accordion-body collapse">
						<%
							for(int i = 0 ; i < HangulChosungSearch.searchItem("ㄴ", list).size();i++){
						%>
						<span><a
							href="javascript:searchForm('<%=HangulChosungSearch.searchItem("ㄴ", list).get(i)%>')"><%=HangulChosungSearch.searchItem("ㄴ", list).get(i)%>&nbsp;&nbsp;</a></span>
						<%
							}
						%>
					</div>
					<div id="da" class="accordion-body collapse">
						<%
							for(int i = 0 ; i < HangulChosungSearch.searchItem("ㄷ", list).size();i++){
						%>
						<span><a
							href="javascript:searchForm('<%=HangulChosungSearch.searchItem("ㄷ", list).get(i)%>')"><%=HangulChosungSearch.searchItem("ㄷ", list).get(i)%>&nbsp;&nbsp;</a></span>
						<%
							}
						%>
					</div>
					<div id="ra" class="accordion-body collapse">
						<%
							for(int i = 0 ; i < HangulChosungSearch.searchItem("ㄹ", list).size();i++){
						%>
						<span><a
							href="javascript:searchForm('<%=HangulChosungSearch.searchItem("ㄹ", list).get(i)%>')"><%=HangulChosungSearch.searchItem("ㄹ", list).get(i)%>&nbsp;&nbsp;</a></span>
						<%
							}
						%>
					</div>
					<div id="ma" class="accordion-body collapse">
						<%
							for(int i = 0 ; i < HangulChosungSearch.searchItem("ㅁ", list).size();i++){
						%>
						<span><a
							href="javascript:searchForm('<%=HangulChosungSearch.searchItem("ㅁ", list).get(i)%>')"><%=HangulChosungSearch.searchItem("ㅁ", list).get(i)%>&nbsp;&nbsp;</a></span>
						<%
							}
						%>
					</div>
					<div id="ba" class="accordion-body collapse">
						<%
							for(int i = 0 ; i < HangulChosungSearch.searchItem("ㅂ", list).size();i++){
						%>
						<span><a
							href="javascript:searchForm('<%=HangulChosungSearch.searchItem("ㅂ", list).get(i)%>')"><%=HangulChosungSearch.searchItem("ㅂ", list).get(i)%>&nbsp;&nbsp;</a></span>
						<%
							}
						%>
					</div>
					<div id="sa" class="accordion-body collapse">
						<%
							for(int i = 0 ; i < HangulChosungSearch.searchItem("ㅅ", list).size();i++){
						%>
						<span><a
							href="javascript:searchForm('<%=HangulChosungSearch.searchItem("ㅅ", list).get(i)%>')"><%=HangulChosungSearch.searchItem("ㅅ", list).get(i)%>&nbsp;&nbsp;</a></span>
						<%
							}
						%>
					</div>
					<div id="aa" class="accordion-body collapse">
						<%
							for(int i = 0 ; i < HangulChosungSearch.searchItem("ㅇ", list).size();i++){
						%>
						<span><a
							href="javascript:searchForm('<%=HangulChosungSearch.searchItem("ㅇ", list).get(i)%>')"><%=HangulChosungSearch.searchItem("ㅇ", list).get(i)%>&nbsp;&nbsp;</a></span>
						<%
							}
						%>
					</div>
					<div id="ja" class="accordion-body collapse">
						<%
							for(int i = 0 ; i < HangulChosungSearch.searchItem("ㅈ", list).size();i++){
						%>
						<span><a
							href="javascript:searchForm('<%=HangulChosungSearch.searchItem("ㅈ", list).get(i)%>')"><%=HangulChosungSearch.searchItem("ㅈ", list).get(i)%>&nbsp;&nbsp;</a></span>
						<%
							}
						%>
					</div>
					<div id="cha" class="accordion-body collapse">
						<%
							for(int i = 0 ; i < HangulChosungSearch.searchItem("ㅊ", list).size();i++){
						%>
						<span><a
							href="javascript:searchForm('<%=HangulChosungSearch.searchItem("ㅊ", list).get(i)%>')"><%=HangulChosungSearch.searchItem("ㅊ", list).get(i)%>&nbsp;&nbsp;</a></span>
						<%
							}
						%>
					</div>
					<div id="ka" class="accordion-body collapse">
						<%
							for(int i = 0 ; i < HangulChosungSearch.searchItem("ㅋ", list).size();i++){
						%>
						<span><a
							href="javascript:searchForm('<%=HangulChosungSearch.searchItem("ㅋ", list).get(i)%>')"><%=HangulChosungSearch.searchItem("ㅋ", list).get(i)%>&nbsp;&nbsp;</a></span>
						<%
							}
						%>
					</div>
					<div id="ta" class="accordion-body collapse">
						<%
							for(int i = 0 ; i < HangulChosungSearch.searchItem("ㅌ", list).size();i++){
						%>
						<span><a
							href="javascript:searchForm('<%=HangulChosungSearch.searchItem("ㅌ", list).get(i)%>')"><%=HangulChosungSearch.searchItem("ㅌ", list).get(i)%>&nbsp;&nbsp;</a></span>
						<%
							}
						%>
					</div>
					<div id="pa" class="accordion-body collapse">
						<%
							for(int i = 0 ; i < HangulChosungSearch.searchItem("ㅍ", list).size();i++){
						%>
						<span><a
							href="javascript:searchForm('<%=HangulChosungSearch.searchItem("ㅍ", list).get(i)%>')"><%=HangulChosungSearch.searchItem("ㅍ", list).get(i)%>&nbsp;&nbsp;</a></span>
						<%
							}
						%>
					</div>
					<div id="ha" class="accordion-body collapse">
						<%
							for(int i = 0 ; i < HangulChosungSearch.searchItem("ㅎ", list).size();i++){
						%>
						<span><a
							href="javascript:searchForm('<%=HangulChosungSearch.searchItem("ㅎ", list).get(i)%>')"><%=HangulChosungSearch.searchItem("ㅎ", list).get(i)%>&nbsp;&nbsp;</a></span>
						<%
							}
						%>
					</div>
			</div>
			
			<div id="searchResult"></div>
			
		</div>
		<!-- /well -->
	</div>
		<div class="span12">
			<div id="keyword" style="text-shadow: 1px 1px 1px gray;text-align : center; background-color : rgba(0, 0, 0, 0.18); font-weight : bold; margin-bottom : 20px;margin-top : -10px "></div>
			<div id="desc" style="background-color :rgba(255, 244, 116, 0.23); margin-bottom : 20px;"></div>
			<div id="url" align="center" style="margin-bottom : 20px; background-color : black"></div>
			<img src="" >
			<div id="tag" align="center" style="margin-bottom : 100px;background-color: rgba(226, 226, 63, 0.47);"></div>
		</div>
	</div>
</div>
</body>
</html>