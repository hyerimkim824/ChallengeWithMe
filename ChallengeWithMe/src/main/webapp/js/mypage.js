document.addEventListener('DOMContentLoaded', () => {
	const form1 = document.getElementById('form1');
	const form2 = document.getElementById('form2');

	if (form1 && form2) {
		form1.addEventListener('click', () => {
			container.classList.add("change-form");
		});
		form2.addEventListener('click', () => {
			container.classList.remove("change-form");
		});
	}
})