package nhn.cistory.dao;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import nhn.cistory.util.MySqlMap;
import nhn.cistory.vo.Obquestion;
import nhn.cistory.vo.Qobtr;
import nhn.cistory.vo.Question;
import nhn.cistory.vo.Subquestion;
import nhn.cistory.vo.Test;
import nhn.cistory.vo.Testresult;
import nhn.cistory.vo.Testtestresult;
import nhn.cistory.vo.ThmWrongNote;
import nhn.cistory.vo.WrongNote;

import com.ibatis.sqlmap.client.SqlMapClient;

public class TestDao {
	private static SqlMapClient sqlMap = MySqlMap.getSqlMapInstance();
	public TestDao(){

	}
	//시험번호와 점수 들고오기
	@SuppressWarnings("unchecked")
	public ArrayList<Question> preSelect(String grade){
		ArrayList<Question> list = new ArrayList<Question>();
		try {
			list = (ArrayList<Question>) sqlMap.queryForList("test.preSelect",grade);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	//객관식 한문제 들고 오기
	/*public Quesob selectOneOb(int num){
		Quesob quesob = new Quesob();
		try {
			quesob=(Quesob) sqlMap.queryForObject("test.selectOneOb",num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return quesob;
	}*/
	// 주관식 한문제 들고 오기
	public Subquestion selectOneSub(int q_num){
		Subquestion sub = new Subquestion();
		try {
			sub = (Subquestion) sqlMap.queryForObject("test.selectOneSub",q_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sub;
	}
	//기출 오답 노트용 객관식 문제 정보 가져오기
	public ArrayList<Obquestion> getObquestions(ArrayList<Integer> qNumList){
		ArrayList<Obquestion> obList = null;
		System.out.println(qNumList);
		try {
			obList = (ArrayList<Obquestion>) sqlMap.queryForList("test.getObquestions",qNumList);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return obList;
	}
	
	//테마 오답 노트용 주관식 문제 정보 가져오기
	public ArrayList<Subquestion> getSubquestions(ArrayList<Integer> qNumList){
		ArrayList<Subquestion> subList = null;
		try {
			subList = (ArrayList<Subquestion>) sqlMap.queryForList("test.getSubquestions",qNumList);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return subList;
	}
	
	//50개의 정답과 해설, 내가 고른 답 들고오기 (오답률위해 오답횟수와출제횟수도 들고옴)
	@SuppressWarnings("unchecked")
	public ArrayList<Qobtr> selectAllTest(String test_num){
		ArrayList<Qobtr> list = null;
		try {
			list = (ArrayList<Qobtr>) sqlMap.queryForList("test.selectAllTest",test_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//시험 점수 가져오기(시험정보모두)
	public Test selectTestInfo(int num) throws Exception{
		Test test = new Test();
		test = (Test) sqlMap.queryForObject("test.selectTestInfo",num);
		return test;
	}
	//아이디 별로 모든 시험 정보 가져오기
	public ArrayList<Test> selectUserTest(String id) throws Exception {
		ArrayList<Test> list = new ArrayList<Test>();
		
		list = (ArrayList<Test>) sqlMap.queryForList("test.selectUserTest",id);
		
		return list;
	}
	public HashMap<String,Integer> selectUserStat(int test_num) throws Exception {
		HashMap<String,Integer> map = new HashMap<String, Integer>();
		map = (HashMap<String, Integer>) sqlMap.queryForObject("test.selectTestDetail",test_num);
		return map;
	}
	
	//INSERT////////////////////////////////////////////
	//시험 시작시간 시험 종료시간 점수 저장하기(시험정보)
	public void insertTime(Test test){
		try {
			sqlMap.insert("test.insertTime",test);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	//시험 결과 저장하기
	public void insertTestRslt(Testresult tr){
		try {
			sqlMap.insert("test.insertTestRslt",tr);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	//문제정보 입력하기(두번의 INSERT)1/2
	public void insertQuestion(Question question){
		try {
			sqlMap.insert("test.insertQuestion1",question);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	//문제정보 입력하기(두번의 INSERT)2/2
	public void insertObQuestion(Obquestion obq){
		try {
			sqlMap.insert("test.insertQuestion2",obq);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//********** UPDATE **********////////////////
	//점수 수정하기
	public void updateScore(Test test){
		try {
			sqlMap.update("test.updateScore",test);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//오답횟수와 출제횟수 수정하기 
	public void updateSetCount(ArrayList<Integer> list) throws Exception{
		sqlMap.update("test.updateSetCount",list);
	}
	public void updateWrongCount(ArrayList<Integer> list) throws Exception{
		System.out.println(list.toString());
		if(list!=null && list.size()!=0){
			sqlMap.update("test.updateWrongCount",list);
		}
	}
	
	//*******************추가사항 *********************
	public ArrayList<Qobtr> selectCalcScore(int test_num){
		ArrayList<Qobtr> list = new ArrayList<Qobtr>();
		try {
			list = (ArrayList<Qobtr>) sqlMap.queryForList("test.calcscore",test_num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public int selectTestNum(Test test){
		int testNum = 0;
		
		try {
			testNum = (int) sqlMap.queryForObject("test.gettestnum",test);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return testNum;
	}
	
	public void insertWrongNote(WrongNote e){
		try {
			sqlMap.insert("test.insertwn",e);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}
	
	//시험 번호를 받아 오답 갯수를 반환
	public int getWrongCnt(int test_num){
		int wrongCnt = 0;
		
		try {
			wrongCnt = (int) sqlMap.queryForObject("test.getWrongCnt",test_num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return wrongCnt;
	}
	
	//시험 번호를 받아 오답 노트 페이지수를 반환
	public int getWrongNoteCnt(int test_num){
		int wrongNoteCnt = 0;
		
		try {
			wrongNoteCnt = (int) sqlMap.queryForObject("test.getWrongNoteCnt",test_num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return wrongNoteCnt;
	}
	//테마시험
	public ArrayList<HashMap<String,Object>> preTheme(HashMap<String,String> map){
		ArrayList<HashMap<String,Object>> list = new ArrayList<HashMap<String,Object>>();
		
		try {
			list = (ArrayList<HashMap<String,Object>>) sqlMap.queryForList("test.preTheme",map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public Obquestion selectObAnswer(String q_num){
		Obquestion obq = new Obquestion();
		try {
			obq = (Obquestion) sqlMap.queryForObject("test.selectobans",q_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return obq;
	}
	
	public Subquestion selectSubAnswer(String q_num){
		Subquestion subq = new Subquestion();
		try {
			subq = (Subquestion) sqlMap.queryForObject("test.selectsubans",q_num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return subq;
	}
	
	public void insertThmWrongNote(ThmWrongNote tn){
		try {
			sqlMap.insert("test.insertThmWrNote",tn);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
}
