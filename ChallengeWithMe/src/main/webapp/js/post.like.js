$(function(){
	
	/* ================================
	 * 좋아요 선택 여부와 선택한 총 개수 읽기
	 * ================================ */
	function selectlike(){
		//서버와 통신
		$.ajax({
			url:'getLike.do',
			type:'post',
			data:{post_num:$('#output_like').attr('data-num')},
			dataType:'json',
			success:function(param){
				displayLike(param);
			},
			error:function(){
				alert('네트워크 오류 발생');
			}
		});
	}
	
	/* ================================
	 * 좋아요 등록 및 삭제 이벤트 연결
	 * ================================ */
	 $('#output_like').click(function(){
		//서버와 통신
		$.ajax({
			url:'writeLike.do',
			type:'post',
			data:{post_num:$('#output_like').attr('data-num')},
			dataType:'json',
			success:function(param){
			if(param.result=='success'){
				displayLike(param);
			}else{
				alert('좋아요 등록 또는 삭제 오류 발생');
			}
			},
			error:function(){
				alert('네트워크 오류 발생');
			}
		});
	 });
	
	
	/* ================================
	 * 좋아요 클릭 시 화면에 나타나는 표시
	 * ================================ */
	 function displayLike(param){
		let output;
		if(param.status == 'yesLike'){
			//좋아요 선택
			console.log("yeslog 클릭돔");
			output = '../images/hj_fill-heart.png';
			}else {
			//좋아요 미선택	
			output = '../images/hj_heart.png';
		    }
			//문서 객체에 설정
			$('#output_like').attr('src', output);
			$('#output_likecount').text(param.count);
		}
	
	/* ================================
	 * 좋아요 클릭 시 화면에 나타나는 표시
	 * ================================ */
	selectlike();
});