$(document).ready( function() {
  $.getJSON("http://api.forismatic.com/api/1.0/?method=getQuote&lang=en&format=jsonp&jsonp=?")
    .done(update)
    .fail(handleErr);
});

function update(response) {
  var quote = JSON.parse(JSON.stringify(response));
  $('#quote').html('"' + quote.quoteText + '"');
  $('#author').html("– " + quote.quoteAuthor);
}

function handleErr(jqxhr, textStatus, err) {
  console.log("Request Failed: " + textStatus + ", " + err);
}
