window.addEventListener('load', () => {
  let advanceImageId;

  if (document.querySelector('.art')) {
    const gallery = document.querySelector('.art');
    const art = gallery.dataset.images.split(', ');
    const artAltText = gallery.dataset.altText.split(', ');
    let imgCounter = 0;

    const advanceImage = () => {
      const artImage = document.querySelector('.art-image');
      artImage.setAttribute('src', `/images/art/${art[imgCounter]}`);
      artImage.setAttribute('alt', artAltText[imgCounter]);
      imgCounter = imgCounter < (art.length - 1) ? imgCounter + 1 : 0;
    };

    clearInterval(advanceImageId);
    advanceImageId = setInterval(advanceImage, 5000);
  } else {
    clearInterval(advanceImageId);
  }
});
