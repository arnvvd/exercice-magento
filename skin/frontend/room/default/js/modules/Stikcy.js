var Sticky = function (element, options) {

  // Check if options object is empty
  options || (options = {});

  // Get options
  this.$container = element; //Get container
  this.$element = options.$element;
  this.stickedClass = options.stickedClass;
  this.positionnedClass = options.positionnedClass;
  this.marginBottom = options.marginBottom;
  this.cover = false || options.cover;

  // Do method if $element isn't empty
  if(this.$element){
    this.stick();
  }
}

Sticky.prototype.stick = function stick() {
  self = this;

  //Get datas
  var parent = self.$container;
  var stickyElement = self.$element;
  var stickedClass = self.stickedClass;
  var positionnedClass = self.positionnedClass;
  var marginBottom = self.marginBottom;
  var boolCover = self.cover;



  window.addEventListener("scroll", function () {


      // Get scrollTop of body
      var doc = document.documentElement;
      var windowPos = (window.pageYOffset || doc.scrollTop)  - (doc.clientTop || 0);

      // Prepare value
      var parentOffset = parent.getBoundingClientRect();
      var parentTopOffset = parentOffset.top + windowPos;

      var hParent =  parent.offsetHeight;
      var hElement =  stickyElement.offsetHeight;

      if(boolCover){
        var maxOffset = hParent;
      }else{
        var maxOffset = hParent - hElement - marginBottom;
      }
      var realOffset = windowPos - parentTopOffset;

      if(realOffset <= 0){
        stickyElement.classList.remove(stickedClass);
        stickyElement.classList.remove(positionnedClass);
      }else if(realOffset > 0 && realOffset < maxOffset){
        stickyElement.classList.add(stickedClass);
        stickyElement.classList.remove(positionnedClass);
      }else{
        stickyElement.classList.remove(stickedClass);
        stickyElement.classList.add(positionnedClass);
      }


  });


};

module.exports = Sticky;