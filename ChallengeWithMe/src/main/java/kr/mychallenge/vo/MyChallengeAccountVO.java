package kr.mychallenge.vo;

public class MyChallengeAccountVO {
	
	private long us_num; //유저 번호
	private long ac_num; //가계부 번호
	private String ac_date; //가계부 입력 날짜
	private String ac_content; //가계부 내용
	private Double ac_income; //입금
	private Double ac_outcome; //츌금
	private Double ac_bal; //잔돈
	private int ac_card; //카드사용
	private int ac_money; //현금사용
	private String ac_memo; //메모 내용

	
	public long getUs_num() {
		return us_num;
	}
	public void setUs_num(long us_num) {
		this.us_num = us_num;
	}
	public long getAc_num() {
		return ac_num;
	}
	public void setAc_num(long ac_num) {
		this.ac_num = ac_num;
	}
	public String getAc_date() {
		return ac_date;
	}
	public void setAc_date(String ac_date) {
		this.ac_date = ac_date;
	}
	public String getAc_content() {
		return ac_content;
	}
	public void setAc_content(String ac_content) {
		this.ac_content = ac_content;
	}
	public Double getAc_income() {
		return ac_income;
	}
	public void setAc_income(Double ac_income) {
		this.ac_income = ac_income;
	}
	public Double getAc_outcome() {
		return ac_outcome;
	}
	public void setAc_outcome(Double ac_outcome) {
		this.ac_outcome = ac_outcome;
	}
	public Double getAc_bal() {
		return ac_bal;
	}
	public void setAc_bal(Double ac_bal) {
		this.ac_bal = ac_bal;
	}
	public int getAc_card() {
		return ac_card;
	}
	public void setAc_card(int ac_card) {
		this.ac_card = ac_card;
	}
	public int getAc_money() {
		return ac_money;
	}
	public void setAc_money(int ac_money) {
		this.ac_money = ac_money;
	}
	public String getAc_memo() {
		return ac_memo;
	}
	public void setAc_memo(String ac_memo) {
		this.ac_memo = ac_memo;
	}
	
}
