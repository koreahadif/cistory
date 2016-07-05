package nhn.cistory.vo;

public class Board {
	
	private int brd_num; // 게시판 번호
	private String brd_ctg; // 카테고리 (자유게시판/건의게시판/Q&A게시판/공지사항)
	private String id;// ID
	private String nickname;// 별명
	private String grade;// 등급
	private String brd_title;// 제목
	private String brd_content;//내용
	private String htr_tag;// 역사정보태그 (태그는 3개까지 가능하다)
	private String brd_post_date;// 게시일
	private int brd_view_count;// 조회수
	private int brd_like_count;// 좋아요
	private int brd_hate_count;// 싫어요
	
	public Board(){
		
	}
	
	public Board(String brd_ctg, String id, String nickname, String grade, String brd_title, String brd_content, String htr_tag) {
		super();
		
		this.brd_ctg = brd_ctg;
		this.id = id;
		this.nickname = nickname;
		this.grade = grade;
		this.brd_title = brd_title;
		this.brd_content = brd_content;
		this.htr_tag = htr_tag;
		
	}

	public Board(int brd_num, String brd_ctg, String id, String nickname,
			String grade, String brd_title, String brd_content, String htr_tag,
			String brd_post_date, int brd_view_count, int brd_like_count,
			int brd_hate_count) {
		super();
		this.brd_num = brd_num;
		this.brd_ctg = brd_ctg;
		this.id = id;
		this.nickname = nickname;
		this.grade = grade;
		this.brd_title = brd_title;
		this.brd_content = brd_content;
		this.htr_tag = htr_tag;
		this.brd_post_date = brd_post_date;
		this.brd_view_count = brd_view_count;
		this.brd_like_count = brd_like_count;
		this.brd_hate_count = brd_hate_count;
	}

	public int getBrd_num() {
		return brd_num;
	}

	public void setBrd_num(int brd_num) {
		this.brd_num = brd_num;
	}

	public String getBrd_ctg() {
		return brd_ctg;
	}

	public void setBrd_ctg(String brd_ctg) {
		this.brd_ctg = brd_ctg;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getBrd_title() {
		return brd_title;
	}

	public void setBrd_title(String brd_title) {
		this.brd_title = brd_title;
	}

	public String getBrd_content() {
		return brd_content;
	}

	public void setBrd_content(String brd_content) {
		this.brd_content = brd_content;
	}

	public String getHtr_tag() {
		return htr_tag;
	}

	public void setHtr_tag(String htr_tag) {
		this.htr_tag = htr_tag;
	}

	public String getBrd_post_date() {
		return brd_post_date;
	}

	public void setBrd_post_date(String brd_post_date) {
		this.brd_post_date = brd_post_date;
	}

	public int getBrd_view_count() {
		return brd_view_count;
	}

	public void setBrd_view_count(int brd_view_count) {
		this.brd_view_count = brd_view_count;
	}

	public int getBrd_like_count() {
		return brd_like_count;
	}

	public void setBrd_like_count(int brd_like_count) {
		this.brd_like_count = brd_like_count;
	}

	public int getBrd_hate_count() {
		return brd_hate_count;
	}

	public void setBrd_hate_count(int brd_hate_count) {
		this.brd_hate_count = brd_hate_count;
	}

	@Override
	public String toString() {
		return "Board [brd_num=" + brd_num + ", brd_ctg=" + brd_ctg + ", id="
				+ id + ", nickname=" + nickname + ", grade=" + grade
				+ ", brd_title=" + brd_title + ", brd_content=" + brd_content
				+ ", htr_tag=" + htr_tag + ", brd_post_date=" + brd_post_date
				+ ", brd_view_count=" + brd_view_count + ", brd_like_count="
				+ brd_like_count + ", brd_hate_count=" + brd_hate_count + "]";
	}
	
	
	
}//class 끝
