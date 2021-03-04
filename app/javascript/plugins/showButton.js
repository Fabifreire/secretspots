const showButton = () => {
  window.addEventListener('scroll', event => {
    const up = document.querySelector('.up');
    console.log(up);
    up.classList.add('show');
    console.log(event);
    console.log(event.srcElement.scrollingElement.scrollTop);
    const height = event.srcElement.scrollingElement.scrollTop;
    if (height < 175) {
      up.classList.remove('show');
    }
  });
}

export { showButton };