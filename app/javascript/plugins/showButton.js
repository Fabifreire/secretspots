const showButton = () => {
  window.addEventListener('scroll', event => {
    const up = document.querySelector('.up');
    // console.log(up);
    up.classList.add('show');
    // console.log(event);
    // console.log(event.srcElement.scrollingElement.scrollTop);
    const height = event.srcElement.scrollingElement.scrollTop;
    const footer = document.querySelector('footer');
    const result = (height - footer.offsetHeight)
    // console.log(footer.offsetHeight, result)
    if (175 > height) {
      up.classList.remove('show');
    }
  });
}

export { showButton };