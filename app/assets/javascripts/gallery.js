$(window).on('load', (function() {
  // mebe trigger this on resize?
  imagesLoaded( document.querySelector('#gallery'), function( instance ) {
    $('.gallery').each(function(i, obj) {
      $(obj).BalancedGallery({ idealHeight: 350 });
    });
  });
}));
