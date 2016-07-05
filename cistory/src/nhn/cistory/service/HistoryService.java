package nhn.cistory.service;

import java.util.ArrayList;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import nhn.cistory.dao.HistoryDao;
import nhn.cistory.util.CreateHistoryJSon;
import nhn.cistory.util.HangulChosungSearch;
import nhn.cistory.vo.History;
import nhn.cistory.vo.MyNote;
import nhn.cistory.vo.Quiz;

public class HistoryService {

	private HistoryDao hDao = new HistoryDao();
	public JSONObject selectQuiz(String num) throws Exception{
		Quiz quiz = hDao.getQuiz(Integer.parseInt(num));
		System.out.println(quiz.toString());
		JSONObject jsonObj = new JSONObject();
		System.out.println(quiz);
		jsonObj.put("hNum", quiz.getHtr_num());
		jsonObj.put("quiz", quiz.getQuiz());
		jsonObj.put("solution", quiz.getQuiz_sol());
		jsonObj.put("desc", quiz.getQuiz_desc());
		jsonObj.put("keyword", quiz.getHtr_keyrd());
		System.out.println(jsonObj.toString());
		return jsonObj;
	}
	public JSONObject getTimeline(String age) throws Exception{
		ArrayList<History> list = hDao.selectTimeline(age);
		CreateHistoryJSon cJson = new CreateHistoryJSon();
		JSONArray jsonArray = (JSONArray) cJson.getJson(list);
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("type", "default");
		jsonObj.put("date", jsonArray);
		JSONObject jObj = new JSONObject();
		
		jObj.put("timeline", jsonObj);
		return jObj;
	}
	public ArrayList<String> getCategory(String strText) throws Exception{
		ArrayList<String> resList = new ArrayList<String>();
		ArrayList<History> list = hDao.selectCategory(null);
		for(int i = 0 ;i < list.size() ; i++){
			resList.add(list.get(i).getHtr_keyrd());
		}
		return resList;
	}
	public JSONObject searchCtg(String keyword) throws Exception{
		try{
			History htr = hDao.selectCategory(keyword).get(0);
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("age", htr.getHtr_age());
			jsonObj.put("date", htr.getHtr_date());
			jsonObj.put("url",htr.getHtr_imguri());
			jsonObj.put("keyword",htr.getHtr_keyrd());
			jsonObj.put("desc",htr.getHtr_desc());
			jsonObj.put("tag", htr.getHtr_tag());
			jsonObj.put("type", htr.getHtr_type());
			return jsonObj;
		}catch(Exception e){
			return null;
		}			

	}
	public void insertMyNote(String htrNum, String id, String myMemo) throws Exception{
			MyNote mn = new MyNote();
			mn.setHtr_num(Integer.parseInt(htrNum));
			mn.setId(id);
			mn.setMy_no_memo(myMemo);
			hDao.insertMyNote(mn);
	}
	public JSONObject searchCtgList(String keyword) throws Exception{
		ArrayList<String> list = hDao.selectCategoryList(keyword);
		if(list==null||list.size()==0)
			return null;
		JSONObject jsonObj = new JSONObject();
		JSONArray array = new JSONArray();
		array.addAll(list);
		jsonObj.put("list",array);
		System.out.println(jsonObj);
		return jsonObj;
	}
	public void delMyNote(int myNoNum) throws Exception{
		hDao.delMyNote(myNoNum);
	}	

}
