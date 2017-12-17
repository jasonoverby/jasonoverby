$(function() {
  if ($('*').hasClass('art')) {
    let art = $('.art').data('images').split(', ');
    let art_alt_text = $('.art').data('alt-text').split(', ');
    let i = 1;

    function advanceImage() {
      $('.art-image').attr("src", `/images/art/${art[i]}`).attr("alt", art_alt_text[i]);
      i = i < (art.length - 1) ? i + 1 : 0;
      setTimeout(advanceImage, 8000);
    }

    setTimeout(advanceImage, 8000);
  }
});
