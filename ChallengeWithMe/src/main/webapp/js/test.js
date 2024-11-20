document.addEventListener('DOMContentLoaded', () => {
  const signUpButton = document.getElementById('signUp');
  const signInButton = document.getElementById('signIn');
  const container = document.getElementById('container');
  const detail = document.getElementById('detail');
  const container_wrapper = document.querySelector('.container-wrapper');

  if (signUpButton && signInButton && container && detail) {
    signUpButton.addEventListener('click', () => {
      container.classList.add("right-panel-active");
    });

    signInButton.addEventListener('click', () => {
      container.classList.remove("right-panel-active");
    });
	
	detail.addEventListener('click', () => {
		document.querySelector('.container-wrapper').classList.add('right-panel-active');
	})
	
	signInButton.addEventListener('click', () => {
	      container_wrapper.classList.remove("right-panel-active");
	    });
  }
});