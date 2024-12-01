package kr.pvchallenge.vo;

import java.sql.Date;

public class PvChallengeVO {
	//기본 챌린지 정보
	private long ch_num; //챌린지 번호(PK)
	private long us_num; //유저 번호(FK)
	private int cat_num; //카테고리 번호(FK)
	
	//인증 게시판 정보
	private int ah_num; //인증글 고유 번호 (인증문구 작성시에 사용)
	private String ah_img; //인증 이미지
	private int ch_proved1;//인증 여부 1 : 인증, 0 : 인증 x
	
	private int check_num;
	public int getCheck_num() {
		return check_num;
	}
	public void setCheck_num(int check_num) {
		this.check_num = check_num;
	}
	public int getCh_proved1() {
		return ch_proved1;
	}
	public void setCh_proved1(int ch_proved1) {
		this.ch_proved1 = ch_proved1;
	}
	public int getCh_proved2() {
		return ch_proved2;
	}
	public void setCh_proved2(int ch_proved2) {
		this.ch_proved2 = ch_proved2;
	}
	public int getCh_proved3() {
		return ch_proved3;
	}
	public void setCh_proved3(int ch_proved3) {
		this.ch_proved3 = ch_proved3;
	}
	public int getCh_proved4() {
		return ch_proved4;
	}
	public void setCh_proved4(int ch_proved4) {
		this.ch_proved4 = ch_proved4;
	}
	public int getCh_proved5() {
		return ch_proved5;
	}
	public void setCh_proved5(int ch_proved5) {
		this.ch_proved5 = ch_proved5;
	}
	public int getCh_proved6() {
		return ch_proved6;
	}
	public void setCh_proved6(int ch_proved6) {
		this.ch_proved6 = ch_proved6;
	}
	private int ch_proved2;
	private int ch_proved3;
	private int ch_proved4;
	private int ch_proved5;
	private int ch_proved6;

	private String ah_date; //인증 날짜
	//private Date 인증 시간 변수 필요
	
	public long getCh_num() {
		return ch_num;
	}
	public void setCh_num(long ch_num) {
		this.ch_num = ch_num;
	}
	public long getUs_num() {
		return us_num;
	}
	public void setUs_num(long us_num) {
		this.us_num = us_num;
	}
	public int getCat_num() {
		return cat_num;
	}
	public void setCat_num(int cat_num) {
		this.cat_num = cat_num;
	}
	public int getAh_num() {
		return ah_num;
	}
	public void setAh_num(int ah_num) {
		this.ah_num = ah_num;
	}
	public String getAh_img() {
		return ah_img;
	}
	public void setAh_img(String ah_img) {
		this.ah_img = ah_img;
	}
	public int getCh_proved() {
		return ch_proved1;
	}
	public void setCh_proved(int ch_proved) {
		this.ch_proved1 = ch_proved;
	}
	public String getAh_date() {
		return ah_date;
	}
	public void setAh_date(String ah_date) {
		this.ah_date = ah_date;
	}

}
 