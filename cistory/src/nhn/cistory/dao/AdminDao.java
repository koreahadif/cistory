package nhn.cistory.dao;

import java.util.ArrayList;

import com.ibatis.sqlmap.client.SqlMapClient;

import nhn.cistory.util.MySqlMap;
import nhn.cistory.vo.History;
import nhn.cistory.vo.Member;
import nhn.cistory.vo.Obquestion;
import nhn.cistory.vo.Quiz;
import nhn.cistory.vo.Subquestion;
import nhn.cistory.vo.WrongNote;

public class AdminDao {
	SqlMapClient sqlMap = MySqlMap.getSqlMapInstance();
	
	//모든 회원 정보 반환
	public ArrayList<Member> getAllMember(int start, int perPage) throws Exception{
		ArrayList<Member> memberList = null;
		if(start==0&&perPage==0)
			memberList = (ArrayList<Member>) sqlMap.queryForList("admin.getAllMember");
		else
			memberList = (ArrayList<Member>) sqlMap.queryForList("admin.getAllMember", start, perPage);
		
		return memberList;
	}

	//회원 등급 관리
	public void modifyMemberGrade(Member memberInfo) throws Exception{
		sqlMap.update("admin.modifyMemberGrade", memberInfo);
	}
	
	//회원 탈퇴 관리
	public void deleteMember(String idInfo) throws Exception{
		sqlMap.delete("admin.deleteMember", idInfo);
	}
		
	//모든 객관식 문제 반환
	public ArrayList<Obquestion> getAllObquestion(int start, int perPage) throws Exception{
		ArrayList<Obquestion> obList = null;
		if(start==0&&perPage==0)
			obList = (ArrayList<Obquestion>) sqlMap.queryForList("admin.getAllObquestion");
		else
			obList = (ArrayList<Obquestion>) sqlMap.queryForList("admin.getAllObquestion", start, perPage);
		return obList;
	}
	
	//객관식 문제 입력
	public void insertObquestion(Obquestion obInfo) throws Exception{
		sqlMap.insert("admin.insertObquestion1", obInfo);
		sqlMap.insert("admin.insertObquestion2", obInfo);
	}
	
	//객관식 문제 수정
	public void modifyObquestion(Obquestion obInfo) throws Exception{
		sqlMap.update("admin.modifyObquestion1", obInfo);
		sqlMap.update("admin.modifyObquestion2", obInfo);
	}
	
	//모든 주관식 문제 반환
	public ArrayList<Subquestion> getAllSubquestion(int start, int perPage) throws Exception{
		ArrayList<Subquestion> subList = null;
		if(start==0&&perPage==0)
			subList = (ArrayList<Subquestion>) sqlMap.queryForList("admin.getAllSubquestion");
		else
			subList = (ArrayList<Subquestion>) sqlMap.queryForList("admin.getAllSubquestion", start, perPage);
		return subList;
	}
	
	//주관식 문제 입력
	public void insertSubquestion(Subquestion subInfo) throws Exception{
		sqlMap.insert("admin.insertSubquestion1", subInfo);
		sqlMap.insert("admin.insertSubquestion2", subInfo);
	}
	
	//주관식 문제 수정
	public void modifySubquestion(Subquestion subInfo) throws Exception{
		sqlMap.update("admin.modifySubquestion1", subInfo);
		sqlMap.update("admin.modifySubquestion2", subInfo);
	}
	
	//문제 삭제
	public void deleteQuestion(int q_num) throws Exception{
		sqlMap.delete("admin.deleteQuestion", q_num);
	}
	
	//모든 퀴즈 반환
	public ArrayList<Quiz> getAllQuiz(int start, int perPage) throws Exception{
		ArrayList<Quiz> quizList = null;
		if(start==0&&perPage==0)
			quizList = (ArrayList<Quiz>) sqlMap.queryForList("admin.getAllQuiz");
		else
			quizList = (ArrayList<Quiz>) sqlMap.queryForList("admin.getAllQuiz", start, perPage);
		return quizList;
	}
	
	//퀴즈 입력
	public void insertQuiz(Quiz quizInfo) throws Exception{
		sqlMap.insert("admin.insertQuiz", quizInfo);
	}
	
	//퀴즈 수정
	public void modifyQuiz(Quiz quizInfo) throws Exception{
		sqlMap.update("admin.modifyQuiz", quizInfo);
	}
	
	//퀴즈 삭제
	public void deleteQuiz(int quiz_num) throws Exception{
		sqlMap.delete("admin.deleteQuiz", quiz_num);
	}
	
	//모든 역사정보 반환
	public ArrayList<History> getAllHistory(int start, int perPage) throws Exception{
		ArrayList<History> htrList =null;
		if(start==0&&perPage==0){
			htrList = (ArrayList<History>) sqlMap.queryForList("admin.getAllHistory");
		}
		else{
			htrList = (ArrayList<History>) sqlMap.queryForList("admin.getAllHistory",start,perPage);
		}
		return htrList;
	}
	
	//역사정보 입력
	public void insertHistory(History htrInfo) throws Exception{
		sqlMap.insert("admin.insertHistory", htrInfo);
	}
	
	//역사정보 수정
	public void modifyHistory(History htrInfo) throws Exception{
		sqlMap.update("admin.modifyHistory", htrInfo);
	}
	
	//역사정보 삭제
	public void deleteHistory(int htr_num) throws Exception{
		sqlMap.delete("admin.deleteHistory", htr_num);
	}
}
