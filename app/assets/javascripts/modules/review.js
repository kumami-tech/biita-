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

// タブ
document.addEventListener('DOMContentLoaded', () => {
	const tabs = document.querySelectorAll('.Position_r__Name');
	const contents = document.querySelectorAll('.Reviews');

	for (let i = 0; i < tabs.length; i++) {
		tabs[i].addEventListener('click', () => {
			for (let j = 0; j < tabs.length; j++) {
				tabs[j].classList.remove('Active');
				contents[j].classList.remove('Show');
			}
			tabs[i].classList.add('Active');
			contents[i].classList.add('Show');
		})
	}
});