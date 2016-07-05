package nhn.cistory.controller;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import nhn.cistory.dao.BoardDao;
import nhn.cistory.service.BoardService;
import nhn.cistory.util.PageNavigator;
import nhn.cistory.vo.Board;
import nhn.cistory.vo.History;
import nhn.cistory.vo.Reply;

public class BoardController {
	
	BoardService boardService = new BoardService();

	public void writeForm(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.sendRedirect("board_writeform.jsp");
		
	}
	public void write(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		System.out.println("id : "+id);
		String nickname = request.getParameter("nickname");
		System.out.println("nickname : "+nickname);
		String grade = "0";
		System.out.println("grade : "+grade);
		String htr_tag = request.getParameter("htr_tag");
		
		String brd_title = request.getParameter("brd_title");
		System.out.println("brd_title : "+brd_title);
		String brd_content = request.getParameter("content");
		
		String brd_ctg = request.getParameter("brd_ctg");
		System.out.println("brd_ctg :"+brd_ctg);
		brd_content = (brd_content.equals(null)?"<br>":brd_content);
		System.out.println("brd_content : "+brd_content);
		htr_tag = (htr_tag.equals(null)?"<br>":htr_tag);
		System.out.println("htr_tag : "+htr_tag);
		
		Board board = new Board(brd_ctg, id, nickname,
				grade, brd_title, brd_content.replaceAll("\n", "<br>"), htr_tag);
		
		boardService.write(board);
		
		String tbrd_ctg = null;
		
		if(brd_ctg.equals("자유게시판")){
			tbrd_ctg = "listfree.cis";
		}
		else if(brd_ctg.equals("건의게시판")){
			tbrd_ctg = "listsuggest.cis";
		}
		else if(brd_ctg.equals("질문과답변게시판")){
			tbrd_ctg = "listfnq.cis";
		}
		
		response.sendRedirect(tbrd_ctg);
		
	}

	public void tag(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String text = request.getParameter("text");
		String type = request.getParameter("typeFrom");
		
		ArrayList<History> taglist = boardService.tag(text);
		
		request.setAttribute("taglist", taglist ); 
		request.setAttribute("type", type);
		request.getRequestDispatcher("tag.jsp").forward(request, response);		
		
	}

	public void listfree(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String str = request.getParameter("page");
		
		int page = 1;
		if(str != null){
			try{
				page = Integer.parseInt(str);
			}
			catch(Exception e){
				page=1;
			}
		}
		
		String search = request.getParameter("search");
		
		int countPerPage = 5;
		int currentPage = page;
		int pagePerGroup = 5;
		int totalRecordsCount=0;
		
		String haction = "자유게시판";	
		
				
		totalRecordsCount = boardService.getTotal(haction,search);
		System.out.println("totalRecordsCount :"+totalRecordsCount);
				
		PageNavigator navi=null;
		int total=0;
		ArrayList<Board> list = null;
		
				
			  total = boardService.getTotal(haction,search);
			  navi = new PageNavigator(countPerPage, pagePerGroup, currentPage, total);
			  list = boardService.listfree(search, navi.getStartRecord(), navi.getCountPerPage());
		
		
		ArrayList<Integer> replyCount = new ArrayList<Integer>();
		
		for(int i=0; i<list.size(); i++){
			
			int x=0;
			System.out.println("list.get(i).getBrd_num() :"+list.get(i).getBrd_num());
			x = boardService.replycount(list.get(i).getBrd_num());
			System.out.println("x :"+x);
			replyCount.add(x);
		}
		
		request.setAttribute("replyCount", replyCount );
		request.setAttribute("navi", navi ); 
		request.setAttribute("list", list ); 
		request.setAttribute("search", search ); 
		
		if(list.size()==0){
		
			response.sendRedirect("board_writeform.jsp");
			
		}
		else{
		
		request.getRequestDispatcher("boardList.jsp").forward(request, response);
		
		}
	}

	public void listsuggest(HttpServletRequest request,	HttpServletResponse response) throws Exception{
		String str = request.getParameter("page");
		
		int page = 1;
		if(str != null){
			try{
				page = Integer.parseInt(str);
			}
			catch(Exception e){
				page=1;
			}
		}
		
		String search = request.getParameter("search");
		System.out.println("search :"+search);
		
		int countPerPage = 5;
		int currentPage = page;
		int pagePerGroup = 5;
		int totalRecordsCount=0;
		
		String haction = "건의게시판";	
		
				
		totalRecordsCount = boardService.getTotal(haction,search);
		System.out.println("totalRecordsCount :"+totalRecordsCount);
				
		PageNavigator navi=null;
		int total=0;
		ArrayList<Board> list = null;
		
				
			  total = boardService.getTotal(haction,search);
			  navi = new PageNavigator(countPerPage, pagePerGroup, currentPage, total);
			  list = boardService.listsuggest(search, navi.getStartRecord(), navi.getCountPerPage());
		
		
		ArrayList<Integer> replyCount = new ArrayList<Integer>();
		
		for(int i=0; i<list.size(); i++){
						
			int x=0;
			System.out.println("list.get(i).getBrd_num() :"+list.get(i).getBrd_num());
			x = boardService.replycount(list.get(i).getBrd_num());
			System.out.println("x :"+x);
			replyCount.add(x);
		}
		
		System.out.println("replyCount : "+replyCount);
		request.setAttribute("replyCount", replyCount );
		request.setAttribute("navi", navi ); 
		request.setAttribute("list", list ); 
		request.setAttribute("search", search ); 
		
		if(list.size()==0){
			
			response.sendRedirect("board_writeform.jsp");
			
		}
		else{
		
		request.getRequestDispatcher("boardList.jsp").forward(request, response);
		
		}
		
	}

	public void listfnq(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String str = request.getParameter("page");
		
		int page = 1;
		if(str != null){
			try{
				page = Integer.parseInt(str);
			}
			catch(Exception e){
				page=1;
			}
		}
		
		String search = request.getParameter("search");
		
		int countPerPage = 5;
		int currentPage = page;
		int pagePerGroup = 5;
		int totalRecordsCount=0;
		
		String haction = "질문과답변게시판";	
		
				
		totalRecordsCount = boardService.getTotal(haction,search);
		System.out.println("totalRecordsCount :"+totalRecordsCount);
				
		PageNavigator navi=null;
		int total=0;
		ArrayList<Board> list = null;
		
				
			  total = boardService.getTotal(haction,search);
			  navi = new PageNavigator(countPerPage, pagePerGroup, currentPage, total);
			  list = boardService.listfnq(search, navi.getStartRecord(), navi.getCountPerPage());
		
		
		ArrayList<Integer> replyCount = new ArrayList<Integer>();
		
		for(int i=0; i<list.size(); i++){
			
			int x=0;
			System.out.println("list.get(i).getBrd_num() :"+list.get(i).getBrd_num());
			x = boardService.replycount(list.get(i).getBrd_num());
			System.out.println("x :"+x);
			replyCount.add(x);
		}
		
		request.setAttribute("replyCount", replyCount );
		request.setAttribute("navi", navi ); 
		request.setAttribute("list", list ); 
		request.setAttribute("search", search ); 
		
		if(list.size()==0){
			
			response.sendRedirect("board_writeform.jsp");
			
		}
		else{
		
		request.getRequestDispatcher("boardList.jsp").forward(request, response);
		
		}
		
	}

	public void like(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String strnum = request.getParameter("brd_num");
		System.out.println(strnum);
		String brd_ctg = request.getParameter("brd_ctg");
		Board board=null;
		int brd_num=0;
		
		if(strnum ==null){
			response.sendRedirect(brd_ctg+".cis");
		}
		else{
			brd_num = Integer.parseInt(strnum);
		}	
								
		boardService.likecount(brd_num);
				
		response.sendRedirect("read.cis?brd_num="+brd_num+"&brd_ctg="+brd_ctg+"&view=done");
		
	}

	public void hate(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String strnum = request.getParameter("brd_num");
		System.out.println(strnum);
		String brd_ctg = request.getParameter("brd_ctg");
		Board board=null;
		int brd_num=0;
		
		
				
		
		if(strnum ==null){
			response.sendRedirect(brd_ctg+".cis");
		}
		else{
				brd_num = Integer.parseInt(strnum);
		}	
								
		boardService.hatecount(brd_num);
				
		response.sendRedirect("read.cis?brd_num="+brd_num+"&brd_ctg="+brd_ctg+"&view=done");
		
	}
	
	public void read(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String strnum = request.getParameter("brd_num");
		System.out.println(strnum);
		String brd_ctg = request.getParameter("brd_ctg");
		String view = request.getParameter("view");
		Board board=null;
		int brd_num=0;
		
		if(strnum ==null){
			System.out.println("BoardController read if문 지나감");
			response.sendRedirect(brd_ctg+".cis");
		}
		else{
			System.out.println("BoardController read else문 지나감");
			brd_num = Integer.parseInt(strnum);
				
		}
		
		if(view==null)
			boardService.viewcount(brd_num);
		
		board = boardService.readNum(brd_num);
				
			
		if(board == null){
			response.sendRedirect(brd_ctg+".cis");
			return;
		}//if
		
		ArrayList<Reply> list = null;
		list = (ArrayList<Reply>) boardService.replyallList(brd_num);
		
		
		System.out.println(list);
		request.setAttribute("list", list ); 
		request.setAttribute("board", board );
		
		request.getRequestDispatcher("boardRead.jsp").forward(request, response);
		
	}

	public void delete(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String strnum = request.getParameter("brd_num");
		System.out.println(strnum);
		String brd_ctg = request.getParameter("brd_ctg");
		Board board=null;
		int brd_num=0;
		
		if(strnum ==null){
			response.sendRedirect(brd_ctg+".cis");
		}
		else{
				brd_num = Integer.parseInt(strnum);
			
		}//else	
		
					boardService.delete(brd_num);		
					response.sendRedirect(brd_ctg+".cis");
		
	}

	public void infoedit1(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession ses = request.getSession();
		
		String strnum = request.getParameter("brd_num");
		int brd_num = Integer.parseInt(strnum);
		Board board = null;
			
			board = boardService.getInfo(brd_num);
			
			request.setAttribute("board", board);
		
		request.getRequestDispatcher("infoeditboard.jsp").forward(request,response);
		
	}

	public void infoedit2(HttpServletRequest request, HttpServletResponse response) throws Exception{
		Board board = new Board();
		
		String strnum = request.getParameter("brd_num");
		int brd_num=1;
		
		brd_num = Integer.parseInt(strnum);
		
		String brd_ctg = request.getParameter("brd_ctg");
		String brd_title = request.getParameter("brd_title");
		String brd_content = request.getParameter("content");
		String htr_tag = request.getParameter("htr_tag");
		brd_content = (brd_content.equals(null)?"<br>":brd_content);
		System.out.println("brd_content : "+brd_content);
		htr_tag = (htr_tag.equals(null)?"<br>":htr_tag);
		System.out.println("htr_tag : "+htr_tag);
		
		board.setBrd_num(brd_num);
		board.setBrd_title(request.getParameter("brd_title"));
		board.setBrd_content(brd_content.replaceAll("\n", "<br>"));
		board.setHtr_tag(htr_tag);
		board.setBrd_ctg(brd_ctg);
		
		System.out.println(board);

		
			boardService.update(board);

		
		String tbrd_ctg = null;
		
		if(brd_ctg.equals("자유게시판")){
			tbrd_ctg = "listfree";
		}
		else if(brd_ctg.equals("건의게시판")){
			tbrd_ctg = "listsuggest";
		}
		else if(brd_ctg.equals("질문과답변게시판")){
			tbrd_ctg = "listfnq";
		}	
		
		response.sendRedirect(tbrd_ctg+".cis");
		
	}

	public void replywrite(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession ses = request.getSession();
		String id = request.getParameter("id");
		String nickname = request.getParameter("nickname");
		String grade = request.getParameter("grade");
		String rp_content = request.getParameter("rp_content");
		String strnum = request.getParameter("brd_num");
		int brd_num = Integer.parseInt(strnum);
		
		
		Reply reply = new Reply( brd_num, id, nickname, grade, rp_content.replaceAll("\n", "<br>"));
		boardService.replywrite(reply);

		response.sendRedirect("read.cis?brd_num="+brd_num+"&view=done");
		
	}

	public void replyallList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String strnum = request.getParameter("brd_num");
		
		int brd_num = 0;
		if(strnum != null){
			brd_num = Integer.parseInt(strnum);
		}
	
		ArrayList<Reply> list = null;
			  list = (ArrayList<Reply>) boardService.replyallList(brd_num);
				
		System.out.println(list);
		request.setAttribute("list", list ); 
				
		request.getRequestDispatcher("boardRead.jsp").forward(request, response);
		
	}

	public void replydelete(HttpServletRequest request,	HttpServletResponse response) throws Exception{
		String strnum1 = request.getParameter("rp_num");
		String strnum2 = request.getParameter("brd_num");
		System.out.println("삭제"+strnum1);
		System.out.println("삭제"+strnum2);
		Board board=null;
		int rp_num=0;
		int brd_num=0;

		if(strnum1 ==null || strnum2 ==null){
			System.out.println("삭제실패1");
			response.sendRedirect("read.cis?brd_num="+brd_num+"&view=done");
		}//if
		else{
			rp_num = Integer.parseInt(strnum1);
			brd_num = Integer.parseInt(strnum2);
			
		}	
			
			
			boardService.replydelete(rp_num);
		
		response.sendRedirect("read.cis?brd_num="+brd_num+"&view=done");
		
	}

	public void replyinfoedit1(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession ses = request.getSession();
		String strnum1 = request.getParameter("rp_num");
		String strnum2 = request.getParameter("brd_num");
		int rp_num = Integer.parseInt(strnum1);
		int brd_num = Integer.parseInt(strnum2);
		Reply reply = null;
		
		
			reply = boardService.replygetInfo(rp_num);
			System.out.println("replyinfoedit1 : "+ reply);
			request.setAttribute("reply", reply);
		
		
		request.getRequestDispatcher("infoeditReply.jsp").forward(request,response);
		
	}

	public void replyinfoedit2(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Reply reply = new Reply();
		String strnum1 = request.getParameter("rp_num");
		String strnum2 = request.getParameter("brd_num");
		int rp_num=0;
		int brd_num=0;
		
		rp_num = Integer.parseInt(strnum1);
		brd_num = Integer.parseInt(strnum2);
		
		reply.setRp_num(rp_num);
		reply.setBrd_num(brd_num);
		reply.setRp_content(request.getParameter("rp_content"));
		
			boardService.replyupdate(reply);
			
		response.sendRedirect("read.cis?brd_num="+brd_num+"&view=done");
	}
		
	
	

}
