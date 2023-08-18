$(document).ready(function () {
	
	$('.openmodal').click(function(){
		var expamount = $('#expamount').data('exp');
		if (expamount >= $(this).data('price')) {
			$('.buyingwhat').text('구매하려는 아이템 : ' + $(this).data('item'));
			$('.howmuch').text('소모 경험치 : ' + $(this).data('price') + ' exp.');
			$('.moex').removeAttr('class').addClass('moex ' + $(this).data('item'));
			$('#item').val($(this).data('item'));
			$('#price').val($(this).data('price'));
			$('#modal-container').removeAttr('class').addClass('one');
  			$('body').addClass('modal-active');
  			$('.modalyes').css("display","unset");
  			$('.noc').text("아니오");
		} else {
			$('.buyingwhat').text('이런... 경험치가 부족합니다!');
			$('.howmuch').text('부족한 경험치 : ' + ($(this).data('price') - expamount)  + " exp.");
			$('.moex').removeAttr('class').addClass('moex ' + $(this).data('item'));
			$('#modal-container').removeAttr('class').addClass('one');
  			$('body').addClass('modal-active');
  			$('.modalyes').css("display","none");
  			$('.noc').text("돌아가기");
		}
  		
	});

	$('.yesc').click(function(){
  		$('#itembuy').submit();
	});
			
	$('.noc').click(function(){
		$('#item').val('');
  		$('#modal-container').addClass('out');
 		$('body').removeClass('modal-active');
	});
});
