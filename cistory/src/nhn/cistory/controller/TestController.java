package nhn.cistory.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import nhn.cistory.service.TestService;

import nhn.cistory.vo.Qobtr;
import nhn.cistory.vo.Test;

public class TestController{
	private TestService tService = new TestService();
	
	public TestController(){}
	
	public void theme(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String q_type = request.getParameter("q_type");
		String age = request.getParameter("age");
		String grade = request.getParameter("grade");
		
		/*if(q_type.equals("HONHAP"))	q_type=null;
		if(age.equals("HONHAP"))	age=null;
		if(grade.equals("HONHAP"))	grade=null;*/
		System.out.println("theme : "+q_type+" / "+age+" / "+grade);
		System.out.println("theme2 : "+q_type.length()+" / "+age.length()+" / "+grade.length());
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("q_type", q_type);
		map.put("age", age);
		map.put("grade", grade);

		ArrayList<HashMap<String, Object>> list = tService.getThmQList(map);
		
		if(q_type.equals("")) map.put("q_type", "혼합형");
		if(age.equals("")) map.put("age", "혼합형");
		if(grade.equals("")) map.put("grade", "혼합형");
		
		request.setAttribute("list", list);
		request.setAttribute("constMap", map);
		RequestDispatcher rd = request.getRequestDispatcher("themetest.jsp");
		rd.forward(request, response);
	}
	
	public void past(HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.getRequestDispatcher("selectgrade.jsp").forward(request, response);
	}
	public void pretheme(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.getRequestDispatcher("selecttheme.jsp").forward(request, response);
	}
	public void startTest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String grade = request.getParameter("grade");

		ArrayList<Integer> numList = tService.startTest(grade);
		
		request.setAttribute("numList", numList);
		RequestDispatcher rd = request.getRequestDispatcher("testpage.jsp");
		rd.forward(request, response);
	}
	public void getQuestion(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		int num =0;
		try{
			num = Integer.parseInt(request.getParameter("num"));
		}catch(NumberFormatException e){
			System.out.println("NUM값 오류");
		}
		JSONObject jsonObj =  tService.getQuestion(num);
		System.out.println(jsonObj);
		response.getWriter().print(jsonObj);

	}
	public void getTQuestion(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String qNum =null;
		String qType = null;
		qNum = request.getParameter("qNum");
		qType = request.getParameter("qType");
		JSONObject jsonObj = tService.getTQuestion(qNum, qType);
		//System.out.println(jsonObj.get("q1"));
		response.getWriter().print(jsonObj);

	}
	public void setTestResult(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String stringList = request.getParameter("list");
		String id = request.getParameter("id");
		String startTime = request.getParameter("stime");
		String endTime = request.getParameter("etime");
		int testNum = tService.setTestResult(stringList, endTime, startTime, id);
		response.getWriter().print(testNum);
	}
	public void testResult(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String testNum = request.getParameter("testNum");

		HashMap<String, Object> map = tService.testResult(testNum);
		
		request.setAttribute("list", map.get("list"));
		request.setAttribute("test", map.get("test"));
		RequestDispatcher rd = request.getRequestDispatcher("testresult.jsp");
		rd.forward(request, response);
	}
	
	public void insertWR(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String memo = request.getParameter("wr_no_memo");
		String num = request.getParameter("rutNum");
		String id = request.getParameter("id");
		System.out.println(num);
		try{
			tService.insertWR(memo, num, id);
			response.getWriter().print(1);
		}catch(Exception e){
			response.getWriter().print(0);
		}
		
	}
	public void getTAnswer(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String qNum = request.getParameter("qNum");
		String qType = request.getParameter("qType");
		JSONObject jsonObj = tService.getTAnswer(qType, qNum);
		response.getWriter().print(jsonObj);
	}
	public void addWrongNote(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String qNum = request.getParameter("qNum");
		String wrMemo = request.getParameter("wrMemo");
		String id = request.getParameter("id");
		String userSol = request.getParameter("userSol");
		tService.addWrongNote(qNum,wrMemo,id,userSol);

		response.getWriter().print(new JSONObject());
	}
	
	public void getUserTest(HttpServletRequest request,	HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String id = request.getParameter("id");
		System.out.println(id);
		ArrayList<Test> list = tService.getUserTest(id);
		request.setAttribute("list", list);
		RequestDispatcher rd = request.getRequestDispatcher("myPage.jsp");
		rd.forward(request, response);
	}

	public void getOneTest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String testNum = request.getParameter("testNum");
		System.out.println(testNum);
		HashMap<String,Integer> map  = tService.selectTestInfo(testNum);
		JSONObject obj = new JSONObject();
		obj.putAll(map);
		response.getWriter().print(obj);
	}
	
	public void getUserPredict(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String id = request.getParameter("id");
		int result = tService.getScorePrediction(id);
		JSONObject obj = new JSONObject();
		obj.put("pred", result);
		response.getWriter().print(obj);
	}
}
