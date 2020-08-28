const stars = $(".Star");
const ratingValue = $("#rating-value");
const ratingValueDisplay = $("#rating-value-display");

$(function(){
	$('.Star').hover(function(){
		let index = $('.Star').index($(this));
		for(let j=0; j<=index; j++){
			stars.eq(j).attr('src', '/assets/star-on.png').addClass('On');
		}
});