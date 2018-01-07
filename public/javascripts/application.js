$(function() {
  if ($('*').hasClass('art')) {
    let art = $('.art').data('images').split(', ');
    let art_alt_text = $('.art').data('alt-text').split(', ');
    let imgLeft = 2;
    let imgRight = 3;

    function advanceImage() {
      $('.img-left').attr("src", `/images/art/${art[imgLeft]}`).attr("alt", art_alt_text[imgLeft]);
      $('.img-right').attr("src", `/images/art/${art[imgRight]}`).attr("alt", art_alt_text[imgRight]);
      imgLeft = imgLeft < (art.length - 1) ? imgLeft + 2 : 0;
      imgRight = imgRight < (art.length - 1) ? imgRight + 2 : 1;
      setTimeout(advanceImage, 8000);
    }

    setTimeout(advanceImage, 8000);
  }
});
