var homeSlider = require('./modules/homeSlider.js');

//DOM READY
(function(){

    $body =  document.querySelector('body');
    if($body.length){
        homeSlider();
    }

})();