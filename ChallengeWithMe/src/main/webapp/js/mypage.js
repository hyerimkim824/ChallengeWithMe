document.addEventListener('DOMContentLoaded', () => {

	const form1 = document.getElementById('form1')
	const form2 = document.getElementById('form2')
	const select2 = document.querySelector('.card-3d-wrapper')

	form1.addEventListener('click', function(event) {
		if (event.target.tagName !== 'INPUT') {
			select2.classList.add('check')
		}
	})
	form2.addEventListener('click', function(evnet) {
		if (event.target.tagName !== 'INPUT') {
			select2.classList.remove('check')
		}
	})
})