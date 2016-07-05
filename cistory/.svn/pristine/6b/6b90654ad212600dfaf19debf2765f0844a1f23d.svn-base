package nhn.cistory.controller;

import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSON;
import net.sf.json.JSONObject;
import nhn.cistory.service.HistoryService;
import nhn.cistory.vo.History;
import nhn.cistory.vo.MyNote;

public class HistoryController {
	private HistoryService hService = new HistoryService();

	public void timeLine(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.sendRedirect("timeline.jsp");
	}
	public void getQuiz(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String num = request.getParameter("num");
		System.out.println(num);
		JSONObject jsonObj = hService.selectQuiz(num);
		response.getWriter().print(jsonObj);

	}

	public void getTimeline(HttpServletRequest request,	HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String age = request.getParameter("age");
		System.out.println(age);
		JSON jsonObj = hService.getTimeline(age);
		System.out.println(jsonObj.toString());
		response.setContentType("application/json");
		response.getWriter().println(jsonObj);
	}
	
	public void getCategory(HttpServletRequest request,HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String strText = request.getParameter("strText");
		ArrayList<String> list = hService.getCategory(strText);
		request.setAttribute("list", list);
		RequestDispatcher rd = request.getRequestDispatcher("ctgList.jsp");
		rd.forward(request, response);
	}
	
	public void searchCtg(HttpServletRequest request,HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String keyword = request.getParameter("keyword");
		System.out.println(keyword);
		JSONObject jsonO = hService.searchCtg(keyword);
		response.getWriter().print(jsonO);
	}

	public void addMyNote(HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String htrNum = request.getParameter("htrNum");
		String id = request.getParameter("id");
		String myMemo = request.getParameter("myMemo");
		hService.insertMyNote(htrNum,id,myMemo);
		response.getWriter().print("");
	}
	public void quiz(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.getRequestDispatcher("quiz.jsp").forward(request, response);
	}
	public void searchCtgList(HttpServletRequest request,HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		String keyword = request.getParameter("keyword");
		JSONObject json = hService.searchCtgList(keyword);
		response.getWriter().print(json);
		
	}
	public void delNote(HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		String num = request.getParameter("num");
		int myNoNum = Integer.parseInt(num);
		
		hService.delMyNote(myNoNum);
		response.sendRedirect("myNote.cis");
		
	}
	
	
}
