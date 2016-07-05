package nhn.cistory.vo;

public class Member {
	private String id;
	private String password;
	private String name;
	private String nickName;
	private String grade;
	private String email;
	private String join_date;
	private String modify_date;
	
	public Member(){
		
	}

	public Member(String id, String password, String name, String nickName,
			String grade, String email) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.nickName = nickName;
		this.grade = grade;
		this.email = email;
	}

	public Member(String id, String password, String name, String nickName,
			String grade, String email, String join_date, String modify_date) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.nickName = nickName;
		this.grade = grade;
		this.email = email;
		this.join_date = join_date;
		this.modify_date = modify_date;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickname(String nickName) {
		this.nickName = nickName;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getJoin_date() {
		return join_date;
	}

	public void setJoin_date(String join_date) {
		this.join_date = join_date;
	}

	public String getModify_date() {
		return modify_date;
	}

	public void setModify_date(String modify_date) {
		this.modify_date = modify_date;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", password=" + password + ", name=" + name
				+ ", nickName=" + nickName + ", grade=" + grade + ", email="
				+ email + ", join_date=" + join_date + ", modify_date="
				+ modify_date + "]";
	}
}
