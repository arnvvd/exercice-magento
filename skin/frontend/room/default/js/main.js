var homeSlider = require('./modules/homeSlider.js');
var pins = require('./modules/pins.js');

//DOM READY
(function(){

  $home=  document.querySelector('.cms-home');
  $pins =  document.querySelector('.room-interactive');


  if($home){
    homeSlider();
  }

  if($pins){
  	pins();
  }

})();
