var homeSlider = require('./modules/homeSlider.js');
var pins = require('./modules/pins.js');
var productSlider =  require('./modules/productSlider.js');

//DOM READY
(function(){

  $home=  document.querySelector('.cms-home');
  $pins =  document.querySelector('.room-interactive');
  $product=  document.querySelector('.product');


  if($home){
    homeSlider();
  }

  if($pins){
  	pins();
  }

  if($product){
  	productSlider();
  }

})();
