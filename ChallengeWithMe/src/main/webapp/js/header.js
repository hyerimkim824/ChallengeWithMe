$(function(){
	
	let profileOn = false;
	
	$('.profile_img').click(function(){
		if(!profileOn){
			$('.myBrief').show();
			profileOn = true;
		}else{
			$('.myBrief').hide();
			profileOn = false;
		}
		
	});
});