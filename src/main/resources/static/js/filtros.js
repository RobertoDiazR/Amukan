$(document).ready(function(){
	$('.btn-inicio .w-100[category="Todo"]').addClass('option');
	
	$('.w-100').click(function(){
		var catLugar = $(this).attr('category');
		console.log(catLugar);
		$('.w-100').removeClass('option');
		$(this).addClass('option');
		
		$('.acceso').hide();
		
		$('.acceso[category="'+catLugar+'"]').show();
	});
	
	$('.w-100[category="Todo"]').click(function(){
		$('.acceso').show();
	});
});