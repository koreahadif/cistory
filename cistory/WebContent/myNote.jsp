<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="loginCheck.jsp" %>
<%@ page import="java.awt.Graphics2D" %>
<%@ page import="java.awt.image.renderable.ParameterBlock" %>
<%@ page import="java.awt.image.BufferedImage" %>
<%@ page import="javax.media.jai.JAI" %>
<%@ page import="javax.media.jai.RenderedOp" %>
<%@ page import="javax.imageio.ImageIO" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="nhn.cistory.vo.MyNote" %>
<%@ page import="nhn.cistory.vo.History" %>
<%


	request.setCharacterEncoding("UTF-8");

	String imagePath = application.getRealPath("h_img");
	
	int size = 1*1024*1024 ;
	int i = 0;
	ArrayList<MyNote> myNoteList = (ArrayList<MyNote>) request.getAttribute("myNoteList");
	String filename[] = null;
	filename = new String[myNoteList.size()];
	
	for(i=0; i<myNoteList.size(); i++){
		filename[i] = myNoteList.get(i).getHtr_imguri();
		ParameterBlock pb=new ParameterBlock();
		pb.add(imagePath+"/"+filename[i]);
		RenderedOp rOp=JAI.create("fileload",pb);
		
		BufferedImage bi= rOp.getAsBufferedImage();
		BufferedImage thumb=new BufferedImage(100,100,BufferedImage.TYPE_INT_RGB);
		
		Graphics2D g=thumb.createGraphics();
		g.drawImage(bi,0,0,100,100,null);
		
		File file=new File(imagePath+"/thumb_"+filename[i]);
		ImageIO.write(thumb,"png",file);
	}
%>
<html>
<head>
<title>이미지 썸네일 예제</title>
<script src="//code.jquery.com/jquery-1.10.0.min.js"></script>


<style>
body{background-image:url('images/historyNote.png'); background-size: 100% 100%;
	   background-repeat : no-repeat; 
}	

#thumbnail{
background-color:rgba(89, 204, 103, 0.24);
}

</style>
<script type="text/javascript">
function deleteItem(num){
	if(confirm('노트정보를 삭제하시겠습니까?')){
		var num = $('#num'+num).val();
		location.href='delNote.cis?num='+num;
	}
	
}
</script>

</head>
<body style="overflow-x:hidden;min-height : 1020px;">

<div id="header">
<%@ include file="memberViewmenu.jsp" %>
</div>
<br><br><br><br>
<%
	MyNote defaultPage = myNoteList.get(0);
	MyNote notePage = null;
%>

<div id="myCarousel" class="carousel slide" data-interval="false" align="center">

  <!-- Carousel items -->
  <div class="carousel-inner">
    <div class="active item">
	    <table cellpadding=10>
			<tr>
				<td rowspan="4"><img class="img-mynote" src="h_img/<%= defaultPage.getHtr_imguri() %>" width="400" height="350">
				<td width="700" height="40">
				<input type="hidden" name="num" id="num0" value="<%=defaultPage.getMy_no_num()%>">
					<h3><%= defaultPage.getHtr_keyrd() %>(<%=defaultPage.getHtr_age()%>/<%=defaultPage.getHtr_type()%>)<button type="button" class="close" onClick="deleteItem(0)">X</button></h3>
			</tr>
			<tr>
				<td width="700" height="330" valign="top">&nbsp;
					&nbsp;
					<%
						if(defaultPage.getHtr_desc().contains("\n")){
							String htr_desc[] = defaultPage.getHtr_desc().split("\n");
							for(int j=0; j<htr_desc.length; j++){
					%>
								<%= htr_desc[j] %><br>
					<%		}
						}else{ %>
							<%= defaultPage.getHtr_desc() %><br>
					<%	} %>
			</tr>
			<tr>
				<td height="50"><strong><%= defaultPage.getMy_no_memo() %></strong></td>
			</tr>
		</table>
    </div>
<%	for(i=1; i<myNoteList.size(); i++){ 
		notePage = myNoteList.get(i);
%>    
    <div class="item">
    	<table cellpadding=10>
			<tr>
				<td rowspan="4"><img class="img-mynote" src="h_img/<%= notePage.getHtr_imguri() %>" width="400" height="350">
				<input type="hidden" name="num" id="num<%=i %>" value="<%=notePage.getMy_no_num()%>">
				<td width="700" height="40">
					<h3><%= notePage.getHtr_keyrd() %>(<%=notePage.getHtr_age()%>/<%=notePage.getHtr_type()%>)<button type="button" class="close" onClick="deleteItem(<%=i%>)">X</button></h3>
			</tr>
			<tr>
				<td width="700" height="330" valign="top">&nbsp;
					<%
						if(notePage.getHtr_desc().contains("\n")){
							String htr_desc[] = notePage.getHtr_desc().split("\n");
							for(int j=0; j<htr_desc.length; j++){
					%>
								<%= htr_desc[j] %><br>
					<%		}
						}else{ %>
							<%= notePage.getHtr_desc() %><br>
					<%	} %>
			</tr>
			<tr>
				<td height="50"><strong><%= notePage.getMy_no_memo() %></strong></td>
			</tr>
		</table>     
    </div>
<%	} %>    
  </div>
  <!-- Carousel navigator -->
  <a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
  <a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
 
  <!-- Carousel indicator -->
	<div id="thumbnail" style="overflow-x:auto; white-space: nowrap;">
	<!-- <table><tr><td style="overflow-x:scroll"> -->  
	  <% for(i=0; i<filename.length; i++){ %>
		<img src="h_img/thumb_<%=filename[i] %>" data-target="#myCarousel" data-slide-to="<%= i %>" class="img-thumbnail" width="100">  
	  <% } %>
	</div>
	<!-- </tr></table> -->
</div>

</body>
</html>
