package kr.post.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.post.vo.PostVO;
import kr.util.DBUtil;
import kr.util.StringUtil;

public class PostDAO {
	//싱글턴 패턴
	private static PostDAO instance = new PostDAO();
	
	public static PostDAO getInstance() {
		return instance;
	}
	private PostDAO() {}
 
	//글 등록
	public void insertPost(PostVO post)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			//커넥션풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			//sql문 작성
			sql = "INSERT INTO post (post_num,post_img,post_title,post_content,us_num) VALUES (post_seq.nextval,?,?,?,?,?)";
			//PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			//?에 데이터 바인딩
			pstmt.setLong(1, post.getPost_num());
			pstmt.setString(2, post.getUs_img());
			pstmt.setString(3, post.getTitle());
			pstmt.setString(4, post.getContent());
			pstmt.setLong(5, post.getUs_num());
			//SQL문 실행
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally{
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	//전체 글 개수/검색 글 개수
	public int getPostCount(String keyfield,String keyword)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		String sub_sql = "";
		int count = 0;
		
		try {
			//커넥션풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			//검색처리
			if(keyword!=null && !"".equals(keyword)) {
				if(keyfield.equals("1")) sub_sql += "WHERE us_nickname LIKE '%' || ? || '%'";
				else if(keyfield.equals("2")) sub_sql += "WHERE title LIKE '% || ? || '%'";
				else if(keyfield.equals("3")) sub_sql += "WHERE content LIKE '% || ? || '%'";
			}
			//sql문 작성
			sql = "SELECT COUNT(*) FROM post JOIN xuser USING(us_num)" + sub_sql;
			//PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			//?에 데이터 바인딩
			if(keyword !=null && !"".equals(keyword)) {
				pstmt.setString(1, keyword);
			}
			//sql문 실행
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		}catch(Exception e){
			throw new Exception(e);
			
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return count;
	}
	
	
	//전체 글 목록/검색 글 목록
	public List<PostVO> getListPost(int start,int end,String keyfield,String keyword)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<PostVO> list = null;
		String sql = null;
		String sql_sub = "";
		int cnt = 0;

		try {
			//커넥션 풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			
			//sql문 작성
			if(keyword != null && !"".equals(keyword)) {
				//1 : 작성자 닉네임, 2 : 제목, 3 : 내용
				if(keyfield.equals("1")) sql_sub += "WHERE us_nickname LIKE '%' || ? || '%'";
				else if(keyfield.equals("2")) sql_sub += "WHERE post_title LIKE '%' || ? || '%'";
				else if(keyfield.equals("3")) sql_sub += "WHERE post_content LIKE '%' || ? || '%'";
			}
			
			sql = "SELECT * FROM (SELECT a.*, rownum rnum FROM"
					+ "(SELECT * FROM post JOIN xuser USING(us_num) " + sql_sub + " ORDER BY post_num DESC)a) WHERE rnum >= ? AND rnum <= ?";
			
			//PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			if(keyword != null && !"".equals(keyword)) {
				pstmt.setString(++cnt, keyword);
			}
			pstmt.setInt(++cnt, start);
			pstmt.setInt(++cnt, end);
			
			//sql문 실행
			rs = pstmt.executeQuery();
			list = new ArrayList<PostVO>();
			while(rs.next()) {
				PostVO post = new PostVO();
				post.setUs_img(rs.getString(rs.getString("us_img")));
				post.setUs_nickname(rs.getString("nickname"));
				post.setDate(rs.getDate("date"));
				//제목 html 태그 불허용
				post.setTitle(StringUtil.useNoHtml("date"));
				
				list.add(post);
			}


		}catch (Exception e){
			throw new Exception(e);

		}finally {
			DBUtil.executeClose(null, pstmt, conn);
			
		}
		return list;
	}
	
	
	
	//글 상세->한건의 레코드 불러오기
	//조회수 증가
	//파일 삭제
	//글 수정
	//글 삭제
	//좋아요 개수
	//회원번호와 게시물 번호를 이용한 좋아요 정보
	//좋아요 등록
	//좋아요 삭제
	//좋아요 목록(=찜 목록)
	//내가 선택한 좋아요 목록 -> 게시판 목록의 정보 보여져야함 List<PostVO>
	//댓글 등록
	//댓글 개수
	//댓글 목록
	//댓글 상세
	//댓글 수정
	//댓글 삭제
}
