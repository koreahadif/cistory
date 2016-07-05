package nhn.cistory.vo;

public class Subquestion extends Question{
	private Integer sub_num = null;
	private String sub_desc = null;
	private String sub_sol = null;
	
	public Subquestion(){
		
	}

	public Subquestion(Integer sub_num, String sub_desc, String sub_sol) {
		super();
		this.sub_num = sub_num;
		this.sub_desc = sub_desc;
		this.sub_sol = sub_sol;
	}

	public Subquestion(Integer q_num, String question, String q_type,
			String grade, String age, Integer wrongCount, Integer setCount,
			Integer point, String q_exp) {
		super(q_num, question, q_type, grade, age, wrongCount, setCount, point, q_exp);
		// TODO Auto-generated constructor stub
	}

	public Integer getSub_num() {
		return sub_num;
	}

	public void setSub_num(Integer sub_num) {
		this.sub_num = sub_num;
	}

	public String getSub_desc() {
		return sub_desc;
	}

	public void setSub_desc(String sub_desc) {
		this.sub_desc = sub_desc;
	}

	public String getSub_sol() {
		return sub_sol;
	}

	public void setSub_sol(String sub_sol) {
		this.sub_sol = sub_sol;
	}

	@Override
	public String toString() {
		return "Subquestion [sub_num=" + sub_num + ", sub_desc=" + sub_desc
				+ ", sub_sol=" + sub_sol + ", Question()=" + super.toString()
				+ "]";
	}
}
