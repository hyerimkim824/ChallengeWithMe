$(function(){
	
	function countPart(){
		
		//서버와 통신
		
		$.ajax({
			url:'myChallengePartNum.do',
			type:'post',
			data:{us_num:$('#partnum').attr('value')}
		})
	}
	
});