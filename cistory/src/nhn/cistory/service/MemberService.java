package nhn.cistory.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import nhn.cistory.dao.MemberDao;
import nhn.cistory.dao.TestDao;
import nhn.cistory.vo.Member;
import nhn.cistory.vo.MyNote;
import nhn.cistory.vo.Obquestion;
import nhn.cistory.vo.Question;
import nhn.cistory.vo.Subquestion;
import nhn.cistory.vo.ThmWrongNote;
import nhn.cistory.vo.WrongNote;

public class MemberService {
	MemberDao dao = new MemberDao();
	
	public MemberService(){	}
	
	public Member login(Member memberInfo) throws Exception{
		 Member member = dao.login(memberInfo);
		 return member;
	}
	
	public void join(String id, String password, String name, String nickName, String grade, String email1, String email2) throws Exception{
		Member memberInfo = new Member();
		String email = email1 + "@";
		
		switch(Integer.parseInt(email2)){
			case 1: email+="naver.com"; break;
			case 2: email+="hanmail.net"; break;
			case 3: email+="google.co.kr"; break;
			case 4: email+="yahoo.com"; break;
			case 5: email+="nate.com"; break;
			case 6: email+="dreamwiz.com"; break;
			case 7: email+="empal.com"; break;
			case 8: email+="gmail.com"; break;
			case 9: email+="korea.com";
		}
		
		memberInfo.setId(id);
		memberInfo.setPassword(password);
		memberInfo.setName(name);
		memberInfo.setNickname(nickName);
		memberInfo.setGrade(grade);
		memberInfo.setEmail(email);
		
		dao.join(memberInfo);
	}
	
	public String idCheck(String idInfo) throws Exception{
		String id = dao.idCheck(idInfo);
		return id;
	}
	
	
	public JSONObject idCheck(HttpServletResponse response, String idInfo) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		
		String id = null;
		
		id = new MemberDao().idCheck(idInfo);
		
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("checkedId", id);

		return jsonObj;
	}
	
	public void modifyMember(String id, String password, String name, String nickName, String email1, String email2) throws Exception{
		Member memberInfo = new Member();
		String email = email1 + "@";
		
		switch(Integer.parseInt(email2)){
			case 1: email+="naver.com"; break;
			case 2: email+="hanmail.net"; break;
			case 3: email+="google.co.kr"; break;
			case 4: email+="yahoo.com"; break;
			case 5: email+="nate.com"; break;
			case 6: email+="dreamwiz.com"; break;
			case 7: email+="empal.com"; break;
			case 8: email+="gmail.com"; break;
			case 9: email+="korea.com";
		}
		
		memberInfo.setId(id);
		memberInfo.setPassword(password);
		memberInfo.setName(name);
		memberInfo.setNickname(nickName);
		memberInfo.setEmail(email);
		
		dao.modify(memberInfo);
	}
	
	public void dropMember(String idInfo) throws Exception{
		dao.drop(idInfo);
	}
	
	public ArrayList<MyNote> getMyNote(String idInfo) throws Exception{
		return dao.getMyNote(idInfo);
	}
	
	/*public JSONObject changeMyNote(HttpServletResponse response, int my_no_num){
		response.setContentType("text/html;charset=UTF-8");
		
		MyNote myNotePage = new MemberDao().getMyNotePage(my_no_num);
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("htr_keyrd",myNotePage.getHtr_keyrd());
		jsonObj.put("htr_imguri",myNotePage.getHtr_imguri());
		jsonObj.put("htr_desc",myNotePage.getHtr_desc());
		jsonObj.put("htr_tag",myNotePage.getHtr_tag());
		jsonObj.put("htr_type",myNotePage.getHtr_type());
		jsonObj.put("htr_age",myNotePage.getHtr_age());
		jsonObj.put("my_no_num",myNotePage.getMy_no_num());
		jsonObj.put("my_no_memo",myNotePage.getMy_no_memo());
		
		return jsonObj;
	}*/
	
	public ArrayList<HashMap<String, Object>> getWrongNoteList(String idInfo, int start, int perPage) throws Exception{
		ArrayList<WrongNote> wrongNotePageList = null;
		ArrayList<Obquestion> obList = null;
		ArrayList<Integer> qNumList = null;
		ArrayList<HashMap<String, Object>> wrongNoteList = new ArrayList<HashMap<String, Object>>();
		HashMap<String, Object> wrongNoteMap = null;
		
		int i = 0;
		int test_num = 0;
		
		wrongNotePageList = dao.getWrongNote(idInfo,start,perPage);
		for(i=0; i<wrongNotePageList.size(); i++){
			if(test_num == wrongNotePageList.get(i).getTestNum())
				continue;
			test_num = wrongNotePageList.get(i).getTestNum();
			qNumList = new ArrayList<Integer>();
			qNumList.add(wrongNotePageList.get(i).getQ_num());
			obList = new TestDao().getObquestions(qNumList);
			wrongNoteMap = new HashMap<String, Object>();
			wrongNoteMap.put("test_num", test_num);
			wrongNoteMap.put("grade", obList.get(0).getGrade());
			wrongNoteMap.put("wrongCnt", new TestDao().getWrongCnt(test_num));
			wrongNoteMap.put("score", wrongNotePageList.get(i).getScore());
			wrongNoteMap.put("testDate", wrongNotePageList.get(i).getTestStartTime().substring(0, 10));
			wrongNoteMap.put("pageCnt", new TestDao().getWrongNoteCnt(test_num));			
			wrongNoteList.add(wrongNoteMap);
		}
		return wrongNoteList;
	}
	
	public ArrayList<WrongNote> getWrongNotePage(String idInfo, String test_num) throws Exception{
		ArrayList<WrongNote> wrongNotePageList = null;
		ArrayList<WrongNote> wrongNotePage = new ArrayList<WrongNote>();
		
		int testNum = Integer.parseInt(test_num);
		
		wrongNotePageList = dao.getWrongNote(idInfo,0,0);
		
		for(int i=0; i<wrongNotePageList.size(); i++){
			if(wrongNotePageList.get(i).getTestNum() == testNum)
				wrongNotePage.add(wrongNotePageList.get(i));
		}
		
		return wrongNotePage;
	}
	
	public ArrayList<Obquestion> getObList(ArrayList<WrongNote> wrongNotePage) throws Exception{
		ArrayList<Integer> qNumList = new ArrayList<Integer>();
		ArrayList<Obquestion> obList = null;
		
		for(int i=0; i<wrongNotePage.size(); i++){
			qNumList.add(wrongNotePage.get(i).getQ_num());				
		}

		obList = new TestDao().getObquestions(qNumList);
		
		return obList;
	}
	
	public int modifyWrongNote(String test_num, String wr_no_num, String wr_no_memo) throws Exception{
		int wrNoNum = Integer.parseInt(wr_no_num);
		int testNum = Integer.parseInt(test_num);

		WrongNote wrongNoteInfo = new WrongNote();
		wrongNoteInfo.setWr_no_num(wrNoNum);
		wrongNoteInfo.setWr_no_memo(wr_no_memo);

		dao.modifyWrongNote(wrongNoteInfo);
		
		return testNum;
	}
	
	public int deleteWrongNote(String test_num, String wr_no_num) throws Exception{
		int wrNoNum = Integer.parseInt(wr_no_num);
		int testNum = Integer.parseInt(test_num);

		dao.deleteWrongNote(wrNoNum);
		
		return testNum;
	}
	
	public ArrayList<HashMap<String,Object>> getThmWrongNotePage(String idInfo, String grade, String q_type, String age) throws Exception{
		ArrayList<ThmWrongNote> thmWrongNotePageList = new ArrayList<ThmWrongNote>();
		ArrayList<HashMap<String,Object>> thmWrongNotePage = new ArrayList<HashMap<String,Object>>();
		ArrayList<Integer> obQNumList = new ArrayList<Integer>();
		ArrayList<Integer> subQNumList = new ArrayList<Integer>();
		ArrayList<Obquestion> obList = null;
		ArrayList<Subquestion> subList = null;
		HashMap<String, Object> thmWrongNoteMap = null;
		ThmWrongNote noteInfo = new ThmWrongNote();
		
		int i = 0;
		int obCnt = 0;
		int subCnt = 0;
		
		noteInfo.setId(idInfo);
		noteInfo.setGrade(grade);
		noteInfo.setQ_type(q_type);
		noteInfo.setAge(age);

		thmWrongNotePageList = dao.getThmWrongNote(noteInfo);
		
		for(i=0; i<thmWrongNotePageList.size(); i++){
			if(thmWrongNotePageList.get(i).getQ_type().equals("객관식")){
				obQNumList.add(thmWrongNotePageList.get(i).getQ_num());
			}else{
				subQNumList.add(thmWrongNotePageList.get(i).getQ_num());
			}
		}

		obList = new TestDao().getObquestions(obQNumList);
		subList = new TestDao().getSubquestions(subQNumList);
		
		for(i=0; i<thmWrongNotePageList.size(); i++){
			thmWrongNoteMap = new HashMap<String,Object>();
			thmWrongNoteMap.put("thmWrongNote", thmWrongNotePageList.get(i));
			if(thmWrongNotePageList.get(i).getQ_type().equals("객관식")){
				thmWrongNoteMap.put("question", obList.get(obCnt));
				obCnt++;
			}else{
				thmWrongNoteMap.put("question", subList.get(subCnt));
				subCnt++;
			}
			thmWrongNotePage.add(thmWrongNoteMap);
		}
		
		return thmWrongNotePage;
	}
	
	public void modifyThmWrongNote(String wr_no_num, String wr_no_memo) throws Exception{
		ThmWrongNote thmWrongNoteInfo = new ThmWrongNote();
		int wrNoNum = Integer.parseInt(wr_no_num);

		thmWrongNoteInfo.setWr_no_num(wrNoNum);
		thmWrongNoteInfo.setWr_no_memo(wr_no_memo);

		dao.modifyThmWrongNote(thmWrongNoteInfo);
	}
	
	public void deleteThmWrongNote(String wr_no_num) throws Exception{
		int wrNoNum = Integer.parseInt(wr_no_num);
		
		dao.deleteThmWrongNote(wrNoNum);
	}
	
	public JSONObject getRecQuestion(Question qInfo) throws Exception{
		ArrayList<Obquestion> recList = dao.getRecQuestion(qInfo);
		int recMax = 4;
		
		recMax = recList.size()<5?recList.size():recMax;

		String q_exp[] = new String[2];
		JSONArray jsonList = new JSONArray();
		JSONObject obj = null;
		JSONObject jsonObj = new JSONObject();
		
		for(int i=0; i<recMax; i++){
			obj = new JSONObject();
			obj.put("question", recList.get(i).getQuestion());
			obj.put("ob_desc", "<img src=\"q_img/"+recList.get(i).getOb_desc()+"\">");
			if(recList.get(i).getCho1().contains(".png")){
				obj.put("cho1", "<img src=\"q_img/"+recList.get(i).getCho1()+"\">");
				obj.put("cho2", "<img src=\"q_img/"+recList.get(i).getCho2()+"\">");
				obj.put("cho3", "<img src=\"q_img/"+recList.get(i).getCho3()+"\">");
				obj.put("cho4", "<img src=\"q_img/"+recList.get(i).getCho4()+"\">");
				obj.put("cho5", "<img src=\"q_img/"+recList.get(i).getCho5()+"\">");
			}else{
				obj.put("cho1", recList.get(i).getCho1());
				obj.put("cho2", recList.get(i).getCho2());
				obj.put("cho3", recList.get(i).getCho3());
				obj.put("cho4", recList.get(i).getCho4());
				obj.put("cho5", recList.get(i).getCho5());
			}
			obj.put("ob_sol", recList.get(i).getOb_sol());
			q_exp = recList.get(i).getQ_exp().split("<오답분석>");

			if(q_exp.length==2){
				obj.put("q_exp", q_exp[0]+"<br><오답분석>"+q_exp[1]);
			}else{
				obj.put("q_exp", q_exp[0]);
			}
			
			jsonList.add(obj);
		}

		jsonObj.put("recList", jsonList);
		
		return jsonObj;
	}

	public int getWrongNoteTotal(String id) throws Exception{
		ArrayList<WrongNote> total=null;
		total = dao.getWrongNote(id, 0, 0);
		return total.size();
	}
}
