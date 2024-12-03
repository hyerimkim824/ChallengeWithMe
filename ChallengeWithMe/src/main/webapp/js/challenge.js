$(function(){
	
	let visi = true;
	let isOfficial = false;
	let isVisible = false;
	
	
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
		console.log("visi clicked");
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
	
	$('.chc-official').click(function(){ 
		console.log("offi clicked");
		if (isOfficial) {
			$('#official_text').html("사용자 챌린지");
			$('.chc-official').css('background-color', '#99FF99');
			$('#officialState').val("0");
			isOfficial = false;
		} else {
			$('#official_text').html("공식 챌린지");
			$('.chc-official').css('background-color', '#99FFFF');
			$('#officialState').val("1");
			isOfficial = true;
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
		
		console.log("1");
		
		if($('#cate_num').val() == "" && $('#ah_num').val() != ""){
			$('.create-dd-btn')[0].scrollIntoView({behavior : 'smooth'});
			$('.cat-warn').show();
			$('.cat-dd').hide();
			e.preventDefault();
			console.log("2");
		}
		else if($('#cate_num').val() != "" && $('#ah_num').val() == ""){
			$('.info-title')[0].scrollIntoView({behavior : 'smooth'});
			$('.auth-warn').show();
			$('.cat-warn').hide();
			e.preventDefault();
			console.log("3");
		}else if($('#cate_num').val() == "" && $('#ah_num').val() == ""){
			$('.create-dd-btn')[0].scrollIntoView({behavior : 'smooth'});
			$('.auth-warn').show();
			$('.cat-warn').show();
			e.preventDefault();
			console.log("4");
		}
		console.log("5");
		//checkPeopleNum(e);
		//checkIfEndDateBeforeStartDate(e);
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
		}	
		else{
			$('#time_auth').hide();
			
		}
	}); 
	
	$('.game-item').click(function(){
		if($(this).attr('id') == 'game1'){
			$('#game1').find('img').css('border', '2px solid black');
			$('#game2').find('img').css('border', '1px solid white');
			$('#game').val('1');
		}
		else if($(this).attr('id') == 'game2'){
			$('#game').val('2');
			$('#game1').find('img').css('border', '1px solid white');
			$('#game2').find('img').css('border', '2px solid black');
		}else{
			alert('게임 선택 에러');
		}
	});
	
	$('#chd_submit').click(function(){
		$('.confirm-join').css('display','flex');
		$('.confirm-box')[0].scrollIntoView({behavior : 'smooth'});
		$('.confirm-join').show();
		
	});
	
	$('#cbtn_back').click(function(){
		$('.confirm-join').css('display','none');
		$('.confirm-join').hide();
	});
	
	
	//필터 버튼 클릭 애니메이션 기능
	$('.filter-btn').click(function () {
	       const items = $('.dd1, .dd2, .dd3');

	       if (!isVisible) {
	           // 버튼을 왼쪽에서 오른쪽으로 이동하며 보이기 시작
	           items.each(function (index) {
	               const element = $(this);

	               // 애니메이션 지연 효과 추가
	               setTimeout(() => {
	                   element.removeClass('hidden').addClass('visible');
	               }, index * 10); // 순차적으로 지연
	           });
	       } else {
	           // 버튼을 오른쪽에서 왼쪽으로 이동하며 숨김
	           items.each(function (index) {
	               const element = $(this);

	               // 애니메이션 지연 효과 추가
	               setTimeout(() => {
	                   element.removeClass('visible').addClass('hidden');
	               }, index * 10); // 순차적으로 지연
	           });
	       }

	       isVisible = !isVisible; // 상태를 반전
	  });
	
	
	function restrictDateFromToday(){
		const today = new Date().toISOString().split('T')[0];
		$('#chc_start').attr('min', today);
		$('#chc_end').attr('min', today);
		
	}
	
	function checkIfEndDateBeforeStartDate(e){
		const start_date = $('#chc_start').val();
		const end_date = $('#chc_end').val();
				
		if(start_date && end_date){
			if(new Date(end_date) < new Date(start_date)){
				
				$('.extra-info')[0].scrollIntoView({behavior : 'smooth'});
				$('.duration-warn').show();
				e.preventDefault();
			}
		}
	}
	
	function checkPeopleNum(e){
		
		const min = parseInt($('.min-people').val(), 10);
		const max = parseInt($('.max-people').val(), 10);
		
		if(min && max)
		{
			if(min > max)
			{
				$('.member-warn').show();
				$('.extra-info')[0].scrollIntoView({behavior : 'smooth'});
				e.preventDefault();	
			}
		}	
	}
	
	
	
	
	
	setDefault();
	showOfficialBtnColor();
	restrictDateFromToday();
	
});