// 投稿
document.addEventListener('DOMContentLoaded', () => {
	const stars = document.querySelectorAll('.Star');
	const ratingVal = document.getElementById('rating-value');
	const ratingValDisplay = document.getElementById('rating-value-display');
	let index;

	for(let i = 0; i < stars.length; i++){
		stars[i].addEventListener('mouseover', () => {
			for(let j = 0; j < stars.length; j++){
				stars[j].style.color = 'silver';
			}
			for(let j = 0; j <= i; j++){
				stars[j].style.color = 'orange';
			}
			ratingValDisplay.innerText = i + 1
		})

		stars[i].addEventListener('click', () => {
			ratingVal.value = i + 1;
			ratingValDisplay.innerText = i + 1;
			index = i;
		})

		stars[i].addEventListener('mouseout', () => {
			for(let j = 0; j < stars.length; j++){
				stars[j].style.color = 'silver';
				ratingValDisplay.innerText = 0
			}
			for(let j = 0; j <= index; j++){
				stars[j].style.color = 'orange';
				ratingValDisplay.innerText = index + 1
			}
		})
	}
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