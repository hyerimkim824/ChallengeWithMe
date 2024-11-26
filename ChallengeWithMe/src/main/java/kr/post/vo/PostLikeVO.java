package kr.post.vo;

public class PostLikeVO {
	private long post_num;//글 번호
	private long us_num;//유저 번호
	
	public PostLikeVO() {}
	
	public PostLikeVO(long post_num,long us_num) {
		this.post_num = post_num;
		this.us_num = us_num;
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

	
}
