package kr.trans.vo;

import java.sql.Date;

public class TransVO {
	private long trans_num;
	private Date trans_date;
	private int trans_bal;
	private int trans_type;
	private long ch_num;
	private long to_num;
	private long from_num;
	
	public long getTrans_num() {
		return trans_num;
	}
	public void setTrans_num(long trans_num) {
		this.trans_num = trans_num;
	}
	public Date getTrans_date() {
		return trans_date;
	}
	public void setTrans_date(Date trans_date) {
		this.trans_date = trans_date;
	}
	public int getTrans_bal() {
		return trans_bal;
	}
	public void setTrans_bal(int trans_bal) {
		this.trans_bal = trans_bal;
	}
	public int getTrans_type() {
		return trans_type;
	}
	public void setTrans_type(int trans_type) {
		this.trans_type = trans_type;
	}
	public long getCh_num() {
		return ch_num;
	}
	public void setCh_num(long ch_num) {
		this.ch_num = ch_num;
	}
	public long getTo_num() {
		return to_num;
	}
	public void setTo_num(long to_num) {
		this.to_num = to_num;
	}
	public long getFrom_num() {
		return from_num;
	}
	public void setFrom_num(long from_num) {
		this.from_num = from_num;
	}
	
	
}
