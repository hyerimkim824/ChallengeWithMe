$(function(){
	
	let visi = true;
	
	
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
	
	$('.chc-visi').click(function(){
		var contextPath = $('#contextPath').val();       
		if (visi) {
		    $('#visi_img').attr('src', contextPath + '/images/lock.svg');
		    $('#visi_text').html("비공개");
			$('#visiState').val(0);
		    visi = false;
		} else {
		    $('#visi_img').attr('src', contextPath + '/images/unlock.svg');
		    $('#visi_text').html("공개");
			$('#visiState').val(1);
		    visi = true;
		}
	});   
	      
	//이미지 등록
	$('#imageBtn').click(function(e){
		e.preventDefault();
		$('#fileInput').click();
	});
		
			
	let photo_path = $('#previewImage').attr('src');	
	$('#fileInput').change(function(){
		$('#previewImage').show();
		$('.image-reselectBtn').show();
		$('.image-text').hide();
		$('#imageBtn').hide();
			
		let my_photo = this.files[0];
		if(!my_photo){
			//선택을 취소하면 원래 처음 화면으로 되돌림
			$('#previewImage').attr('src',photo_path);
			alert('파일 선택 안됨');
			return;
		}
			
		//화면에서 이미지 미리보기
		const reader = new FileReader();
		reader.readAsDataURL(my_photo);
						
		reader.onload=function(){
			$('#previewImage').attr('src',reader.result);
			let updated_path = $('#previewImage').attr('src');
			$('#photoPath').val(updated_path);
		};		
	});
	   		
	
});