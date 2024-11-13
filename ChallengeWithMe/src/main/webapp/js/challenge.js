$(function(){
	
	$.ajax({
		url:'categoryList.do',
		type:'post',
		data:form_data,
		dataType:'json',
		success:function(param){
			$(document).on('click','#cat_item',function(){
				let cat_name = $('#cat_item').val();
				
			})
		}
	})
	
});