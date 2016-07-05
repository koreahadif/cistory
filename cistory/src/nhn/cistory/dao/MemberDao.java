package nhn.cistory.dao;

import java.util.ArrayList;

import nhn.cistory.util.MySqlMap;
import nhn.cistory.vo.Member;
import nhn.cistory.vo.MyNote;
import nhn.cistory.vo.Obquestion;
import nhn.cistory.vo.Question;
import nhn.cistory.vo.ThmWrongNote;
import nhn.cistory.vo.WrongNote;

import com.ibatis.sqlmap.client.SqlMapClient;

public class MemberDao {
	/**
	 * @uml.property  name="sqlMap"
	 * @uml.associationEnd  multiplicity="(1 1)"
	 */
	SqlMapClient sqlMap = MySqlMap.getSqlMapInstance();
	
	//로그인
	public Member login(Member memberInfo) throws Exception{
		Member member = null;
		member = (Member) sqlMap.queryForObject("member.login", memberInfo);
		return member;
	}	
	
	//중복확인
	public String idCheck(String idInfo) throws Exception{
		String id = null;
		id = (String) sqlMap.queryForObject("member.idCheck", idInfo);
		return id;
	}
	
	//회원가입
	public void join(Member memberInfo) throws Exception{
		sqlMap.insert("member.join", memberInfo);
	}
	
	//회원 정보 수정
	public void modify(Member memberInfo) throws Exception{
		sqlMap.update("member.modify", memberInfo);
	}
	
	//회원 탈퇴
	public void drop(String idInfo) throws Exception{
		sqlMap.delete("member.drop", idInfo);
	}
	
	//나만의 노트 반환
	public ArrayList<MyNote> getMyNote(String idInfo) throws Exception{
		ArrayList<MyNote> myNoteList = null;
		myNoteList = (ArrayList<MyNote>) sqlMap.queryForList("member.getMyNote", idInfo);
		return myNoteList;
	}
	
	//나만의 노트 한 페이지 반환(쓸모음성...)
	public MyNote getMyNotePage(int my_no_num) throws Exception{
		MyNote myNotePage = null;
		myNotePage = (MyNote) sqlMap.queryForObject("member.getMyNotePage", my_no_num);
		return myNotePage;
	}
	
	//오답 노트 반환
	public ArrayList<WrongNote> getWrongNote(String idInfo, int start, int perPage) throws Exception{
		ArrayList<WrongNote> wrongNoteList = null;
		if(start==0&&perPage==0)
			wrongNoteList = (ArrayList<WrongNote>) sqlMap.queryForList("member.getWrongNote2", idInfo);
		else
			wrongNoteList = (ArrayList<WrongNote>) sqlMap.queryForList("member.getWrongNote", idInfo,start,perPage);
		return wrongNoteList;
	}
	
	//오답 노트 수정
	public void modifyWrongNote(WrongNote wrongNoteInfo) throws Exception{
		sqlMap.update("member.modifyWrongNote", wrongNoteInfo);
	}
	
	//오답 노트 삭제
	public void deleteWrongNote(int wr_no_num) throws Exception{
		sqlMap.delete("member.deleteWrongNote", wr_no_num);
	}

	//테마 오답 노트 반환
	public ArrayList<ThmWrongNote> getThmWrongNote(ThmWrongNote noteInfo) throws Exception{
		ArrayList<ThmWrongNote> thmWrongNoteList = null;
		thmWrongNoteList = (ArrayList<ThmWrongNote>) sqlMap.queryForList("member.getThmWrongNote", noteInfo);
		return thmWrongNoteList;
	}
	
	//테마오답 노트 수정
	public void modifyThmWrongNote(ThmWrongNote thmWrongNoteInfo) throws Exception{
		sqlMap.update("member.modifyThmWrongNote", thmWrongNoteInfo);

	}
	
	//테마 오답 노트 삭제
	public void deleteThmWrongNote(int wr_no_num) throws Exception{
		sqlMap.delete("member.deleteThmWrongNote", wr_no_num);
	}
	
	//오답 노트에서 추천 문제 반환
	public ArrayList<Obquestion> getRecQuestion(Question qInfo) throws Exception{
		ArrayList<Obquestion> recList = null;
		recList = (ArrayList<Obquestion>) sqlMap.queryForList("member.getRecQuestion", qInfo);
		return recList;
	}
}
