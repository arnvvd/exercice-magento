var homeSlider = require('./modules/homeSlider.js');
var pins = require('./modules/pins.js');
var productSlider =  require('./modules/productSlider.js');
var Sticky =  require('./modules/Stikcy.js');


//DOM READY
(function(){

  var $home=  document.querySelector('.cms-home');
  var $pins =  document.querySelector('.room-interactive');
  var $product=  document.querySelector('.product-carousel');
  var $productFilter = document.querySelector('.product-filter');
  var $search = document.querySelector('#search_mini_form');


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

  if($search){

    var $buttonOpen = document.querySelector('.icon-search');
    var $buttonClose = document.querySelector('#search_mini_form .close');

    $buttonOpen.addEventListener('click',function(){
      $search.classList.add('is-active');
    })
    
    $buttonClose.addEventListener('click',function(){
      console.log('coucou');
      $search.classList.remove('is-active');
    })
  }

    var $productCateg = document.querySelector('.product-category');
    var $productCategFilter = document.querySelector('.product-category-aside');


    if($productCateg){
        var hProductCategFilter = $productCategFilter.offsetHeight;
        $productCateg.style.minHeight = hProductCategFilter + 'px';

        document.addEventListener('resize', function(){
            var hProductCategFilter = $productCategFilter.offsetHeight;

            $productCateg.style.minHeight = hProductCategFilter + 'px';
        })
    }

})();
