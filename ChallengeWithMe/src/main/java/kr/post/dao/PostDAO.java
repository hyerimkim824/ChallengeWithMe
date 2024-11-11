package kr.post.dao;

public class PostDAO {
	//싱글턴 패턴
	private static PostDAO instance = new PostDAO();
	
	public static PostDAO getInstance() {
		return instance;
	}
	private PostDAO() {}

	//글 등록
	//전체 글 개수/검색 글 개수
	//전체 글 목록/검색 글 목록
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
	//댓륵 개수
	//댓글 목록
	//댓글 상세
	//댓글 수정
	//댓글 삭제
}
