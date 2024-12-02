$(function(){
	$('.amount-option').click(function(){
		$('.amount-option').css('background-color', 'transparent');
		$(this).css('background-color', 'skyblue');
		$('#selected_amount').html($(this).html());
		const optionValue = $(this).html();
		if (optionValue) {
		   $('#money').val(optionValue.slice(0, optionValue.length - 1));
		   console.log($('#money').val());
	   } else {
		   console.warn('선택된 옵션에 값이 없습니다.');
	   }
	});
	
	$('#charge_amount').on('input', function(){
	        // 입력된 값을 가져옴
			$('.amount-option').css('background-color', 'transparent');
	        const inputValue = $(this).val();
			if (inputValue.length > 6) {
				$(this).val(inputValue.slice(0, 6));
			}
	        $('#selected_amount').html(inputValue + "원");
			$('#money').val(inputValue);
	    });
});