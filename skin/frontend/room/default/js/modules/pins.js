module.exports = function pins(){


	var $pins = document.querySelectorAll('.room-interactive-product');

	for (var i = 0; i < $pins.length; i++) {
		var x = $pins[i].getAttribute('data-x');
		var y = $pins[i].getAttribute('data-y');
		var card = $pins[i].querySelector('.room-interactive-card');
		placeData(card, x, y);

		// Buttons
		var $button = $pins[i].querySelector('button');
		$button.addEventListener('click', function(){

			if(this.parentNode.classList.contains('is-active')){
				for (var j = 0; j < $pins.length; j++) {
					$pins[j].classList.remove('is-active')
				}
			}else{
				for (var j = 0; j < $pins.length; j++) {
					$pins[j].classList.remove('is-active')
				}
				this.parentNode.classList.add('is-active');
			}
		})
	}



	// FUNCTIONS
	
	function placeData(e, x, y){

		if(x > 50){
			e.classList.add('room-interactive-card--left');
		}else{
			e.classList.add('room-interactive-card--right');
		}

		if(y > 50){
			e.classList.add('room-interactive-card--top');
		}else{
			e.classList.add('room-interactive-card--bottom');
		}
	}


}