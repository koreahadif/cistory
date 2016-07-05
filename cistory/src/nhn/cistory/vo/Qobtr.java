package nhn.cistory.vo;

public class Qobtr {
	private int test_rslt_num;
	private int test_tmp_num;
	private int q_num;
	private String q_exp;
	private int wrong_count;
	private int set_count;
	private int ob_sol;
	private int user_sol;
	private int point;
	private String question;
	private String q_type;
	private String ob_desc;
	private String cho1;
	private String cho2;
	private String cho3;
	private String cho4;
	private String cho5;
	
	
	public Qobtr() {
		super();
	}


	public Qobtr(int test_rslt_num, int test_tmp_num, int q_num, String q_exp,
			int wrong_count, int set_count, int ob_sol, int user_sol,
			int point, String question, String q_type, String ob_desc,
			String cho1, String cho2, String cho3, String cho4, String cho5) {
		super();
		this.test_rslt_num = test_rslt_num;
		this.test_tmp_num = test_tmp_num;
		this.q_num = q_num;
		this.q_exp = q_exp;
		this.wrong_count = wrong_count;
		this.set_count = set_count;
		this.ob_sol = ob_sol;
		this.user_sol = user_sol;
		this.point = point;
		this.question = question;
		this.q_type = q_type;
		this.ob_desc = ob_desc;
		this.cho1 = cho1;
		this.cho2 = cho2;
		this.cho3 = cho3;
		this.cho4 = cho4;
		this.cho5 = cho5;
	}


	public int getTest_rslt_num() {
		return test_rslt_num;
	}


	public void setTest_rslt_num(int test_rslt_num) {
		this.test_rslt_num = test_rslt_num;
	}


	public int getTest_tmp_num() {
		return test_tmp_num;
	}


	public void setTest_tmp_num(int test_tmp_num) {
		this.test_tmp_num = test_tmp_num;
	}


	public int getQ_num() {
		return q_num;
	}


	public void setQ_num(int q_num) {
		this.q_num = q_num;
	}


	public String getQ_exp() {
		return q_exp;
	}


	public void setQ_exp(String q_exp) {
		this.q_exp = q_exp;
	}


	public int getWrong_count() {
		return wrong_count;
	}


	public void setWrong_count(int wrong_count) {
		this.wrong_count = wrong_count;
	}


	public int getSet_count() {
		return set_count;
	}


	public void setSet_count(int set_count) {
		this.set_count = set_count;
	}


	public int getOb_sol() {
		return ob_sol;
	}


	public void setOb_sol(int ob_sol) {
		this.ob_sol = ob_sol;
	}


	public int getUser_sol() {
		return user_sol;
	}


	public void setUser_sol(int user_sol) {
		this.user_sol = user_sol;
	}


	public int getPoint() {
		return point;
	}


	public void setPoint(int point) {
		this.point = point;
	}


	public String getQuestion() {
		return question;
	}


	public void setQuestion(String question) {
		this.question = question;
	}


	public String getQ_type() {
		return q_type;
	}


	public void setQ_type(String q_type) {
		this.q_type = q_type;
	}


	public String getOb_desc() {
		return ob_desc;
	}


	public void setOb_desc(String ob_desc) {
		this.ob_desc = ob_desc;
	}


	public String getCho1() {
		return cho1;
	}


	public void setCho1(String cho1) {
		this.cho1 = cho1;
	}


	public String getCho2() {
		return cho2;
	}


	public void setCho2(String cho2) {
		this.cho2 = cho2;
	}


	public String getCho3() {
		return cho3;
	}


	public void setCho3(String cho3) {
		this.cho3 = cho3;
	}


	public String getCho4() {
		return cho4;
	}


	public void setCho4(String cho4) {
		this.cho4 = cho4;
	}


	public String getCho5() {
		return cho5;
	}


	public void setCho5(String cho5) {
		this.cho5 = cho5;
	}


	@Override
	public String toString() {
		return "Qobtr [test_rslt_num=" + test_rslt_num + ", test_tmp_num="
				+ test_tmp_num + ", q_num=" + q_num + ", q_exp=" + q_exp
				+ ", wrong_count=" + wrong_count + ", set_count=" + set_count
				+ ", ob_sol=" + ob_sol + ", user_sol=" + user_sol + ", point="
				+ point + ", question=" + question + ", q_type=" + q_type
				+ ", ob_desc=" + ob_desc + ", cho1=" + cho1 + ", cho2=" + cho2
				+ ", cho3=" + cho3 + ", cho4=" + cho4 + ", cho5=" + cho5 + "]";
	}
	
	
	
	
}