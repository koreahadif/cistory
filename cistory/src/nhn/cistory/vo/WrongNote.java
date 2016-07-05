package nhn.cistory.vo;

public class WrongNote extends Testresult{
	private int wr_no_num;
	private String wr_no_memo;
	
	public WrongNote(){
	
	}

	public WrongNote(int wr_no_num, String wr_no_memo) {
		super();
		this.wr_no_num = wr_no_num;
		this.wr_no_memo = wr_no_memo;
	}

	public WrongNote(Integer testNum, String id, Integer score,
			String testStartTime, String testEndTime) {
		super(testNum, id, score, testStartTime, testEndTime);
		// TODO Auto-generated constructor stub
	}

	public int getWr_no_num() {
		return wr_no_num;
	}

	public void setWr_no_num(int wr_no_num) {
		this.wr_no_num = wr_no_num;
	}

	public String getWr_no_memo() {
		return wr_no_memo;
	}

	public void setWr_no_memo(String wr_no_memo) {
		this.wr_no_memo = wr_no_memo;
	}

	@Override
	public String toString() {
		return "WrongNote [wr_no_num=" + wr_no_num
				+ ", wr_no_memo=" + wr_no_memo + ", TestResult()="
				+ super.toString() + "]";
	}
}
