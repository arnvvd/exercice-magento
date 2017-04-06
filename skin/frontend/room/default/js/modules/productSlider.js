module.exports = function productSlider(){

  var Flickity = require('flickity');


  /*PRODUCT*/
  var elem = document.querySelector('.product-carousel');
  var flkty = new Flickity( elem, {
    freeScroll: false,
    contain: false,
    pageDots: false,
    prevNextButtons: false,
    draggable: false,
    adaptiveHeight: true
  });

  // Navigation
  var $buttons = document.querySelectorAll('.product-carousel-navigation button');

  for (var i = 0; i < $buttons.length; i++) {
    $buttons[i].addEventListener('click', function(){

      for (var i = 0; i < $buttons.length; i++) {
        $buttons[i].classList.remove('is-active');
      }

      this.classList.add('is-active');

      var index = this.getAttribute('data-index');
      flkty.select( index );
    })
  }

}
