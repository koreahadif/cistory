package nhn.cistory.vo;

public class Reply {

	private int rp_num;//리플번호
	private int brd_num;//본분 글번호
	private String id;// ID
	private String nickname;//별명
	private String grade;// 등급
	private String rp_post_date;// 게시일	
	private String rp_content;//리플내용
	
	public Reply() {
		super();
	}

	public Reply(int rp_num, int brd_num, String id, String nickname,
			String grade, String rp_post_date, String rp_content) {
		super();
		this.rp_num = rp_num;
		this.brd_num = brd_num;
		this.id = id;
		this.nickname = nickname;
		this.grade = grade;
		this.rp_post_date = rp_post_date;
		this.rp_content = rp_content;
	}

	public Reply(int brd_num, String id, String nickname, String grade,	String rp_content) {
		super();
		this.brd_num = brd_num;
		this.id = id;
		this.nickname = nickname;
		this.grade = grade;
		this.rp_content = rp_content;
	}

	public int getRp_num() {
		return rp_num;
	}

	public void setRp_num(int rp_num) {
		this.rp_num = rp_num;
	}

	public int getBrd_num() {
		return brd_num;
	}

	public void setBrd_num(int brd_num) {
		this.brd_num = brd_num;
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

	public String getRp_post_date() {
		return rp_post_date;
	}

	public void setRp_post_date(String rp_post_date) {
		this.rp_post_date = rp_post_date;
	}

	public String getRp_content() {
		return rp_content;
	}

	public void setRp_content(String rp_content) {
		this.rp_content = rp_content;
	}

	@Override
	public String toString() {
		return "Reply [rp_num=" + rp_num + ", brd_num=" + brd_num + ", id="
				+ id + ", nickname=" + nickname + ", grade=" + grade
				+ ", rp_post_date=" + rp_post_date + ", rp_content="
				+ rp_content + "]";
	}
	
	
}//class끝
