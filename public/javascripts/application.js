$(function() {
  if ($('*').hasClass('art')) {
    let art = $('.art').data('images').split(', ');
    let art_alt_text = $('.art').data('alt-text').split(', ');
    let imgCounter = 1;

    function advanceImage() {
      $('.art-image').attr("src", `/images/art/${art[imgCounter]}`).attr("alt", art_alt_text[imgCounter]);
      imgCounter = imgCounter < (art.length - 1) ? imgCounter + 2 : 0;
      setTimeout(advanceImage, 8000);
    }

    setTimeout(advanceImage, 8000);
  }
});
