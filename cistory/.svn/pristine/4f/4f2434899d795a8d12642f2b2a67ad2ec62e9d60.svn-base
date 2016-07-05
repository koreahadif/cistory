package nhn.cistory.service;

import java.io.File;
import java.util.ArrayList;

import nhn.cistory.dao.AdminDao;
import nhn.cistory.vo.History;
import nhn.cistory.vo.Member;
import nhn.cistory.vo.Obquestion;
import nhn.cistory.vo.Quiz;
import nhn.cistory.vo.Subquestion;
import nhn.cistory.vo.WrongNote;

public class AdminService {
	AdminDao dao = new AdminDao();

	public AdminService(){}
	
	public ArrayList<Member> getAllMember(int start, int perPage) throws Exception{
		 ArrayList<Member> memberList = dao.getAllMember(start,perPage);
		 return memberList;
	}
	
	public int getMemberTotal() throws Exception{
		ArrayList<Member> total=null;
		total = dao.getAllMember(0, 0);
		return total.size();
	}
	
	public void modifyGrade(String idInfo, String grade) throws Exception{
		Member memberInfo = new Member();
		memberInfo.setId(idInfo);
		memberInfo.setGrade(grade);
		
		dao.modifyMemberGrade(memberInfo);
	}
	
	public void deleteMember(String idInfo) throws Exception{
		dao.deleteMember(idInfo);
	}
	
	public ArrayList<Obquestion> getAllObquestion(int start, int perPage) throws Exception{
		ArrayList<Obquestion> obList = dao.getAllObquestion(start, perPage);
		return obList;
	}
	
	public int getObTotal() throws Exception{
		ArrayList<Obquestion> total = dao.getAllObquestion(0,0);
		return total.size();
	}
	
	public void insertObquestion(Obquestion obInfo) throws Exception{
		dao.insertObquestion(obInfo);
	}
	
	public void modifyObquestion(Obquestion obInfo) throws Exception{		
		dao.modifyObquestion(obInfo);
	}
	
	public ArrayList<Subquestion> getAllSubquestion(int start, int perPage) throws Exception{
		ArrayList<Subquestion> subList = dao.getAllSubquestion(start, perPage);
		return subList;
	}
	
	public int getSubTotal() throws Exception{
		ArrayList<Subquestion> total = dao.getAllSubquestion(0,0);
		return total.size();
	}
	
	public void insertSubquestion(Subquestion subInfo) throws Exception{
		dao.insertSubquestion(subInfo);
	}
	
	public void modifySubquestion(Subquestion subInfo) throws Exception{		
		dao.modifySubquestion(subInfo);
	}
	
	public void deleteQuestion(int q_num, String filename, String cho[]) throws Exception{
		File desc = new File(filename);
		desc.delete();
		if(!cho[0].equals("#")){
			File cho1 = new File(cho[0]);
			File cho2 = new File(cho[1]);
			File cho3 = new File(cho[2]);
			File cho4 = new File(cho[3]);
			File cho5 = new File(cho[4]);
			
			cho1.delete();
			cho2.delete();
			cho3.delete();
			cho4.delete();
			cho5.delete();
		}
		dao.deleteQuestion(q_num);
	}
	
	public ArrayList<Quiz> getAllQuiz(int start, int perPage) throws Exception{
		ArrayList<Quiz> quizList = dao.getAllQuiz(start, perPage);
		return quizList;
	}
	
	public int getQuizTotal() throws Exception{
		ArrayList<Quiz> total = dao.getAllQuiz(0,0);
		return total.size();
	}
	
	public void insertQuiz(Quiz quizInfo) throws Exception{
		dao.insertQuiz(quizInfo);
	}
	
	public void modifyQuiz(Quiz quizInfo) throws Exception{		
		dao.modifyQuiz(quizInfo);
	}
	
	public void deleteQuiz(int quiz_num) throws Exception{
		dao.deleteQuiz(quiz_num);
	}
	
	public ArrayList<History> getAllHistory(int start, int perPage) throws Exception{
		ArrayList<History> htrList = dao.getAllHistory(start,perPage);
		return htrList;
	}
	
	public int getHistoryTotal() throws Exception{
		ArrayList<History> htrList = dao.getAllHistory(0,0);
		return htrList.size();
	}
	
	public void insertHistory(History htrInfo) throws Exception{
		dao.insertHistory(htrInfo);
	}
	
	public void modifyHistory(History htrInfo) throws Exception{		
		dao.modifyHistory(htrInfo);
	}
	
	public void deleteHistory(int htr_num, String filename) throws Exception{
		File htr_imguri = new File(filename);
		htr_imguri.delete();
		
		dao.deleteHistory(htr_num);
	}
	
	public void g() throws Exception{
		 
	}
}
