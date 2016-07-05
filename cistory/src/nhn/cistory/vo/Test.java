package nhn.cistory.vo;

/**
 * Table name : test
 * Generated by CUBRID Tools.
 */
public class Test {
	private Integer test_num = null;
	private String id = null;
	private Integer score = null;
	private String test_start_time = null;
	private String test_end_time = null;

	public Test() {
		super();
	}

	public Test(String startDate, String endDate) {
		this.test_start_time = startDate;
		this.test_end_time = endDate;
	}

	public Test(Integer testNum, String id, Integer score, String testStartTime,
			String testEndTime) {
		super();
		this.test_num = testNum;
		this.id = id;
		this.score = score;
		this.test_start_time = testStartTime;
		this.test_end_time = testEndTime;
	}

	public Test(String startDate, String endDate, String id) {
		this.test_start_time = startDate;
		this.test_end_time = endDate;
		this.id = id;
		
	}

	/**
	 * testNum (integer)
	 *
	 * @return testNum
	 */
	public Integer getTestNum() {
		return test_num;
	}

	/**
	 * testNum (integer)
	 *
	 * @param testNum
	 */
	public void setTestNum(Integer testNum) {
		this.test_num = testNum;
	}

	/**
	 * id (character varying)
	 *
	 * @return id
	 */
	public String getId() {
		return id;
	}

	/**
	 * id (character varying)
	 *
	 * @param id
	 */
	public void setId(String id) {
		this.id = id;
	}

	/**
	 * score (integer)
	 *
	 * @return score
	 */
	public Integer getScore() {
		return score;
	}

	/**
	 * score (integer)
	 *
	 * @param score
	 */
	public void setScore(Integer score) {
		this.score = score;
	}

	/**
	 * testStartTime (datetime)
	 *
	 * @return testStartTime
	 */
	public String getTestStartTime() {
		return test_start_time;
	}

	/**
	 * testStartTime (datetime)
	 *
	 * @param testStartTime
	 */
	public void setTestStartTime(String testStartTime) {
		this.test_start_time = testStartTime;
	}

	/**
	 * testEndTime (datetime)
	 *
	 * @return testEndTime
	 */
	public String getTestEndTime() {
		return test_end_time;
	}

	/**
	 * testEndTime (datetime)
	 *
	 * @param testEndTime
	 */
	public void setTestEndTime(String testEndTime) {
		this.test_end_time = testEndTime;
	}

}
