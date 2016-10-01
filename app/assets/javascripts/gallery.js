$(document).ready(function() {
  if ($('#gallery').length) {
    $(window).resize(function() {
      $('#gallery').perfectLayout(window.photos);
    });
  };
});
