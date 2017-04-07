var homeSlider = require('./modules/homeSlider.js');
var pins = require('./modules/pins.js');
var productSlider =  require('./modules/productSlider.js');
var Sticky =  require('./modules/Stikcy.js');


//DOM READY
(function(){

  var $home=  document.querySelector('.cms-home');
  var $pins =  document.querySelector('.room-interactive');
  var $product=  document.querySelector('.product');
  var $productFilter = document.querySelector('.product-filter');



  if($home){
    homeSlider();
  }

  if($pins){
  	pins();
  }

  if($product){
  	productSlider();
  }

  if($productFilter){
      var stick = document.querySelector('.product-category-aside');
      var stickParent = document.querySelector('.product-category');

      var sticky1 = new Sticky(stickParent, {
        $element : stick,
        stickedClass : 'is--sticked',
        positionnedClass : 'is--positionned',
        marginBottom: 0
      });
  }

})();
