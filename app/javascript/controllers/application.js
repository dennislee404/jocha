import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

// const observer = new IntersectionObserver((entries) => {
// 	entries.forEach((entry) => {
// 		if (entry.isIntersecting) {
// 			entry.target.classList.add('show');
// 		} else {
// 			entry.target.classList.remove('show')
// 		}
// 	});
// });
// const hiddenElements = document.querySelectorALl('.hidden');
// hiddenElements.forEach((el) => observer.observe(el));