/* eslint-env jquery */

$(() => {
  if ($('*').hasClass('art')) {
    const art = $('.art').data('images').split(', ');
    const artAltText = $('.art').data('alt-text').split(', ');
    let imgCounter = 1;

    const fn = function advanceImage() {
      $('.art-image').attr('src', `/images/art/${art[imgCounter]}`).attr('alt', artAltText[imgCounter]);
      imgCounter = imgCounter < (art.length - 1) ? imgCounter + 2 : 0;
      setTimeout(fn, 8000);
    };

    setTimeout(fn, 8000);
  }
});
