// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import * as Bootstrap from "bootstrap"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

// include bootstrap in global and window scope so you can access it globally in the web browser
global.bootstrap = Bootstrap;
window.bootstrap = Bootstrap;
