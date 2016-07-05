package nhn.cistory.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private TestController test = new TestController();
    private MemberController mctr = new MemberController();
    private HistoryController htr = new HistoryController();
    private BoardController brdctr = new BoardController();
    private AdminController actr = new AdminController();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;UTF-8");
		
		String action = request.getServletPath();

		try {
			if (action.equals("/theme.cis")) {
				test.theme(request, response);
			}
			else if (action.equals("/past.cis")) {
				test.past(request, response);
			}
			else if (action.equals("/pretheme.cis")) {
				test.pretheme(request, response);
			}
			else if (action.equals("/startTest.cis")) {
				test.startTest(request, response);
			}
			else if (action.equals("/getQuestion.cis")) {
				test.getQuestion(request, response);
			}
			else if (action.equals("/getTQuestion.cis")) {
				test.getTQuestion(request, response);
			}
			else if (action.equals("/setTestResult.cis")) {
				test.setTestResult(request, response);
			}
			else if (action.equals("/testResult.cis")) {
				test.testResult(request, response);
			}
			else if (action.equals("/insertWR.cis")) {
				test.insertWR(request, response);
			}			
			else if (action.equals("/getTAnswer.cis")) {
				test.getTAnswer(request, response);
			}
			else if (action.equals("/addWrongNote.cis")) {
				test.addWrongNote(request, response);
			}
			//게스트 페이지로
			else if (action.equals("/guest.cis")) { mctr.gIndex(request,response); }
			//인덱스 페이지로
			else if (action.equals("/index.cis")) { mctr.index(request, response); }
			//로그인
			else if (action.equals("/login.cis")) { mctr.login(request, response); }
			//로그아웃
			else if (action.equals("/logout.cis")) { mctr.logout(request, response); }
			//회원가입 폼으로
			else if (action.equals("/joinForm.cis")) { mctr.joinForm(request, response); }
			//회원가입
			else if (action.equals("/join.cis")) { mctr.join(request, response); }
			//아이디 중복확인 폼으로
			else if (action.equals("/idCheckForm.cis")) { mctr.idCheckForm(request, response); }
			//아이디 중복확인
			else if (action.equals("/idCheck.cis")) { mctr.idCheck(request, response); }
			//마이페이지로
			else if (action.equals("/myPage.cis")) { mctr.myPage(request, response); }
			//회원 정보 수정 폼으로
			else if (action.equals("/modifyMemberForm.cis")) { mctr.modifyMemberForm(request, response); }
			//회원 정보 수정
			else if (action.equals("/modifyMember.cis")) { mctr.modifyMember(request, response); }
			//회원 탈퇴
			else if (action.equals("/dropMember.cis")) { mctr.dropMember(request, response); }
			//나만의 노트
			else if (action.equals("/myNote.cis")) { mctr.myNote(request, response); }
			/*//나만의 노트 썸네일 클릭
			else if (action.equals("/changeMyNote.cis")) {	System.out.println("aa");	}*/
			//오답 노트
			else if (action.equals("/wrongNote.cis")) { mctr.wrongNote(request, response); }
			//오답 노트 페이지
			else if (action.equals("/wrongNotePage.cis")) { mctr.wrongNotePage(request, response); }
			//오답 노트 수정
			else if (action.equals("/modifyWrongNote.cis")) { mctr.modifyWrongNote(request, response); }
			//오답 노트 삭제
			else if (action.equals("/deleteWrongNote.cis")) { mctr.deleteWrongNote(request, response); }
			//테마 오답 노트
			else if (action.equals("/thmWrongNote.cis")) { mctr.thmWrongNote(request, response); }
			//테마 오답 노트 수정
			else if (action.equals("/modifyThmWrongNote.cis")) { mctr.modifyThmWrongNote(request, response); }
			//테마 오답 노트 삭제
			else if (action.equals("/deleteThmWrongNote.cis")) { mctr.deleteThmWrongNote(request, response); }
			//오답노트에서 추천 문제 반환
			else if (action.equals("/getRecQuestion.cis")) { mctr.getRecQuestion(request, response); }
			//관리자 인덱스
			else if (action.equals("/admin.cis")){ actr.adminIndex(request, response); }
			//관리자 로그인
			else if (action.equals("/adminLogin.cis")) { actr.adminLogin(request, response); }
			//관리자 페이지로
			else if (action.equals("/adminPage.cis")) { actr.adminPage(request, response); }
			//회원 관리 페이지로
			else if (action.equals("/adminMember.cis")) { actr.adminMember(request, response); }
			//회원 등급 관리
			else if (action.equals("/modifyMemberGrade.cis")) { actr.modifyMemberGrade(request, response); }
			//회원 탈퇴 관리
			else if (action.equals("/deleteMember.cis")) { actr.deleteMember(request, response); }
			//문제 관리 페이지로
			else if (action.equals("/adminQuestion.cis")) { actr.adminQuestion(request, response); }
			//객관식 문제 입력
			else if (action.equals("/insertOb.cis")) { 
				ServletContext application = getServletContext();
				String filepath = application.getRealPath("q_img");
				actr.insertOb(request, response, filepath); 
			}
			//객관식 문제 수정
			else if (action.equals("/modifyOb.cis")) {
				ServletContext application = getServletContext();
				String filepath = application.getRealPath("q_img");
				actr.modifyOb(request, response, filepath);
			}
			//주관식 문제 입력
			else if (action.equals("/insertSub.cis")) { 
				ServletContext application = getServletContext();
				String filepath = application.getRealPath("q_img");
				actr.insertSub(request, response, filepath); 
			}
			//주관식 문제 수정
			else if (action.equals("/modifySub.cis")) { 
				ServletContext application = getServletContext();
				String filepath = application.getRealPath("q_img");
				actr.modifySub(request, response, filepath);
			}
			//문제 삭제
			else if (action.equals("/deleteQuestion.cis")) {
				ServletContext application = getServletContext();
				String filepath = application.getRealPath("q_img");
				actr.deleteQuestion(request, response, filepath); 
			}
			//퀴즈 입력
			else if (action.equals("/insertQuiz.cis")) { actr.insertQuiz(request, response); }
			//퀴즈 수정
			else if (action.equals("/modifyQuiz.cis")) { actr.modifyQuiz(request, response); }
			//퀴즈 삭제
			else if (action.equals("/deleteQuiz.cis")) { actr.deleteQuiz(request, response); }
			//역사 관리 페이지로
			else if (action.equals("/adminHistory.cis")) { actr.adminHistory(request, response); }
			//역사정보 입력
			else if (action.equals("/insertHistory.cis")) {
				ServletContext application = getServletContext();
				String filepath = application.getRealPath("h_img");
				actr.insertHistory(request, response, filepath);
			}
			//역사정보 수정
			else if (action.equals("/modifyHistory.cis")) { 
				ServletContext application = getServletContext();
				String filepath = application.getRealPath("h_img");
				actr.modifyHistory(request, response, filepath);
			}
			//역사정보 삭제
			else if (action.equals("/deleteHistory.cis")) { 
				ServletContext application = getServletContext();
				String filepath = application.getRealPath("h_img");
				actr.deleteHistory(request, response, filepath);
			}
			//
			else if (action.equals("/.cis")) {  }
			//
			else if (action.equals("/.cis")) {  }
			
			else if(action.equals("/quiz.cis")){
				htr.quiz(request,response);
			}
			else if(action.equals("/getQuiz.cis")){
				htr.getQuiz(request,response);
			}
			//타임라인
			else if(action.equals("/getTimeline.cis")){
				htr.getTimeline(request,response);
			}
			else if (action.equals("/writeForm.cis")) 
			{ // 게시판 글쓰기폼으로 가기
				brdctr.writeForm(request, response);
			}
			else if (action.equals("/write.cis")) 
			{ // 게시판 글쓰기
				brdctr.write(request, response);
			}
			else if (action.equals("/tag.cis")) 
			{ // 게시판 글쓰기폼 태그검색
				brdctr.tag(request, response);
			}
			else if (action.equals("/listfree.cis")) 
			{ // 자유게시판
				brdctr.listfree(request, response);
			}
			else if (action.equals("/listsuggest.cis")) 
			{ // 건의게시판
				brdctr.listsuggest(request, response);
			}
			else if (action.equals("/listfnq.cis")) 
			{ // 질문과답변게시판
				brdctr.listfnq(request, response);
			}
			else if (action.equals("/like.cis")) 
			{ // 게시물 좋아요 수 증가
				brdctr.like(request, response);
			}
			else if (action.equals("/hate.cis")) 
			{ // 게시물 싫어요 수 증가
				brdctr.hate(request, response);
			}
			else if (action.equals("/read.cis")){
				brdctr.read(request,response);
			}
			else if (action.equals("/delete.cis")) 
			{ // 게시판물 삭세
				brdctr.delete(request, response);
			}
			else if (action.equals("/infoedit1.cis")) 
			{ // 게시판 수정전 데이터 가져오기
				brdctr.infoedit1(request, response);
			}
			else if (action.equals("/infoedit2.cis")) 
			{ // 게시판 수정
				brdctr.infoedit2(request, response);
			}
			else if (action.equals("/replywrite.cis")) 
			{ // 리플달기
				brdctr.replywrite(request, response);
			}
			else if (action.equals("/replyallList.cis")) 
			{ // 게시물에 해당하는 리플 보여주기
				brdctr.replyallList(request, response);
			}
			else if (action.equals("/replydelete.cis")) 
			{ // 리플삭제
				brdctr.replydelete(request, response);
			}
			else if (action.equals("/replyinfoedit1.cis")) 
			{ // 리플 수정전 자료 가져오기
				brdctr.replyinfoedit1(request, response);
			}else if (action.equals("/replyinfoedit2.cis")) 
			{ // 리플 수정하기
				brdctr.replyinfoedit2(request, response);
			}
			else if(action.equals("/historyCtg.cis"))
			{
				htr.getCategory(request, response);
			}
			else if(action.equals("/searchCtg.cis"))
			{
				htr.searchCtg(request, response);
			}
			else if(action.equals("/getUserTest.cis")){
				test.getUserTest(request,response);
			}
			else if(action.equals("/getMyPer.cis")){
				test.getOneTest(request,response);
			}
			else if(action.equals("/addMyNote.cis")){
				htr.addMyNote(request,response);
			}
			else if(action.equals("/timeline.cis")){
				htr.timeLine(request, response);
			}
			else if(action.equals("/getPrediction.cis")){
				test.getUserPredict(request, response);
			}
			else if(action.equals("/searchCtgList.cis")){
				htr.searchCtgList(request,response);
			}
			else if(action.equals("/delNote.cis")){
				htr.delNote(request,response);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
			request.getRequestDispatcher("errorPage.jsp").forward(request, response);
		}
		
	}

}
