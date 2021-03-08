const showButton = () => {
  window.addEventListener('scroll', event => {
    const up = document.querySelector('.up');
    if (!up) {
      return;
    }
    // console.log(up);
    up.classList.add('show');
    // console.log(event);
    // console.log(event.srcElement.scrollingElement.scrollTop);
    // const height = event.srcElement.scrollingElement.scrollTop;
    const footer = document.querySelector('footer');
    // console.log(height);
    const diff = (height - footer.offsetHeight);
    // console.log(height, diff);
    if (height < 175) {
      up.classList.remove('show');
      // console.log(up);
    } 
    // else if (diff) {
    //   up.classList.remove('show');
    //   up.classList.add('stay_there');
    //   console.log(up);
    // }
  });
}

export { showButton };