$(function(){

	const stars = $('.Star');
	let index;

	$('.Star').click(function(){
		index = $('.Star').index($(this));
		for(let j=0; j<stars.length; j++){
			stars.eq(j).css('color', 'silver')
		}
		for(let j=0; j<=index; j++){
			stars.eq(j).css('color', 'orange')
		}
		$('#rating-value').val(index + 1);
		$('#rating-value-display').text(index + 1);
	})

	$('.Star').hover(
		function(){
			let i = $('.Star').index($(this));
			for(let j=0; j<stars.length; j++){
				stars.eq(j).css('color', 'silver')
			}
			for(let j=0; j<=i; j++){
				stars.eq(j).css('color', 'orange')
			}
			$('#rating-value-display').text(i + 1);
		},
		function(){
			for(let j=0; j<stars.length; j++){
				stars.eq(j).css('color', 'silver')
				$('#rating-value-display').text(0);
			}
			for(let j=0; j<=index; j++){
				stars.eq(j).css('color', 'orange')
				$('#rating-value-display').text(index + 1);
			}
		}
	)

});