package nhn.cistory.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;


import nhn.cistory.util.MySqlMap;
import nhn.cistory.vo.Board;
import nhn.cistory.vo.History;
import nhn.cistory.vo.Reply;


import com.ibatis.sqlmap.client.SqlMapClient;

public class BoardDao {
SqlMapClient sqlMap = MySqlMap.getSqlMapInstance();
	
	public BoardDao() {		
	}

	public void insert(Board board) throws SQLException {
		
		sqlMap.insert("board.insert", board);
	}
	
	public ArrayList<History> selectTag(String text) throws SQLException{
		ArrayList<History> taglist= null;
		taglist = (ArrayList<History>) sqlMap.queryForList("board.selectTag",text);
		return taglist;
	}
	
	
	public ArrayList<Board> listfree(String search, int start, int count) throws SQLException {
		ArrayList<Board> list= null;
		list = (ArrayList<Board>) sqlMap.queryForList("board.listfree",search,start,count);
		return list;
		
	}
	
	public ArrayList<Board> listsuggest(String search, int start, int count) throws SQLException {
		ArrayList<Board> list= null;
		list = (ArrayList<Board>) sqlMap.queryForList("board.listsuggest",search,start,count);
		return list;
		
	}
	
	public ArrayList<Board> listfnq(String search, int start, int count) throws SQLException {
		ArrayList<Board> list= null;
		list = (ArrayList<Board>) sqlMap.queryForList("board.listfnq",search,start,count);
		return list;
		
	}
	
	public int replycount(int brd_num) throws SQLException {
		
					
		int replycount = (Integer) sqlMap.queryForObject("board.replycount", brd_num);
		return replycount;
		
	}
	
	
	public int getTotal(String haction, String search) throws SQLException {
		
		HashMap<String, String> map = null;
				
		map = new HashMap<String, String>();
		
		map.put("haction", haction);
		map.put("search", search);
				
		int total = (Integer) sqlMap.queryForObject("board.total", map);
		return total;
		
	}
	
	

	public Board readNum(int num) throws SQLException {
		Board readNum = null;
		readNum =  (Board) sqlMap.queryForObject("board.readNum",num);
		return readNum;
		// TODO Auto-generated method stub
		
	}

	public void delete(int brd_num) throws SQLException {
		
		sqlMap.delete("board.delete",brd_num);
		
	}
	

	public Board getInfo(int brd_num) throws SQLException {
		Board board = null;
		board = (Board) sqlMap.queryForObject("board.getInfo",brd_num);
		return board;
	}
	
	public void viewcount(int brd_num) throws SQLException {
		sqlMap.update("board.viewcount", brd_num);
		
	}
	
	public void likecount(int brd_like_count) throws SQLException {
		sqlMap.update("board.likecount", brd_like_count);
		
	}
	
	public void hatecount(int brd_hate_count) throws SQLException {
		sqlMap.update("board.hatecount", brd_hate_count);
		
	}
	
	public void update(Board board) throws SQLException {
		sqlMap.update("board.update", board);
		
	}

	    public ArrayList<Reply> replyallList(int brd_num) throws SQLException {
		ArrayList<Reply> list = null;
		list = (ArrayList<Reply>) sqlMap.queryForList("board.replyallList", brd_num);
		return list;
		
	}

	public void replywrite(Reply reply) throws SQLException {
		sqlMap.insert("board.replywrite", reply);
		
	}
	
		
	public HashMap<String, Object> numSearch(int rp_num) throws SQLException {
		HashMap map = null;
		map = (HashMap<String, Object>) sqlMap.queryForObject("board.numSearch", rp_num);
		return map;
		
	}
	
	
	public void replyupdate(Reply reply) throws SQLException {
		sqlMap.update("board.replyupdate", reply);
		
	}
	
	
	public void replydelete(int rp_num) throws SQLException {
		sqlMap.delete("board.replydelete", rp_num);
		
	}

	public Reply replygetInfo(int rp_num) throws SQLException {
		Reply reply = null;
		reply = (Reply) sqlMap.queryForObject("board.replygetInfo", rp_num);
		return reply;
	}

	

	


}
