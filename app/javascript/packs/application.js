// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application";
import 'jscroll';
import '../stylesheets/public/post_players/index.css';
import '../packs/public/post_players/script.js';
import '../packs/public/post_players/jquery.min.js';

Rails.start()
Turbolinks.start()
ActiveStorage.start()


// $(function() {
//   $('scroll-top-btn a').on('click',function(event){
//     $('body, html').animate({
//     }, 800);
//     event.preventDefault();
//   });
// });