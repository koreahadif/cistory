package nhn.cistory.vo;

public class ThmWrongNote {
	private int wr_no_num;
	private int q_num;
	private String q_type;
	private String age;
	private String grade;
	private String wr_no_memo;
	private String id;
	private String user_sol;
	
	public ThmWrongNote(){
		
	}

	public ThmWrongNote(int wr_no_num, int q_num, String q_type, String age,
			String grade, String wr_no_memo, String id, String user_sol) {
		super();
		this.wr_no_num = wr_no_num;
		this.q_num = q_num;
		this.q_type = q_type;
		this.age = age;
		this.grade = grade;
		this.wr_no_memo = wr_no_memo;
		this.id = id;
		this.user_sol = user_sol;
	}

	public int getWr_no_num() {
		return wr_no_num;
	}

	public void setWr_no_num(int wr_no_num) {
		this.wr_no_num = wr_no_num;
	}

	public int getQ_num() {
		return q_num;
	}

	public void setQ_num(int q_num) {
		this.q_num = q_num;
	}

	public String getQ_type() {
		return q_type;
	}

	public void setQ_type(String q_type) {
		this.q_type = q_type;
	}

	public String getWr_no_memo() {
		return wr_no_memo;
	}

	public void setWr_no_memo(String wr_no_memo) {
		this.wr_no_memo = wr_no_memo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUser_sol() {
		return user_sol;
	}

	public void setUser_sol(String user_sol) {
		this.user_sol = user_sol;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	@Override
	public String toString() {
		return "ThmWrongNote [wr_no_num=" + wr_no_num + ", q_num=" + q_num
				+ ", q_type=" + q_type + ", age=" + age + ", grade=" + grade
				+ ", wr_no_memo=" + wr_no_memo + ", id=" + id + ", user_sol="
				+ user_sol + "]";
	}
}
