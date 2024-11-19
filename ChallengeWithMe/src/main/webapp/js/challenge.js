$(function(){
	
	$('.dropdown-item').click(function(e) {
		e.preventDefault(); // 기본 동작 방지

		// 클릭된 항목의 data-category 값을 가져옴
		let category = $(this).data('category');
		let categoryName = $(this).text(); // 클릭한 버튼의 텍스트 가져오기

		// 카테고리 버튼의 텍스트를 클릭한 항목의 이름으로 변경
		$('#categoryButton').text(categoryName);
			
	    // AJAX 요청 전송
	    $.ajax({
			url: 'challengeList.do', // 데이터를 전송할 서버 파일
	        type: 'POST',
	        data: { category: category } // category 데이터 전송
	           
	       });
	   });
	   
	   //이미지 등록
	   $('#imageBtn').click(function(){
	   			$(this).hide();//수정 버튼 감추기
				$('#fileInput').click();
	   		});
	   		
	
});