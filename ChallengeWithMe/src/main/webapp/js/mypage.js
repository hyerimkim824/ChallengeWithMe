document.addEventListener('DOMContentLoaded', () => {

	const form1 = document.getElementById('form1')
	const form2 = document.getElementById('form2')
	const select2 = document.querySelector('.card-3d-wrapper')
	const iframe = document.getElementById('iframe-container')
	const photo_btn = document.getElementById('photo_btn')
	let iframecreated = false

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
	
	photo_btn.addEventListener('click', function(){
		if(!iframecreated){
			iframe.style.display = 'flex'
			iframecreated = true;
			
		} else{
			while(iframe.firstChild){
			iframe.removeChild(iframe.firstElementChild)
			}
			iframe.style.display = 'none'
			iframecreated = false;
		}
	})
})