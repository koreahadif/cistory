package nhn.cistory.vo;

public class MyNote extends History{
	private int my_no_num;
	private String id;
	private String my_no_memo;
	
	public MyNote(){
		
	}

	public MyNote(int my_no_num, String id, String my_no_memo) {
		super();
		this.my_no_num = my_no_num;
		this.id = id;
		this.my_no_memo = my_no_memo;
	}

	public MyNote(int htr_num, String htr_keyrd, String htr_imguri,
			String htr_desc, String htr_tag, String htr_type, String htr_age, String htr_date) {
		super(htr_num, htr_keyrd, htr_imguri, htr_desc, htr_tag, htr_type, htr_age, htr_date);
		// TODO Auto-generated constructor stub
	}

	public int getMy_no_num() {
		return my_no_num;
	}

	public void setMy_no_num(int my_no_num) {
		this.my_no_num = my_no_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getMy_no_memo() {
		return my_no_memo;
	}

	public void setMy_no_memo(String my_no_memo) {
		this.my_no_memo = my_no_memo;
	}

	@Override
	public String toString() {
		return "MyNote [my_no_num=" + my_no_num + ", id=" + id
				+ ", my_no_memo=" + my_no_memo + ", history()="
				+ super.toString() + "]";
	}
}
