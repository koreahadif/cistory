package nhn.cistory.controller;

import java.net.URLDecoder;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import nhn.cistory.service.AdminService;
import nhn.cistory.service.MemberService;
import nhn.cistory.util.PageNavigator;
import nhn.cistory.vo.History;
import nhn.cistory.vo.Member;
import nhn.cistory.vo.Obquestion;
import nhn.cistory.vo.Quiz;
import nhn.cistory.vo.Subquestion;

public class AdminController {
	private AdminService aService = new AdminService();
	HttpSession session = null;
	
	public AdminController(){}
	
	//관리자 인덱스
	public void adminIndex(HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.getRequestDispatcher("adminIndex.jsp").forward(request, response);
	}
	
	//관리자 로그인
	public void adminLogin(HttpServletRequest request, HttpServletResponse response) throws Exception{
		session = request.getSession();
		
		Member adminInfo = new Member();
		String id = request.getParameter("id");
		String password = request.getParameter("password");
			
		adminInfo.setId(id);
		adminInfo.setPassword(password);
		Member admin = new MemberService().login(adminInfo);
		System.out.println(admin);
		if(admin == null){
			request.getRequestDispatcher("adminIndex.jsp").forward(request, response);
		}else if(admin.getGrade().equals("관리자")){
			session.setMaxInactiveInterval(3*60*60);
			session.setAttribute("member", admin);
			response.sendRedirect("adminPage.cis");
		}else{
			request.getRequestDispatcher("adminIndex.jsp").forward(request, response);
		}
	}
	//관리자 페이지로
	public void adminPage(HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.getRequestDispatcher("adminPage.jsp").forward(request, response);
	}
	//회원 관리 페이지
	public void adminMember(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ArrayList<Member> memberList = null;
		int intPage=1;
		int total= 0;
		int countPerPage = 10;
		int pagePerGroup = 5;
		String page = request.getParameter("page");
		try{
			intPage = Integer.parseInt(page);
		}catch(Exception e){
			intPage = 1;
		}
		int currentPage = intPage;
		PageNavigator navi=null;

		total=aService.getMemberTotal();
		navi = new PageNavigator(countPerPage, pagePerGroup, currentPage, total);
		memberList = aService.getAllMember(navi.getStartRecord(), navi.getCountPerPage());		
		request.setAttribute("memberList", memberList);
		request.setAttribute("navi", navi);
		request.getRequestDispatcher("adminMember.jsp").forward(request, response);
	}
	//회원 등급 관리
	public void modifyMemberGrade(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String idInfo = request.getParameter("id");
		String grade = new String(URLDecoder.decode(request.getParameter("grade"), "UTF-8"));
		
		aService.modifyGrade(idInfo, grade);
		response.sendRedirect("adminMember.cis");
	}
	//회원 탈퇴 관리
	public void deleteMember(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String idInfo = request.getParameter("id");
		
		aService.deleteMember(idInfo);
		response.sendRedirect("adminMember.cis");
	}
	//문제 관리 페이지로
	public void adminQuestion(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ArrayList<Obquestion> obList = null;
		ArrayList<Subquestion> subList = null;
		ArrayList<Quiz> quizList = null;
		ArrayList<History> htrList = aService.getAllHistory(0,0);
		PageNavigator obNavi=null;
		PageNavigator subNavi=null;
		PageNavigator quizNavi=null;

		int intPage=1;
		int countPerPage = 10;
		int pagePerGroup = 10;
		
		String obPage = request.getParameter("obPage");
		String subPage = request.getParameter("subPage");
		String quizPage = request.getParameter("quizPage");
		
		int obTotal= 0;	
		try{ intPage = Integer.parseInt(obPage); }
			catch(Exception e){	intPage = 1; }
		int currentPage = intPage;
		
		obTotal = aService.getObTotal();
		obNavi = new PageNavigator(countPerPage, pagePerGroup, currentPage, obTotal);
		obList = aService.getAllObquestion(obNavi.getStartRecord(), obNavi.getCountPerPage());

		int subTotal= 0;
		
		try{ intPage = Integer.parseInt(subPage); }
			catch(Exception e){	intPage = 1; }
		int subCurrentPage = intPage;
		
		subTotal = aService.getSubTotal();
		subNavi = new PageNavigator(countPerPage, pagePerGroup, subCurrentPage, subTotal);
		subList = aService.getAllSubquestion(subNavi.getStartRecord(), subNavi.getCountPerPage());

		int quizTotal= 0;
		
		try{ intPage = Integer.parseInt(quizPage); }
			catch(Exception e){	intPage = 1; }
		int quizCurrentPage = intPage;
		
		quizTotal = aService.getQuizTotal();
		quizNavi = new PageNavigator(countPerPage, pagePerGroup, quizCurrentPage, quizTotal);
		quizList = aService.getAllQuiz(quizNavi.getStartRecord(), quizNavi.getCountPerPage());
		
		request.setAttribute("obList", obList);
		request.setAttribute("obNavi", obNavi);
		request.setAttribute("subList", subList);
		request.setAttribute("subNavi", subNavi);
		request.setAttribute("quizList", quizList);
		request.setAttribute("quizNavi", quizNavi);
		request.setAttribute("htrList", htrList);
		request.getRequestDispatcher("adminQuestion.jsp").forward(request, response);
	}
	//객관식 문제 입력
	public void insertOb(HttpServletRequest request, HttpServletResponse response, String filepath) throws Exception {
		int sizeLimit = 5*1024*1024;
		MultipartRequest multi = new MultipartRequest(request, filepath, sizeLimit
													, "utf-8", new DefaultFileRenamePolicy());
		Obquestion obInfo = new Obquestion();
		String q_exp = null;
		obInfo.setQuestion(multi.getParameter("obQuestion"));
		obInfo.setOb_desc(multi.getFilesystemName("ob_descImgIn"));
		if(multi.getFilesystemName("cho1ImgIn")!=null){
			obInfo.setCho1(multi.getFilesystemName("cho1ImgIn"));
		}else{
			obInfo.setCho1(multi.getParameter("cho1In"));
		}
		if(multi.getFilesystemName("cho2ImgIn")!=null){
			obInfo.setCho2(multi.getFilesystemName("cho2ImgIn"));
		}else{
			obInfo.setCho2(multi.getParameter("cho2In"));
		}
		if(multi.getFilesystemName("cho3ImgIn")!=null){
			obInfo.setCho3(multi.getFilesystemName("cho3ImgIn"));
		}else{
			obInfo.setCho3(multi.getParameter("cho3In"));
		}
		if(multi.getFilesystemName("cho4ImgIn")!=null){
			obInfo.setCho4(multi.getFilesystemName("cho4ImgIn"));
		}else{
			obInfo.setCho4(multi.getParameter("cho4In"));
		}
		if(multi.getFilesystemName("cho5ImgIn")!=null){
			obInfo.setCho5(multi.getFilesystemName("cho5ImgIn"));
		}else{
			obInfo.setCho5(multi.getParameter("cho5In"));
		}
		obInfo.setOb_sol(multi.getParameter("ob_sol"));
		if(multi.getParameter("obQ_exp").contains("\r\n")){
			q_exp = multi.getParameter("obQ_exp");
			q_exp = q_exp.replaceAll("\r\n", "\n");
			obInfo.setQ_exp(q_exp);
		}else{
			obInfo.setQ_exp(multi.getParameter("obQ_exp"));
		}
		obInfo.setPoint(Integer.parseInt(multi.getParameter("obPoint")));
		obInfo.setAge(multi.getParameter("obAge"));
		obInfo.setGrade(multi.getParameter("obGrade"));
		System.out.println(obInfo.getQ_exp());
		aService.insertObquestion(obInfo);
		response.sendRedirect("adminQuestion.cis");
	}
	//객관식 문제 수정
	public void modifyOb(HttpServletRequest request, HttpServletResponse response, String filepath) throws Exception {
		int sizeLimit = 5*1024*1024;
		MultipartRequest multi = new MultipartRequest(request, filepath, sizeLimit
													, "utf-8", new DefaultFileRenamePolicy());
		Obquestion obInfo = new Obquestion();
		String q_exp = null;
		obInfo.setQ_num(Integer.parseInt(multi.getParameter("obQ_num")));
		obInfo.setQuestion(multi.getParameter("obQuestion"));
		obInfo.setOb_desc(multi.getFilesystemName("ob_descImgIn"));
		if(multi.getFilesystemName("cho1ImgIn")!=null){
			obInfo.setCho1(multi.getFilesystemName("cho1ImgIn"));
		}else{
			obInfo.setCho1(multi.getParameter("cho1In"));
		}
		if(multi.getFilesystemName("cho2ImgIn")!=null){
			obInfo.setCho2(multi.getFilesystemName("cho2ImgIn"));
		}else{
			obInfo.setCho2(multi.getParameter("cho2In"));
		}
		if(multi.getFilesystemName("cho3ImgIn")!=null){
			obInfo.setCho3(multi.getFilesystemName("cho3ImgIn"));
		}else{
			obInfo.setCho3(multi.getParameter("cho3In"));
		}
		if(multi.getFilesystemName("cho4ImgIn")!=null){
			obInfo.setCho4(multi.getFilesystemName("cho4ImgIn"));
		}else{
			obInfo.setCho4(multi.getParameter("cho4In"));
		}
		if(multi.getFilesystemName("cho5ImgIn")!=null){
			obInfo.setCho5(multi.getFilesystemName("cho5ImgIn"));
		}else{
			obInfo.setCho5(multi.getParameter("cho5In"));
		}
		obInfo.setOb_sol(multi.getParameter("ob_sol"));
		if(multi.getParameter("obQ_exp").contains("\r\n")){
			q_exp = multi.getParameter("obQ_exp");
			q_exp = q_exp.replaceAll("\r\n", "\n");
			obInfo.setQ_exp(q_exp);
		}else{
			obInfo.setQ_exp(multi.getParameter("obQ_exp"));
		}
		obInfo.setPoint(Integer.parseInt(multi.getParameter("obPoint")));
		obInfo.setAge(multi.getParameter("obAge"));
		obInfo.setGrade(multi.getParameter("obGrade"));
		
		aService.modifyObquestion(obInfo);
		response.sendRedirect("adminQuestion.cis");
	}
	//주관식 문제 입력
	public void insertSub(HttpServletRequest request, HttpServletResponse response, String filepath) throws Exception {
		int sizeLimit = 5*1024*1024;
		MultipartRequest multi = new MultipartRequest(request, filepath, sizeLimit
													, "utf-8", new DefaultFileRenamePolicy());
		Subquestion subInfo = new Subquestion();
		subInfo.setQuestion(multi.getParameter("subQuestionIn"));
		subInfo.setSub_desc(multi.getFilesystemName("sub_descImgIn"));
		subInfo.setSub_sol( multi.getParameter("sub_solIn"));
		subInfo.setQ_exp(multi.getParameter("subQ_expIn"));
		subInfo.setPoint(Integer.parseInt(multi.getParameter("subPoint")));
		subInfo.setAge(multi.getParameter("subAge"));
		subInfo.setGrade(multi.getParameter("subGrade"));
		
		aService.insertSubquestion(subInfo);
		response.sendRedirect("adminQuestion.cis");
	}
	//주관식 문제 수정
	public void modifySub(HttpServletRequest request, HttpServletResponse response, String filepath) throws Exception {
		
		//String filepath = "C:\\workspace\\cistory\\WebContent\\q_img";
		System.out.println(filepath);
		int sizeLimit = 5*1024*1024;
		MultipartRequest multi = new MultipartRequest(request, filepath, sizeLimit
													, "utf-8", new DefaultFileRenamePolicy());		
		Subquestion subInfo = new Subquestion();
		subInfo.setQ_num(Integer.parseInt(multi.getParameter("subQ_num")));
		subInfo.setQuestion(multi.getParameter("subQuestionIn"));
		subInfo.setSub_desc(multi.getFilesystemName("sub_descImgIn"));
		subInfo.setSub_sol( multi.getParameter("sub_solIn"));
		subInfo.setQ_exp(multi.getParameter("subQ_expIn"));
		subInfo.setPoint(Integer.parseInt(multi.getParameter("subPoint")));
		subInfo.setAge(multi.getParameter("subAge"));
		subInfo.setGrade(multi.getParameter("subGrade"));
		
		aService.modifySubquestion(subInfo);
		response.sendRedirect("adminQuestion.cis");
	}
	//문제 삭제
	public void deleteQuestion(HttpServletRequest request, HttpServletResponse response, String filepath) throws Exception {
		int q_num = Integer.parseInt(request.getParameter("q_num"));
		String desc = request.getParameter("desc");
		String cho[] = new String[5];
		cho[0] = request.getParameter("cho1");
		cho[1] = request.getParameter("cho2");
		cho[2] = request.getParameter("cho3");
		cho[3] = request.getParameter("cho4");
		cho[4] = request.getParameter("cho5");
		
		desc = desc.replaceAll("q_img/", "");
		if(cho[0].contains("png")){
			cho[0] = cho[0].replaceAll("q_img/", "");
			cho[1] = cho[1].replaceAll("q_img/", "");
			cho[2] = cho[2].replaceAll("q_img/", "");
			cho[3] = cho[3].replaceAll("q_img/", "");
			cho[4] = cho[4].replaceAll("q_img/", "");
			
			cho[0] = filepath + "\\" + cho[0];
			cho[1] = filepath + "\\" + cho[1];
			cho[2] = filepath + "\\" + cho[2];
			cho[3] = filepath + "\\" + cho[3];
			cho[4] = filepath + "\\" + cho[4];
		}
		String filename = filepath + "\\" + desc;

		aService.deleteQuestion(q_num, filename, cho);
		response.sendRedirect("adminQuestion.cis");
	}
	//퀴즈 입력
	public void insertQuiz(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Quiz quizInfo = new Quiz();
		quizInfo.setHtr_num(Integer.parseInt(request.getParameter("htr_keyrdIn")));
		quizInfo.setQuiz(request.getParameter("quizIn"));
		quizInfo.setQuiz_sol(request.getParameter("quiz_sol"));
		quizInfo.setQuiz_desc(request.getParameter("quiz_descIn"));

		aService.insertQuiz(quizInfo);
		response.sendRedirect("adminQuestion.cis");
	}
	//퀴즈 수정
	public void modifyQuiz(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Quiz quizInfo = new Quiz();
		quizInfo.setQuiz_num(Integer.parseInt(request.getParameter("quiz_num")));
		quizInfo.setQuiz(request.getParameter("quizIn"));
		quizInfo.setQuiz_sol(request.getParameter("quiz_sol"));
		quizInfo.setQuiz_desc(request.getParameter("quiz_descIn"));
		
		aService.modifyQuiz(quizInfo);
		response.sendRedirect("adminQuestion.cis");
	}
	//퀴즈 삭제
	public void deleteQuiz(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int quiz_num = Integer.parseInt(request.getParameter("quiz_num"));
		
		aService.deleteQuiz(quiz_num);
		response.sendRedirect("adminQuestion.cis");
	}
	//역사 관리 페이지
	public void adminHistory(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ArrayList<History> htrList = null;
		int intPage=1;
		int total= 0;
		int countPerPage = 10;
		int pagePerGroup = 10;
		String page = request.getParameter("page");
		try{
			intPage = Integer.parseInt(page);
		}catch(Exception e){
			intPage = 1;
		}
		int currentPage = intPage;
		PageNavigator navi=null;
		total = aService.getHistoryTotal(); 
		navi = new PageNavigator(countPerPage, pagePerGroup, currentPage, total);
		htrList = aService.getAllHistory(navi.getStartRecord(), navi.getCountPerPage());		
		request.setAttribute("htrList", htrList);
		request.setAttribute("navi", navi);
		//String test[] = htrList.get(49).getHtr_desc().split("\n");

		/*String test = htrList.get(50).getHtr_desc();
		for(int i=0; i<test.length(); i++){
			System.out.println(i + " : " + test.charAt(i) + " - " + (int) test.charAt(i));
		}*/
		request.getRequestDispatcher("adminHistory.jsp").forward(request, response);
	}
	//역사정보 입력
	public void insertHistory(HttpServletRequest request, HttpServletResponse response, String filepath) throws Exception {
		final int TAG_MAX = 6;
		int sizeLimit = 5*1024*1024;
		MultipartRequest multi = new MultipartRequest(request, filepath, sizeLimit
													, "utf-8", new DefaultFileRenamePolicy());
		History htrInfo = new History();
		String htr_tag = "";
		String htr_desc=null;
		htrInfo.setHtr_keyrd(multi.getParameter("htr_keyrd"));
		htrInfo.setHtr_imguri(multi.getFilesystemName("htr_imgIn"));
		if(multi.getParameter("htr_desc").contains("\r\n")){
			htr_desc = multi.getParameter("htr_desc");
			htr_desc = htr_desc.replaceAll("\r\n", "\n");
			htrInfo.setHtr_desc(htr_desc);
		}else{
			htrInfo.setHtr_desc(multi.getParameter("htr_desc"));
		}
		for(int i=0; i<TAG_MAX; i++){
			if(!multi.getParameter("htr_tag"+i).equals("")){
				if(i!=0){
					htr_tag+="/";
				}
				htr_tag+=multi.getParameter("htr_tag"+i);
			}
		}
		htrInfo.setHtr_tag(htr_tag);
		htrInfo.setHtr_type(multi.getParameter("htr_type"));
		htrInfo.setHtr_age(multi.getParameter("htr_age"));
		htrInfo.setHtr_date(multi.getParameter("htr_date"));

		aService.insertHistory(htrInfo);
		response.sendRedirect("adminHistory.cis");
	}
	//역사정보 수정
	public void modifyHistory(HttpServletRequest request, HttpServletResponse response, String filepath) throws Exception {
		final int TAG_MAX = 6;
		int sizeLimit = 5*1024*1024;
		MultipartRequest multi = new MultipartRequest(request, filepath, sizeLimit
													, "utf-8", new DefaultFileRenamePolicy());
		History htrInfo = new History();
		String htr_tag = "";
		String htr_desc=null;
		htrInfo.setHtr_num(Integer.parseInt(multi.getParameter("htr_num")));
		htrInfo.setHtr_keyrd(multi.getParameter("htr_keyrd"));
		htrInfo.setHtr_imguri(multi.getFilesystemName("htr_imgIn"));
		if(multi.getParameter("htr_desc").contains("\r\n")){
			htr_desc = multi.getParameter("htr_desc");
			htr_desc = htr_desc.replace("\r\n", "\n");
			htrInfo.setHtr_desc(htr_desc);
		}else{
			htrInfo.setHtr_desc(multi.getParameter("htr_desc"));
		}
		for(int i=0; i<TAG_MAX; i++){
			if(!multi.getParameter("htr_tag"+i).equals("")){
				if(i!=0){
					htr_tag+="/";
				}
				htr_tag+=multi.getParameter("htr_tag"+i);
			}
		}
		htrInfo.setHtr_tag(htr_tag);
		htrInfo.setHtr_type(multi.getParameter("htr_type"));
		htrInfo.setHtr_age(multi.getParameter("htr_age"));
		htrInfo.setHtr_date(multi.getParameter("htr_date"));

		aService.modifyHistory(htrInfo);
		response.sendRedirect("adminHistory.cis");
	}
	//역사정보 삭제
	public void deleteHistory(HttpServletRequest request, HttpServletResponse response, String filepath) throws Exception {
		int htr_num = Integer.parseInt(request.getParameter("htr_num"));
		String htr_imguri = request.getParameter("htr_img");
		
		htr_imguri = htr_imguri.replaceAll("h_img/", "");

		String filename = filepath + "\\" + htr_imguri;

		aService.deleteHistory(htr_num, filename);
		response.sendRedirect("adminHistory.cis");
	}
	//
	public void d(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
	}
	//
	public void e(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
	}
	//
	public void f(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
	}
}
