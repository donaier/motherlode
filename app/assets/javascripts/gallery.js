$(window).load(function() {
  // mebe trigger this on resize?
  $('.gallery').each(function(i, obj) {
    $(obj).BalancedGallery({ idealHeight: 350 });
  });
});
