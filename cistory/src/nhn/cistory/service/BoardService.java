package nhn.cistory.service;


import java.sql.SQLException;
import java.util.ArrayList;

import nhn.cistory.dao.BoardDao;
import nhn.cistory.vo.Board;
import nhn.cistory.vo.History;
import nhn.cistory.vo.Reply;


public class BoardService {
	
	BoardDao dao = new BoardDao();
	
	public void write(Board board) throws Exception {
		dao.insert(board);
	}

	public ArrayList<History> tag(String text) throws Exception {
		ArrayList<History> taglist = dao.selectTag(text);
		return taglist;
	}

	public int getTotal(String haction, String search) throws Exception{
		int getTotal = dao.getTotal(haction, search);
		return getTotal;
	}

	public ArrayList<Board> listfree(String search, int startRecord, int countPerPage) throws Exception {
		ArrayList<Board> list = dao.listfree(search, startRecord, countPerPage);
		return list;
	}

	public int replycount(int brd_num) throws Exception {
		int x = dao.replycount(brd_num);
		return x;
	}
	
	public ArrayList<Board> listsuggest(String search, int startRecord, int countPerPage) throws Exception {
		ArrayList<Board> list = dao.listsuggest(search, startRecord, countPerPage);
		return list;
	}
	
	public ArrayList<Board> listfnq(String search, int startRecord, int countPerPage) throws Exception {
		ArrayList<Board> list = dao.listfnq(search, startRecord, countPerPage);
		return list;
	}

	public void likecount(int brd_num) throws Exception {
		dao.likecount(brd_num);
		
	}
	
	public void hatecount(int brd_num) throws Exception {
		dao.hatecount(brd_num);
		
	}

	public void viewcount(int brd_num) throws Exception {
		dao.viewcount(brd_num);
		
	}

	public Board readNum(int brd_num) throws Exception {
		Board board = dao.readNum(brd_num);
		return board;
	}

	public ArrayList<Reply> replyallList(int brd_num) throws Exception {
		ArrayList<Reply> list = null;
		list = (ArrayList<Reply>) dao.replyallList(brd_num);
		return list;
	}

	public void delete(int brd_num) throws Exception {
		dao.delete(brd_num);
		
	}

	public Board getInfo(int brd_num) throws Exception {
		Board board = dao.getInfo(brd_num);
		return board;
	}

	public void update(Board board) throws Exception {
		dao.update(board);
		
	}

	public void replywrite(Reply reply) throws Exception {
		dao.replywrite(reply);
		
	}

	public void replydelete(int rp_num) throws Exception{
		dao.replydelete(rp_num);
		
	}

	public Reply replygetInfo(int rp_num) throws Exception{
		Reply reply = dao.replygetInfo(rp_num);
		return reply;
	}

	public void replyupdate(Reply reply) throws Exception {
		dao.replyupdate(reply);
		
	}
	
	
	
}
