package nhn.cistory.vo;

/*

//SELECT
SELECT
	q_num,
	question,
	q_type,
	grade,
	age,
	wrong_count,
	set_count,
	point,
	q_exp
FROM
	question
WHERE
	q_num = #qNum#
	AND question = #question#
	AND q_type = #qType#
	AND grade = #grade#
	AND age = #age#
	AND wrong_count = #wrongCount#
	AND set_count = #setCount#
	AND point = #point#
	AND q_exp = #qExp#

//INSERT
INSERT INTO question
(
	q_num,
	question,
	q_type,
	grade,
	age,
	wrong_count,
	set_count,
	point,
	q_exp
)
VALUES
(
	#qNum#,
	#question#,
	#qType#,
	#grade#,
	#age#,
	#wrongCount#,
	#setCount#,
	#point#,
	#qExp#
)

//UPDATE
UPDATE
	question
SET
	q_num = #qNum#,
	question = #question#,
	q_type = #qType#,
	grade = #grade#,
	age = #age#,
	wrong_count = #wrongCount#,
	set_count = #setCount#,
	point = #point#,
	q_exp = #qExp#
WHERE
	q_num = #qNum#
	AND question = #question#
	AND q_type = #qType#
	AND grade = #grade#
	AND age = #age#
	AND wrong_count = #wrongCount#
	AND set_count = #setCount#
	AND point = #point#
	AND q_exp = #qExp#

//DELETE
DELETE FROM
	question
WHERE
	q_num = #qNum#
	AND question = #question#
	AND q_type = #qType#
	AND grade = #grade#
	AND age = #age#
	AND wrong_count = #wrongCount#
	AND set_count = #setCount#
	AND point = #point#
	AND q_exp = #qExp#

*/

/**
* Table name : question
* Generated by CUBRID Tools.
*/
public class Question {
	private Integer q_num = null;
	private String question = null;
	private String q_type = null;
	private String grade = null;
	private String age = null;
	private Integer wrong_count = null;
	private Integer set_count = null;
	private Integer point = null;
	private String q_exp = null;

	public Question(){
		
	}
	
	public Question(Integer q_num, String question, String q_type,
			String grade, String age, Integer wrong_count, Integer set_count,
			Integer point, String q_exp) {
		super();
		this.q_num = q_num;
		this.question = question;
		this.q_type = q_type;
		this.grade = grade;
		this.age = age;
		this.wrong_count = wrong_count;
		this.set_count = set_count;
		this.point = point;
		this.q_exp = q_exp;
	}

	public Integer getQ_num() {
		return q_num;
	}
	
	public void setQ_num(Integer q_num) {
		this.q_num = q_num;
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
	
	public String getGrade() {
		return grade;
	}
	
	public void setGrade(String grade) {
		this.grade = grade;
	}
	
	public String getAge() {
		return age;
	}
	
	public void setAge(String age) {
		this.age = age;
	}
	
	public Integer getWrong_count() {
		return wrong_count;
	}
	public void setWrong_count(Integer wrong_count) {
		this.wrong_count = wrong_count;
	}
	public Integer getSet_count() {
		return set_count;
	}
	public void setSet_count(Integer set_count) {
		this.set_count = set_count;
	}
	public Integer getPoint() {
		return point;
	}
	
	public void setPoint(Integer point) {
		this.point = point;
	}
	
	public String getQ_exp() {
		return q_exp;
	}
	
	public void setQ_exp(String q_exp) {
		this.q_exp = q_exp;
	}

	@Override
	public String toString() {
		return "Question [q_num=" + q_num + ", question=" + question
				+ ", q_type=" + q_type + ", grade=" + grade + ", age=" + age
				+ ", wrong_count=" + wrong_count + ", set_count=" + set_count
				+ ", point=" + point + ", q_exp=" + q_exp + "]";
	}
}
