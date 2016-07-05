package nhn.cistory.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;

import net.sf.json.JSONObject;
import nhn.cistory.dao.TestDao;
import nhn.cistory.util.CalcScore;
import nhn.cistory.util.GetnumList;
import nhn.cistory.util.ScorePrediction;
import nhn.cistory.vo.Obquestion;
import nhn.cistory.vo.Qobtr;
import nhn.cistory.vo.Question;
import nhn.cistory.vo.Subquestion;
import nhn.cistory.vo.Test;
import nhn.cistory.vo.Testresult;
import nhn.cistory.vo.ThmWrongNote;
import nhn.cistory.vo.WrongNote;

public class TestService {
	private TestDao tdao = new TestDao();
	
	public TestService(){}
	
	public ArrayList<HashMap<String, Object>> getThmQList(HashMap<String,String> map){
		ArrayList<HashMap<String, Object>> list = tdao.preTheme(map);
		Collections.shuffle(list);
		return list;
	}
	
	public ArrayList<Integer> startTest(String grade) throws Exception{
		if(grade.equals("i")) grade="중급";
		else if(grade.equals("a")) grade="고급";
		//문제 랜덤으로 뽑은 알고리즘
		ArrayList<Question> list = tdao.preSelect(grade);
		GetnumList getList = new GetnumList();
		ArrayList<Integer> numList = getList.getNumList(list);
		return numList;
	}
	
	public JSONObject getQuestion(int num){
		ArrayList<Obquestion> getQuestion = null;
		Obquestion oneQuestion = null;
		ArrayList<Integer> qNumList = new ArrayList<Integer>();
		
		qNumList.add(num);
		getQuestion = tdao.getObquestions(qNumList);
		System.out.println("사이즈:"+getQuestion.size()+"야호:"+getQuestion);
		if(getQuestion.size()!=1){
			return null;
		}
		JSONObject jsonObj = new JSONObject();
		oneQuestion = getQuestion.get(0);
		System.out.println(oneQuestion);
		if(oneQuestion.getCho1().endsWith("png")|| oneQuestion.getCho1().endsWith("PNG")){
			String q1 = "<img src='q_img/"+oneQuestion.getCho1()+"'>";
			String q2 = "<img src='q_img/"+oneQuestion.getCho2()+"'>";
			String q3 = "<img src='q_img/"+oneQuestion.getCho3()+"'>";
			String q4 = "<img src='q_img/"+oneQuestion.getCho4()+"'>";
			String q5 = "<img src='q_img/"+oneQuestion.getCho5()+"'>";
				jsonObj.put("q1",q1);	
			jsonObj.put("q2",q2);	
			jsonObj.put("q3",q3);	
			jsonObj.put("q4",q4);	
			jsonObj.put("q5",q5);
		}
		else{
			jsonObj.put("q1",oneQuestion.getCho1());	
			jsonObj.put("q2",oneQuestion.getCho2());	
			jsonObj.put("q3",oneQuestion.getCho3());	
			jsonObj.put("q4",oneQuestion.getCho4());	
			jsonObj.put("q5",oneQuestion.getCho5());				
		}
		jsonObj.put("question",oneQuestion.getQuestion());
		jsonObj.put("desc", oneQuestion.getOb_desc());
		jsonObj.put("point",oneQuestion.getPoint());
		return jsonObj;
	}
	
	public JSONObject getTQuestion(String qNum,String qType){
		System.out.println(qType);
		
		if(qType == null){
			JSONObject jsonObj = null;
			return jsonObj;
		}else if(qType.equals("객관식")){
			Obquestion oneQuestion = null;
			ArrayList<Integer> list = new ArrayList<Integer>();
			list.add(Integer.parseInt(qNum));
			ArrayList<Obquestion> getQuestion = tdao.getObquestions(list);
			if(getQuestion.size()!=1){
				return null;
			}
			JSONObject jsonObj = new JSONObject();
			oneQuestion = getQuestion.get(0);
			System.out.println(oneQuestion.toString());
			if(oneQuestion.getCho1().endsWith("png")|| oneQuestion.getCho1().endsWith("PNG")){
				String q1 = "<img src='q_img/"+oneQuestion.getCho1()+"' style=\"width:110px; height:110px\">";
				String q2 = "<img src='q_img/"+oneQuestion.getCho2()+"' style=\"width:110px; height:110px\">";
				String q3 = "<img src='q_img/"+oneQuestion.getCho3()+"' style=\"width:110px; height:110px\">";
				String q4 = "<img src='q_img/"+oneQuestion.getCho4()+"' style=\"width:110px; height:110px\">";
				String q5 = "<img src='q_img/"+oneQuestion.getCho5()+"' style=\"width:110px; height:110px\">";
				jsonObj.put("q1",q1);	
				jsonObj.put("q2",q2);	
				jsonObj.put("q3",q3);	
				jsonObj.put("q4",q4);	
				jsonObj.put("q5",q5);
			}
			else{
				jsonObj.put("q1",oneQuestion.getCho1());	
				jsonObj.put("q2",oneQuestion.getCho2());	
				jsonObj.put("q3",oneQuestion.getCho3());	
				jsonObj.put("q4",oneQuestion.getCho4());	
				jsonObj.put("q5",oneQuestion.getCho5());				
			}
			jsonObj.put("question",oneQuestion.getQuestion());
			jsonObj.put("desc", oneQuestion.getOb_desc());
			jsonObj.put("point",oneQuestion.getPoint());
			return jsonObj;
		}else{// if(qType.equals("주관식")){
			Subquestion sub = null;
			sub = tdao.selectOneSub(Integer.parseInt(qNum));
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("question",sub.getQuestion());
			jsonObj.put("desc", "<img src='q_img/"+sub.getSub_desc()+"'>");
			jsonObj.put("point",sub.getPoint());
			return jsonObj;
		}
	}
	
	public int setTestResult(String stringList,String endTime, String startTime, String id) throws Exception{
		//DateTime 형식으로 변환
		SimpleDateFormat pformat = new SimpleDateFormat("yyyy년 M월 d일 a hh:mm:ss");
		Testresult tr = null;
		Date stime = null; Date etime = null;
		stime = pformat.parse(startTime);
		etime = pformat.parse(endTime);
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		startTime = format.format(stime);
		endTime = format.format(etime);
		Test test = new Test(startTime,endTime,id);
		//시간정보 입력(test 테이블 insert)
		tdao.insertTime(test);			
		//들고온 시험정보를 분류해줌 (tmp_num,q_num,user_sol)
		String[] tmp1 = stringList.split(",");
		String[] tmpNum = new String[tmp1.length];
		String[] qNum = new String[tmp1.length];
		String[] userSol = new String[tmp1.length];
		ArrayList<Integer> tmpList = new ArrayList<Integer>();
		for(int i = 0 ;i < tmp1.length;i++){
			if(i%3==0)
				tmpNum[i/3] = tmp1[i];
			else if(i%3==1){
				qNum[i/3] = tmp1[i];
				tmpList.add(Integer.parseInt(tmp1[i]));
			}
			else
				userSol[i/3] = tmp1[i];
			if(i!=0 && i%3==2){
				//Test_TestResult JOIN 객체 생성하여 필요한 값 집어넣기
				tr = new Testresult();
				tr.setQ_num(Integer.parseInt(qNum[i/3]));
				tr.setTest_tmp_num(Integer.parseInt(tmpNum[i/3]));
				tr.setUser_sol(Integer.parseInt(userSol[i/3]));
				tr.setTestStartTime(startTime);
				tr.setId(id);
				//시험결과에 입력
				tdao.insertTestRslt(tr);					
			}
			
		}
		tdao.updateSetCount(tmpList);

		int testNum = tdao.selectTestNum(test);
		test.setTestNum(testNum);
		ArrayList<Qobtr> list = tdao.selectCalcScore(testNum);
		CalcScore cs = new CalcScore();
		int score = cs.calculate(list);			
		test.setScore(score);
		tdao.updateScore(test);
		
		ArrayList<Integer> numList= cs.wrongList(list);

		tdao.updateWrongCount(numList);
		return testNum;
	}
	
	public HashMap<String, Object> testResult(String testNum) throws Exception{
		Test test = tdao.selectTestInfo(Integer.parseInt(testNum));
		ArrayList<Qobtr> list = new ArrayList<Qobtr>();
		list = tdao.selectAllTest(testNum);
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("test", test);
		map.put("list", list);
		return map;

	}
	
	public void insertWR(String memo2, String num2, String id) throws Exception{
				WrongNote wn  = new WrongNote();
				wn.setTest_rslt_num(Integer.parseInt(num2));
				wn.setWr_no_memo(memo2);
				wn.setId(id);
				System.out.println(wn.toString());
				tdao.insertWrongNote(wn);
	}
	public JSONObject getTAnswer(String qType,String qNum){
		String desc = null;
		String question = null;
		String solution = null;
		String exp = null;
		int point = 0;
		Obquestion obq = new Obquestion();
		Subquestion subq = new Subquestion();
		JSONObject jsonObj = new JSONObject();
		if(qType.equals("객관식")){
			obq = tdao.selectObAnswer(qNum);
			desc = obq.getOb_desc();
			question = obq.getQuestion();
			solution = obq.getOb_sol();
			exp  = obq.getQ_exp();
			if(obq.getCho1().endsWith("png")|| obq.getCho1().endsWith("PNG")){
				String q1 = "<img src='q_img/"+obq.getCho1()+"'>";
				String q2 = "<img src='q_img/"+obq.getCho2()+"'>";
				String q3 = "<img src='q_img/"+obq.getCho3()+"'>";
				String q4 = "<img src='q_img/"+obq.getCho4()+"'>";
				String q5 = "<img src='q_img/"+obq.getCho5()+"'>";
				jsonObj.put("q1",q1);	
				jsonObj.put("q2",q2);	
				jsonObj.put("q3",q3);	
				jsonObj.put("q4",q4);	
				jsonObj.put("q5",q5);
			}
			else{
				jsonObj.put("q1",obq.getCho1());	
				jsonObj.put("q2",obq.getCho2());	
				jsonObj.put("q3",obq.getCho3());	
				jsonObj.put("q4",obq.getCho4());	
				jsonObj.put("q5",obq.getCho5());				
			}
			point = obq.getPoint();
		}
		else{
			subq = tdao.selectSubAnswer(qNum);
			desc = subq.getSub_desc();
			question = subq.getQuestion();
			solution = subq.getSub_sol();
			exp = subq.getQ_exp();
			point = subq.getPoint();
		}
		jsonObj.put("question",question);
		jsonObj.put("desc", desc);
		jsonObj.put("solution",solution);
		jsonObj.put("exp", exp);
		jsonObj.put("point",point);
		return jsonObj;
	}

	public void addWrongNote(String qNum, String wrMemo, String id,	String userSol) {
		int q_num =0;
		if(wrMemo.equals("오답노트입력"))
			wrMemo="";
		try{
			q_num = Integer.parseInt(qNum);
		}catch(NumberFormatException e){
			e.printStackTrace();
		}
		ThmWrongNote wn = new ThmWrongNote();
		wn.setId(id);
		wn.setWr_no_memo(wrMemo);
		wn.setQ_num(q_num);
		wn.setUser_sol(userSol);
		tdao.insertThmWrongNote(wn);
	}

	public ArrayList<Test> getUserTest(String id) throws Exception {
		ArrayList<Test> list = new ArrayList<Test>();
		list = tdao.selectUserTest(id);
		return list;
	}
	public HashMap<String,Integer> selectTestInfo(String num) throws Exception{
		HashMap<String, Integer> map = tdao.selectUserStat(Integer.parseInt(num));
		return map;
	}
	public int getScorePrediction(String id) throws Exception{
		ArrayList<Test> list = getUserTest(id);
		ArrayList<HashMap<String,Integer>> aryList = new ArrayList<HashMap<String,Integer>>();
		for(int i = 0 ;i < list.size() ;i++){
			aryList.add(selectTestInfo(list.get(i).getTestNum().toString()));
		}
		int prediction = ScorePrediction.predictScore(aryList);
		
		return prediction;
	}
}
