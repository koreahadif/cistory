<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="nhn.cistory.vo.Member" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"/> -->
<script type="text/javascript">
<%if(session.getAttribute("member")!=null){%>
var id = '<%=((Member)session.getAttribute("member")).getId()%>';
<%}%>
var sAppID = "368795783220853";
window.fbAsyncInit= function(){
 	FB.init({
	appId  : sAppID,
	status : true, 
	cookie : true, 
	xfbml  : true, 
	oauth  : true
 	});
 
};
(function(d){
var js, id = 'facebook-jssdk'; if (d.getElementById(id)) {return;}
js = d.createElement('script'); js.id = id; js.async = true;
js.src = "//connect.facebook.net/ko_KR/all.js";
d.getElementsByTagName('head')[0].appendChild(js);
}(document));
 
function sLogin(){
FB.login(function(response) {
	if (response.authResponse) {
		alert('로그인되었습니다.');
	}else{
		alert('로그인실패');
	}
},{scope:'publish_stream,offline_access,user_status,read_stream,user_photo_video_tags,user_photos'});
}
function htrPosting(){
	set();
	FB.ui(
			  {
			    method: 'feed',
			    name: '씨스토리',
			    link: 'http://203.233.196.84:8080/cistory/',
			    picture: 'http://203.233.196.84:8080/cistory/'+$('#'+currPage).children().children().children().eq(1).children().children().attr('src'),
			    caption: $('#'+currPage).children().children().children().children().eq(1).text(),
			    description: $('#'+currPage).children().children().children().children().eq(2).text()
			  },
			  function(response) {
			    if (response && response.post_id) {
			      alert('공유되었습니다.');
			    } else {
			      alert('공유에 실패하였습니다.');
			    }
			  }
			);
}
function addMyNote(){
	set();
	$('#nameLabel').html($('#'+currPage).children().children().children().children().eq(1).text());
	$('#expLabel').html($('#'+currPage).children().children().children().children().eq(2).text());
}
function submitMyNote(){
	var param = {htrNum:$('#'+currPage+' .num').text(), myMemo:$('#myNote').val(), id:id};
	$.post("addMyNote.cis",param,nonAction);
	$('#saveNote').attr("aria-hidden",true);
	$('#saveNote').attr("data-dismiss","modal");
	resetText();
}
function resetText(){
	$('#myNote').val('');
}
function nonAction(str){
	alert('나만의 노트에 추가되었습니다.');
}
</script>
</head>
<body>
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/ko_KR/all.js#xfbml=1&appId=368795783220853";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
<img src="images/login-facebook-2.png" onClick="sLogin()" width="25%" height="7%">
<a href="javascript:htrPosting()" role="button" class="btn btn-primary">공유하기</a>
<%if((Member)session.getAttribute("member")!=null){%>
<a href="#myModal" role="button" class="btn btn-primary" data-toggle="modal" onClick="addMyNote()">노트에 추가</a>
<button class="btn btn-primary" type="button" onClick='location.href="myNote.cis"'>역사노트로</button>
<!-- Modal -->
<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
	  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	  <h3 id="myModalLabel">Add MyNote</h3>
	</div>
	<div class="modal-body">
	  <p id="nameLabel"></p>
	  <p id="expLabel"></p>
	  <p id="texta"><textarea id="myNote" rows="3" placeholder="나만의노트입력"></textarea>
	</div>
	<div class="modal-footer">
    <button class="btn" data-dismiss="modal" aria-hidden="true" onClick="resetText()">취소</button>
    <button class="btn btn-primary" id="saveNote" onClick="submitMyNote()">노트 저장</button>
    </div>
</div>
<%} %>
</body>
</html>