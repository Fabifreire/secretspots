// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import { showButton } from "plugins/showButton"
// import { getDirections } from "plugins/get_directions"

Rails.start()
Turbolinks.start()
ActiveStorage.start()


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

import { initMapbox } from '../plugins/init_mapbox';
import { initAutocomplete } from '../plugins/init_autocomplete';
// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';


document.addEventListener('turbolinks:load', () => {
  initMapbox();
  initAutocomplete();
  // Call your functions here, e.g:
  // initSelect2();
  showButton();
});



const typedSpan = document.querySelector(".typed") // Storing the Span of HTML of Class 'typed' for changing the text
const totype = ["gem.", "spot.", "secret."] // Array in which all of the words which have to be typed are stored

const delayTyping_char = 120; // 200ms will be waited before next Character of the Text is typed
const delayErasing_text = 60; // 100ms will be waited before removing the next character
const delayTyping_text = 2000; // 2500ms will be waited before everything is erased & next text is typed

let totypeIndex = 0; // Index of The text which is being typed
let charIndex = 0; // Index of The Character which is being typed


function typeText() {
  // if (!typedSpan) {
  //   return;
  // }
  if (charIndex < totype[totypeIndex].length) {
    typedSpan.textContent += totype[totypeIndex].charAt(charIndex); // Value of The Span in HTML is = the Character at the index of charIndex of the Text which is being typed
    charIndex++; // Adding 1 to charIndex
    setTimeout(typeText, delayTyping_char); // Calling typeText Until the charIndex is greater than the length of the Text which is being typed
  }
  else {
    setTimeout(eraseText, delayTyping_text); // if charIndex is Greater than length of the text which is being type then after the time setted (delayTyping_text) erase function will be called
  }
}

function eraseText() {
  // if (!typedSpan) {
  //   return;
  // }
  if (charIndex > 0) {
    typedSpan.textContent = totype[totypeIndex].substring(0, charIndex-1); // substring(0, charIndex-1) here charIndex-1 is saying to select the text leaving one of last text behind
    charIndex = charIndex-1; // subtracting 1 from charIndex
    setTimeout(eraseText, delayErasing_text); // Will call eraseText() Function until the charIndex is not equal to 0
  }
  else {
    totypeIndex++; // If everything is erased then the totypeIndex will be increased and next text in Array (totype) will be typed

    if (totypeIndex >= totype.length) // If totypeIndex is equal to or greater than the number of text to be typed then
      totypeIndex = 0; // totypeIndex will be 0 so that we can start from the first text in the array (toType) and
      setTimeout(typeText, delayTyping_text); // after some delay presetted (delayTyping_text) typeText() Function is called
  }
}

window.onload = function() {
  if (!typedSpan) {
    return;
  }
  if (totype[totypeIndex].length) setTimeout(typeText, delayTyping_text); // typeText() Function is called when everything is loaded
}
