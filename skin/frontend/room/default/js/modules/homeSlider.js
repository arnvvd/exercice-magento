var Flickity = require('flickity');
var asNavFor = require('flickity-as-nav-for');
var indexArray = [];


/*BACKGROUND*/
var elem = document.querySelector('.main-carousel');
var flkty = new Flickity( elem, {
  freeScroll: false,
  contain: true,
  pageDots: false,
  prevNextButtons: false
});


/* TITLE*/
var title = document.querySelector('.title-carousel');
var titles = document.querySelectorAll('.title-carousel-cell');
var flkty2 = new Flickity( title, {
  asNavFor: elem,
  draggable: false,
  contain: false,
  pageDots: false,
  prevNextButtons: false
});

flkty2.on( 'select', function() {
  if(indexArray.length < 1){
    indexArray.push(flkty2.selectedElement);
  }else if(indexArray.length === 1){
    indexArray[0].classList.remove('is-last');
    indexArray.push(flkty2.selectedElement);
    indexArray[0].classList.add('is-last');
    setTimeout(function () {
      indexArray[0].classList.remove('is-last');
    }, 300);
  }else{
    indexArray[0].classList.remove('is-last');
    indexArray.splice(0,1);
    indexArray.push(flkty2.selectedElement);
    indexArray[0].classList.add('is-last');
    setTimeout(function () {
      indexArray[0].classList.remove('is-last');
    }, 300);
  }
});



  /*DESC*/
  var desc = document.querySelector('.desc-carousel');
  var descs = document.querySelectorAll('.desc-carousel-cell');
  var flkty3 = new Flickity( desc, {
    asNavFor: elem,
    draggable: false,
    contain: false,
    pageDots: false,
    prevNextButtons: false
  });

