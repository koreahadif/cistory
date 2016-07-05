package nhn.cistory.dao;

import java.util.ArrayList;

import nhn.cistory.util.MySqlMap;
import nhn.cistory.vo.History;
import nhn.cistory.vo.MyNote;
import nhn.cistory.vo.Quiz;

import com.ibatis.sqlmap.client.SqlMapClient;

public class HistoryDao {
	SqlMapClient sqlMap = MySqlMap.getSqlMapInstance();

	//역사번호로 역사 정보 반환
	public History getHistory(int htr_num) throws Exception{
		History history = null;
		history = (History) sqlMap.queryForObject("history.getHistory", htr_num);
		return history;
	}
	
	public Quiz getQuiz(int quiz_num) throws Exception{
		Quiz quiz = new Quiz();
		quiz = (Quiz) sqlMap.queryForObject("history.getQuiz",quiz_num);
		if(quiz==null){
			return null;
		}
		return quiz;
		
	}

	public ArrayList<History> selectTimeline(String htr_age) throws Exception{
		ArrayList<History> list = new ArrayList<History>();
		list = (ArrayList<History>) sqlMap.queryForList("history.getTList",htr_age);
		return list;
	}
	
	public ArrayList<History> selectCategory(String htr_keyrd) throws Exception{
		ArrayList<History> list = new ArrayList<History>();
		list = (ArrayList<History>) sqlMap.queryForList("history.getCList",htr_keyrd);
		return list;
	}

	public void insertMyNote(MyNote mn) throws Exception{
		sqlMap.insert("history.insertMyNote",mn);
	}

	public ArrayList<String> selectCategoryList(String htr_keyrd) throws Exception{
		ArrayList<String> list = (ArrayList<String>) sqlMap.queryForList("history.getKeyword",htr_keyrd);
		return list;
	}

	public void delMyNote(int my_no_num) throws Exception{
		sqlMap.delete("history.delMyNum",my_no_num);
	}

}
