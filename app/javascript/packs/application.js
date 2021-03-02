// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

const showButton = () => {
  window.addEventListener('scroll', event => {
    const up = document.querySelector('.up');
    console.log(up);
    up.classList.add('show');
    console.log(event);
    console.log(event.srcElement.scrollingElement.scrollTop);
    const height = event.srcElement.scrollingElement.scrollTop;
    if (height < 65) {
      up.classList.remove('show');
    }
  });
}

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  showButton();
});
