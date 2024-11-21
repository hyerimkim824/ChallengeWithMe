$(function(){
	
	let visi = true;
	
	
	$('.dropdown-item').click(function(e) {
		e.preventDefault(); // 기본 동작 방지

		// 클릭된 항목의 data-category 값을 가져옴
		let category = $(this).data('category');
		let auth = $(this).data('auth');
		let categoryName = $(this).text(); // 클릭한 버튼의 텍스트 가져오기

		
		
		
		if($(this).hasClass('list-dd'))	
		{
			// 카테고리 버튼의 텍스트를 클릭한 항목의 이름으로 변경
			$('#categoryButton').text(categoryName);
			
			// AJAX 요청 전송
			$.ajax({
				url: 'challengeList.do', // 데이터를 전송할 서버 파일
			    type: 'POST',
			    data: { category: category } // category 데이터 전송
			           
			   });		
		}
		else if($(this).hasClass('create-dd')){
			$('#cate_num').val(category);
			$('.create-dd-btn').text(categoryName);
			$('#cat-warn').hide();
			
		}else if($(this).hasClass('auth-dd')){
			$('#ah_num').val(auth);
			$('#auth_btn').text(categoryName);
		}
	   
	   });
	
	$('.chc-visi').click(function(){ 
		if (visi) {
		    $('#visi_img').attr('src', '../images/lock.svg');
		    $('#visi_text').html("비공개");
			$('#visiState').val(0);
		    visi = false;
		} else {
		    $('#visi_img').attr('src', '../images/unlock.svg');
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
			
		};		
	});
	
	function showImg(){
		if(!$('#photoPath').val() == ""){
			$('#previewImage').show();
			$('#previewImage').attr('src',$('#photoPath').val());
			$('.image-reselectBtn').show();
			$('.image-text').hide();
			$('#imageBtn').hide();
		}
	}
	
	$('#create_form').submit(function(e){
		
		
		if($('#cate_num').val() == "" && $('#ah_num').val() != ""){
			$('.create-dd-btn')[0].scrollIntoView({behavior : 'smooth'});
			$('.cat-warn').show();
			$('.cat-dd').hide();
			e.preventDefault();
		}
		else if($('#cate_num').val() != "" && $('#ah_num').val() == ""){
			$('.info-title')[0].scrollIntoView({behavior : 'smooth'});
			$('.auth-warn').show();
			$('.cat-warn').hide();
			e.preventDefault();
		}else if($('#cate_num').val() == "" && $('#ah_num').val() == ""){
			$('.create-dd-btn')[0].scrollIntoView({behavior : 'smooth'});
			$('.auth-warn').show();
			$('.cat-warn').show();
			e.preventDefault();
		}
	});
	
	$('.ch-item').click(function(){
		alert('클릭되었습니다');
	});	
	
});