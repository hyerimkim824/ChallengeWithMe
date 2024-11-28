$(function(){
	
	let visi = true;
	
	
	
	function setDefault(){
		$('#visiState').val("0");
		$('#join_code').hide();	
	}
	
	$('.dropdown-item').click(function(e) {
		

		// 클릭된 항목의 data-category 값을 가져옴
		let category = $(this).data('category');
		let auth = $(this).data('auth');
		let categoryName = $(this).text(); // 클릭한 버튼의 텍스트 가져오기

		
		
		
		
		if($(this).hasClass('create-dd')){
			e.preventDefault(); // 기본 동작 방지
			$('#cate_num').val(category);
			$('.create-dd-btn').text(categoryName);
			$('#cat-warn').hide();
			
		}else if($(this).hasClass('auth-dd')){
			e.preventDefault(); // 기본 동작 방지
			$('#ah_num').val(auth);
			$('#auth_btn').text(categoryName);
		}
	   
	   });
	
	$('.chc-visi').click(function(){ 
		if (visi) {
		    $('#visi_img').attr('src', '../images/lock.svg');
		    $('#visi_text').html("비공개");
			$('#visiState').val("1");
			$('#join_code').show();
		    visi = false;
		} else {
		    $('#visi_img').attr('src', '../images/unlock.svg');
		    $('#visi_text').html("공개");
			$('#visiState').val("0");
			$('#join_code').hide();
		    visi = true;
		}
	});   
	      
	//이미지 등록
	$('#imageBtn').click(function(e){
		e.preventDefault();
		$('#fileInput').click();
	});
	
	//검색버튼 클릭
	$('.search-submitBtn').click(function(){
		$('#search_form').submit();
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
	
	
	
	$('.image-reselectBtn').click(function(e) {
		e.preventDefault();
	    $('#previewImage').hide(); 
	    $('#previewImage').attr('src', ''); 
	
	   
	    $('#fileInput').val(''); 

	    
	    $(this).hide(); 
	    $('.image-text').show();
	    $('#imageBtn').show(); 
	});
	
	$(document).on('click', '.item-heart', function () {
		
		let $clickedElement = $(this);
		let $imgElement = $clickedElement.find('img');
		
	    $.ajax({
	        url: 'challengeLike.do',
	        type: 'POST',
	        data: { ch_num: $(this).attr('data-chnum') },
			dataType: 'json',
	        success: function (param) {
				console.log("param:"+param.myLike)
				if(param.result=="logout"){
					alert('로그인 해야합니다');
				}else if(param.result=="success"){
					if(param.myLike=="do"){
						$imgElement.attr('src', '../images/red-heart.png');
					}else if(param.myLike=="undo"){
						$imgElement.attr('src', '../images/heart.png');
					}
					else{
						alert('no');
					}
					
				}else{
					alert('실패!');
				}
				
	        },
	        error: function () {
	            alert('네트워크 오류 발생!');
	        }
	    });
	});

	
	
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
	
	function showOfficialBtnColor(){
		const currentUrl = window.location.href;

		// 조건에 따라 버튼 CSS 변경
		if (currentUrl.includes("/challenge/challengeList.do")) {
		    $('.user-ch').css('background-color', '#FFE066');
			$('.admin-ch').css('background-color', '#FFFACD');
		} else if (currentUrl.includes("/challenge/challengeOfficialList.do")) {
			$('.user-ch').css('background-color', '#FFFACD');
			$('.admin-ch').css('background-color', '#FFE066');
		}
	}
	
	//인증 방식 선택 후 세부 사항 태그
	$('.auth-dd').click(function(){ 
		if($(this).attr('id') === 'auth_time'){
			$('#time_auth').show();
			$('#game_auth').hide();
		}else if($(this).attr('id') === 'auth_game'){
			$('#time_auth').hide();
			$('#game_auth').show();
		}else{
			$('#time_auth').hide();
			$('#game_auth').hide();
		}
	});   
	
	
	setDefault();
	showOfficialBtnColor();
	
});