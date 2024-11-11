package kr.post.vo;

import java.sql.Date;

public class PostCommVO {
	private long com_num;//댓글 번호
	private long post_num;//글 번호
	private long us_num;//유저 번호
	private String com_content;//댓글 내용
	private Date date;//댓글 작성일
	
	private String us_nickname;//유저의 닉네임
	private String us_img;//유저 프로필 이미지
	
	
	public long getCom_num() {
		return com_num;
	}
	public void setCom_num(long com_num) {
		this.com_num = com_num;
	}
	public long getPost_num() {
		return post_num;
	}
	public void setPost_num(long post_num) {
		this.post_num = post_num;
	}
	public long getUs_num() {
		return us_num;
	}
	public void setUs_num(long us_num) {
		this.us_num = us_num;
	}
	public String getCom_content() {
		return com_content;
	}
	public void setCom_content(String com_content) {
		this.com_content = com_content;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
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
