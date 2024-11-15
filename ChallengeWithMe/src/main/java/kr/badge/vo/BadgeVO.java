package kr.badge.vo;

import java.sql.Date;

public class BadgeVO {
	// 뱃지 정보
	private long bg_num;
	private String bg_img;
	private String bg_name;
	private String bg_desc;
	
	// 유저 뱃지
	private Date bg_date;
	private long us_num;
	
	public long getBg_num() {
		return bg_num;
	}
	public void setBg_num(long bg_num) {
		this.bg_num = bg_num;
	}
	public String getBg_img() {
		return bg_img;
	}
	public void setBg_img(String bg_img) {
		this.bg_img = bg_img;
	}
	public String getBg_name() {
		return bg_name;
	}
	public void setBg_name(String bg_name) {
		this.bg_name = bg_name;
	}
	public String getBg_desc() {
		return bg_desc;
	}
	public void setBg_desc(String bg_desc) {
		this.bg_desc = bg_desc;
	}
	public Date getBg_date() {
		return bg_date;
	}
	public void setBg_date(Date bg_date) {
		this.bg_date = bg_date;
	}
	public long getUs_num() {
		return us_num;
	}
	public void setUs_num(long us_num) {
		this.us_num = us_num;
	}
	
}
