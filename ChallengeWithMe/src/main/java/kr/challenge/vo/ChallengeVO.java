package kr.challenge.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class ChallengeVO {
	private Long ch_num;
	private String ch_title;
	private String ch_desc;
	private String ch_start;
	private String ch_end;
	private String ch_img;
	private int ch_min;
	private int ch_max;
	private int ch_like;
	private int ch_view;
	private int ch_person;
	private int ch_visi;
	private int trans_bal;
	private int official;
	private String ch_status;
	private Long us_num;
	private int cate_num;
	private String cate_name;
	private int ch_authd;
	private int ahDetail_num;
	
	private String us_nickname;
	private String us_img;
	
	
	private long dateDifference;
	
	public String getCate_name() {
		return cate_name;
	}
	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
	}
	public Long getCh_num() {
		return ch_num;
	}
	public void setCh_num(Long ch_num) {
		this.ch_num = ch_num;
	}
	
	
	public String getCh_title() {
		return ch_title;
	}
	public void setCh_title(String ch_title) {
		this.ch_title = ch_title;
	}
	
	
	public String getCh_desc() {
		return ch_desc;
	}
	public void setCh_desc(String ch_desc) {
		this.ch_desc = ch_desc;
	}
	
	
	public String getCh_start() {
		return ch_start;
	}
	public void setCh_start(String ch_start) {
		this.ch_start = ch_start;
	}
	
	
	public String getCh_end() {
		return ch_end;
	}
	public void setCh_end(String ch_end) {
		this.ch_end = ch_end;
	}
	
	
	public String getCh_img() {
		return ch_img;
	}
	public void setCh_img(String ch_img) {
		this.ch_img = ch_img;
	}
	
	public int getCh_max() {
		return ch_max;
	}
	public void setCh_max(int ch_max) {
		this.ch_max = ch_max;
	}
	
	public int getCh_min() {
		return ch_min;
	}
	public void setCh_min(int ch_min) {
		this.ch_min = ch_min;
	}
	
	public int getCh_like() {
		return ch_like;
	}
	public void setCh_like(int ch_like) {
		this.ch_like = ch_like;
	}
	public int getCh_view() {
		return ch_view;
	}
	public void setCh_view(int ch_view) {
		this.ch_view = ch_view;
	}
	
	public int getCh_person() {
		return ch_person;
	}
	public void setCh_person(int ch_person) {
		this.ch_person = ch_person;
	}
	
	
	public int getCh_visi() {
		return ch_visi;
	}
	public void setCh_visi(int ch_visi) {
		this.ch_visi = ch_visi;
	}
	
	
	public int getTrans_bal() {
		return trans_bal;
	}
	public void setTrans_bal(int trans_bal) {
		this.trans_bal = trans_bal;
	}
	
	
	public int getOfficial() {
		return official;
	}
	public void setOfficial(int official) {
		this.official = official;
	}
	
	
	public String getCh_status() {
		return ch_status;
	}
	public void setCh_status(String ch_status) {
		this.ch_status = ch_status;
	}
	
	
	public Long getUs_num() {
		return us_num;
	}
	public void setUs_num(Long us_num) {
		this.us_num = us_num;
	}
	
	
	public int getCate_num() {
		return cate_num;
	}
	public void setCate_num(int cate_num) {
		this.cate_num = cate_num;
	}
	
	public int getCh_authd() {
		return ch_authd;
	}
	public void setCh_authd(int ch_authd) {
		this.ch_authd = ch_authd;
	}
	
	public int getAh_num() {
		return ahDetail_num;
	}
	public void setAh_num(int ah_num) {
		this.ahDetail_num = ah_num;
	}
	
	public void calDate_diff() {
		try {
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	        
	        // 날짜 문자열을 Date 객체로 변환
	        Date startDate = sdf.parse(ch_start);
	        Date endDate = sdf.parse(ch_end);
	        
	        // 날짜 차이를 계산 (밀리초 단위)
	        long diffInMillis = endDate.getTime() - startDate.getTime();
	        
	        // 밀리초를 일 단위로 변환
	        long diffInDays = diffInMillis / (1000 * 60 * 60 * 24);
	        
	        this.dateDifference = diffInDays;  // 날짜 차이 저장
	    } catch (Exception e) {
	        e.printStackTrace();
	    } 
	}
	
	public long getDateDifference() {
		calDate_diff();
		return dateDifference;
	}
	public void setDateDifference(long dateDifference) {
		this.dateDifference = dateDifference;
	}
	public int getAhDetail_num() {
		return ahDetail_num;
	}
	public void setAhDetail_num(int ahDetail_num) {
		this.ahDetail_num = ahDetail_num;
	}
	public String getUs_nickname() {
		return us_nickname;
	}
	public void setUs_nickname(String us_nickname) {
		this.us_nickname = us_nickname;
	}
	public String getUs_img() {
		return us_img;
	}
	public void setUs_img(String us_img) {
		this.us_img = us_img;
	}
	
	
	
	
	
}
