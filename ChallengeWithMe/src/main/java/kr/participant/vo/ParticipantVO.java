package kr.participant.vo;

public class ParticipantVO {
	private long us_num;
	private long ch_num;
	private String p_stat;
	private String p_date;
	private String end_date;
	
	public long getUs_num() {
		return us_num;
	}
	public void setUs_num(long us_num) {
		this.us_num = us_num;
	}
	public long getCh_num() {
		return ch_num;
	}
	public void setCh_num(long ch_num) {
		this.ch_num = ch_num;
	}
	public String getP_stat() {
		return p_stat;
	}
	public void setP_stat(String p_stat) {
		this.p_stat = p_stat;
	}
	public String getP_date() {
		return p_date;
	}
	public void setP_date(String p_date) {
		this.p_date = p_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
}
