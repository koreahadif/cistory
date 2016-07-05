var sAppID = "368795783220853";
window.fbAsyncInit= function(){
 	FB.init({
	appId  : sAppID,
	status : true, // check login status
	cookie : true, // enable cookies to allow the server to access the session
	xfbml  : true,  // parse XFBML
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
		
		alert('login');
		var content = document.getElementById("tmp_str2");
		content.innerHTML= "getPernonalID()";
 
	}else{
		alert('??');
	}
},{scope:'publish_stream,offline_access,user_status,read_stream,user_photo_video_tags,user_photos'});
}
function htrPosting(){
	FB.ui(
			  {
			    method: 'feed',
			    name: 'Minsik',
			    link: 'http://localhost:8080/web1_1',
			    picture: 'http://localhost:8080/web1_1/test.jpg',
			    caption: '테스트입니다.',
			    description: '테스트에요'
			  },
			  function(response) {
			    if (response && response.post_id) {
			      alert('Post was published.');
			    } else {
			      alert('Post was not published.');
			    }
			  }
			);
}