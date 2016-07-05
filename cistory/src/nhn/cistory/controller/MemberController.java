package nhn.cistory.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import nhn.cistory.dao.MemberDao;
import nhn.cistory.dao.TestDao;
import nhn.cistory.service.MemberService;
import nhn.cistory.service.TestService;
import nhn.cistory.util.PageNavigator;
import nhn.cistory.vo.Board;
import nhn.cistory.vo.Member;
import nhn.cistory.vo.MyNote;
import nhn.cistory.vo.Obquestion;
import nhn.cistory.vo.Question;
import nhn.cistory.vo.Subquestion;
import nhn.cistory.vo.ThmWrongNote;
import nhn.cistory.vo.WrongNote;

public class MemberController {
	//private TestService tService = new TestService();
	private MemberService mService = new MemberService();
	HttpSession session = null;
	
	public MemberController(){}
	
	//인덱스 페이지로
	public void index(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
	//로그인
	public void login(HttpServletRequest request, HttpServletResponse response) throws Exception {
		session = request.getSession();
		if(session.getAttribute("member")==null){
			Member memberInfo = new Member();
			String id = request.getParameter("id");
			String password = request.getParameter("password");
			memberInfo.setId(id);
			memberInfo.setPassword(password);
			Member member = mService.login(memberInfo);
			if(member == null){
				response.sendRedirect("index.cis");
				return;
			}
			session.setAttribute("member", member);
			session.setMaxInactiveInterval(3*60*60);
		}
		request.getRequestDispatcher("memberView.jsp").forward(request, response);
	}
	//로그아웃
	public void logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		session = request.getSession();
		session.invalidate();
		response.sendRedirect("index.cis");
	}
	//회원가입 폼으로
	public void joinForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.getRequestDispatcher("joinForm.jsp").forward(request, response);
	}
	//회원가입
	public void join(HttpServletRequest request, HttpServletResponse response) throws Exception {
		/*request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;UTF-8");*/
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String nickName = request.getParameter("nickName");
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		String grade = "기본";
		PrintWriter out = response.getWriter();
		
		mService.join(id, password, name, nickName, grade, email1, email2);
		
		out.println("<script language=\"javascript\">");
		out.println("alert('가입 완료!');");
		out.println("location.href=\"index.cis\"");
		out.println("</script>");	
	}
	//아이디 중복 확인 폼으로
	public void idCheckForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.getRequestDispatcher("idCheckForm.jsp").forward(request, response);
	}
	//아이디 중복 확인
	public void idCheck(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String idInfo = request.getParameter("id");
		String onCheckForm = request.getParameter("onCheckForm");
		
		if(onCheckForm == null){
			JSONObject jsonObj = mService.idCheck(response, idInfo);
			response.getWriter().print(jsonObj);
		}else if(onCheckForm.equals("yes")){
			PrintWriter out = response.getWriter();
			String id = mService.idCheck(idInfo);
			
			out.println("<script language=\"javascript\">");
			if(id == null){
				out.println("location.href=\"idCheckForm.cis?overlap=no&id=" + idInfo + "\"");
			}else{
				out.println("location.href=\"idCheckForm.cis?overlap=yes&id=" + id + "\"");
			}
			out.println("</script>");
		}
	}
	//마이페이지로
	public void myPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.getRequestDispatcher("getUserTest.cis").forward(request, response);
	}
	//회원 정보 수정 폼으로
	public void modifyMemberForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.getRequestDispatcher("modifyMemberForm.jsp").forward(request, response);
	}
	//회원 정보 수정
	public void modifyMember(HttpServletRequest request, HttpServletResponse response) throws Exception {
		session = request.getSession();
		String id = ((Member)session.getAttribute("member")).getId();
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String nickName = request.getParameter("nickName");
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		//String email = request.getParameter("email1") + "@";
		mService.modifyMember(id, password, name, nickName, email1, email2);
		/*try{				
			switch(Integer.parseInt(request.getParameter("email2"))){
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
		}catch(NumberFormatException e){
			e.printStackTrace();
		}*/
		/*Member memberInfo = new Member();
		memberInfo.setId(id);
		memberInfo.setPassword(password);
		memberInfo.setName(name);
		memberInfo.setNickname(nickName);
		memberInfo.setEmail(email);
		
		dao.modify(memberInfo);*/
		request.getRequestDispatcher("myPage.cis").forward(request, response);
	}
	//회원 탈퇴
	public void dropMember(HttpServletRequest request, HttpServletResponse response) throws Exception {
		session = request.getSession();
		String idInfo = ((Member)session.getAttribute("member")).getId();
		session.invalidate();
		mService.dropMember(idInfo);
		
		response.sendRedirect("index.cis");
	}
	//나만의 노트
	public void myNote(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ArrayList<MyNote> myNoteList = null;
		session = request.getSession();
		String idInfo = ((Member) session.getAttribute("member")).getId();
		
		myNoteList = mService.getMyNote(idInfo);
		
		request.setAttribute("myNoteList", myNoteList);
		request.getRequestDispatcher("myNote.jsp").forward(request, response);
	}
	//나만의 노트 썸네일 선택(필요없나..ㅠㅠ)
	/*public void changeMyNote(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int my_no_num = Integer.parseInt(request.getParameter("my_no_num"));
		
		JSONObject jsonObj = mService.changeMyNote(response, my_no_num);
		
		response.getWriter().print(jsonObj);

	}*/
	//오답 노트
	public void wrongNote(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ArrayList<HashMap<String, Object>> wrongNoteList = null;
		int intPage = 1;
		session = request.getSession();
		if(session.getAttribute("member") == null){
			response.sendRedirect("loginCheck.jsp");
			return;
		}
		String idInfo = ((Member) session.getAttribute("member")).getId();
		
		if(idInfo == null){
			response.sendRedirect("loginCheck.jsp");
		}
		String page = request.getParameter("page");
		try{
			intPage = Integer.parseInt(page);
		}catch(Exception e){
			intPage = 1;
		}

		int countPerPage = 5;
		int currentPage = intPage;
		int pagePerGroup = 5;
		int total=0;

		PageNavigator navi=null;
     	total = mService.getWrongNoteTotal(idInfo);
		navi = new PageNavigator(countPerPage, pagePerGroup, currentPage, total);

		wrongNoteList = mService.getWrongNoteList(idInfo,navi.getStartRecord(), navi.getCountPerPage());
		request.setAttribute("navi", navi ); 
		request.setAttribute("wrongNoteList", wrongNoteList);
		request.getRequestDispatcher("wrongNote.jsp").forward(request, response);
	}
	//오답 노트 페이지
	public void wrongNotePage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ArrayList<WrongNote> wrongNotePage = new ArrayList<WrongNote>();
		ArrayList<Obquestion> obList = null;
		
		session = request.getSession();
		String idInfo = ((Member) session.getAttribute("member")).getId();
		String test_num = request.getParameter("test_num");
		
		wrongNotePage = mService.getWrongNotePage(idInfo, test_num);
		
		obList = mService.getObList(wrongNotePage);
		
		request.setAttribute("wrongNotePage", wrongNotePage);
		request.setAttribute("obList", obList);
		request.getRequestDispatcher("wrongNotePage.jsp").forward(request, response);
	}
	//오답 노트 수정
	public void modifyWrongNote(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String test_num = request.getParameter("test_num");
		String wr_no_num = request.getParameter("wr_no_num");
		String wr_no_memo = request.getParameter("wr_no_memo");

		//오답 노트 수정하고 testNum을 int형으로 변환 후 반환
		int testNum = mService.modifyWrongNote(test_num, wr_no_num, wr_no_memo);
		
		response.sendRedirect("wrongNotePage.cis?test_num=" + testNum);
	}
	//오답 노트 삭제
	public void deleteWrongNote(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String test_num = request.getParameter("test_num");
		String wr_no_num = request.getParameter("wr_no_num");
	
		//오답 노트 삭제하고 testNum을 int형으로 변환 후 반환
		int testNum = mService.deleteWrongNote(test_num, wr_no_num);
		
		response.sendRedirect("wrongNotePage.cis?test_num=" + testNum);
	}
	//테마 오답 노트
	public void thmWrongNote(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;UTF-8");
		ArrayList<HashMap<String,Object>> thmWrongNotePage = new ArrayList<HashMap<String,Object>>();

		session = request.getSession();
		String idInfo = ((Member) session.getAttribute("member")).getId();
		String grade = new String(URLDecoder.decode(request.getParameter("grade"), "UTF-8"));
		String q_type = new String(URLDecoder.decode(request.getParameter("q_type"), "UTF-8"));
		String age = new String(URLDecoder.decode(request.getParameter("age"), "UTF-8"));
		
		thmWrongNotePage = mService.getThmWrongNotePage(idInfo, grade, q_type, age);
				
		request.setAttribute("thmWrongNotePage", thmWrongNotePage);
		request.getRequestDispatcher("thmWrongNote.jsp").forward(request, response);
	}
	//테마 오답 노트 수정
	public void modifyThmWrongNote(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String wr_no_num = request.getParameter("wr_no_num");
		String wr_no_memo = request.getParameter("wr_no_memo");
		
		mService.modifyThmWrongNote(wr_no_num, wr_no_memo);
		
		response.sendRedirect("thmWrongNote.cis?grade=&q_type=&age=");
	}
	//테마 오답 노트 삭제
	public void deleteThmWrongNote(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String wr_no_num = request.getParameter("wr_no_num");

		mService.deleteThmWrongNote(wr_no_num);
		
		response.sendRedirect("thmWrongNote.cis?grade=&q_type=&age=");
	}
	//오답노트에서 추천 문제 반환
	public void getRecQuestion(HttpServletRequest request, HttpServletResponse response) throws Exception {		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;UTF-8");

		Question qInfo = new Question();
		qInfo.setQ_num(Integer.parseInt(request.getParameter("q_num")));
		qInfo.setAge(request.getParameter("age"));

		JSONObject jsonObj = mService.getRecQuestion(qInfo);

		response.getWriter().print(jsonObj);
	}
	//
	public void gIndex(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.getRequestDispatcher("guestView.jsp").forward(request, response);
	}
}
